class ContactMailer < ApplicationMailer
  def contact_us(admin, form_data)
    @admin, @form_data = admin, form_data
    mail(
          to: "dana.scheider@gmail.com", 
          subject: "User Inquiry: #{form_data[:subject]}",
          content: "Message from #{form_data[:email]}:\n\n#{form_data[:body]}"
        )
  end
end
