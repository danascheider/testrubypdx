class SiteController < ApplicationController
  def index
  end

  def contact
  end

  def about
  end

  # Triggered when a user submits the contact form
  def send_mail
    @admin = User.find_by(:admin => true)
    ContactMailer.contact_us(@admin, params).deliver_now
    flash[:success] = "Thank you! Your message has been sent."
    redirect_to '/contact'
  end
end
