class IconsController < ApplicationController
  # GET /icons
  # GET /icons.json
  def index
    respond_to do |format|
      format.html
      format.json do
        icon = Icon.where(class_name: params[:class_name]).first
        render json: {
          data: icon.base64_encoded_data
        }
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
