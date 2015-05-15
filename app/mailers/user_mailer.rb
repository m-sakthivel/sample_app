class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_mail
    #@user = user
    #@url  = 'http://example.com/login'
    mail(to: "sakthivel@qadex.com", subject: 'Welcome to My Awesome Site')
  end
end
