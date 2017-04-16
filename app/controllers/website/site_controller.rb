require 'i18n'

class  Website::SiteController < ApplicationController

  layout false

  before_action :set_environment

  def home

    @product_types = ProductType.all

    @ourworks = Ourwork.all

  end

  def product_type_index

    @product_types = ProductType.all

    respond_to do |format|
      format.any { render content_type: 'application/json' }
    end

  end

  def product_type

    @product_types = ProductType.all

    @product_type = ProductType.find(params[:id])

    @product_sub_types = ProductSubType.where(product_type_id: @product_type.id).order(:name)

    @products = Product.where(product_type_id: @product_type, enabled: true).order(:name)

    gon.products = @products.select(:id)

  end

  private

  def set_environment
    @environment = params[:environment].to_s.size > 0 ? params[:environment].to_s : 'beta'
  end


end
