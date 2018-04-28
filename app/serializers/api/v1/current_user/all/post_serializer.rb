module API
  module V1
    module CurrentUser
      module All
        class PostSerializer < ::PostSerializer
          attribute :revision

          def revision
            object.revisisions.find(object.newest_revision_id)
          end
        end
      end
    end
  end
end