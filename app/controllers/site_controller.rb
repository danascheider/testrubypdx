class SiteController < ApplicationController
  before_filter :authorize, only: [:admin]

  def index
  end

  def contact
  end

  def about
  end

  def speak
  end

  def admin
    @admin = current_user
    redirect_to new_meeting_url
  end

  # Triggered when a user submits the contact form
  def send_mail
    @admin = User.find_by(:id => 1)

    begin
      ContactMailer.contact_us(@admin, params).deliver_now
      flash[:success] = "Thank you! Your message has been sent."
    rescue
      flash[:error] = "There was a problem sending your e-mail. Please make sure your e-mail address is correct and try again."
    end

    redirect_to '/contact'
  end

  def submit_talk
    @admin = User.find_by(id: 1)

    begin
      ContactMailer.submit_talk(@admin, params).deliver_now
      flash[:success] = "Thank you! Your talk has been submitted."
    rescue
      flash[:error] = "There was a problem submitting your talk. Please fill the form out completely and try again."
    end

    redirect_to '/speak#submissions'
  end
end
