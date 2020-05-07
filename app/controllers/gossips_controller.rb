class GossipsController < ApplicationController
  # Aller chercher les Gossip
  def index
    @gossips = Gossip.all.order("created_at DESC")
  end

  # Montrer aller chercher un Gossip
  def show
    @gossip = Gossip.find(params[:id])
  end

  # Vue sur création
  def new
    @gossip = Gossip.new(title: "", content: "", user: User.last)
  end

  # Creer un nouveau Gossip
  def create
    @gossip = Gossip.new(title: params[:title],
                         content: params[:content],
                         user: User.find(params[:user]))
    if @gossip.save
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  # Aller chercher le Gossip pour Edition
  def edit
    @gossip = Gossip.find(params[:id])
  end

  # Editer un Gossip (le titre ne veut pas pour le moment)
  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:name, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  # Supprimer un Gossip
  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end
end
