class Admin::PublicationsController < AdminController
  before_filter :find_publication, only: [:show, :edit, :update, :destroy]

def index
  @publications = Publication.all
end

def show; end

def new
  @publications = Publication.new
end

def create
  @publications = Publication.new(publications_params)

  if @publications.save
    redirect_to
    admin_publication_path(@publications)
  else
    render :new, alert: "Something went wrong."
  end
end

def edit; end

def update
  if @publications.update(publications_params)
    redirect_to
    admin_publication_path(@publications)
  else
    render :new, alert: "Something went wrong."
  end
end

def destroy
  @publications.destroy
  redirect_to admin_publication_path,
  alert: "Successfully deleted publication."
end

private
def find_publication
  @publications = Publication.find(params[:id])
end

def publications_params
  params.require(:publications).permit(:title, :description, :file_url)
end
end
