class ThanksMailer < ApplicationMailer
  default :from => "shuhei.abe1107@gmail.com"

  def send_signup_email
    @greeting = "Hi"
    mail( :to => "abe.shuhei1107@gmail.com", :subject => 'ご登録ありがとうございます')
  end
end
