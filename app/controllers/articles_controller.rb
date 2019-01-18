class ArticlesController < ApplicationController
  def index
    @articles = Article.order(:created_at)
  end

  def show
    @article = Article.find(params[:id])

    @article.content = ContentTagsService.instance.parse_content_tags(@article.content)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
