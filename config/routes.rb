Rails.application.routes.draw do
  
  devise_for :brands, controllers: {
  sessions:      'brands/sessions',
  passwords:     'brands/passwords',
  registrations: 'brands/registrations'
}
  devise_for :retailers, controllers: {
  sessions:      'retailers/sessions',
  passwords:     'retailers/passwords',
  registrations: 'retailers/registrations'
}


  resources :retailers, only: [:show, :edit, :update, :new, :create, :index]

  resources :brands, only: [:new, :create, :show, :edit, :update] do
    resources :products, only: [:index, :edit, :update]
    resources :contracts, only: [:new, :create, :show, :destroy, :edit]
  end

  resources :contents, only: [:index]

  root to: "contents#index"

end
