class ListsController < ApplicationController

# Un utilisateur peut ajouter un nouveau signet (association film/liste) à une liste existante

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  # 1. new creer le formulaire
  def new
    @list = List.new
  end
  # 2. soummettre le formulaire
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
