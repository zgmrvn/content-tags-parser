Rails.application.routes.draw do
  root 'home#index'
  
  resources :articles
  resources :content_tags, execpt: [:show, :delete]
end
