class User< ActiveRecord::Migration
  def up
    create_table :users, force: true do |t|
      t.string :username
      t.string :password
     puts 'ran up method'
    end
    def down
    	drop_table :users
    	puts 'ran down method'
    end
  end
end
