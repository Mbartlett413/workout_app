class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.string :title
      t.boolean :active_week
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
