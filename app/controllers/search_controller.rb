class SearchController < ApplicationController
  def index
    if params[:name]
      hash=params[:name]
      if hash.length < 1
        flash[:error]="Please enter a value to search for in the field."
        redirect_to :controller=>"search",:action=>'index'
      end
      @notices = Notice.general_search(hash,params[:page])
      if @notices
        @show = true
      end
    else
      #redirect_to new_notice_path
    end
    
  end
  def custom
    #For custom searches
    
  end
  
end
