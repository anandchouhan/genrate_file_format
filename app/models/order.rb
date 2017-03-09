class Order < ActiveRecord::Base
	belongs_to :user, foreign_key: "u_id", class_name: 'User'

	# def method_is
	# 	puts @a
	# 	puts "dddddd"
	# end

	# def self.method
	# 	@a = 15
 #    self.new.method_is
	# end


end
