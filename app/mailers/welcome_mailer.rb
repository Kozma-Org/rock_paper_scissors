class WelcomeMailer < ApplicationMailer
  def send_greetings_notification(user)
    @user = user

    mail to: user.email, subject: "Thanks for your subscription!"
  end
end
