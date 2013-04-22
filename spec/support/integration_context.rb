shared_context "integration" do
  let :api do
    ENV['API_URL'] = ENV['API_URL'] || 'https://store-vnh06c71.mybigcommerce.com'
    ENV['API_USER'] = ENV['API_USER'] || 'apiuser'
    ENV['API_PASS'] = ENV['API_PASS'] || '123456'
    
    Bigcommerce::Api.new({
      :store_url => ENV['API_URL'],
      :username => ENV['API_USER'],
      :api_key => ENV['API_PASS']
    })
  end
end