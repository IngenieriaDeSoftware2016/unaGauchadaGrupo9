class AddImagenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :imagen, :string, :default => "http://www.cheap-accountants-in-london.co.uk/wp-content/uploads/2015/07/User-Avatar.png"
  end
end
