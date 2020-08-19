class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.date :start_date
      t.date :end_date
      t.integer :priority
      t.string :status
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
