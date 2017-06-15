describe "GET account" do
 
  let(:account) { CrowdFiberApi::Private.new({api_key: ENV['CROWD_FIBER_API_KEY'], api_url: ENV['CROWD_FIBER_API_URL'] } ).accounts.find(1) }
 
  before do
    VCR.insert_cassette 'account', :record => :new_episodes
  end
 
  after do
    VCR.eject_cassette
  end
 
  it "must have a account method" do
    account.must_respond_to :account
  end
  
  it "must have a account id" do 
    account.id.must_equal 1
  end
  
  
end