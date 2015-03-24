class AddProviderToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :provider, :string
  end
end
