class RemoveChordsFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :chords, :string
  end
end
