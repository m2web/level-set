# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'spec_helper'

describe User do
	
	before do
		@user = User.new(first_name:"John", last_name: "Doe", email:"jd@here.com", password: "foobar", password_confirmation: "foobar")
	end
	
	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should be_valid}

	describe "when the user first name is not present" do
		before { @user.first_name = "" }
		it { should_not be_valid}
	end

	describe "when the user last name is not present" do
		before { @user.last_name = "" }
		it { should_not be_valid}
	end

	describe "when the user email is not present" do
		before { @user.email = "" }
		it { should_not be_valid}
	end

	describe "when the user first name is too short" do
		before { @user.first_name = "b" }
		it { should_not be_valid}
	end

	describe "when the user first name is too long" do
		before { @user.first_name = "a" * 36 }
		it { should_not be_valid}
	end

	describe "when the user last name is too short" do
		before { @user.first_name = "b" }
		it { should_not be_valid}
	end

	describe "when the user last name is too long" do
		before { @user.first_name = "a" * 51 }
		it { should_not be_valid}
	end

	describe "when the email format is invalid" do
		invalid_addresses = %w[user@foo,com THE_USER_at_foo.bar.org first.last@foo]
		invalid_addresses.each do |address|
			before { @user.email = address }
			it { should_not be_valid}
		end
	end

	describe "when the email format is valid" do
		invalid_addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.com]
		invalid_addresses.each do |address|
			before { @user.email = address }
			it { should be_valid}
		end
	end

	describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
	end
end
