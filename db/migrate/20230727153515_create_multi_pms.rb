class CreateMultiPms < ActiveRecord::Migration[7.0]
  def change
    create_table :multi_pms do |t|
      t.belongs_to :recipient, foreign_key: { to_table: :users }
      t.belongs_to :private_message, index: true

      t.timestamps
    end
  end
end
