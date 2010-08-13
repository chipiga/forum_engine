class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.string :state
      # t.string :kind
      t.integer :topics_count, :default => 0
      t.integer :posts_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
