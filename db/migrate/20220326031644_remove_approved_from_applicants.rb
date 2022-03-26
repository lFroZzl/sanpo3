class RemoveApprovedFromApplicants < ActiveRecord::Migration[5.2]
  def change
    remove_column :applicants, :approved, :boolean
  end
end
