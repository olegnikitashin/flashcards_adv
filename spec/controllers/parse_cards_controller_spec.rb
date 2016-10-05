require 'rails_helper'

RSpec.describe Dashboard::ParseCardsController, type: :controller do
  context "non-authenticated access" do
    describe "GET ParseCards#new" do
      it "redirect to login page" do
        get :new
        expect(response).to redirect_to login_path
      end
    end
  end

  context "authenticated access" do
    let(:user) { create(:user_with_one_block_without_cards) }
    before do
      @user = create(:user)
      @block = create(:block, user: @user)
      @controller.send(:auto_login, @user)
    end

    describe "GET ParseCards#new" do
      it "returns a 200 status" do
        get :new
        expect(response.status).to eq 200
      end
    end

    describe "POST ParseCards#create" do
      it "redirects to cards page" do
        post :create, params:{ parse_cards: { user_id: @user.id, url: 'http://example.com', original_text_selector: 'a.classname', translated_text_selector: 'div.classname', block_id: @user.blocks.first.id } }
        expect(response.status).to redirect_to cards_path
      end
    end
  end
end
