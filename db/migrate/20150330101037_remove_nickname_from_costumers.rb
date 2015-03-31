class RemoveNicknameFromCostumers < ActiveRecord::Migration
  def change
    remove_column :costumers, :nickname, :string
  end
end
