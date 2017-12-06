class AddUriToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :uri, :string
  end
end
