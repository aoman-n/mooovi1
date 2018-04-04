class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking
  def ranking
    product_ids = Review.group(:product_id).order('count_product_id').limit(5).count(:product_id).keys
    @ranking = product_ids.map{|id| Product.find(id)}
  end
end
