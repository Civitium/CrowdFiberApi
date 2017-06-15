describe "GET accounts" do
 
  let(:account) { CrowdFiberApi::Private.new({api_key: ENV['CROWD_FIBER_API_KEY'], api_url: ENV['CROWD_FIBER_API_URL'] } ).accounts.all }
 
  before do
    VCR.insert_cassette 'account', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end
 
  it "must have a accounts method" do
    account.must_respond_to :accounts
  end
  
  it "must have more then one account" do 
    account.count > 0
  end
  
  it "must respond to account.last" do
    account.last.must_be_instance_of Hash
  end
  it "must respond to account.first" do
    account.first.must_be_instance_of Hash
  end
  
  
end