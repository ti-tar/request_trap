class AddCookiesToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :cookies, :string
  end
end
