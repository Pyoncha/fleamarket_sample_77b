require "fileutils"
Dir.chdir 'public/uploads/image/image/'
FileUtils.rm(Dir.glob('*.*'))

Image.seed do |s|
  s.id = 1
  s.image = Rails.root.join("db/fixtures/development/images/a0003407_main.jpg").open
  s.item_id = 1
end
Image.seed do |s|
  s.id = 2
  s.image = Rails.root.join("db/fixtures/development/images/ootoro_pic02.jpg").open
  s.item_id = 2
end
Image.seed do |s|
  s.id = 3
  s.image = Rails.root.join("db/fixtures/development/images/footer_totop.png").open
  s.item_id = 3
end
Image.seed do |s|
  s.id = 4
  s.image = Rails.root.join("db/fixtures/development/images/battle-sec03_logo.png").open
  s.item_id = 4
end
Image.seed do |s|
  s.id = 5
  s.image = Rails.root.join("db/fixtures/development/images/1WftJJM1_400x400.jpg").open
  s.item_id = 5
end
Image.seed do |s|
  s.id = 6
  s.image = Rails.root.join("db/fixtures/development/images/ootoro_pic02.jpg").open
  s.item_id = 6
end
