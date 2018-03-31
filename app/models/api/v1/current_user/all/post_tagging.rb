class API::V1::CurrentUser::All::PostTagging < Post::Tagging
  belongs_to :post, optional: true
end
