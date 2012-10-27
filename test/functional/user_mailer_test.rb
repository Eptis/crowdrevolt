require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "activation_needed_email" do
    mail = UserMailer.activation_needed_email
    assert_equal "Activation needed email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "activation_succes_email" do
    mail = UserMailer.activation_succes_email
    assert_equal "Activation succes email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
