class AddUsernameToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :username, :string
  end
end
