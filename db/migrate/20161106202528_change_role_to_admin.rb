class ChangeRoleToAdmin < ActiveRecord::Migration
  def change
    add_column :usuarios, :admin, :boolean, default: false
    remove_column :usuarios, :rol
  end
end
