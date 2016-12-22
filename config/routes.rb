Rails.application.routes.draw do


  post 'favorites/new'
  get 'degree_requirments/find'

  get 'favorites/search'

  get 'favorites/edit'


  post 'past_courses/new'
  delete "past_courses/delete"
  get 'past_courses/edit'


  get 'welcome/index'

  get 'about/aboutus'

  root 'welcome#index'
  devise_for :users, :controllers => { registrations: 'registrations' }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
