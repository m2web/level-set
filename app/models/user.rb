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

class User < ActiveRecord::Base
	has_one :user_profile
	validates :first_name, 	:presence => true, :length => { :minimum => 2, :maximum => 35 } 
	validates :last_name, 	:presence => true, :length => { :minimum => 2, :maximum => 50 }
	validates :email, 			:presence => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
		uniqueness: { case_sensitive: false }

	has_secure_password
	validates_presence_of :password, :on => :create
end
