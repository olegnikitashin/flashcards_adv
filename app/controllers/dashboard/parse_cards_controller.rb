class Dashboard::ParseCardsController < Dashboard::BaseController
  def new
  end

  def create
    AddCardsFromUrlJob.perform_later(card_params.to_h)
    redirect_to cards_path, notice: "The request for getting cards from #{card_params[:url]} was created!"
  end

  private

  def card_params
    params.require(:parse_cards).permit(:user_id, :url, :original_text_selector, :translated_text_selector, :block_id)
  end
end
