class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.string :url
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
