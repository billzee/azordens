module BrandsHelper

 	def new_or_edit_brands_path(brand)
    brand ? edit_brand_path(brand) : new_brand_path(brand)
  end

end
