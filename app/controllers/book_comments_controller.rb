class BookCommentsController < ApplicationController
  def create
    @book_f = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book_f.id
    comment.save
  end
  
  def destroy
    @book_f = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
