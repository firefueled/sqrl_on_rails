class CreateSqrlOnRailsAuthentications < ActiveRecord::Migration
  def up
    create_table :sqrl_on_rails_authentications do |t|
      t.string :client_ip, null: false
      t.string :nut, null: false, index: true
      t.string :session, null:false, index: true
      t.boolean :authenticated, null:false, default: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :sqrl_on_rails_authentications
  end
end