class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = params[:branch].present? ? Event.branch(params[:branch]) : Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
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
    params.require(:event).permit(:name, :description, :location, :date_time, :image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
