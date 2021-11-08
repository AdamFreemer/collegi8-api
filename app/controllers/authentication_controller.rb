class AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request

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

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
