class User< ActiveRecord::Migration
  def up
    create_table :users, force: true do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.datetime :date_of_birth
      t.boolean :sex
      t.string :password_hash
     puts 'ran up method'
    end
    def down
    	drop_table :users
    	puts 'ran down method'
    end
  end
end
