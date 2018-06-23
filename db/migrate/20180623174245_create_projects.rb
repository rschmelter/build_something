class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :cost
      t.integer :difficulty
      t.string :type
    end
  end
end
