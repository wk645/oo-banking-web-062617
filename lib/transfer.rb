require 'pry'

class Transfer

	attr_accessor :sender, :receiver, :status, :amount

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		if sender.valid? && receiver.valid?
			true
		end
	end

	def execute_transaction
		if valid? && sender.balance > @amount && self.status == "pending"
			sender.balance -= @amount
			receiver.balance += @amount
			self.status = "complete"
		else
			self.status = "rejected"
			return "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if receiver.balance > @amount && self.status == "complete"
			# if greater than the transfer amount and the status is complete,
			receiver.balance -= @amount
			# lose
			sender.balance += @amount
			# gain
			self.status = "reversed"
			# changed to reversed
		else
			self.status = "rejected"
			# changed to rejected
			return "Transaction rejected. Please check your account balance."
		end
	end
end
