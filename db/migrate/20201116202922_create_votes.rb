class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :movie_title
      t.integer :thumbs_up, default: 0
      t.integer :thumbs_down, default: 0
      t.timestamps
    end
  end
end
