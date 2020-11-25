class Prefecture < ApplicationRecord
  has_many :companies, dependent: :destroy

  #    enum prefecture_name:{
  #    "---":0,
  #    hokkaido:1,aomoriken:2,iwateken:3,miyagiken:4,akitaken:5,yamagataken:6,hukushimaken:7,
  #    ibarakiken:8,tochigiken:9,gunmaken:10,saitamaken:11,chibaken:12,toukyouto:13,kanagawaken:14,
  #    niigataken:15,toyamaken:16,ishikawaken:17,hukuiken:18,yamanashiken:19,naganoken:20,
  #    gihuken:21,sizuokaken:22,aichiken:23,mieken:24,
  #    shigaken:25,kyoutohu:26,oosakahu:27,hyougoken:28,naraken:29,wakayamaken:30,
  #    tottoriken:31,simaneken:32,okayamaken:33,hiroshimaken:34,yamaguchiken:35,
  #    tokushimaken:36,kagawaken:37,ehimeken:38,kouchiken:39,
  #    hukuokaken:40,sagaken:41,nagasakiken:42,kumamotoken:43,ooitaken:44,miyazakiken:45,kagoshimaken:46,
  #    okinawaken:47
  #  }

  enum prefecture_name:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }
end
