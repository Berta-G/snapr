class UserMailer < ActionMailer::Base
  default from: "snapr.love@gmail.com"

  def welcome(user)
    @user = user
    @url  = 'http://snapr.example.com/login'
    mail(to: @user.email, subject: 'Welcome to Snapr')
  end

  def purchase(user, snap_id)
  	@user = user
  	@snap = SnapPresenter.new(Snap.find(snap_id), :original)
  	attachments[@snap.image_file_name] = File.read(open(@snap.image_path).path)
    mail(to: @user.email, subject: 'Here is your Snap')
  end
end
