Rails.application.routes.draw do
  get '/home' => 'home#index'
  root 'home#index'
  get "/pages/:page" => "pages#show"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :user_ids, only: [:new, :create]
  resources :payments, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  get '/contact' => 'contacts#new', as: :new_contact
  post '/contact' => 'contacts#create', as: :contact
end
