class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    @results = Result.all
  end

  def home
    @search = Search.new
  end
end
