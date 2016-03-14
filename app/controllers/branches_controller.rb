class BranchesController < ApplicationController
  
  layout "companies"  

  def index
      @branches = Branch.sorted_name
  end


  def show
     @branch  = Branch.find(params[:id])
  end

  def new
       @branch  = Branch.new({:name => " "})
       @branch_count = Branch.count + 1
  end

   def create
# #Instantiate the new object using the form parameters

     @branch  = Branch.new(branch_params)
# Save the object
 
    if @branch.save
          flash[:notice] = " Branch #{@branch.name} created successfully!"
# If the save succeed, it will redirect some where (this case, index action)
          redirect_to(@branch)    
    else 
# If the save fails, redisplay the form so the user can fix the problem and the submit it
    @branch_count = Branch.count + 1
    render('new')
    end
  
   end


  def edit
    @branch = Branch.find(params[:id])
    @branch_count = Branch.count
  end

  def update
    @branch = Branch.find(params[:id])
    if @branch.update_attributes(branch_params)
      flash[:notice] = " Branch #{@branch.name} updated successfully!"
      redirect_to(:action => 'show', :id => @branch.id)
    else
      @branch_count = Branch.count
      render ('edit')
    end
  end


   def delete
     @branch  = Branch.find(params[:id])
   end

   def destroy
#     #I Find an existing object using the form parameters
     branch = Branch.find(params[:id]).destroy 
     flash[:notice] = "Branch #{branch.name} destroyed successfully!"
     redirect_to(:action => 'index')
   end
 


  private

  def branch_params
    params.require(:branch).permit(:id_code, :discipline, :company_id, :name, :email, :contact_details_id, :creator, :logged_as)
  end

end
