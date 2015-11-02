class SiteController < ApplicationController
  before_filter :authorize, only: [:admin]

  def index
  end

  def contact
  end

  def about
  end

  def admin
    @admin = current_user
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
end
