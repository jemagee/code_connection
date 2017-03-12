require "spec_helper"
require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do

  describe "welcome_email" do
    let(:user) {FactoryGirl.create(:user)}
    let(:mail) { WelcomeMailer.welcome_email(user) }

    it "should have the correct subject" do
      expect(mail).to have_subject('Welcome to Code Connection')
    end

    it "sends from the default email" do
      expect(mail).to be_delivered_from('notifications@example.com')
    end

    it "delivers to the email passed in" do
      expect(mail).to deliver_to(user.email)
    end

    it "should have the text 'Welcome to Code Connection' in the body" do
      expect(mail).to have_body_text('Welcome to Code Connection')
    end

    it "should have the text 'You have successfully signed up to codeconnection.com' in the body"do
      expect(mail).to have_body_text('You have successfully signed up to codeconnection.com')
    end

    it "should have a link to the home page" do
      expect(mail).to have_body_text(root_url)
    end
  end
end
