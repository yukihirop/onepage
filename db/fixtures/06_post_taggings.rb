Post.all.each do |post|
  Tag.all.each do |tag|
    FactoryBot.create(:post_tagging, post: post, tag: tag)
  end
end
