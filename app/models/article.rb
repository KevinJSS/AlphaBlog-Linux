class Article < ApplicationRecord
    #Active Record Validations
    validates :title, presence: {message: 'is required'}, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
