module API::V1::All
  class CurrentUserFollowingUsers::PostWithActionType < Post
    class << self
      def with_action_type(user_ids, sort_key = 'updated_at')
        action_types = action_types(user_ids, sort_key)
        post_ids = action_types.map { |hwia| hwia[:post_id] }
        where(id: post_ids).each do |post|
          detail = action_types.find { |hwia| hwia[:post_id] == post.id }
          post.action_type = detail[:action_type]
        end
      end

      private

      def action_types(user_ids, sort_key = 'updated_at')
        details = details_sort_by(user_ids, sort_key)
        details.map { |hwia| hwia.slice(:post_id, :action_type) }
      end

      def details_sort_by(user_ids, sort_key)
        data = details_from_posts(user_ids) + details_from_comments(user_ids) + details_from_post_likings(user_ids)
        data.sort_by! { |el| el[sort_key] }.reverse!
        # 同じpost_idの時はupdated_atが新しいものを優先するようにする
        data.uniq { |h| h['post_id'] }.map(&:with_indifferent_access)
      end

      def details_from_posts(user_ids)
        # pluckではなくこっちを使うようにしよう
        # https://stackoverflow.com/questions/36011306/ruby-on-rails-4-pluck-results-to-hash
        data = Post.where(user_id: user_ids).select(:updated_at, :user_id, :id).as_json
        data.select do |h|
          h[:action_type] = :post
          h.transform_keys! do |_key|
            if _key == 'id'
              _key = 'post_id'
            else
              _key
            end
          end
        end
      end

      def details_from_comments(user_ids)
        data = Comment.where(user_id: user_ids).select(:updated_at, :user_id, :post_id, :id).as_json
        data.select { |h| h[:action_type] = :comment }
      end

      def details_from_post_likings(user_ids)
        data = PostLiking.where(user_id: user_ids).select(:updated_at, :user_id, :post_id, :id).as_json
        data.select { |h| h[:action_type] = :post_liking }
      end
    end
  end
end
