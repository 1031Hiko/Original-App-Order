Rails.application.routes.draw do
 devise_for :buyers, controllers: {
  sessions:      'buyers/sessions',
  passwords:     'buyers/passwords',
  registrations: 'buyers/registrations'
}
devise_for :retailers, controllers: {
  sessions:      'retailers/sessions',
  passwords:     'retailers/passwords',
  registrations: 'retailers/registrations'
}

  # devise_for :retailers
  # devise_for :buyers
root to: "top#index"
end
