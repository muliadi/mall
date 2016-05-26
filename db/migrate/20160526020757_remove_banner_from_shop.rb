class RemoveBannerFromShop < ActiveRecord::Migration
  def change
    remove_column :shops, :banner_file_name, :string
    remove_column :shops, :banner_content_type, :string
    remove_column :shops, :banner_file_size, :integer
    remove_column :shops, :banner_updated_at, :datetime
  end
end
