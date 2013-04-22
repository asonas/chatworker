class IconsController < ApplicationController

  MAX_KILO_BYTE = 10
  MAX_FILE_SIZE = MAX_KILO_BYTE * 1024

  # GET /icons
  # GET /icons.json
  def index
    @icons = []
    Icon.all.each do |icon|
      @icons << {
        class_name: icon.class_name,
        data_uri_encoded_data: icon.data_uri_encoded_data,
      }
    end
    respond_to do |format|
      format.html
      format.json do
        render json: @icons
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

    if MAX_FILE_SIZE < image.size
      return redirect_to "/"
    end

    @icon.base64_encoded_binary = [File.read(image.tempfile)].pack("m")
    @icon.content_type = image.content_type

    if @icon.save
      redirect_to root_path
    end
  end
end
