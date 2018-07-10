class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.belongs_to :survey
    end
  end
end
