User.all.each do |user|
  FactoryBot.create_list(:post_with_revisions, 3, user: user)
end
