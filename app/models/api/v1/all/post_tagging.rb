class API::V1::All::PostTagging < PostTagging
  belongs_to :tag, optional: true
  belongs_to :post, optional: true

  class << self
    def filtered_post_ids_by(tag_ids = [])
      where(tag_id: tag_ids).pluck(:post_id).uniq
    end
  end
end
