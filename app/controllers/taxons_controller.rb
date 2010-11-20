class TaxonsController < Spree::BaseController
  prepend_before_filter :reject_unknown_object, :only => [:show]
  before_filter :load_data, :only => :show
  resource_controller
  actions :show
  helper :products

  include Spree::Search

  def show
    respond_to do |format|
      format.html {render :layout => 'sans_bg'}
    end
  end

  private
  def load_data
    @taxon ||= object
    retrieve_products
  end

  def object
    @object ||= end_of_association_chain.find_by_permalink(params[:id].join("/") + "/")
  end
end
