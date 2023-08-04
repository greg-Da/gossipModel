class LikesController < ApplicationController
    before_action :is_logged_in?
    
    def create
        like = Like.new
        if params[:gossip_id]
            if is_liked?("gossip", params[:gossip_id])
                flash[:warning] = "Tu ne peux pas liker plusieur fois le même potin"
                redirect_back_or_to root_path
            else
                like.user_id = current_user.id
                like.gossip_id = params[:gossip_id]

                if like.save
                    redirect_back_or_to root_path
                else
                    flash[:warning] = "Le like ne s'est pas enregistré"
                    redirect_back_or_to root_path
                end
            end
        else
            if is_liked?("comment", params[:comment_id])
                flash[:warning] = "Tu ne peux pas liker plusieur fois le même potin"
                redirect_back_or_to root_path
            else
                like.user_id = current_user.id
                like.comment_id = params[:comment_id]

                if like.save
                    redirect_back_or_to root_path
                else
                    flash[:warning] = "Le like ne s'est pas enregistré"
                    redirect_back_or_to root_path
                end
            end
        end

    end
    
    def destroy
        if params[:gossip_id]
            like = Gossip.find(params[:gossip_id]).likes.where(user_id: current_user.id)[0]
            like.destroy
        else
            like = Comment.find(params[:comment_id]).likes.where(user_id: current_user.id)[0]
            like.destroy
        end
        redirect_back_or_to root_path

    end
    
    private
    
    def is_liked?(type, id)
        if type == 'gossip'
            if Gossip.find(id).likes.where(user_id: current_user.id) == []
                return false
            else
                return true
            end
        else
            if Comment.find(id).likes.where(user_id: current_user.id) == []
                return false
            else
                return true
            end
        end
    end
    
end
