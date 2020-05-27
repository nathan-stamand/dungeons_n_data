class User < ApplicationRecord
    has_many :campaigns
    has_many :sessions, through: :campaigns
    has_many :characters
end
