class IconsController < ApplicationController
  # GET /icons
  # GET /icons.json
  def index
  end

  def new
    @icon = Icon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @icon }
    end
  end

  def create
    @icon = Icon.find_by_class_name params[:icon][:class_name]
    if @icon
      @icon.icon_url = params[:icon][:icon_url]
    else
      @icon = Icon.new params[:icon]
    end

    if @icon.save
      redirect_to root_path
    end
  end
end
