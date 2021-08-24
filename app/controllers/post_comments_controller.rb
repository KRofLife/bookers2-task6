class PostCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    @comment = PostComment.new(post_comment_params)
    @books = Book.all
    @book = Book.new
   if @comment.save
    redirect_to book_path(book)
   else
    # @book = Book.new
    render "books/index"
   end
  end

  def destroy
    PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
