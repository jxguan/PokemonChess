class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :nickname
      t.string  :password_digest
      t.string  :salt
      t.timestamp
    end
  end
end
