module Pg
  class TagsWithPostTaggings
    include ActiveModel::Model

    def result
      template = File.read(Rails.root.join('app/sqls/pg/tags_with_post_taggings.sql.erb'))
      sql = ERB.new(template).result(binding)
      args = [sql, {}]
      query = ApplicationRecord.send(:sanitize_sql_array, args)
      ApplicationRecord.connection.select_all(query).to_hash
    end
  end
end

