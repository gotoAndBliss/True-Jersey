class ContactMailer < ActionMailer::Base
  def contact(contact)
    recipients    "daniel.levine4@gmail.com"
    from          contact.email
    subject       "HOLY !@#$, you got mail!"
    body          :contact => contact
    sent_on       Time.now
    content_type  "text/html"
  end  
end
