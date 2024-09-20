# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string           default(""), not null
#  first_name      :string
#  last_name       :string
#  password_digest :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_accounts_on_email  (email) UNIQUE
#
class AccountBlock::Account < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["email", "first_name", "last_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
