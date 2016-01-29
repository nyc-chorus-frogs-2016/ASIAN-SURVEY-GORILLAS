class CreateQuestionSurveys < ActiveRecord::Migration
  def change
    create_table :question_surveys do |t|
      t.integer  :survey_id, null:false
      t.integer  :question_id, null:false

      t.timestamps(null: false)
    end
  end
end
