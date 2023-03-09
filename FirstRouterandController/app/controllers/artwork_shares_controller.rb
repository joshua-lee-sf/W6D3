class ArtWorkSharesController < ApplicationController
  def index
    render json: ArtworkShare.all
  end

  def create
    art = ArtworkShare.new(artwork_shares_params)

    if art.save!
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    incoming_wildcard = params[:id]
    user = ArtworkShare.find(incoming_wildcard)
    user.destroy
    render json: user
  end

private
  def artwork_shares_params
      params.require(:artworks_shares).permit(:art_work_id, :viewer_id)
  end 
end