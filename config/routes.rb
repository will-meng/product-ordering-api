Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'customers/:id/number_purchased_by_category', 
      to: 'customers#number_purchased_by_category'
    get 'customers/number_purchased_by_category',
      to: 'customers#number_purchased_by_category_all'
    get 'customers/:id/orders',
      to: 'orders#index'
    get 'products/quantities_sold',
      to: 'products#quantities_sold'
  end
end
