require 'rails_helper'

describe "with users and roles" do

  def log_in_as(user)
    visit new_user_session_path
    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button("Log in")
  end

  let(:user){User.create(email: "test@example.com", password: "password")}

  xit 'allows a logged-in user to view their recently bought items' do
    log_in_as(user)
    visit()
    expect(current_path).to eq()
  end
end
