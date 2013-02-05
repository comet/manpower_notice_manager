class Notice < ActiveRecord::Base
  attr_accessible :company, :edition, :edition_date, :id_number, :name, :no_of_appearance, :page_no
#  validates :name, :company, :edition, :no_of_appearance,:page_no,:presence => true
 # validates :id_number,:page_no,:no_of_appearance, :numericality => true
  def self.general_search(value,perpage)
    conditions = []
    value = value<<"%"
    prep = "%"
    value = prep << value
    if value.length > 0
      conditions[0] =" name LIKE ?"
      conditions<< value
      conditions[0]+=" OR company LIKE ?"
      conditions<< value

      Notice.paginate(:page => perpage,:per_page => 15).where(conditions)
    else
      Notice.paginate(:page => perpage, :per_page => 15)
    end
    
  end
  def self.advanced_search(value)
    
  end
end
