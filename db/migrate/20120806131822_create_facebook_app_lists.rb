class CreateFacebookAppLists < ActiveRecord::Migration
  def change
    create_table :facebook_app_lists do |t|
      t.text :app_name
      t.text :app_url

      t.timestamps
    end
  end
end
