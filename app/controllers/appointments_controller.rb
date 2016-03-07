class AppointmentsController < ApplicationController
  
  layout "companies"  

  def index
      @appointments = Appointment.sorted_discipline
  end


  def show
     @appointments  = Appointment.find(params[:id])
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
  end

  def delete
  end


   private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def appointment_params
      # same as using "params[:appointment]", except taht it:
      # - raises an error if :appointment is not present
      # - allows listed attributes to be mass-assigned
      params.require(:appointment).permit(:discipline, :company_id, :branch_id, :professional_id, :client_id, :needs_folloup, :date_time, :status, :task_type, :task_note, :payment_details)
    end


end
