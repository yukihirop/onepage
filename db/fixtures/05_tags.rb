TAG_LIST = %w[Python JavaScript Ruby AWS Android Docker Swift iOS Rails PHP].freeze

TAG_LIST.each do |tag_name|
  FactoryBot.create(:tag, name: tag_name)
end
