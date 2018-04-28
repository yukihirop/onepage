module API
  module V1
    module All
      class CurrentUserFollowingTagsPostSerializer < ::PostSerializer
        attributes :user, :profile, :revision, :post_likings_count, :tags

        has_many :post_likings

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

        def tags
          API::V1::All::Tag.where(id: object.post_taggings.pluck(:tag_id))
        end
      end
    end
  end
end
