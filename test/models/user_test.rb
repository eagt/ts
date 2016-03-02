require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:name => "Example User", :email => "user@example.com",
							      :password => "foobar", :password_confirmation => "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end


  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end



  test "email should be present" do
    @user.email= "     "
    assert_not @user.valid?
  end


 
 
  test "email addresses should be unique" do   # The method here is to make a user with the same email address as @user using @user.dup,
    duplicate_user = @user.dup           		# which creates a duplicate user with the same attributes. Since we then save @user,
    duplicate_user.email = @user.email.upcase 	# the duplicate user has an email address that already exists in the database, and hence should not be valid.
     @user.save
    assert_not duplicate_user.valid?
   end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end



  test "name should not be too long" do  # this is done to validate the length
    @user.name = "a" * 21					 # This is put atleast one above the maximun set on the model
    assert_not @user.valid?						 # So, it will ensures that it's taking the maximun value only.
  end

  test "email should not be too long" do
    @user.email = "a" * 44 + "@example.com"
    assert_not @user.valid?
  end


# Now the two validations below are used to make sure not just that invalid email addresses like user@example,com are rejected, 
# but also that valid addresses like user@example.com are accepted
    test "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    	valid_addresses.each do |valid_address|
      	@user.email = valid_address
      	assert @user.valid?, "#{valid_address.inspect} should be valid"
    	end
 	  end


    test "email validation should reject invalid addresses" do
     invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
     	invalid_addresses.each do |invalid_address|
     	@user.email = invalid_address
     	assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    	end
  	end 


    test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end

    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end

    test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
  end



