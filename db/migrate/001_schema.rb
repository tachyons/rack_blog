class Schema < ActiveRecord::Migration
  def up
    create_table :users, force: true do |t|
      t.string :name
      t.string :password
     puts 'ran up method'
    end
    def down
    	drop_table :users
    	puts 'ran down method'
    end
  end
end
