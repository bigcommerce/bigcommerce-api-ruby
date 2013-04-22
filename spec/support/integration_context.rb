shared_context "integration" do
  let :api do
    Bigcommerce::Api.new({
      store_url: ENV['API_URL'],
      username: ENV['API_USER'],
      api_key: ENV['API_PASS']
    })
  end
end