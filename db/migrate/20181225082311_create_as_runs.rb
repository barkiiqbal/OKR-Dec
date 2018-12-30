class CreateAsRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :as_runs do |t|
      t.text :name
      t.text :attachment

      t.timestamps
    end
  end
end
