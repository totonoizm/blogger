class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|

      t.integer :admin_id, null: false
      t.integer :status, default: 0, null: false
      t.string :title
      t.timestamps
    end
  end
end
