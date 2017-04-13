class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    # Using citext to make username unique constraint and search case-insensitive
    add_column :users, :username, :citext
    add_index :users, :username, unique: true
  end
end
