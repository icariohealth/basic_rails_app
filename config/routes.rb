Rails.application.routes.draw do

  devise_for :users, :controllers => {:invitations => 'devise/invitations', :password_expired => 'devise/password_expired', :sessions => 'users/sessions'}

  resource :registers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to =>'home#show'
end
