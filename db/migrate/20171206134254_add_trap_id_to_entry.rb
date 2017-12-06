class AddTrapIdToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :trap_id, :string
  end
end
