# This migration comes from refinery_portfolio (originally 3)
class AddPositionToPortfolioItems < ActiveRecord::Migration
  def change
    add_column :refinery_portfolio_items, :position, :integer
  end
end 
