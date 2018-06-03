class ChangeSchoolTypeToStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :schools, :type, :status
  end
end
