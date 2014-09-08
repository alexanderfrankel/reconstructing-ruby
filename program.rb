# 4
# 8
# 15
# 16
# 23
# 42

# x = 5_1

# 1.0
# 1.01
# 1_0.0
# 1_0.0_1
# 1e1
# 1.0e1
# 1.0e+1
# 1.0e-1
# 1.0E1
# 1.0E+1
# 1.0E-1
# 1_1_1.0_1_4E+1_4_0
# 10
# 1_0

class Greeter
	def initialize(name)
		@name = name.capitalize
	end

	def salute
		puts "Hello #{@name}!"
	end
end

g = Greeter.new("world")

g.salute