class RemoveLengthFromSong < ActiveRecord::Migration[5.1]
  def change  
    remove_column :songs, :length
  end
end
