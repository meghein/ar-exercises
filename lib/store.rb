class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than: 0 }
  validates :mens_apparel, inclusion: { in: [true, false] }
  validates :womens_apparel, inclusion: { in: [true, false] }
  validate :must_carry_apparel

  def must_carry_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:womens_apparel, "Store must have men's and/or women's apparel")
    end
  end
end
