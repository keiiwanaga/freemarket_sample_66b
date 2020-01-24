class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

    belongs_to :user, optional: true
    validates :address_firstname, :address_lastname, :municipalities, :address ,presence: true
    validates :address_kana_firstname, :address_kana_lastname, presence: true
    validates :zipcode,presence: true
    validates :prefecture_id,presence: true
end

