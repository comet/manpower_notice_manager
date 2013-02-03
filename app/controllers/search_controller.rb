class SearchController < ApplicationController
  def index
    if params[:name]
      hash=params[:name]
      @notices = Notice.general_search(hash)
      if @notices
        @show = true
      end
    else
      flash[:error]="Please enter a value to search for in the field."
      #redirect_to new_notice_path
    end
    
  end
  def custom
    #For custom searches
    
  end
  
end
