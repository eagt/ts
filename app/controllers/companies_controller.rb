class CompaniesController < ApplicationController
	

  layout "companies"  

  def index
      @companies = Company.sorted_name
  end

 def show
     @company  = Company.find(params[:id])
  end

  def new
       @company  = Company.new({:name => " "})
       @company_count = Company.count + 1
   end

  def create
# #Instantiate the new object using the form parameters

     @company  = Company.new(company_params)
# Save the object
 
    if @company.save
          flash[:notice] = " Company #{@company.name} created successfully!"
# If the save succeed, it will redirect some where (this case, index action)
          redirect_to(@company)    
    else 
# If the save fails, redisplay the form so the user can fix the problem and the submit it
    @company_count = Company.count + 1
    render('new')
    end
  
   end


   def edit
     @company  = Company.find(params[:id])
     @company_count = Company.count
   end

   def update
  # Find an existing object using the form parameters
       @company  = Company.find(params[:id])       
  #  Update the object 
      if @company.update_attributes(company_params)
       flash[:notice] = " Company #{@company.name} updated successfully!"
  #  If the update succeeds, it will redirect some where (this case, index action)
       redirect_to(:action => 'show', :id => @company.id)
       else 
  #  If the save fails, redisplay the form so the user can fix the problem and the submit it
       @company_count = Company.count
       render('edit')
       end
     end


   def delete
     @company  = Company.find(params[:id])
   end

   def destroy
#     #I Find an existing object using the form parameters
     company = Company.find(params[:id]).destroy 
     flash[:notice] = "Company #{company.name} destroyed successfully!"
     redirect_to(:action => 'index')
   end
 

  

  private

   def company_params
     # same as using "params[:subject]", except that it:
     # - raises an error if :subject is not present
     # - allows listed attributes to be mass-assigned
      params.require(:company).permit(:id_code, :discipline, :company_id, :name, :email, :contact_details_id, :creator, :logged_as)
  end

end

