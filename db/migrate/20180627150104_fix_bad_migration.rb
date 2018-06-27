class FixBadMigration < ActiveRecord::Migration
  def change
    drop_table :surveys
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.belongs_to :user
    end
  end
end
