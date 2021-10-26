class BooksController < ApplicationController

  def index
    # 投稿内容を全て
    @books = Book.all
    # 投稿を送信（新規投稿）単数
    @book = Book.new

  end


  def new
　　# indexに一覧、新規投稿のためなし
  end

　def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(book.id)

　end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


end