class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find(params[:question_id])
  end

  # POST /answers
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer was successfully saved."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      flash[:notice] = "Answer was successfully updated."
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    @question = Question.find(params[:question_id])
    flash[:notice] = "Answer was successfully destroyed."
    redirect_to question_path(@question)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:body, :user_id)
    end
end
