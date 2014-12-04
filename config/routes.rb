ProductsInventory::Application.routes.draw do
  resources :purchases, except: [:edit, :new]

  resources :products, except: [:edit, :new]
end