class ReviewsController < ApplicationController
def new
  @fundi = Fundi.find(params[:fundi_id])
  @review = @fundi.reviews.new
end
 def create
   @fundi = Fundi.find(params[:fundi_id])
   @review = @fundi.reviews.new(review_params)
   if @review.save
     redirect_to fundi_path(@review.fundi)
   else
     render :new
   end
 end

 private
   def review_params
     params.require(:review).permit(:name, :comment)
   end
 end
