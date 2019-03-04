class Idea < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
