class CreateLeavetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :leavetypes do |t|
      t.string :leave_type

      t.timestamps
    end
  end
end
