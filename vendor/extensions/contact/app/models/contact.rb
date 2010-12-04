class Contact < ActiveRecord::Base
  
  validates_presence_of :name, :email, :message
  
  def deliver_contact
    ContactMailer.deliver_contact(self)
  end
  
end
