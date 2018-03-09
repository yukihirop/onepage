require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # 今回はRspecを使うのでこのように設定
    with.test_framework :rspec

    # shoulda-matchersを使いたいテストライブラリを指定
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end
