class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer  :taker_id, null: false
      t.integer  :choice_id, null: false
      t.integer  :survey_id, null: false
      t.integer  :question_id, null: false

      t.timestamps(null: false)
    end
  end
end
