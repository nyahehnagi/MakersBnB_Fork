describe "test data setup" do
  it "deletes all data from the database" do

    DB.run("TRUNCATE customers RESTART IDENTITY CASCADE")
    DB.run("INSERT INTO customers (name, email, password) VALUES ('test', 'test@example.com', 'password')")
    DB.run("INSERT INTO spaces (name, description, price, owner_customer_id) VALUES ('test', 'test', 10, 1)")
    
    Rake::Task['test_database_setup'].execute

    dataset_customer = DB['SELECT * FROM customers']
    dataset_space = DB['SELECT * FROM spaces']
    
    expect(dataset_customer.count).to eq 0
    expect(dataset_space.count).to eq 0

  end
end