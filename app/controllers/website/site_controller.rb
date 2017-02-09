class  Website::SiteController < ApplicationController

  layout false

  def home

  end

  def product_type

    @product_type = ProductType.find(params[:id])

    puts @product_type.name

  end


end
