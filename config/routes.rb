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

  resources :top, only: [:index]

  resources :contracts, only: [:new, :create, :show, :destroy, :edit]

  resources :retailers, only: [:show, :edit, :update, :new, :create, :index], shallow: true do
    resources :order_fors, only: [:show, :edit, :update, :new, :create, :index]
  end

  resources :brands, only: [:show, :edit, :update], shallow: true do
    resources :registers, only: [:edit, :update, :new, :create, :index, :show]
      resources :products, only: [:edit, :update, :new, :create, :show]
  end

  resources :contents, only: [:index]
  root to: "contents#index"

end



# resources :brands, only: [:new, :create, :show, :edit, :update] do
#     resources :products, only: [:edit, :update, :new, :create, :show]
#     resources :contracts, only: [:new, :create, :show, :destroy, :edit]
#   end



# resources :retailers, only: [:show, :edit, :update, :new, :create, :index] do
#   resources :orders, only: [:show, :edit, :update, :new, :create, :index]
#     resources :order_details, only: [:show, :edit, :update, :new, :create, :index]
# end
