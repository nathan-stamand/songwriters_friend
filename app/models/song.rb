class Song < ActiveRecord::Base 
    belongs_to :user
    belongs_to :genre
end