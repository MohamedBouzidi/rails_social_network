# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  
  def account_activation
    UserMailer.account_activation(User.find_by_name('Horse'))
  end

end
