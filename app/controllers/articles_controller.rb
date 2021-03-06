class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new article_params
    if @article.save
      flash[:success] = 'Article is created!'
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:success] = 'Article is updated!'
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article is deleted!'
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find params[:id]
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

end

