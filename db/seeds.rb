# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Prefecture.find_or_create_by(
#   [
#     {
#       id: 1,
#       prefecture_name: 'hokkaido',
#     },
#     {
#       id: 2,
#       name: 'aomoriken',

#     },
#     {
#       id: 3,
#       name: 'akitaken',
#     }
#   ]
# )

Prefecture.create(:prefecture_name => '北海道')
Prefecture.create(:prefecture_name => '青森県')
Prefecture.create(:prefecture_name => '秋田県')

Tag.create([
  { language: 'タグ1' },
  { language: 'タグ2' },
  { language: 'タグ3' },
  { language: 'タグ4' },
  { language: 'タグ5' }
])

Tag.create([
  { framework: 'タグ1' },
  { framework: 'タグ2' },
  { framework: 'タグ3' },
  { framework: 'タグ4' },
  { framework: 'タグ5' }
])