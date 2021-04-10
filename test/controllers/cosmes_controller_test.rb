require 'test_helper'

class CosmesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get cosmes_index_url
    assert_response :success
  end
end
