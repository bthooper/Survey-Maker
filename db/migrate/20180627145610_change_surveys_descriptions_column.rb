class ChangeSurveysDescriptionsColumn < ActiveRecord::Migration
  def change
    change_column :surveys, :descriptions, :description
  end
end
