class AddUserIdCatsTable < ActiveRecord::Migration
  def change
    add_reference :cats, :users, index: true, foreign_key: true

  end
end
