module API
  module V1
    module CurrentUser
      module All
        class FollowingTagsPostSerializer < ::PostSerializer
          attribute :revision, :tags

          def revision
            object.revisisions.find(object.newest_revision_id)
          end

          def tags
            API::V1::All::Tag.where(id: object.post_taggings.pluck(:tag_id))
          end
        end
      end
    end
  end
end