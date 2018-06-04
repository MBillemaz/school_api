class Api::V1::SessionsController < Api::ApiController
  skip_before_action :require_login!, only: [:create]
  
   # api :POST, '/v1/users/sign_in', 'Connexion et création de token'
  def create
    user = User.find_by(email: params[:email])
    if user.valid_password?(params[:password])
      render json: {success: true, auth_token: user.generate_token}.to_json
    else 
      render json: {success: false}, status: 401
    end
    
  end

end