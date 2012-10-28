class AddNewsletterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :optin, :boolean
  end
end
