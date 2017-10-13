class BooklistController < ApplicationController
  def index
  	@booklist = Book.all
  end

  def show 
 	@book = Book.find(params[:id])  
  end

  def new 
    @book = Book.new 
  end

  def edit 
  	@book = Book.find(params[:id])
  end

  def create 
    @book = Book.create(book_params)
    if @book.save #this is a boolean. true if it succeed. false if message fails to save
      redirect_to booklist_index_path
    else
      render :new #render stays on the current HTTP request
  	end
  end

  def update 
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to booklist_index_path
  end

  def destroy 
    Book.find(params[:id]).destroy
    redirect_to booklist_index_path
  end

  private

  def book_params
   	params.require(:book).permit(:name, :author)
  end
     
end
