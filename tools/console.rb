require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


Facebook = Startup.new("Mark")
Apple = Startup.new("Steve")

Facebook.startup_name = "Facebook"
Apple.startup_name = "Apple"

Apple.domain = "www.apple.com"

Tony = Venture_capitalist.new
Naomi = Venture_capitalist.new

Tony.vc_name = "Tony"
Naomi.vc_name = "Naomi"

Tony.vc_total_worth = 3000000000
Naomi.vc_total_worth = 3


Apple.sign_contract(Tony, "Angel", 2000000)
Facebook.sign_contract(Naomi, "Seed", 4000000)
Apple.sign_contract(Naomi, "Angel", 1000000)
Apple.sign_contract(Naomi, "Seed", 3003)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
