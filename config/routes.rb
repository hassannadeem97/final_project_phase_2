Rails.application.routes.draw do
  resources :camp_instructors
  resources :camps
  resources :curriculums
  resources :locations
  resources :instructors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
