class Api::SessionsController < Api::ApiController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {msg:'OK', status:200}, status:200
    else
      render json: {msg:'Failed', status:403}, status:403
    end
  end

  def show
    if current_user
      render json: {username: current_user.username, msg:'OK'}
    else
      render json: {username: '', msg:'You are not logged in'}, status: 401
    end
  end

end
