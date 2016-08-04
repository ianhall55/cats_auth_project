class ChangeUserIdColCatsTable < ActiveRecord::Migration
  def change
    rename_column :cats, :users_id, :user_id
  end
end
