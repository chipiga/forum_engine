class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.references :forum
      t.string :title
      t.string :state
      # t.string :type
      t.integer :posts_count

      t.timestamps
    end
    add_index :topics, :forum_id
  end

  def self.down
    drop_table :topics
  end
end
