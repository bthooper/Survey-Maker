class CreateSurveysTable < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :descriptions
      t.belongs_to :user
    end
  end
end
