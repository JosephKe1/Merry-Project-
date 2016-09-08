Rails.application.routes.draw do
  get '/home' => 'home#index'
  root 'home#index'
  get "/pages/:page" => "pages#show"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :user_ids, only: [:new, :create]

  resources :billings, only: [:new, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  get '/contact' => 'contacts#new', as: :new_contact
  post '/contact' => 'contacts#create', as: :contact

  resources :doctors, only: [:new, :create]
end
