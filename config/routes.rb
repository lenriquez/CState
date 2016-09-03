Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get '/' => 'al_ord#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/authentication' do
	      post '/sign_in' => 'authentication#sign_in'
	      post '/sing_up' => 'authentication#sing_up'
      end
      scope '/diagram' do
      	get '/' => 'diagram#index'
      end
    end
  end
end