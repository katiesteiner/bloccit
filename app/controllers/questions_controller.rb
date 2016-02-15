class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(params.require(:post).permit(:title, :body))
    if @question.save
      flash[:notice] = "Question was posted"
      redirect_to @post
    else
      flash[:error] = "There was an error posting the question. Please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body))
      flash[:notice] = "Question was asked."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again"
      render :edit
    end
  end

  def destroy
  end
end
