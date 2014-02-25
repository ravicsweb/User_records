class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.string   :fname
      t.string   :lname
      t.string   :email
      t.string   :cell_no
      t.string   :address
      t.text     :hobbies
      t.string   :city
      t.string   :gender
      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
