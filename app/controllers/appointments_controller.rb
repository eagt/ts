class AppointmentsController < ApplicationController
  
  layout "companies"  

  def index
      @appointments = Appointment.sorted_discipline
  end


  def show
     @appointment  = Appointment.find(params[:id])
  end


  def new
       @appointment  = Appointment.new({:discipline => " "})
       @appointment_count = Appointment.count + 1
  end

  def create
# #Instantiate the new object using the form parameters
     @appointment  = Appointment.new(appointment_params)
# Save the object
     if @appointment.save
          flash[:notice] = " Appointment created successfully!"
# If the save succeed, it will redirect some where (this case, index action)
          redirect_to(@appointment)      
    else 
# If the save fails, redisplay the form so the user can fix the problem and the submit it
    @appointment_count = Appointment.count + 1
    render('new')
    end
  end


 def edit
     @appointment  = Appointment.find(params[:id])
     @appointment_count = Appointment.count
   end

   def update
  # Find an existing object using the form parameters
       @appointment  = Appointment.find(params[:id])       
  #  Update the object 
      if @appointment.update_attributes(appointment_params)
       flash[:notice] = " Appointment updated successfully!"
  #  If the update succeeds, it will redirect some where (this case, index action)
       redirect_to(:action => 'show', :id => @appointment.id)
       else 
  #  If the save fails, redisplay the form so the user can fix the problem and the submit it
      @appointment_count = Appointment.count
       render('edit')
       end
     end

  
   def delete
     @appointment  = Appointment.find(params[:id])
   end

   def destroy
#     #I Find an existing object using the form parameters
     appointment = Appointment.find(params[:id]).destroy 
     flash[:notice] = "Appointment destroyed successfully!"
     redirect_to(:action => 'index')
   end
 


   private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def appointment_params
      # same as using "params[:appointment]", except taht it:
      # - raises an error if :appointment is not present
      # - allows listed attributes to be mass-assigned
      params.require(:appointment).permit(:discipline, :company_id, :branch_id, :client_id, :date_time, :status, :appointment_code, :follow_up_code, :task_type, :task_note, :photo, :needs_followup, :payment_details_id, :creator, :logged_as)
    end


end
