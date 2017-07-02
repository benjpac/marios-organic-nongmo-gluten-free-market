class ReviewsController < ApplicationController
  before_action :find_product

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product), notice: 'Review added'
    else
      render :new
    end
  end

  def edit
    find_review
  end

  def update
    find_review
    if @review.update 
      redirect_to product_path(@product), notice: "Review updated"
    else
      render :edit
    end
  end

  def destroy
    find_review
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted'
  end

private

  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
