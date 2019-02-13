require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  setup do
    @tweet = tweets(:one)
    @user = users(:one)
    visit user_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: ActiveSupport::TestCase.default_password
    click_on "Log in"
  end

  test "visiting the index" do
    visit tweets_url(format: 'html')
    assert_selector "label[for=tweet_tweet]", text: "Tweet about it"
  end

  test "creating a Tweet" do
    visit tweets_url(format: 'html')
    click_on "New Tweet"

    fill_in "Tweet", with: @tweet.tweet
    click_on "Create Tweet"

    assert_text "Tweet was successfully created"
  end

  # test "updating a Tweet" do
  #   visit tweets_url(format: 'html')
  #   click_on "Edit", match: :first
  #
  #   fill_in "Tweet", with: @tweet.tweet
  #   click_on "Update Tweet"
  #
  #   assert_text "Tweet was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Tweet" do
  #   visit tweets_url, format: 'html'
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "Tweet was successfully destroyed"
  # end
end
