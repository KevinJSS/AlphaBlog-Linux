class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 4, maximum: 25}
    validates_uniqueness_of :name
end
