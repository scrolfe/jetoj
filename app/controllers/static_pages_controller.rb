class StaticPagesController < ApplicationController
  layout "home", only: :home

  def login
  end

  def home
    @chicago_performers = Performer.chicago
    @minneapolis_performers = Performer.minneapolis
    @featured_event = Event.first
  end

  def about
  end
end
