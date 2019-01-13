class ContentTagsController < ApplicationController
  def index
    @content_tags = ContentTag.all
  end

  def new
    @content_tag = ContentTag.new
    @content_tag.color = 'ffffff'
  end

  def edit
    @content_tag = ContentTag.find(params[:id])
  end

  def create
    @content_tag = ContentTag.new(content_tag_params)

    if @content_tag.save
      redirect_to @content_tag
    else
      render 'new'
    end
  end

  def update
    @content_tag = ContentTag.find(params[:id])

    if @content_tag.update(content_tag_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  private

  def content_tag_params
    params.require(:content_tag).permit(:tag, :html, :color)
  end
end
