class User < ApplicationRecord

  #to avoid duplication downcase email
  before_save {self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: true

  #criation of password attribute
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }                  
end
