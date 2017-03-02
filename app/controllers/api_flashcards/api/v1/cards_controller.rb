module ApiFlashcards
  module Api::V1
    class CardsController < ApiFlashcards::ApplicationController
      respond_to :json

      def index
        respond_with current_user.cards
      end

      def show
        respond_with Card.find(params[:id])
      end

      def create
        card = current_user.cards.build(card_params)
        if card.save
          render json: card, status: 201
        else
          render json: { errors: card.errors }, status: 422
        end
      end

      private

      def card_params
        params.permit(:original_text, :translated_text, :block_id, :remote_image_url)
      end
    end
  end
end
