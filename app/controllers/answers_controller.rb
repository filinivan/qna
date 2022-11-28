class AnswersController < ApplicationController
  before_action :find_answer, only: %i[edit update destroy]
  before_action :find_question, only: %i[create]

  def new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to [@question, @answer]
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Question.find(params[:id])
  end
end
