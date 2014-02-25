class AddImageToUser < ActiveRecord::Migration
  def self.up
    add_attachment :records, :avatar
  end

  def self.down
    remove_attachment :records, :avatar
  end
end
