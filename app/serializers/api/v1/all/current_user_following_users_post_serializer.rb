module API
  module V1
    module All
      class CurrentUserFollowingUsersPostSerializer < ::PostSerializer
        attributes :user, :profile, :revision, :post_likings_count, :comments_count

        def user
          object.user
        end

        def profile
          object.user.profile
        end

        def revision
          object.revisions.find(object.newest_revision_id)
        end

        def post_likings_count
          object.post_likings.count
        end

        def comments_count
          object.comments.count
        end
      end
    end
  end
end
