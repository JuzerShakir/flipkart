require 'rails_helper'

RSpec.describe AccountBlock::Account, type: :model do
  subject { build(:account) }

  describe "validations" do
    context "for email" do
      # email address
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
      it { should validate_email_format_of(:email) }
    end

    # password
    context "for password" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6) }
    end
  end
end
