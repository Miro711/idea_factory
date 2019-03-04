class IdeasController < ApplicationController

    def new
        @idea = Idea.new
    end

    def create
        idea_params = params.require(:idea).permit(:title, :description)
        @idea = Idea.new idea_params
        if @idea.save
            redirect_to idea_path(@idea)
        else
            render :new
        end
    end

    def show
        @idea = Idea.find params[:id]
    end

    def index
        @ideas = Idea.order(created_at: :DESC)
    end
    
    

end
