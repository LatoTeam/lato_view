class CreateLatoCoreSuperusers < ActiveRecord::Migration
  def change
    create_table :lato_core_superusers do |t|
      t.string :name
      t.string :username
      t.string :email
      t.integer :permission
      t.string :session_code
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
