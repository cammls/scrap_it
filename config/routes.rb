Rails.application.routes.draw do
  get 'product/test'
  post 'product/test' => 'product#test'
  get '/product/:id'=>  'product#show'
  get '/products'=> 'product#index'
  root 'product#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
