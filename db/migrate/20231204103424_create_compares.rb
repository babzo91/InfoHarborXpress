class CreateCompares < ActiveRecord::Migration[7.1]
  def change
    create_table :compares do |t|
      t.string :url1
      t.string :url2

      t.timestamps
    end
  end
end
