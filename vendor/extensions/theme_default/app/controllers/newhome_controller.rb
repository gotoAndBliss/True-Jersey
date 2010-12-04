class NewhomeController < ApplicationController
  def index
    @images = Image.all.select{|i|i.viewable_type == "homepage"}
    
    render :layout => "sans_bg"
  end
  
  def storeloc
  end
  
  def faq
  end
  
  def about
  end

  def size_charts
  end
  
  def shipping
  end

  def contact
  end

end
