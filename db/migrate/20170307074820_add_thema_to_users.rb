class AddThemaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :thema, :string
  end
end
