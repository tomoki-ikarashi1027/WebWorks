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
#       prefecture_name: '北海道',
#     },
#     {
#       id: 2,
#       name: '青森',

#     },
#     {
#       id: 3,
#       name: '秋田',
#     }
#   ]
# )

Prefecture.create(:prefecture_name => 'hokkaido')
# Prefecture.create(:prefecture_name => '青森県')
# Prefecture.create(:prefecture_name => '秋田県')