require 'rails_helper'

RSpec.describe ProductBlock::Product, type: :model do
  subject { build(:product) }

  describe "validations" do
    context "for title" do
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_most(255) }
    end

    context "for description" do
      it { should validate_presence_of(:description) }
      it { should validate_length_of(:description).is_at_least(50) }
    end

    context "for price" do
      it { should validate_numericality_of(:price).is_greater_than(0) }
      it { should validate_numericality_of(:price).only_integer }
    end
  end
end
