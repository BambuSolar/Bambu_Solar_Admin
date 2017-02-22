require 'i18n'

class  Website::SiteController < ApplicationController

  layout false

  def home

  end

  def product_type

    @product_types = ProductType.all

    @product_type = ProductType.find(params[:id])

    @products = Product.where(product_type_id: @product_type)

  end


end
