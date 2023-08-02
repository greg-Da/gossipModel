class GossipsController < ApplicationController
  
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new()

  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first)

    if @gossip.save
      flash[:success] = "Potins créé"
      redirect_to gossips_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.title = params[:title]
    @gossip.content = params[:content]

    if @gossip.save
      flash[:success] = "Potins édité"
      redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:warning] = "Supression du potin"
    redirect_to gossips_path
  end
end
