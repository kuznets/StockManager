class AddStockAndUsersTables < ActiveRecord::Migration[5.0]
  def change
      create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # Registrable
      t.string :username,           null: false, default: ""


      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true

      create_table :stocks do |t|
        t.string :name, null: false
        t.integer :unit_price, null: false
        t.integer :interest, limit: 3, null: false
        t.integer :duration, null: false

        t.references :user, foreign_key: true

        t.timestamps
      end
  end
end
