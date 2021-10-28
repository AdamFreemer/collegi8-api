class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      puts '--- authentication authorized'
      render json: { auth_token: command.result }, status: 200
    else
      puts '--- authentication failure'
      render json: {}, status: 200
    end
  end
end
