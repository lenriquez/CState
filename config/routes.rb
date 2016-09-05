Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'

  scope '/api' do
    scope '/v1' do
      scope '/auth' do
        post "/register" => 'auth#register'
      end
    end
  end

  scope :api do
    scope :v1 do
      mount_devise_token_auth_for "User", at: 'auth'
    end
  end
end
