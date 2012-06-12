class Job < ActiveRecord::Base
  attr_accessible :company, :date_posted, :description, :position, :town, :url
  
  
  def self.search(params)

    results = Job.scoped
    
    results = results.where("jobs.date_posted > ?", Date.today - params[:days_back].to_i.days) if params[:days_back]  
    results = results.where("jobs.position LIKE ? OR jobs.company LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%") if params[:keywords]
    results = results.where("jobs.town LIKE ?", "%#{params[:location]}%") if params[:location]
    
    return results
    
  end
  



end
