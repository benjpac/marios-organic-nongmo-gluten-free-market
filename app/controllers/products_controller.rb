class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @most_reviewed = Product.most_reviewed
    @three_most_recent = Product.three_most_recent
    @made_in_usa = Product.made_in_usa
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @review = @product.reviews.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product added'
    else
      render :new
    end
  end

  # def new_review
  #   @product = Product.find(params[:id])
  #   @review = @product.reviews.new
  # end

  def create_revieww
    @product = Product.find(params[:id])
    if @review.save
      redirect_to product_path(@product), notice: 'Review added'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.reviews.each do |review|
      review.destroy
    end
    @product.destroy
    redirect_to products_path, notice: 'Product deleted'
  end

private

  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end

end
