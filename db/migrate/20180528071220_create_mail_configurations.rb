class CreateMailConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_configurations do |t|
      t.string :host
      t.string :user_name
      t.string :password
      t.string :domain
      t.string :address
      t.integer :port
      t.string :authentication
      t.boolean :enable_starttls_auto
      t.boolean :ssl
      t.string :slug, unique: true
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
