class TalksController < ApplicationController
  before_filter :verify_password, :only => [:create, :update]

  def index
    @talks = Talk.all
    @talk  = Talk.new
  end

  def create
    @talk = Talk.new(params[:talk])

    if @talk.save
      redirect_to talks_url, notice: 'Talk was successfully created.'
    else
      @talks = Talk.all
      render action: "index"
    end
  end

  private

  def verify_password
    unless params[:password] == "" then
      sleep rand(10) unless Rails.env.test?
      redirect_to root_path
    end
  end
end
