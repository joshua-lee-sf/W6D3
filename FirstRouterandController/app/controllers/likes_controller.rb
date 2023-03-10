class LikesController < ApplicationController
    def index
        param = params[:art_work_id]
        param2 = params[:user_id]

        incoming_wildcard = Like.art_work_like_finder(param)
        incoming_wildcard2 = Like.user_like_finder(param2)

        if incoming_wildcard == nil
            render json: incoming_wildcard2
        elsif incoming_wildcard
            render json: incoming_wildcard
        else
            render json: ["Post, not found."], status: 404
        end
    end

    def create
        like = Like.new(like_params)

        if like.save!
          render json: like
        else
          render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        incoming_wildcard = params[:id]
        like = Like.find(incoming_wildcard)
        like.destroy
    
        redirect_to likes_url
    end

    private
    def like_params
        params.require(:likes).permit(:user_id, :art_work_id)
    end
end