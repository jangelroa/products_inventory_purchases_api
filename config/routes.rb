ProductsInventory::Application.routes.draw do
  resources :purchases, only: [:index, :show]

  resources :products, except: [:edit, :new]
end