class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 15}}
    validates :content, {presence: true, length: {maximum: 1000}}
    validates :value, {presence: true, length: {maximum: 200}}
    validates :act, {presence: true, length: {maximum: 200}}
    validates :forWho, {presence: true, length: {maximum: 100}}

    

    
    def user
        return User.find_by(id: self.user_id)
    end
    
    
end
