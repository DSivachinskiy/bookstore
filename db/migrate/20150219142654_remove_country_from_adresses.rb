class RemoveCountryFromAdresses < ActiveRecord::Migration
  def change
    remove_column :adresses, :country, :string
  end
end
