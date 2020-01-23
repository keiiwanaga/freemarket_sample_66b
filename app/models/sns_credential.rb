class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
  validates :uid,
  presence: true,
  uniqueness: { message: "既に存在しています" }
  validates :provider,
    presence: true
  validates :user_id,
    presence: true
end