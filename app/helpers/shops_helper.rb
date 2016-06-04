module ShopsHelper

  def shop_location
    @shop.city + ", " + @shop.country
  end
end
