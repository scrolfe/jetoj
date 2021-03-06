class PerformersController < ApplicationController
  before_action :set_performer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:chicago, :minneapolis, :show]

  def chicago
    @performers = Performer.chicago
  end

  def minneapolis
    @performers = Performer.minneapolis
  end

  def show
  end

  def new
    @performer = Performer.new
  end

  def create
    @performer = current_user.performers.new(performer_params)
    if @performer.save
      redirect_to @performer
    else
      p @performer.errors.details
      render :new
    end
  end

  def edit
  end

  def update
    if @performer.update(performer_params)
      redirect_to @performer
    else
      render :edit
    end
  end

  def destroy
    if @performer.destroy
      redirect_to performers_path
    end
  end

  private

  def performer_params
    params.require(:performer).permit(:first_name, :last_name, :bio, :headshot)
  end

  def set_performer
    @performer = Performer.find(params[:id])
  end
end
