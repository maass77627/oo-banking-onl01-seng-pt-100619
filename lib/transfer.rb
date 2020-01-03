class Transfer
  
  
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount) 
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = 'pending' 
  end 
  
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end 
  
  def execute_transaction
    if self.status == "pending" && self.valid?
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
    end
  end 
  
  
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
    
    
  end 
    
  
  
  
  
end
