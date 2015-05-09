class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login
      t.string  :username
      t.string  :password_digest
      t.string  :salt
      t.timestamp
    end
  end
end
