class UsersController < ApplicationController
  def show
    @albums = ImgAlbum.where(user_id: params[:id])
    @user_email = User.where(id: params[:id]).pluck(:email)
    rescue
      flash[:notice] = "Album not found"
      redirect_to root_path
  end
end
