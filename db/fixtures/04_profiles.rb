# 参考
# https://ja.stackoverflow.com/questions/19451/rails%E3%81%A7%E3%83%86%E3%82%B9%E3%83%88%E3%82%84%E9%96%8B%E7%99%BA%E7%94%A8%E3%81%AE%E5%88%9D%E6%9C%9F%E3%83%87%E3%83%BC%E3%82%BF%E3%83%90%E3%82%A4%E3%83%8A%E3%83%AA%E3%82%92%E7%94%A8%E6%84%8F%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95
User.all.each do |user|
  image_path = Rails.root.join('spec', 'images', 'profile', 'default.jpg')
  FactoryBot.create(:profile, user: user, image: File.new(image_path))
end
