Post.all.each do |post|
  FactoryBot.create_list(:post_like, 10, post: post, user: post.user)
end
