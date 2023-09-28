class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :token, null: false
      t.datetime :deleted_at
      t.integer :calls, null: false, default: 0

      t.timestamps
    end
  end
end
