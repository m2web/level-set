module UsersHelper
	def gravatar_for(user, options = { :size => 75 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.first_name) + " " +  h(user.last_name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
