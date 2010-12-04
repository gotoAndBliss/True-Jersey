class Admin::GatewaysController < Admin::BaseController
  resource_controller
  before_filter :load_data

  update.before :update_before

  update.wants.html { redirect_to edit_object_url }
  create.wants.html { redirect_to edit_object_url }

  private       
  def build_object
		if params[:gateway] && params[:gateway][:type]
			@object ||= params[:gateway][:type].constantize.send parent? ? :build : :new, object_params 
		else
			@object ||= end_of_association_chain.send parent? ? :build : :new, object_params 
		end
  end
  
  def load_data   
    @providers = Gateway.providers
  end
  
  def update_before
		if params[:gateway] && params[:gateway][:type] && @object['type'].to_s != params[:gateway][:type]
			@object.update_attribute(:type, params[:gateway][:type])
			
			load_object			
		end
 		@object.update_attributes params[@object.class.name.underscore.gsub("/", "_")]
  end
end
