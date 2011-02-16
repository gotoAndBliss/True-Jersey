class ContactMailer < ActionMailer::Base
  def contact(contact)
    recipients    "info@truejersey.com"
    from          "info@truejersey.com"
    subject       "HOLY MOLY, you got mail!"
    body          :contact => contact
    sent_on       Time.now
    content_type  "text/html"
  end  
end
