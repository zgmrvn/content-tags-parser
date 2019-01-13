class CreateContentTags < ActiveRecord::Migration[5.2]
  def change
    create_table :content_tags do |t|
      t.string :tag
      t.string :html
      t.string :color

      t.timestamps
    end
  end
end
