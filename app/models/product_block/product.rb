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
end
