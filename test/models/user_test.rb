require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Saving a user" do
    assert User.create(
      email: 'test@test.com',
      salt: 'teste',
      password: 'teste'
    )
  end
end
