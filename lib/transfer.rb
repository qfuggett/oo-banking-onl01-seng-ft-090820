class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver, :transfer
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else false
    end
  end
  
  
  def execute_transaction
    #binding.pry
    
    
  # if !sender.valid   
  #   @status == "rejected"
    
  if @status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
      
  elsif @status == "complete"
      @status == "rejected"
    
  elsif @amount > @sender.balance
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
      
    end
  
  end
  
  
  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
  
end
