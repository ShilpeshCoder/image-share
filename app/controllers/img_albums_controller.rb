class ImgAlbumsController < ApplicationController
  before_action :find_album, only: [:edit, :update, :show, :delete]
  before_action :authenticate_user!, except: [:index, :show, :home_page]
  before_action :album_owner, only: [:edit, :update, :destroy]

  def home_page
    @photos = Photo.includes(img_album: :user).limit(25).order('id desc')
  end
  # Index action to render all album
  def index
    @albums = ImgAlbum.all
  end
  
  def new
    @album = ImgAlbum.new
  end

  # Create action saves the album into database
  def create
    @album = current_user.img_albums.create(img_album_params)
    if @album.save
      flash[:notice] = "Successfully created album!"
      redirect_to img_album_path(@album)
    else
      flash[:alert] = "Error creating new album!"
      render :new
    end
  end

  # Edit action retrives the album and renders the edit page
  def edit
  end

  # Update action updates the album with the new information
  def update
    if @album.update_attributes(img_album_params)
      flash[:notice] = "Successfully updated album!"
      redirect_to img_album_path(@album)
    else
      flash[:alert] = "Error updating album!"
      render :edit
    end
  end

  # The show action renders the album after retrieving the the id
  def show
    @album = ImgAlbum.includes(:photos, :user).where(id: params[:id]).first
  end

  # The destroy action removes the album permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted album!"
      redirect_to img_albums_path
    else
      flash[:alert] = "Error deleting album!"
    end
  end

  private

  def img_album_params
    params.require(:img_album).permit(:name, photos_attributes: [:id, :tag_line, :image, :_destroy])
  end

  def find_album
    @album = ImgAlbum.find(params[:id])
    rescue
      flash[:notice] = 'Album not found'
      redirect_to img_albums_path
  end
  
  def album_owner
    unless @album.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Album'
      redirect_to img_album_path(@album)
    end
  end
end
