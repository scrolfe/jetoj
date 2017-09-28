class StaticPagesController < ApplicationController
  layout "home", only: :home

  def login
  end

  def home
  end

  def about
  end
end
