class MediaController < ApplicationController
    before_action :set_medium, only: [:show, :edit, :update, :destroy]

  def index
    @media = Medium.all
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
    if @medium.save
      redirect_to @medium
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
      redirect_to media_path
    end
  end

  private

  def medium_params
    params.require(:medium).permit(:youtube_id, :description, :image)
  end

  def set_medium
    @medium = Medium.find(params[:id])
  end
end
