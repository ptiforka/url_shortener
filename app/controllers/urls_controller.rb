class UrlsController < ApplicationController

  def index
    render json: { url: Url.all }
  end

  def show
    render json: { url: Url.find_by_short_url(params[:id]).original_url }
  end

  def create
    url = Url.find_or_create_by(params_url)
    render json: { response: 'created', url: url.short_url }
  end

  private

  def params_url
    params.require(:url).permit(
        :original_url
    )
  end
end