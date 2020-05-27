class RemoveChordsFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :chords, :string
  end
end
