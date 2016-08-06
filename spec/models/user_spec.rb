require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.admin' do
    it 'returns all admins' do
      all_admins = FactoryGirl.create_list(:admin_user, 2)
      non_admin_users = FactoryGirl.create_list(:non_admin_user, 2)

      expect(User.admins).to eq(all_admins)
    end
  end
end
