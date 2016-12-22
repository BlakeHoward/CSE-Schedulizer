# CSE Schudulizer
### Ruby on Rails Project

This project is a scheduling tool that makes it easy to find rate my professors ratings for classes that you might be interested in. It also does a sort of CSE only degree audit. To run the app, run the following commands

$ rake routes
$ rake db:migrate
$ rake db:setup
$ rails server

Be patient with the setup command. It takes a little bit to complete. After you have the rails server running, navigate to the given setup page.

### Roles
* Overall Project Manager: Brett Boehmer
* Coding Manager: Jason Kline
* Testing Manager: Kyle Hutchinson
* Documentation: Yuzhao Li

### Contributions

####Brett Boehmer
* Added functionality of the Search Page
* Wrote favorites controller and view
* Wrote code to display table in past courses view
* Wrote code to help user understand each web page

####Blake Howard
* Wrote style.css, navbarStyle.css (and styled views using classes in these files)
* Wrote \_navbar.html.erb (partial)
* Wrote navFunc.js
* Wrote registerLayout.html.erb
* Wrote layout functionality in controllers

####Jason Kline
* Added relations to the database
* Added favorites table to homescreen
* Helped Kyle create degree requirements search
* Set up the seeds.rb file to do database setup
* Helped Yuzhao and Brett to get the controllers for favorites and past courses working

####Kyle Hutchinson
* Created starting index page
* Created starting about us page
* Created and wrote the algorithm for degree requirements search (with Jason's help)
* Created basic styling for website (later to be replaced with Blake's styling)
* Coded in required courses for graduation on seeds.rb page

####Yuzhao Li
* Set up the ruby on rails and devise
* Created the database model
* Wrote the CSS for index page
* Wrote the past_courses controller and view

###Testing
Testing was done with a variety of use cases:
* Run $rake db:setup and ensure that course numbers, instructors, etc. match up with official schedule.
* Create a users and ensure they can log in and log out
* Have a user add favorites and past courses
* Ensure the required courses page matches with their past_courses
* Multiple users signing up and adding courses to past and favorite course. Ensure that only their courses and not those of other users are associated with them.
