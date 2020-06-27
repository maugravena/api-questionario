class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :points

      t.timestamps
    end
  end
end
