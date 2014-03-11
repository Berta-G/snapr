class UserMailer < ActionMailer::Base
  default from: "snapr.love@gmail.com"

  def welcome(user)
    @user = user
    @url  = 'http://snapr.example.com/login'
    mail(to: @user.email, subject: 'Welcome to Snapr')
  end

  def purchase(user, snap_id)
  	@user = user
  	@snap = Snap.find(snap_id)
  	attachments[@snap.image_file_name] = File.read(@snap.image.path)
    mail(to: @user.email, subject: 'Here is your Snap')
  end
end