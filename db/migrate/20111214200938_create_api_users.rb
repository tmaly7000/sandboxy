class CreateApiUsers < ActiveRecord::Migration
  def change
    create_table :api_users do |t|
      t.string :usr_name
      t.string :enc_pswd
      t.string :api_key
      t.boolean :is_active

      t.timestamps
    end
  end
end
