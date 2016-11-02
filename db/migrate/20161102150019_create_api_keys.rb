class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.json :app_info,      null: false,     default: {}
      t.string :token,       null: false
      t.timestamps
    end
  end
end
