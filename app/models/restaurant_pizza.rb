class RestaurantPizza < ApplicationRecord
  belongs_to :pizza
  belongs_to :restaurant

  validates :price, presence: true
    # validates is used in custom validation
  validate :price_range

    # custom price range validation(should be between 1 and 30)
    def price_range
        if (price > 30 || price < 1)
            errors.add(:price, 'Must be between 30 and 1')
        end            
    end
end
