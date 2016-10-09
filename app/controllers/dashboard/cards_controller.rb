class Dashboard::CardsController < Dashboard::BaseController
  before_action :set_card, only: [:destroy, :edit, :update]

  def index
    @cards = current_user.cards.all.order('review_date')
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to cards_path
      ahoy.track "card:create", request.filtered_parameters
    else
      respond_with @card
    end
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      respond_with @card
    end
  end

  def destroy
    @card.destroy
    respond_with @card
  end

  def find_flickr
    @tag = params[:tag]
    @urls = FlickrPhotos.flickr(@tag)

    respond_to do |format|
      format.html
      format.js
    end
    ahoy.track "card:flickr", request.filtered_parameters
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date,
                                 :image, :image_cache, :remote_image_url, :remove_image, :block_id, :tag)
  end
end
