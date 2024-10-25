Rails.application.routes.draw do
  namespace :api do
    resources :calculations, only: [] do
      collection do
        post :mean
        post :median
        post :sum
        post :minimum
        post :maximum
        post :standard_deviation
        post :count
        post :variance
      end
    end

    resources :data_access, only: [] do
      collection do
        post 'cell_value'
        post 'column_values'
        post 'row_values'
        post 'find_value'
      end
    end
  end
end
