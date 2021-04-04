class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      
      t.integer :status, default: 0, null: false
      t.string :title
      t.timestamps
    end
  end
end
