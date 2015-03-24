class AddNicknameToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :nickname, :string
  end
end
