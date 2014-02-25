class DateOfBirthToUsers < ActiveRecord::Migration
  def change
    add_column :records, :bdate, :string
  end
end
