class AddUrlToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :url, :string
  end
end
