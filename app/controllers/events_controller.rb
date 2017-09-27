class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    if params[:branch].present?
      @events = Event.where("DATE(date_time) >= DATE(?)", DateTime.now).branch(params[:branch]).order('date_time ASC')
    else
      @events = Event.where("DATE(date_time) >= DATE(?)", DateTime.now).order('date_time ASC')
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      p '!!!!!!!!!!1'
      p @event.errors.details
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date_time, :image, address: [:street_address, :city, :state, :zip, :branch])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
