RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # fixture_file_uploadを使えるようにする
  # rspec内で、ファイルアップロードのテストに使用する
  config.include ActionDispatch::TestProcess

  # FactoryBot内での呼び出し
  # 参考
  # https://qiita.com/kon_yu/items/f532b67fb78aaa3df0ee
  FactoryBot::SyntaxRunner.class_eval do
    include ActionDispatch::TestProcess
  end
end
