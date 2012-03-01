# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  about_me   :text
#  want_to    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class UserProfile < ActiveRecord::Base
	belongs_to :user
end
