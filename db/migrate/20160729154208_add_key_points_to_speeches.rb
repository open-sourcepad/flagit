class AddKeyPointsToSpeeches < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :key_points, :text
  end
end
