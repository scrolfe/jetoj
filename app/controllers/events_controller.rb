# require 'Google_Maps_Service'

class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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
      @coords = Event.set_coords(@event)
      @event.update_attributes(lat: @coords[:lat], lng: @coords[:lng])

      p "!!!!!!!!!!!!!!!!!!!!!!!!"
      p @event.lat

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
    params.require(:event).permit(:branch, :name, :description, :date_time, :image, :lat, :lng, address: [:street_address, :city, :state, :zip, :branch])
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
