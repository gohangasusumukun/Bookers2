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
    # 作成
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index

    end
  end

  def show
    # 詳細へ
    @book = Book.find(params[:id])
  end

  def edit
    # 編集へ
    @book = Book.find(params[:id])
  end

  def update
    # アップデート
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    # 削除
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to "/books"
    else
　　# indexへ与える
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end