class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :name
      t.string :edition
      t.datetime :edition_date
      t.integer :page_no
      t.string :company
      t.string :id_number
      t.integer :no_of_appearance

      t.timestamps
    end
  end
end
