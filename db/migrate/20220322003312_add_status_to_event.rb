class AddStatusToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :status, :integer
  end
end
