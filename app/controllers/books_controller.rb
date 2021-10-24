class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
    @book = ook.find(params[:id])
  end

  def new
     @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
