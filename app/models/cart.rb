class Cart < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def subtotal
    product.price.reduce(:+)
  end
end
