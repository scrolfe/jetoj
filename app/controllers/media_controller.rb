class MediaController < ApplicationController
  before_action :set_medium, only: [:edit, :update, :destroy]

  def photo
    @media = Medium.photo
  end

  def video
    @media = Medium.video
  end

  def audio
    @media = Medium.audio
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = current_user.media.new(medium_params)
    if @medium.save
      redirect_to "/media/#{@medium.medium_type}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium
    else
      render :edit
    end
  end

  def destroy
    if @medium.destroy
      redirect_to media_photo_path
    end
  end

  private

  def medium_params
    params.require(:medium).permit(:medium_type, :youtube_id, :image, :audio, :description)
  end

  def set_medium
    @medium = Medium.find(params[:id])
  end
end
