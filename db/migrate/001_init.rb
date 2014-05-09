class Init < ActiveRecord::Migration
  def self.up
    create_table "posts" do |t|
      t.string   "address", :null => false
      t.string   "title", :null => false
      t.text     "body", :null => false
      t.string   "lng", :null => false
      t.string   "lat", :null => false
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    raise IrreversibleMigration
  end
end