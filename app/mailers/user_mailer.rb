class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_email(current_user.subscribed)
    current_user.subscribed = current_user.subscribed
    @url = 'http://spinoffnewsletter.com/login'
    mail(to: current_user.subscribed.email, subject: 'Welcome to SpinoffNewsletter.com',
                          template_path: 'user_mailer',
                          template_path: 'welcome_email')
  end
end
