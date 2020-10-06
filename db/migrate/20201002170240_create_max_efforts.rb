class CreateMaxEfforts < ActiveRecord::Migration[5.2]
  def change
    create_table :max_efforts do |t|
      t.integer :max_amount
      t.belongs_to :exercise, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
