class SettingsController < ApplicationController
  def index
    if request.post?
      #Get the damn file and process it if it set
      if params[:upload]
        #process the file
        uploaded_io = params[:upload]
        Rails.logger.debug{uploaded_io.inspect}
        #File.open(Rails.root.join('public', 'data', uploaded_io.original_filename), 'w') do |file|
        #  file.write(uploaded_io.read)
        #end
        #filename = params[:file_name]
        require 'csv'
        file = uploaded_io.tempfile
        #infile = params[:file].read
        count = 0
        CSV.foreach(file) do |row|
          # use row here...
          count = count + 1
          name = row[3].to_s.encode('UTF-8', :invalid => :replace)
          id =row[3].to_i
          ed = row[0]
          edition = ed.include?('Nation')? 1 : 2
          edition_date = row[1]
          page_no = row [2].to_i
          co = row [4].to_s.encode('UTF-8', :invalid => :replace)
          no_of_app = 1
          notice = {:name=>name,:edition=>edition,:edition_date=>edition_date,:page_no=>page_no,:company=>co,:no_of_appearance=>no_of_app}
          @notice = Notice.new(notice)
          if !@notice.save
            Rails.logger.error{"Failed Creating the notice"}
            Rails.logger.error{@notice}
          end
          
        end
        #@parsed_file = FasterCSV.read(file)
        #@parsed_file.each do |row| 
        #  puts row
        # and do some operations
        #end
        flash[:notice]="Successfully imported #{count} records"
        redirect_to notices_path and return
      else
        flash[:error]="Please choose a file"
        redirect_to :controller=>"settings" ,:action=>"index" and return
      end
    end
    
  end
end
