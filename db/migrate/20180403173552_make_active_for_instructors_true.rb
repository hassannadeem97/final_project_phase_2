class MakeActiveForInstructorsTrue < ActiveRecord::Migration[5.1]
  def change
    change_column :instructors, :active, :boolean, default:true  
  end
end
