class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]
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
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update article_params
      flash[:success] = 'Article is updated!'
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    flash[:success] = 'Article is deleted!'
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end

