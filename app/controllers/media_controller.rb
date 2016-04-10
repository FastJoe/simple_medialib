class MediaController < ApplicationController
  load_and_authorize_resource except: [:create]

  def new
    @medium = Medium.new
    resource_class = "MediaTypes::#{params[:type].camelize}".constantize
    @medium.resource = resource_class.new
  end

  def create
    @medium = Medium.new(medium_params)
    @medium.user = current_user
    authorize! :create, @medium
    resource_class = "MediaTypes::#{params[:resource][:type].camelize}".constantize
    @medium.resource = resource_class.get_instance(resource_params)
    if @medium.save
      render :edit
    else
      render :new
    end
  end

  def update
    @medium.update_attributes(medium_params)
    render :edit
  end

  def index
    @media = current_user.media
  end

  def destroy
    @medium.destroy
    redirect_to action: :index
  end

  private

  def medium_params
    params.require(:medium).permit(:name,:description)
  end

  def resource_params
    params.require(:medium).permit(resource_attributes:[:url])[:resource_attributes]
  end

end
