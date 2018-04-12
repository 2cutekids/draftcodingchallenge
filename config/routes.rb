Rails.application.routes.draw do
  get 'sport/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  namespace 'api' do
    namespace 'v1' do
      resources :sports, only: [:index] do
        resources :players, only: [:index]
      end

      resources :players, only: [:show]
    end
  end
end
