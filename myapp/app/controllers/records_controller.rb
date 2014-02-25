class RecordsController < ApplicationController
 
  def index
    @records = Record.all
  end

  def show
   @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
    @sumbit = "Save"
  end

  def create
   
    @hobby  = params[:hobby]#to_sentence(:last_word_connector => ",")
    unless @hobby.nil?
      @hobbies = @hobby.join(',')
    end
    
    @gender = params[:gender]
   
   # @bdate = params[:bdate]
   # @date = Date.new @bdate["bd_on(1i)"].to_i, @bdate["bd_on(2i)"].to_i, @bdate["bd_on(3i)"].to_i
    @record = Record.new(params[:record].merge(:hobbies => @hobbies,:gender => @gender))
    #@record = Record.new(params[:record].merge(:hobbies => @hobbies,:gender => @gender,:bdate=>@date))
    if @record.save
       redirect_to @record
    else
      render :action => 'new'
    end
  end

  def edit
     @record = Record.find(params[:id])
     @sumbit = "Update"
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(params[:record])
      redirect_to @record, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end
  def display
    #@records = Record.all
  end
end
