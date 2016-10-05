class AddCardsFromUrlJobTest < ActiveJob::Base
  include ActionMailer::TestHelper

  setup do
    @import = user_imports(:admin_import)
    ActionMailer::Base.deliveries.clear
  end

  test "send a message upon completing an import" do
    assert_no_emails
    ProcessImportedUsersJob.perform_now(@import)

    assert_emails 1
    message = ActionMailer::Base.deliveries.last
    assert_equal [@import.user.email], message.to
    assert_match /Your User Import Task Has Completed/, message.subject
  end


  test "a completely failing import job should notify the creator" do
    kaboom = -> (data) { raise ActiveRecord::RecordNotFound, "Oh no!" }
    UserBulkLoader.stub(:load, kaboom) do
      ProcessImportedUsersJob.perform_now(@import)
    end

    assert_emails 1

    message = ActionMailer::Base.deliveries.last
    body = message.html_part.to_s
    assert_match /Your User Import Task Has Failed/, message.subject
    assert_match /ActiveRecord::RecordNotFound/, body
    assert_match /Oh no\!/, body
  end
end
