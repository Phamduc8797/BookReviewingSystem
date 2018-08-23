class ReviewsController < ApplicationController
  before_action :load_review, except: :create

  def show; end

  def edit; end

  def create
    @book = Book.find_by id: params[:book_id]
    if @book
      @review = @book.reviews.new review_params
      @review.user_id = current_user.id
      if @review.save
        flash[:success] = t ".success"
        redirect_to book_path @book
      else
        flash[:danger] = t ".error"
        redirect_to book_path @book
      end
    else
      flash[:danger] = "not_found"
      redirect_to books_path
    end
  end

  def update
    if correct_review? @review
      if @review.update_attributes review_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".update_failed"
      end
    end
    redirect_to book_path @book
  end

  def destroy
    if correct_review? @review
      if @review.destroy
        flash[:success] = t ".deleted"
      else
        flash[:error] = t ".delete_failed"
      end
    else
      flash.now[:danger] = t ".unauthorized"
    end
    redirect_to book_path @book
  end

  private

  def review_params
    params.require(:review).permit :content, :user_id, :book_id
  end

  def load_review
    if @book = Book.find_by(id: params[:book_id])
      return if @review = @book.reviews.find_by(id: params[:id])
      flash[:danger] = t ".not_found"
      redirect_to book_path @book
    else
      flash[:danger] = t ".not_found"
      redirect_to books_path
    end
  end
end
