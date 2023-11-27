class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :csv_file
      t.references :search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
