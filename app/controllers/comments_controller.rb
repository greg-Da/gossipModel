class CommentsController < ApplicationController
  before_action :is_logged_in?, except: [:index, :show]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      flash[:warning] = "Tu n'en es pas l'auteur"
      redirect_back_or_to root_path
    end
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(content: params[:content], gossip_id: params[:gossip_id], user: User.find_by(id: session[:user_id]))

    if @comment.save
      flash[:success] = "Commentaire créé"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:warning] = "Commentaire non créé"
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user

      @comment.content = params[:content]

      if @comment.save
        flash[:success] = "Commentaire édité"
        redirect_to gossip_path(@comment.gossip.id)
      else
        flash[:warning] = "Commentaire non édité"
        redirect_to gossip_path(@comment.gossip.id)
      end
    else
      flash[:warning] = "Tu n'en es pas l'auteur"
      redirect_back_or_to root_path
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user

    @comment.destroy
    flash[:warning] = "Supression du commentaire"
    redirect_to gossip_path(@comment.gossip.id)

    else
      flash[:warning] = "Tu n'en es pas l'auteur"
      redirect_back_or_to root_path
    end
  end

end
