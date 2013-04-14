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

    unless @icon
      @icon = Icon.new params[:icon]
    end

    require "base64"
    image = params[:image]
    @icon.base64_encoded_binary = [File.read(image.tempfile)].pack("m")
    @icon.content_type = image.content_type

    if @icon.save
      redirect_to root_path
    end
  end
end
