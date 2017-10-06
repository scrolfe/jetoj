class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def calendar
    # event = Event.first
    # title = event.name
    # start_time = event.date_time.strftime("%Y-%m-%d")
    # end_time = event.date_time.advance(days: 1).strftime("%Y-%m-%d")

    cal_data = Event.all.map { |e| {title: e.name, start: e.date_time.strftime("%Y-%m-%dT%H:%M:00"), end: e.date_time.strftime("%Y-%m-%dT%H:%M:00")} }.to_json

    respond_to do |format|
      format.json do
        # render json: {
          # data: {
          #   title: "#{title}",
          #   start: "#{start_time}",
          #   end: "#{end_time}"
          # }
          # }

        render json: { data: "#{cal_data}" }
      end
    end
  end

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
    params.require(:event).permit(:branch, :name, :description, :date_time, :image, address: [:street_address, :city, :state, :zip, :branch])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
