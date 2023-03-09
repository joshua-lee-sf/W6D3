class CommentsController < ApplicationController
    def index
        param2 = params[:user_id]
        param = params[:art_work_id]
        # debugger
        incoming_wildcard = Comment.comment_finder(param)
        incoming_wildcard2 = Comment.art_work_comment_finder(param2)

        if incoming_wildcard == nil
            render json: incoming_wildcard2
        elsif incoming_wildcard
            render json: incoming_wildcard
        else
            render json: ["I couldn't find this comment."], status: 404
        end
    end

    def create
        comment = Commment.new(comment_params)
        if comment.save!
            render json: comment
        else
            render json: ["Couldn't post the comment."], status: 421
        end
    end

    def destroy
        comment = Commment.find(params[:id])
        comment.destroy

        redirect_to comments_url
    end

    private
    def comment_params
        params.require(:comments).permit(:author_id, :art_work_id, :body)
    end
end