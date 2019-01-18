class ContentTag < ApplicationRecord
  def preview
    html + tag + ContentTagsService.instance.get_closing_tags(html)
  end
end
