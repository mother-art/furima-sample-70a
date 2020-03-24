class Product < ApplicationRecord
    validates :price, presence: true, format: {with: /\A[0-9]+\z/, message: "全角数字は入力できません。"}
    validates :item_status, :postage_cost, :ship_area, :ship_method, :ship_date, presence: true
    validates :item_images, 
        length: { 
            minimum: 1,
        }
    has_many :comments
    belongs_to :user
    belongs_to :main_tag
    has_many :item_images, dependent: :destroy
    accepts_nested_attributes_for :item_images, allow_destroy: true
    def self.search(search)
        return Product.all unless search
        Product.where('item_name LIKE(?)', "%#{search}%")
    end
    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user
end
