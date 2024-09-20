# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text             default(""), not null
#  price       :integer          default(0), not null
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ProductBlock::Product < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description", "price"]
  end
end
