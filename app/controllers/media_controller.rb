class MediaController < ApplicationController
  def index
    @media = Medium.all
  end

  def show
    @medium = Medium.find(params[:id])
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
    @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])
    if @medium.update(medium_params)
      redirect_to @medium
    else
      render :edit
    end
  end

  def destroy
    @medium = Medium.find(params[:id])
    if @medium.destroy
      redirect_to media_path
    end
  end

  private

  def medium_params
    params.require(:medium).permit(:youtube_id, :description)
  end
end
