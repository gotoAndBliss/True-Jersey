class Admin::ImagesController < Admin::BaseController
  resource_controller
  before_filter :load_data
	
	new_action.response do |wants|
    wants.html {render :action => :new, :layout => false}
  end
  
  def create
    object = Image.new(params[:image])
    if params[:image].has_key? :viewable_id
  		if params[:image][:viewable_id] == "All"
  			object.viewable_type = 'Product'
  			object.viewable_id = @product.id
  		else
  			object.viewable_type = 'Variant'
  			object.viewable_id = params[:image][:viewable_id]
  		end
  	else
  	  if params[:image][:viewable_type] == "homepage"
      else
  			object.viewable_type = 'Product'
  			object.viewable_id = @product.id
  		end
  	end
  	if object.save
  	  if @product == nil
  	    redirect_to admin_image_rotator_path
	    else
      	redirect_to admin_product_images_url(@product)
      end
    end
  end

	create.response do |wants|
	  if @product == nil
	    wants.html {redirect_to admin_image_rotator_path}
    else
		  wants.html {redirect_to admin_product_images_url(@product)}
	  end
  end

	update.response do |wants|
		wants.html {redirect_to admin_product_images_url(@product)}
  end
	
	#create.before :create_before
	update.before :update_before
	destroy.before :destroy_before
  
  destroy.response do |wants| 
    wants.html do
			render :text => ""
    end
  end
 
  private

  def load_data
    if params[:product_id] != nil
		  @product = Product.find_by_permalink(params[:product_id])
		  @variants = @product.variants.collect do |variant| 
			  [variant.options_text, variant.id ]
		  end
		  @variants.insert(0, [I18n.t("all"), "All"])
	  end
  end

  def create_before
		if params[:image].has_key? :viewable_id
			if params[:image][:viewable_id] == "All"
				object.viewable_type = 'Product'
				object.viewable_id = @product.id
			else
				object.viewable_type = 'Variant'
				object.viewable_id = params[:image][:viewable_id]
			end
		else
		  if params[:image][:viewable_type] == "homepage"
		    return true
	    else
  			object.viewable_type = 'Product'
  			object.viewable_id = @product.id
			end
		end
	end
	
	def update_before
	  if params[:image][:viewable_id] == "All"
        object.viewable_type = 'Product'
        object.viewable_id = @product.id
    end
  end
  
  def destroy_before 
    @viewable = object.viewable
  end

end
