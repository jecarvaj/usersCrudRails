Rails.application.routes.draw do

  resources :users do
    get :autocomplete_user_rut, :on => :collection
    get :autocomplete_user_last_name, :on=>:collection
  end

  get 'search', to: 'users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
