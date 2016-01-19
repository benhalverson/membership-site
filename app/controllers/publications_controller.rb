class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end

  def show
    @publications = Publication.find(params[:id])
  end
end
