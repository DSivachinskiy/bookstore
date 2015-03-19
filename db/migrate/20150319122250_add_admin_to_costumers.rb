class AddAdminToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :admin, :boolean
  end

  class AddAdminToCostumers < ActiveRecord::Migration
      def self.up
        add_column :costumers, :admin, :boolean, :default => false
      end

      def self.down
        remove_column :costumers, :admin
      end
  end
end
