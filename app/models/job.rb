class Job < ActiveRecord::Base
  attr_accessible :company, :date_posted, :description, :position, :town, :url
  
  
  def self.search(params)

    results = Job.scoped
    
    if params[:days_back]    
      results = results.where("jobs.date_posted > ?", Date.today - params[:days_back].to_i.days) 
    end
    
    if params[:keywords]
      results = results.where("jobs.position LIKE ?", "%#{params[:keywords]}%") 
    end
    
    return results
    
  end
  



end
