class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :hex_code, null: false
      t.string :nickname

      t.belongs_to :user
      t.timestamps
    end
  end
end
