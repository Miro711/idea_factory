class ReviewsController < ApplicationController

    def create
        @idea = Idea.find(params[:idea_id])
        @review = Review.new review_params
        @review.idea = @idea
        if @review.save
          redirect_to @idea
        else
          @reviews = @ideas.reviews.order(created_at: :desc)
          render 'ideas/show'
        end
      end
    
      private
    
      def review_params
        params.require(:review).permit(:body)
      end

end
