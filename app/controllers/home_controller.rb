class HomeController < ApplicationController
  def index
    @article = Article.order('RANDOM()').first
    
    @article.content = ContentTagsService.instance.parse_content_tags(@article.content)
  end
end
