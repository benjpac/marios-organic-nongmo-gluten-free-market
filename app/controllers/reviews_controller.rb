class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :_new
    end
  end

  private

  def review_params
    params.require(:review).permit(:author, :content_body, :rating, :product_id)
  end

end
