require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    mail = SupportRequestMailer.respond(support_requests(:one))
    assert_equal "Re: #{support_requests(:one).subject}", mail.subject
    assert_equal [support_requests(:one).subject], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match support_requests(:one).response.to_plain_text, mail.body.encoded
  end

end
