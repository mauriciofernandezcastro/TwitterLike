class AddSearchColumnToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :search, :text
  end
end
