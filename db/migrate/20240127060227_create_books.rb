class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price, precision: 10, scale: 2
      t.date :pub_date

      t.timestamps
    end
  end
end
