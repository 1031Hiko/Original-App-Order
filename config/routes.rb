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

resources :contents, only: [:index]

resources :retailers, only: [:show, :edit, :update]
resources :brands, only: [:show, :edit, :update]

root to: "contents#index"
end
