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

resources :retailers, only: [:show, :edit, :update, :new, :create, :index]

resources :brands, only: [:show, :edit, :update] do
  resources :products, only: [:index, :new, :create, :edit, :update]
  resources :contracts, only: [:new, :create, :show, :destroy, :edit]
# get 'brands/:id' => 'brands#product_detail'
end


root to: "contents#index"

end
