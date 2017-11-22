require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "notification_mail" do
    mail = NotificationMailer.notification_mail
    assert_equal "Notification mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
