class AddIpToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :ip, :string
  end
end
