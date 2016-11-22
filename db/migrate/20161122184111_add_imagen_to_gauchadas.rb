class AddImagenToGauchadas < ActiveRecord::Migration
  def change
    add_column :gauchadas, :imagen, :string, :default => "https://s22.postimg.org/cs5ohupgx/logo.png"
  end
end
