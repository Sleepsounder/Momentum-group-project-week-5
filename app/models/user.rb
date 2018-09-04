class User < ApplicationRecord
    has_secure_password
    validates :email, :username, presence: true, uniqueness: true
    validates :name, presence: true 
    validates :password, presence: true, length:{minimum:6}
    acts_as_voter
end
