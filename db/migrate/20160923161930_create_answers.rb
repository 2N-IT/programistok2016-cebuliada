class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :points
      t.integer :question_id

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
