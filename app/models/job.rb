class Job < ActiveRecord::Base
  attr_accessible :company, :date_posted, :description, :position, :town, :url
  
  def jobs
    @jobs ||= find_jobs
  end
  
  private
  
  def find_jobs    
    scope = Job.scoped({})
    scope = scope.conditions "job.date_posted > ?", "%#{keywords}%" unless keywords.blank?
  end
  



end
