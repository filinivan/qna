require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) { create(:question) }
  let!(:answer) { create(:answer, question: question) }

   describe "GET /new" do
    it 'renders new view' do
      get :new, params: { question_id: question }
      expect(response).to render_template :new
    end 
   end

   describe "POST #create" do
    context 'with valid attributes' do
      it 'save answer in database' do
        expect { post :create, params: { answer: attributes_for(:answer), question_id: question.id}}.to change(question.answers, :count).by(1)
      end

      it 'redirect after success' do
        post :create, params: { answer: attributes_for(:answer), question_id: question.id}
        expect(response).to redirect_to [assigns(:question), assigns(:answer)]
      end
    end
    context 'with invalid attributes' do
      it 'not save answer in database' do
        expect { post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question.id}}.to_not change(question.answers, :count)
      end

      it 're-renders to new view' do
        post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question.id}
        expect(response).to render_template :new
      end
    end
   end
end
