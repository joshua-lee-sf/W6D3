class ArtWorksController < ApplicationController
    def index
        render json: ArtWork.all
    end
    
    def create
        art = ArtWork.new(art_work_params)
    
        if art.save!
          render json: art
        else
          render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def show
        incoming_wildcard = params[:id]
        user = ArtWork.find(incoming_wildcard)
        if user
            render json: user
        else
          render json: ['not found'], status: 404
        end
    end
    
    def update
        user = ArtWork.find_by(id: params[:id])
    
        if user && user.update(art_work_params)
          redirect_to art_works_url(user.id)
        else
          render json: user.errors.full_messages, status: 422
        end
    end
    
    def destroy
        incoming_wildcard = params[:id]
        user = ArtWork.find(incoming_wildcard)
        user.destroy
    
        redirect_to art_works_url
    end
    
    private
    def art_work_params
        params.require(:art_works).permit(:title, :image_url, :artist_id)
    end
end
