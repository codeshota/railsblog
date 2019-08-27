class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    authorize @articles
  end

  def show
  end

  def new
    # @article = current_user.articles.build
    @article = Article.new
    authorize @article
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    authorize @article
  
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
  
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def find_article
      @article = Article.find(params[:id])
      authorize @article
    end
end
