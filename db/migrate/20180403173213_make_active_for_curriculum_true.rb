class MakeActiveForCurriculumTrue < ActiveRecord::Migration[5.1]
  def change
    change_column :curriculums, :active, :boolean, default:true  
  end
end
