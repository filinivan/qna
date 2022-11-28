require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }

   describe "GET /new" do
    it 'renders new view' do
      get :new, params: { question_id: question }
      expect(response).to render_template :new
    end 
   end

   describe "POST #create" do
    context 'with valid attributes'
    context 'with invalid attributes'
   end
end
