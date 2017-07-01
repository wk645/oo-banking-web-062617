class BankAccount

	attr_accessor :balance, :status
	attr_reader :name

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(amount)
		@balance += amount
		# deposits money into account
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?
		# if it has an open status and a balance greater than 0, it is valid/true
		if @status == "open" && @balance > 0
			true
		else
			false
		end
	end

	def close_account
		@balance = 0
		@status = "closed"
	end

end










