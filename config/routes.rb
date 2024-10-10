Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'mean', to: 'calculations#mean'
      post 'median', to: 'calculations#median'
      post 'sum', to: 'calculations#sum'
      post 'minimum', to: 'calculations#minimum'
      post 'maximum', to: 'calculations#maximum'
      post 'standard_deviation', to: 'calculations#standard_deviation'
      post 'count', to: 'calculations#count'
      post 'variance', to: 'calculations#variance'
    end
  end
end
