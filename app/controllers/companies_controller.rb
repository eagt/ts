class CompaniesController < ApplicationController
	

  layout "professional"

  before_action :set_locale  
  before_action :current_user

  def login
    render layout: false
  end

  def index
    if !@is_company # If the user is a professional
      @companies = @current_user.companies
    else # If the user is companies pass the whole list ONLY for testing
       @companies = Company.sorted_name    #@companies = Company.all   THIS WAS CHANGED
    end
  end

  def show
    @company = Company.find(params[:id])
  end




  def new
      if !@is_company # If the user is a professional 
         @company = @current_user.companies.new  
         @company_count = Company.count + 1      
      else            # If it is a company create only one 
        @company = Company.new   # this is new
        @company_count = Company.count + 1 
           if @company_count == 2                                 
              flash[:notice] = " As a Company you can only create your own Company"  
              redirect_to :back  
           end
      end 
  end

  
  # def create  
  #     # if !@is_company              
  #   # Instantiate a new object using form parameters
  #     @company = @current_user.companies.new(company_params) 
  #           #@company = Company.new(company_params)
  #     if @company.save
  #      Employment.create(:company => @company, :professional => @current_user, :note => "virtual company, Real professional", :validated => true) end
  #         # If save succeeds, redirect to the index action     
  #         flash[:notice] = "#{t(:company)} #{t(:create_success)}"
  #         redirect_to([@current_user, :companies])   
  #     end
  # end

#/**** Working **/
  # def new
  #     if !@is_company # If the user is a professional 
  #        @company = @current_user.companies.new  
  #        @company_count = Company.count + 1      
  #     else            # If it is a company create only one 
  #       @company = Company.new   # this is new
  #       @company_count = Company.count + 1 
  #          if @company_count == 2                                 
  #             flash[:notice] = " As a Company you can only create your own Company"  
  #             redirect_to :back  
  #          end
  #     end 
  # end

  
  def create               
    # Instantiate a new object using form parameters
      @company = Company.new(company_params)
      if @company.save
          if !@is_company then Employment.create(:company => @company, :professional => @current_user, :note => "virtual company, Real professional", :validated => true) end
          # If save succeeds, redirect to the index action     
          flash[:notice] = "#{t(:company)} #{t(:create_success)}"
          redirect_to([@current_user, :companies])   
      end
  end

#/***  Working ***/



#  /****  This is the old code  ****/ 



  # def new


  #   #begin     
  #     if !@is_company # If the user is a professional and is creating a new virtual company
  #        @company = @current_user.companies.new       
  #     elsif # kicks in when registering a new Company ... If it is a company create one. and only one. 



  #       @company = Company.new #(is_virtual: false) 
  #       @company_count = Company.count + 1        #This is new  



  #     #else    This is new uncommented       
  #   # rescue Exception => e # Catch exceptions 
  #   #   flash[:notice] = e.to_s
  #   #   redirect_to([@current_user, :companies])
  #     end
  #      @company_count = Company.count + 1
  # end

          

  # def create               
  #   # Instantiate a new object using form parameters
  #   @company = Company.new(company_params)
  #   if @company.save
  #     if !@is_company 
  #      Employment.create(:name => @company, :professional => @current_user, :note => "virtual company, Real professional", :validated => true) 
  #     end
  #     # If save succeeds, redirect to the index action     
  #     flash[:notice] = "#{t(:company)} #{t(:create_success)}"
  #     redirect_to([@current_user, :companies])    
  #   else 

  #       @company_count == 2                       # This is new ... This could work but I need to declare that the delete action won't show once it the company is created
  #       flash[:notice] = " You can't create more Companies"   # This is new
  #       redirect_to :back
  #     # If save fails, redisplay the from so user can fix problems
  #       # @company_count >= 1                        # This is new ... This could work but I need to declare that the delete action won't show once it the company is created
  #       # flash[:notice] = " You can't create more Companies"   # This is new
  #       # redirect_to :back
  #      #render('new')
  #   end
  # end


  #  /****  This is the old code  ****/ 



  def edit
    @company = Company.find(params[:id])
  end

  def update
    # Find and existing object using form parameters
    @company = Company.find(params[:id])
    # Update the object
    if @company.update_attributes(company_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "#{t(:company)} #{t(:update_success)}"
      redirect_to([@current_user, @company])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end

  def delete
    @company = Company.find(params[:id])
  end

  def destroy
    company = Company.find(params[:id]).destroy
    flash[:notice] = "#{t(:company)} '#{company.email}' #{t(:destroy_success)}"
    redirect_to([@current_user, :companies])
  end


  private

      def set_locale
          I18n.locale = params[:locale] || I18n.default_locale
      end

       def company_params
         # same as using "params[:subject]", except that it:
         # - raises an error if :subject is not present
         # - allows listed attributes to be mass-assigned
          params.require(:company).permit(:id, :id_code, :id_token, :discipline, :company_id, :name, :email, :contact_details_id, :creator, :logged_as, :is_virtual, :is_default, :time_zone)
      end
  

end