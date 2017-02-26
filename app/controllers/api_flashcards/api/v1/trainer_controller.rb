module ApiFlashcards
  module Api::V1
    class TrainerController < ApiFlashcards::ApplicationController

      respond_to :json

      def index
        if params[:id]
          @card = current_user.cards.find(params[:id])
        else
          if current_user.current_block
            @card = current_user.current_block.cards.pending.first
          else
            @card = current_user.cards.pending.first
          end
        end

        render json: @card, status: 200
      end

      def review_card
        @card = current_user.cards.find(params[:card_id])
        @oncheck = SuperMemo.new(@card, trainer_params[:user_translation])
        if upd = @oncheck.card_update
          render json: { message: t(:correct_translation_notice) }
        elsif upd.nil?
          render json: { message: t(:incorrect_translation_alert) }
        else
          render json: { message: t(:translation_from_misprint_alert) }
        end
      end

      private

      def trainer_params
        params.permit(:user_translation)
      end
    end
  end
end
