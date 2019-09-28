class AddAncestryToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :ancestry, :string
    add_index :tweets, :ancestry
  end
end
