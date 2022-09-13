class User < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  # This is a regular expression that matches the RFC 5322 standard for email addresses.
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # format: { with: VALID_EMAIL_REGEX }
end
