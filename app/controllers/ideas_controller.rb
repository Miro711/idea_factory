class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_idea, only: [:show, :destroy, :edit, :update]
  before_action :authorize_user!, only: [:destroy, :edit, :update]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @review = Review.new
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

  def authorize_user!
    redirect_to root_path, alert: 'Access Denied' unless can? :crud, @idea
  end

end
