class ContactMailer < ActionMailer::Base
  def contact(contact)
    recipients    "daniel.levine4@gmail.com"
    from          'daniel.levine4@gmail.com'
    subject       "HOLY MOLY, you got mail!"
    body          :contact => contact
    sent_on       Time.now
    content_type  "text/html"
  end  
end
