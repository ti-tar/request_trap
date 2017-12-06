class AddMethodToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :method, :string
  end
end
