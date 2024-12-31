class Post < ApplicationRecord


    has_many :comments

    has_many :likes
    belongs_to :user
    has_rich_text :title
end
