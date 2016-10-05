class AddCardsFromUrlJob < ApplicationJob
  queue_as :add_cards

  def perform(params)
    parsed_words = WordParser.words_finder(params[:url], params[:original_text_selector], params[:translated_text_selector])

    if parsed_words
      parsed_words.each do |original, translation|
        Card.create(original_text: original, translated_text: translation, block_id: params[:block_id], user_id: params[:user_id])
      end
    end
  end
end
