class ContactMailer < ApplicationMailer
  def contact_us(admin, form_data)
    @admin, @form_data = admin, form_data
    mail(
          to: "dana.scheider@gmail.com", 
          subject: "User Inquiry: #{form_data[:subject]}",
          content: "Message from #{form_data[:email]}:\n\n#{form_data[:body]}"
        )
  end

  def submit_talk(admin, form_data)
    @admin, @form_data = admin, form_data
    mail(
      to: "dana.scheider@gmail.com",
      subject: "Talk proposal submitted",
      content: "Speaker Name: #{form_data[:first_name]} #{form_data[:last_name]}\nTalk Title: #{form_data[:talk_title]}\nDescription: #{form_data[:talk_description]}"
    )
  end
end
