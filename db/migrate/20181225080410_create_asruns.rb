class CreateAsruns < ActiveRecord::Migration[5.2]
  def change
    create_table :asruns do |t|
      t.text :name

      t.timestamps
    end
  end
end
