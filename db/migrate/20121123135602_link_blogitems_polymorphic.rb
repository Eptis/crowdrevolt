class LinkBlogitemsPolymorphic < ActiveRecord::Migration
  def change

    rename_column :blogitems, :post_id, :ownable_id
    add_column :blogitems, :ownable_type, :string
  end
end
