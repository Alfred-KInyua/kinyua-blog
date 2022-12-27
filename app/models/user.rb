class User < ApplicationRecord
    validates :username, presence: true, length:{ minimum: 3, maximum: 70 }
    validates :email, presence: true, length:{ minimum: 3, maximum: 70 }
end