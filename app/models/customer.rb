class Customer < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "full_name", "id", "id_value", "notes", "phone_number", "updated_at"]
  end
end