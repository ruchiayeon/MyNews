class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices.each do |t|
      t.string :title
      t.string :link
      t.string :writer
      t.date :created_on

      t.timestamps null: false
    end
  end
end
