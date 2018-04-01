class API::V1::CurrentUser::All::PostTagging < PostTagging
  belongs_to :post, optional: true
end
