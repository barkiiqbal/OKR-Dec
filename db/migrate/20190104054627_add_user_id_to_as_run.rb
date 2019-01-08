class AddUserIdToAsRun < ActiveRecord::Migration[5.2]
  def change
    add_column :as_runs, :user_id, :integer
  end
end
