class ProfessionalsController < ApplicationController

  layout "professional"

  before_action :set_locale
  before_action :current_user

    def login
      render layout: false
    end

    def index
      if @is_company # If the user is a Company
        @professionals = @current_user.professionals
      else # If the user is professional pass the whole list ONLY for testing
        @professionals = Professional.all
      end
    end

    def show
      @professional = Professional.find(params[:id])
    end

def new
    begin
      if @is_company # If the user is a company and is creating a new virtual professional
        @professional = @current_user.professionals.new
      else # kicks in when registering a new Professional
        @professional = Professional.new      #(is_virtual: false)
      end    
    rescue Exception => e # Catch exceptions 
      flash[:notice] = e.to_s
      redirect_to([@current_user, :professionals])
    end
  end

# def new
#       if @is_company # If the user is a company and is creating a new virtual company
#         @professional = @current_user.professional.new
#         @professional_count = Professional.count + 1 
#       else # kicks in when registering a new Company
#            @professional = Professional.new   # this is new
#            @professional_count = Professional.count + 1 
#             if @professional_count >= 2                                 
#                flash[:notice] = " As a Professional you can only create your own Company"  
#                redirect_to :back  
#             end      
#       end
#       #redirect_to([@current_user, :companies])
#   end


def create        
    # Instantiate a new object using form parameters
    @professional = Professional.new(professional_params)
    if @professional.save
      if @is_company then Employment.create(:company => @current_user, :professional => @professional, :validated => true) end
      # If save succeeds, redirect to the index action
      flash[:notice] = "#{t(:professional)} #{t(:create_success)}"
      redirect_to([@current_user, :professionals])          
    else
      # If save fails, redisplay the from so user can fix problems
      render('new')
    end
  end








 # ***** ------------------------------------ ******
#Latest --> Saving professionals as normal but it isn't saving on companies satck 

#  def new
#     @professional = Professional.new({:first_name => " "})
#     @professional_count = Professional.count + 1
#   end

# def create
#     #@professional = Professional.new(params[:professional]) 
#     @professional = Professional.new(professional_params)
#     if @professional.save
#         flash[:success] = "Welcome to TS App '#{@professional.first_name}'!"
#       # Handle a successful save.
#          redirect_to @professional
#     else
#        render 'new'
#     end
#   end

 # ***** ------------------------------------ ******


 # def new
 #    begin
 #      if @is_company # If the user is a company and is creating a new virtual professional
 #        @professional = @current_user.professionals.new
 #      else # kicks in when registering a new Professional
 #        @professional = Professional.new(is_virtual: false)
 #      end    
 #    rescue Exception => e # Catch exceptions 
 #      flash[:notice] = e.to_s
 #      redirect_to([@current_user, :professionals])
 #    end
 #  end

 # def create        
 #    # Instantiate a new object using form parameters
 #    @professional = Professional.new(professional_params)
 #    if @professional.save
 #      if @is_company then Employment.create(:company => @current_user, :professional => @professional, :note => "Real company, Virtual professional", :validated => true) end
 #      # If save succeeds, redirect to the index action
 #      flash[:notice] = "#{t(:professional)} #{t(:create_success)}"
 #      redirect_to([@current_user, :professionals])          
 #    else
 #      # If save fails, redisplay the from so user can fix problems
 #      render('new')
 #    end
 #  end




    # def new
    #      if @is_company # If the user is a company and is creating a new virtual professional
    #         @professional = @current_user.professionals.new
    #         @professional_count = Professional.count + 1 
    #      else           # If it is a company create only one 
    #         @professional = Professional.new   # this is new
    #         @professional_count = Professional.count + 1 
    #            if @professional_count == 2
    #               flash[:notice] = " As a Professional you can only create yourself"  
    #               redirect_to :back  
    #            end
    #      end 
    # end

    # def create                
    #   # Instantiate a new object using form parameters
    #      @professional = Professional.new(professional_params)     # Professional.new(professional_params)
    #      if @professional.save
    #        # if is_company then Employment.create(:company => @current_user, :professional => @professional, :note => "Real company, Virtual professional", :validated => true) end
    #        #   # If save succeeds, redirect to the index action
    #          flash[:notice] = "#{t(:professional)} #{t(:create_success)}"
    #          redirect_to([@current_user, :professionals]) 
    #     end
    # end




    def edit
      @professional = Professional.find(params[:id])
    end

    def update
      # Find and existing object using form parameters
      @professional = Professional.find(params[:id])
      # Update the object
      if @professional.update_attributes(professional_params)
        # If update succeeds, redirect to the index action
        flash[:notice] = "#{t(:professional)} #{t(:update_success)}"
        redirect_to([@current_user, @professional])
      else
        # If save fails, redisplay the from so user can fix problems
        render('edit')
      end
    end

    def delete
      @professional = Professional.find(params[:id])
    end

    def destroy
      professional = Professional.find(params[:id]).destroy
      flash[:notice] = "#{t(:professional)} '#{professional.email}' #{t(:destroy_success)}"
      redirect_to([@current_user, :professionals])
    end

    private

      def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
      end

      def professional_params
        params.require(:professional).permit( :id, :id_code, :discipline, :first_name, :last_name, :dob, :email, :contact_details_id, :service, :specialty, :creator, :logged_as, :pass_active, :acc_active)
      end


 end
