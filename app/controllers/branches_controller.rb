class BranchesController < ApplicationController
   

layout "professional"

  before_action :set_locale
  before_action :current_user


  def index    
    if @is_company # if the user is a company list the branches under it
      @branches = @current_user.branches
    else # if the user is a professional check that the param company_id exist to show the branches under a specific company
      if params[:company_id]
        @branches = Branch.where(company_id: params[:company_id])
      else
        redirect_to([@current_user, :companies])
      end
    end 
  end

  def show
    @branch = Branch.find(params[:id])
  end

  

  def new
    #begin
      if @is_company #if the user is a company
        @branch = @current_user.branches.new()
        @branch_count = Branch.count + 1 
      else   # if the user is a professional check that the param company_id exist to show the branches under a specific company ( DUDO QUE ESTO FUNCIONE DESDE PROFESSIONAL)
         params[:company_id]
         @branch = Branch.new(company_id: params[:company_id])
        # redirect_to([@current_user, :companies])
      end
      
    # rescue Exception => e # Catch exceptions 
    #   flash[:notice] = e.to_s
    #   redirect_to([@current_user, :companies])
    # end
  end


#   def create
# #Instantiate the new object using the form parameters
#     @branch  = Branch.new(branch_params)
# # Save the object
#     flash[:notice] = " Branch #{@branch.name} created successfully!"
#     if @branch.save
# # If the save succeed, it will redirect some where (this case, index action)
#     redirect_to(:action => 'index')
    
#     else 
# # If the save fails, redisplay the form so the user can fix the problem and the submit it
#      @branch_count = Branch.count + 1
#     render('new')
#     end
#   end

  # /**************  ------------------  ******************** /

  # Old code not working properly

  def create  
    # Instantiate a new object using form parameters
    @branch = Branch.new(branch_params)
    redirect_to([@current_user, :branches])
    if @branch.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "#{t(:branch)} #{t(:create_success)}" 
      # begin
      #   # If save succeeds, redirect to the index action
      #   flash[:notice] = "#{t(:branch)} #{t(:create_success)}"
        
      # rescue Exception => e # Catch exceptions if it can't create the children of a company
      #   # If there is an exception delete the objects created and redirect to index        
      #   if @branch then @branch.destroy end        
        
      #   flash[:notice] = "#{t(:branch)}->" + e.to_s
      #   redirect_to([@current_user, :branches])
      # end    
    else
      # If save fails, redisplay the from so user can fix problems
        render('new')
    end
  end

    # /**************  ------------------  ******************** /

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    # Find and existing object using form parameters
    @branch = Branch.find(params[:id])
    # Update the object
    if @branch.update_attributes(branch_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "#{t(:branch)} #{t(:update_success)}"
      redirect_to([@current_user, @branch])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end

  def delete
    @branch = Branch.find(params[:id])
  end

  def destroy
    branch = Branch.find(params[:id]).destroy
    flash[:notice] = "#{t(:branch)} '#{branch.name}' #{t(:destroy_success)}"
    redirect_to([@current_user, :branches])
  end

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

  def branch_params
    params.require(:branch).permit(:id_code, :company_id, :discipline, :name, :email, :contact_details_id, :creator, :logged_as, :time_zone)
                                  #(:id_token,  )
  end

end
