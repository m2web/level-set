# By using the symbol ':user', we get Factory Girl to simulate the User model
Factory.define :user do |user|
  user.first_name							"Mark"
	user.last_name							"McFadden"
  user.email									"m2web@yahoo.com"
  user.password              	"foobar"
  user.password_confirmation 	"foobar"
end
