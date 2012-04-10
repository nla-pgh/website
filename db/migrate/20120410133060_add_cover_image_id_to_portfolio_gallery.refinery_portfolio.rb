# This migration comes from refinery_portfolio (originally 4)
class AddCoverImageIdToPortfolioGallery < ActiveRecord::Migration

  def change
    add_column :refinery_portfolio_galleries, :cover_image_id, :integer
  end

end
