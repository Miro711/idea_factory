class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :destroy, :edit, :update]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @reviews = @idea.reviews.order(created_at: :desc)
  end

  def index
    @ideas = Idea.order(created_at: :DESC)
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find params[:id]
  end
end
