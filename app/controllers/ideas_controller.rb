class IdeasController < ApplicationController

    def new
        @idea = Idea.new
    end

    def create
        idea_params = params.require(:idea).permit(:title, :description)
        @idea = Idea.new idea_params
        if @idea.save
            render plain: "Product Created"
        else
            render :new
        end
    end

end
