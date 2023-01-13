require 'rails_helper'

feature 'User can see all questions', %q{
  All users can see questions
} do

  given(:user) { create(:user) }

  describe 'Authenticate user'do
  
    background do
      sign_in(user)

      visit questions_path
    end

    scenario 'see questions' do

      expect(page).to have_content 'Questions:'
    end
  end

  scenario 'Unauthenticated user see questions' do
    visit questions_path

    expect(page).to have_content 'Questions:'
  end
end
