class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |s|
      s.string :title 
      s.string :lyrics 
      s.string :chords
      s.string :tempo 
      s.string :key_signature 
      s.string :time_signature
      s.string :date_created 
      s.string :co_authors
      s.integer :user_id
    end 
  end
end
