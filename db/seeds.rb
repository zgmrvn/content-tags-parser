# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

ContentTag.create([
  { tag: 'title', html: '<h5>', color: '17a2b8' },
  { tag: 'important', html: '<strong style="color: #ff0000;">', color: 'dc3545' },
  { tag: 'stylised', html: '<i><s>', color: '20c997' },
  { id: 9, tag: 'quote', html: '<span class="quote">', color: '6c757d' }
])

articles = YAML.load_file('db/articles.yml')
articles.each { |a| Article.create(a) }
