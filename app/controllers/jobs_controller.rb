require 'will_paginate'

class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index

    print "Params: " + params.to_s
    @jobs = Job.search(params) ? Job.search(params) : Job.all
    @results = @jobs.count
    
    @jobs = @jobs.order("date_posted DESC").paginate(:page => params[:page], :per_page => 10)


    if session[:v].nil?
      version = rand(2)
      session[:v] = version
    end
    
    if session[:v] == 0
      render 'index'
    else
      render 'index2', :layout => "layout2"
    end
    
  end
  


  def show
    @job = Job.find(params[:id])
  end


  def new
    @job = Job.new
  end


  def edit
    @job = Job.find(params[:id])
  end


  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
end
