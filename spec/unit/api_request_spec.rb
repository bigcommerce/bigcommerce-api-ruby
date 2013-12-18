describe "API request delegation" do
  include_context "mock api"

  it "requests a resource" do
    api.connection.should_receive(:get).once.with("/time")
    api.time
  end

  it "requests a resource by id" do
    api.connection.should_receive(:get).once.with("/products/333", {})
    api.product(333)
  end

  it "requests a compound resource by ids" do
    api.connection.should_receive(:get).once.with("/orders/999/products/333", {})
    api.orders_product(999, 333)
  end

  it "requests a resource with pagination" do
    api.connection.should_receive(:get).once.with("/orders", {:page => 2})
    api.orders(:page => 2)
  end

  it "requests a resource with limit" do
    api.connection.should_receive(:get).once.with("/categories", {:limit => 10})
    api.categories(:limit => 10)
  end

  it "request a resource with pagination and limit" do
    api.connection.should_receive(:get).once.with("/customers", {:limit => 10, :page => 2})
    api.customers(:limit => 10, :page => 2)
  end

end
