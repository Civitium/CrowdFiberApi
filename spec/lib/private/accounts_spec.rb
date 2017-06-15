describe "GET accounts" do
 
  let(:accounts) { CrowdFiberApi::Private.new({api_key: ENV['CROWD_FIBER_API_KEY'], api_url: ENV['CROWD_FIBER_API_URL'] } ).account.all }
 
  before do
    VCR.insert_cassette 'accounts', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end
 
  it "must have a accounts method" do
    accounts.must_respond_to :accounts
  end
  
  it "must have more then one account" do 
    accounts.count > 0
  end
  
  it "must respond to account.last" do
    accounts.last.must_be_instance_of Hash
  end
  it "must respond to account.first" do
    accounts.first.must_be_instance_of Hash
  end
  
  
end