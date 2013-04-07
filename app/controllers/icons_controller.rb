class IconsController < ApplicationController
  # GET /icons
  # GET /icons.json
  def index
    respond_to do |format|
      format.html
      format.json do
        icons = Icon.select(:class_name).select(:icon_url).where(class_name: params[:icon_class_names])
        render json: icons
      end
    end
  end

  def new
    @icon = Icon.new
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
