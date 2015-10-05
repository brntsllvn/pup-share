class HomeController < ApplicationController
  layout 'home' 
  
  def index
    render layout: 'home'
  end

end