module ActiveModelSerializers
  class SerializationContext
    def initialize(*args)
      options = args.extract_options!
      if args.size == 1
        request = args.pop
        # requestはRack::Requestクラスのインスタンスなので、original_urlメソッドが使えない
        # original_urlはActionDispatch::Requestクラスのメソッドである。
        # なので代わりにurlを使用する。
        # 同様にquery_parametersも使えないので、envから参照する。
        # options[:request_url] = request.original_url[/\A[^?]+/]
        # options[:query_parameters] = request.query_parameters
        options[:request_url] = request.url[/\A[^?]+/]
        options[:query_parameters] = request.env["rack.request.query_hash"]
      end
      @request_url = options.delete(:request_url)
      @query_parameters = options.delete(:query_parameters)
      @url_helpers = options.delete(:url_helpers) || self.class.url_helpers
      @default_url_options = options.delete(:default_url_options) || self.class.default_url_options
    end
  end
end
