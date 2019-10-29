class User < ApplicationRecord
    has_secure_password(validations: false)
    
    validates :name, {presence: true, length: {maximum: 18}}
    validates :email, {presence: true, uniqueness:true, length: {maximum: 50}}
    # validates :password_digest, {presence: true, length: {maximum: 32}}

    
  
        
end
