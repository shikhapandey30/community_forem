class AddCurrentCompanyToEmploymentDetails < ActiveRecord::Migration
  def change
    add_column :employment_details, :current_company, :boolean
  end
end
