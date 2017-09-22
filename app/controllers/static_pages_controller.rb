class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def blog
  end

  def home
  end

  def register
  end
  
  def request_initializate
   
  end
  
  def request_do
    @content_request = Request.new
    @mess =  @content_request.content
  end
  
end
