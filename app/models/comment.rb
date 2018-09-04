class Comment < ApplicationRecord
=begin
Hello Gene!! 
=end 
belongs_to :commentable, polymorphic: true
has_many :comments, as: :commentable
end
