require 'test_helper'

class BattleControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get battle_new_url
    assert_response :success
  end
end
