class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tweet_confirm,:boolean
    add_column :users, :tweet_signal,:boolean
  end
end
