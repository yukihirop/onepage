module API
  module V1
    module All
      class PostLikingSerializer < ::PostLikingSerializer
        attributes :id, :user_id, :post_id, :to_user_id, :created_at, :updated_at
      end
    end
  end
end
