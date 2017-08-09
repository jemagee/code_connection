class AddCountryCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :country_code, :string
  end
end
