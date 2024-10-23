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
  end
end
