class API::V1::All::Profile < Profile
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  belongs_to :user, optional: true
end
