# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'set'



=begin
  RMP Helper methods taken directly from previous project.  Used when populating the professors
  table
=end
def get_rmp_link (name)

  #Create a new instance of Mechanize
  rmp_mech = Mechanize.new

  #Manipulate the given name so that is is all lower case and it is just their first and
  #last name with a '+' symbol between the two
  name.downcase
  space=name.index(' ')
  firstName= name[0..space]
  endString=name[space+1..name.length]
  space2=endString.index(' ')
  if(space2)
    lastName=endString[space2+1..endString.length]
  end
  name= "#{firstName}+#{lastName}"

  #Use the name previously created in a query to search the RateMyProfessor website for the professor
  url = 'http://www.ratemyprofessors.com/search.jsp?query=ohio+state+' + name
  page = rmp_mech.get url

  #Parse the web page for //div elements who have the class result-count to see
  #if the professor is on the web site
  test= page.parser.xpath("//div[@class='result-count']").to_s

  #If the letter at position 436 in the parsed string is a 'S' then there exists a page for that name
  letter=test[436]
  if letter=='S'
    #Get the link to the professors specific page on the web site
    return page.link_with(:href => /ShowRatings.*/).click
  else
    #Return 0 if the professor does not have a page on the web site
    return 0
  end
end

#Given an array of instructors, this method returns a hash containing the average score
#of each professor paired with their name

#Created by Brett Boehmer 10/7/2016
#Modifications made by Brett Boehmer 10/9/2016 - Fix problem of crashing program when
#a professor does not show up on the RateMyProfessor website
def get_rmp_score (results)

  grade = 0.0;
  score=nil

  #If results is something other than 0, a page for the professor exists and we can pull information from it
  if (results!=0)
    #Parse the web page for //div elements who have the class grade
    score_html= results.parser.xpath("//div[@class='grade']").to_s
    #From the string created above pull out the score of the professor
    score= score_html[19,3]
  end

  #Add the score and professor name to the hash called grades
  #If the score is still nil then the professor is not in the system and there is no score
  if score==nil
    grade = "No Score"
    #Else add the score that we previously scraped from the web page to the hash with the professor name
  else
    grade = score
  end
  #return the hash grades
  grade
end


#Here we need to populate the courses table before continuing to next step
agent = Mechanize.new do |a|
  a.user_agent_alias = "Mac Safari"
end


page = agent.get('http://coe-portal.cse.ohio-state.edu/pdf-exports/CSE/')

html = Nokogiri::HTML(page.body)

html.search('tr').each do |course|
  course_num = 0
  course_name = " "
  course_ch = 0.0

  i = 0
  course.search('td').each do |data|
    if data.text.chop == "Number"
      i=100
    end

    if i == 0
      course_num = data.text.chomp.to_i
    elsif i ==2
      course_name = data.text.chomp
    elsif i==3
      course_ch = data.text.chomp.to_f
    end
    i = i+1;
  end

  #TODO:  Prerequisits?
  if i<100
    req = 0

    #BA & CIS & CSE
    if (course_num == 2221)
      req = 3
    end
    if (course_num == 2231)
      req = 3
    end
    if (course_num == 2321)
      req = 3
    end
    if (course_num == 2421)
      req = 3
    end
    if (course_num == 2501)
      req = 3
    end

    #CIS & CSE
    if (course_num == 2431)
      req = 2
    end

    Course.create(credit_hours: course_ch, number: course_num, name: course_name, required: req)
  end
end

=begin
  Code adapted from web scraping project to get courses and professors
=end
agent = Mechanize.new do |a|
  a.user_agent_alias = "Mac Safari"
end

page = agent.get('https://web.cse.ohio-state.edu/cgi-bin/portal/report_manager/display_schedule-drupal.cgi')
page_form = page.forms.first
term = '1172' #1172 stands for Spring 2017

page_form.field_with(:name => 'tc').value = term
result = agent.submit(page_form)

html = Nokogiri::HTML(result.body)

course = Array.new

html.css("table").each do |course|
  instructorSet = Set.new
  course_num = course.css("th").first.text[4,4]
  course.css("table").each do |section|


    section_time = " "
    section_location = " "
    section_instructor_name = " "

    i = 0
    section.css("tr").each do |row|

      row.css("td").each do |data|
        i +=1
        if(i == 2)
          section_instructor_name = data.text.chomp
        end
        if(i==3)
          section_time = data.text.chomp
        end
        if(i==4)
          section_location = data.text.chomp
        end
      end

      #TODO: Check if instructor exists.  If they don't create them and use RMP helpers.

      #TODO: Add foreign keys to section

    end

    if !Instructor.exists?({name: section_instructor_name})
      rmp_link = get_rmp_link(section_instructor_name)
      rmp_rating = get_rmp_score(rmp_link)
      rmp_link_to_s = "http://www.ratemyprofessors.com"
      if rmp_link != 0
        rmp_link_to_s = rmp_link.uri.to_s
      end
      Instructor.create(name: section_instructor_name, rmp_ratings: rmp_rating, rmp_url: rmp_link_to_s)
    end
    section_instructor = Instructor.find_by name: section_instructor_name

    section_course = Course.find_by number: course_num
    course = 0
    if section_course != nil
      Section.create(time: section_time, location: section_location, instructor_id: section_instructor.id, course_id: section_course.id) #Set course num and instructor
    end



  end

end
=begin
agent = Mechanize.new do |a|
  a.user_agent_alias = "Mac Safari"
end


page = agent.get('https://web.cse.ohio-state.edu/cgi-bin/portal/report_manager/display_schedule-drupal.cgi')
page_form = page.forms.first
term = '1172' #1172 stands for Spring 2017

page_form.field_with(:name => 'tc').value = term
result = agent.submit(page_form)

html = Nokogiri::HTML(result.body)

course = Array.new
courseMap = Hash.new
html.search('table').each do |th|
  head = th.search('th').first.text
  if(head != 'Section')
    course.push(head)

  end
end


html.css("table").each do |course|
  instructorSet = Set.new
  course.css("table").each do |section|

    courseNum = course.css("th").first.text[4,4]
    i = 0
    section.css("tr").each do |row|
      row.css("td").each do |data|
        i +=1
        if(i == 2)
          instructorSet.add(data.text.chomp)
        end
      end
    end
    courseMap[courseNum] = instructorSet
  end

end
=end

#Here we need to add RMP data for all instructors
