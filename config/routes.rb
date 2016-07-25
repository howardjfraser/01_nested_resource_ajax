Rails.application.routes.draw do
  root 'notes#about'
  resources :people do
    resources :messages, only: [:index, :create]
  end
end
