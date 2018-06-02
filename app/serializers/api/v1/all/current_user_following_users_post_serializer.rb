module API
  module V1
    module All
      class CurrentUserFollowingUsersPostSerializer < ::PostSerializer
        attributes :follower_profile, :revision, :post_liking, :comment, :resource_count, :action_type

        def follower_profile
          case action_type
          when 'post'
            object.user.profile
          when 'post_liking'
            User.find(post_liking.user_id).profile
          when 'comment'
            User.find(comment.user_id).profile
          else
            object.user.profile
          end
        end

        def revision
          object.revisions.find(object.newest_revision_id)
        end

        def post_liking
          object.post_likings.find_by(post_id: object.id)
        end

        def comment
          object.comments.find_by(post_id: object.id)
        end

        def resource_count
          case action_type
          when 'post'
            nil
          when 'post_liking'
            nil
          when 'comment'
            object.comments.count
          else
            nil
          end
        end

        def action_type
          object.action_type || ''
        end
      end
    end
  end
end
