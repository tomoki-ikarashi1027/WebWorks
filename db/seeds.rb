# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ prefecture_name: 'Star Wars' }, { prefecture_name: 'Lord of the Rings' }])
#   Character.create(prefecture_name: 'Luke', movie: movies.first)

# Prefecture.find_or_create_by(
#   [
#     {
#       id: 1,
#       prefecture_name: 'hokkaido',
#     },
#     {
#       id: 2,
#       prefecture_name: 'aomoriken',

#     },
#     {
#       id: 3,
#       prefecture_name: 'akitaken',
#     }
#   ]
# )

# Prefecture.create(:prefecture_name => '北海道')
# Prefecture.create(:prefecture_name => '青森県')
# Prefecture.create(:prefecture_name => '秋田県')



# Tag.create([
#   { language: 'タグ1' },
#   { language: 'タグ2' },
#   { language: 'タグ3' },
#   { language: 'タグ4' },
#   { language: 'タグ5' }
# ])

# Tag.create([
#   { framework: 'タグ1' },
#   { framework: 'タグ2' },
#   { framework: 'タグ3' },
#   { framework: 'タグ4' },
#   { framework: 'タグ5' }
# ])

# 5.times do
#   Memo.create(
#     title: Faker::Lorem.word,
#     body: Faker::Lorem.sentence,
#   )
# end

# 3.times { Task.create!(name: 'Sample Task') }
# 2.times { Task.create!(name: 'Sample Task', is_done: true) }

# 48.times do
#   Prefecture.create(
#     prefecture_name: Faker::Address.state
#   )
# end

Prefecture.create( prefecture_name: '北海道' )
Prefecture.create( prefecture_name: '青森県' )
Prefecture.create( prefecture_name: '岩手県' )
Prefecture.create( prefecture_name: '宮城県' )
Prefecture.create( prefecture_name: '秋田県' )
Prefecture.create( prefecture_name: '山形県' )
Prefecture.create( prefecture_name: '福島県' )
Prefecture.create( prefecture_name: '茨城県' )
Prefecture.create( prefecture_name: '栃木県' )
Prefecture.create( prefecture_name: '群馬県' )
Prefecture.create( prefecture_name: '埼玉県' )
Prefecture.create( prefecture_name: '千葉県' )
Prefecture.create( prefecture_name: '東京都' )
Prefecture.create( prefecture_name: '神奈川県' )
Prefecture.create( prefecture_name: '山梨県' )
Prefecture.create( prefecture_name: '長野県' )
Prefecture.create( prefecture_name: '新潟県' )
Prefecture.create( prefecture_name: '富山県' )
Prefecture.create( prefecture_name: '石川県' )
Prefecture.create( prefecture_name: '福井県' )
Prefecture.create( prefecture_name: '岐阜県' )
Prefecture.create( prefecture_name: '静岡県' )
Prefecture.create( prefecture_name: '愛知県' )
Prefecture.create( prefecture_name: '三重県' )
Prefecture.create( prefecture_name: '滋賀県' )
Prefecture.create( prefecture_name: '京都府' )
Prefecture.create( prefecture_name: '大阪府' )
Prefecture.create( prefecture_name: '兵庫県' )
Prefecture.create( prefecture_name: '奈良県' )
Prefecture.create( prefecture_name: '和歌山県' )
Prefecture.create( prefecture_name: '鳥取県' )
Prefecture.create( prefecture_name: '島根県' )
Prefecture.create( prefecture_name: '岡山県' )
Prefecture.create( prefecture_name: '広島県' )
Prefecture.create( prefecture_name: '山口県' )
Prefecture.create( prefecture_name: '徳島県' )
Prefecture.create( prefecture_name: '香川県' )
Prefecture.create( prefecture_name: '愛媛県' )
Prefecture.create( prefecture_name: '高知県' )
Prefecture.create( prefecture_name: '福岡県' )
Prefecture.create( prefecture_name: '佐賀県' )
Prefecture.create( prefecture_name: '長崎県' )
Prefecture.create( prefecture_name: '熊本県' )
Prefecture.create( prefecture_name: '大分県' )
Prefecture.create( prefecture_name: '宮崎県' )
Prefecture.create( prefecture_name: '鹿児島県' )
Prefecture.create( prefecture_name: '沖縄県' )