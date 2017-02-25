module ApiFlashcards
  class Api::V1::CardsController < Api::V1::ApiController

    respond_to :json

    def index
      respond_with Card.all
    end

    def show
      respond_with Card.find(params[:id])
    end

    def create
      card = current_user.cards.build(card_params)
      if card.save
        render json: card, status: 201, location: [:api, card]
      else
        render json: { errors: card.errors }, status: 422
      end
    end

    private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date,
                                   :image, :image_cache, :remove_image, :block_id, :user_id, :remote_image_url)
    end
end
