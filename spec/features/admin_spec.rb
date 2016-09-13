require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'administration panel' do
  describe 'admin access' do
    before do
      create(:admin)
      visit trainer_path
      login('admin@test.com', '12345', 'Войти')
    end

    it 'will allow admin to access admin panel' do
      visit "/admin"
      expect(page).to have_content 'Администрация сайта'
    end
  end

  describe 'user access' do
    before do
      create(:user)
      visit trainer_path
      login('test@test.com', '12345', 'Войти')
    end

    it 'will not alow simple user to access admin panel' do
      visit "/admin"
      expect(page).to have_content 'Добро пожаловать'
    end
  end
end
