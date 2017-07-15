require 'i18n'

class  Website::SiteController < ApplicationController

  layout false

  before_action :set_environment

  def home

    @product_types = ProductType.all.order(:order)

    @ourworks = Ourwork.all

    @home_website_config = HomeWebsiteConfig.first

    @ribbons = Ribbon.all.order(:order)

  end

  def product_type_index

    @product_types = ProductType.all.order(:order)

    respond_to do |format|
      format.any { render content_type: 'application/json' }
    end

  end

  def product_type

    @product_types = ProductType.all.order(:order)

    @product_type = ProductType.find(params[:id])

    @product_sub_types = ProductSubType.where(product_type_id: @product_type.id).order(:order)

    @products = Product.where(product_type_id: @product_type, enabled: true).order(:price)

    gon.products = @products.select(:id)

  end

  def products_index

    @products = Product.where(product_type_id: params[:product_type_id], enabled: true).order(:price)

  end

  def product_show

    @product = Product.find(params[:id])

  end

  private

  def set_environment
    @environment = params[:environment].to_s.size > 0 ? params[:environment].to_s : 'beta'
  end


end
