class ProfessionalsController < ApplicationController

  layout "companies"  
 
# /** -- I could place in here any form of sorting I desire depending on  the methods I've
# created in the professional model
  def index
    @professionals = Professional.sorted_lastname
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def new
    @professional = Professional.new({:name => " "})
    @professional_count = Professional.count + 1
  end

  def create
    #@professional = Professional.new(params[:professional])  =>  # Not the final implementation!
    @professional = Professional.new(professional_params)
      if @professional.save
        flash[:success] = "Welcome to TS App '#{@professional.name}'!"
      # Handle a successful save.
         redirect_to @professional
      else
       render 'new'
      end
  end

 def edit
     @professional  = Professional.find(params[:id])
     @professional_count = Professional.count
   end

   def update
  # Find an existing object using the form parameters
       @professional  = Professional.find(params[:id])       
  #  Update the object 
      if @professional.update_attributes(professional_params)
       flash[:notice] = " Professional #{@professional.name} updated successfully!"
  #  If the update succeeds, it will redirect some where (this case, index action)
       redirect_to(:action => 'show', :id => @professional.id)
       else 
  #  If the save fails, redisplay the form so the user can fix the problem and the submit it
       @professional_count = Professional.count
       render('edit')
       end
     end


   def delete
     @professional  = Professional.find(params[:id])
   end

   def destroy
#     #I Find an existing object using the form parameters
     professional = Professional.find(params[:id]).destroy 
     flash[:notice] = "Professional #{professional.name} destroyed successfully!"
     redirect_to(:action => 'index')
   end
 

  private

    def professional_params
      params.require(:professional).permit(:id, :id_code, :discipline, :name, :email, :contact_details_id, :creator, :logged_as, :updated_at, :comapny_id, :branch_id, :client_id, :appointment, :password,
                                   :password_confirmation)
    end



end
