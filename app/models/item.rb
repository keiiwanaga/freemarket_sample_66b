class Item < ApplicationRecord
    validates :name, presence: true, length: { maximum: 40 }
    validates :description, presence: true, length: { maximum: 1000 }
    validates :price, presence: true
    validates :condition_id, presence: true
    validates :prefecture_id, presence: true
    validates :delivery_day_id, presence: true
    validates :delivery_burden_id, presence: true
    validates :parent_category_id, presence: true
    validates :child_category_id, presence: true
    validates :category_id, presence: true

    validates_associated :images
    validates :images, presence: true

    belongs_to :user
    has_many :images, foreign_key: :item_id, dependent: :destroy
    accepts_nested_attributes_for :images
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_burden
    belongs_to :delivery_day

    belongs_to :prefecture
end
