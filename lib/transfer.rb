require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.receiver.valid? && self.sender.valid? && self.receiver.balance > @amount
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      self.sender.balance -= amount
      self.receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      @status = "reversed"
    end
  end


end
