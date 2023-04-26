# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'adminpass',
  )

User.create!(
  [
    {name: 'name1',email: 'name1@email.com',password: 'password',birthplace: '北海道',introduction: '北の大地の魅力を発信していきます！'},
    {name: 'name2',email: 'name2@email.com',password: 'password',introduction: '地元・東北の魅力を発信していきます！'},
    {name: 'name3',email: 'name3@email.com',password: 'password'},
    {name: 'name4',email: 'name4@email.com',password: 'password',is_deleted: true}
  ]
  )
  
Region.create!(
  [
    {name: '北海道',image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/snw0011-004.jpg"), filename:"snw0011-004.jpg")},
    {name: '東北',image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/riv0065-051.jpg"), filename:"riv0065-051(1).jpg")},
    {name: '中部',image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yam0035-013.jpg"), filename:"yam0035-013.jpg")},
    {name: '関東',image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yak0034-003.jpg"), filename:"yak0034-003.jpg")}
  ]
  )
  
Tag.create!(
  [{name: '秋'},
  {name: '川'},
  {name: '夏'},
  {name: '桜'},
  {name: '春'},
  {name: '山'},
  {name: '富士山'},
  {name: '銘菓'}
  ]
  )
  

Post.create!(
  [
    {user_id: 2,region_id: 2,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/landscape-g206950787_640.jpg"), filename:"landscape-g206950787_640.jpg"),
      prefecture: ' 秋田',title: '秋の川',body: '秋の川を撮影。双六川上流。',status: 0},
    {user_id: 1,region_id: 1,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hokkaido-g70ed7c2f2_640.jpg"), filename:"hokkaido-g70ed7c2f2_640.jpg"),
      prefecture: '北海道',title: '札幌の公園',body: '天気のいい日に撮影。',status: 1},
    {user_id: 1,region_id: 1,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japanese-cherry-gbbce87634_640.jpg"), filename:"japanese-cherry-gbbce87634_640.jpg"),
      prefecture: '北海道',title: '札幌の公園',body: '桜満開、春満開！',status: 0},
    {user_id: 2,region_id: 2,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/fukushima-g8d6952f4d_640.jpg"), filename:"fukushima-g8d6952f4d_640.jpg"),
      prefecture: '福島',title: '磐梯山',body: '福島の雄大な山、磐梯山。',status: 0},
    {user_id: 3,region_id: 3,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mount-fuji-g95cf73299_640.jpg"), filename:"mount-fuji-g95cf73299_640.jpg"),
      prefecture: '山梨',title: '富士山麓の民家',body: '富士山麓にある古風な日本建築な民家の写真です。',status: 0},
    {user_id: 3,region_id: 3,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shirakawa-go-gafd5ab4a7_640.jpg"), filename:"shirakawa-go-gafd5ab4a7_640.jpg"),
      prefecture: '岐阜',title: '白川郷',body: '岐阜県西北部・世界遺産の白川郷。観光におすすめです。',status: 0},
    {user_id: 3,region_id: 3,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/bisquit-4797456_960_720.jpg"), filename:"bisquit-4797456_960_720.jpg"),
      prefecture: '富山',title: 'とやま銘菓',body: '〒○○○-○○○○ とやま銘菓　お手頃価格の菓子を販売。',status: 0},
    {user_id: 2,region_id: 2,image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/eclair-3366430_960_720.jpg"),filename:"eclair-3366430_960_720.jpg"),
      prefecture: '福島',title: '日本三代饅頭の店',body: '日本の老舗菓子店・柏屋。和菓子だけでなく洋菓子などたくさんんの菓子を取り扱ってます。',status: 0}
  ]
  )

PostTag.create!(
  post_id: Post.first.id,
  tag_id: Tag.first.id,
  )
PostTag.create!(
  post_id: Post.first.id,
  tag_id: Tag.second.id,
  )
  
PostTag.create!(
  post_id: Post.second.id,
  tag_id: Tag.third.id,
  )
  
PostTag.create!(
  post_id: Post.third.id,
  tag_id: Tag.fourth.id,
  )
PostTag.create!(
  post_id: Post.third.id,
  tag_id: Tag.fifth.id,
  )
  
PostTag.create!(
  post_id: Post.fourth.id,
  tag_id: Tag.third.id,
  )
  
PostTag.create!(
  post_id: Post.fifth.id,
  tag_id: Tag.third.id,
  )
PostTag.create!(
  post_id: Post.fifth.id,
  tag_id: Tag.find(6).id,
  )
PostTag.create!(
  post_id: Post.fifth.id,
  tag_id: Tag.find(7).id,
  )
  
PostTag.create!(
  post_id: Post.find(6).id,
  tag_id: Tag.third.id,
  )
PostTag.create!(
  post_id: Post.find(6).id,
  tag_id: Tag.find(6).id,
  )
  
PostTag.create!(
  post_id: Post.find(7).id,
  tag_id: Tag.find(8).id,
  )

PostTag.create!(
  post_id: Post.find(8).id,
  tag_id: Tag.find(8).id,
  )


Comment.create!(
  [{user_id: 1,post_id: 1,comment: '紅葉が綺麗ですね。いつか行ってみたい！'},
   {user_id: 3,post_id: 1,comment: '葉っぱの色がとっても鮮やか！'}
  ]
  )
  
Favorite.create!(
  [{user_id: 1,post_id: 1},
   {user_id: 3,post_id: 1},
   {user_id: 2,post_id: 2}, 
   {user_id: 1,post_id: 5},
   {user_id: 2,post_id: 5}
  ]
  )

Room.create!(
  [{owner_id:1,name: '都会出身集まれ'},
  {owner_id:2,name: '地方出身集まれ'}
  ]
  )

RoomUser.create!(
  room_id: 1,
  user_id: 2,
  )

RoomUser.create!(
  room_id: 1,
  user_id: 3,
  )

RoomUser.create!(
  room_id: 2,
  user_id: 3,
  )


Message.create!(
  [{room_id: 1,user_id: 1,message: 'こんにちは！'},
  {room_id: 1,user_id: 2,message: 'こんにちは！'},
  {room_id: 2,user_id: 2,message: 'こんにちは！'},
  {room_id: 2,user_id: 3,message: 'こんにちは！'}
  ]
  )
