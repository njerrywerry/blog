class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.srting :title
      t.text :body

      t.timestamps null: false
    end
  end
end
