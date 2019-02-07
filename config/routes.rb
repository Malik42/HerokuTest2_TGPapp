Rails.application.routes.draw do



  resources :city
  resources :gossip do
    resources :comment
  end
  get 'static_pages/error'
  get 'static_pages/succes'
  root 'index#show'



get 'alert_comment/succes/:id', to: 'alert_comment#succes',  as: 'commentsucces'
get 'alert_comment/modifie/:id', to: 'alert_comment#modify',  as: 'commentmodify'
get 'alert_comment/error/:id', to: 'alert_comment#error',  as: 'commenterror'

  get 'user/:id', to: 'user#show' , as: 'users'


  get 'static_pages/team'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/home'
  get 'static_pages/delete'
  get 'static_pages/modified'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/static_pages/contact', to: 'controller#method'
end
