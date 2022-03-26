class AddStatusToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :status, :integer
  end
end
