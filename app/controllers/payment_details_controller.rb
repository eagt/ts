class PaymentDetailsController < ApplicationController
  
        layout "companies" 

      def index
          @payment_details = PaymentDetail.sorted_id        
      end

      def show
         @payment_detail  = PaymentDetail.find(params[:id])
      end


      def new
           @payment_detail  = PaymentDetail.new({:total_project_price => " "})
           @payment_detail_count = PaymentDetail.count + 1
      end

      def create
    # #Instantiate the new object using the form parameters
         @payment_detail  = PaymentDetail.new(payment_detail_params)
    # Save the object
         if @payment_detail.save
              flash[:notice] = " Payment Detail #{@payment_detail.id} created successfully!"
    # If the save succeed, it will redirect some where (this case, index action)
              redirect_to(@payment_detail)      
        else 
    # If the save fails, redisplay the form so the user can fix the problem and the submit it
        @payment_detail_count = PaymentDetail.count + 1
        render('new')
        end
      end


     def edit
         @payment_detail  = PaymentDetail.find(params[:id])
         @payment_detail_count = PaymentDetail.count
       end

       def update
      # Find an existing object using the form parameters
           @payment_detail  = PaymentDetail.find(params[:id])       
      #  Update the object 
          if @payment_detail.update_attributes(payment_detail_params)
           flash[:notice] = " Payment Detail updated successfully!"
      #  If the update succeeds, it will redirect some where (this case, index action)
           redirect_to(:action => 'show', :id => @payment_detail.id)
           else 
      #  If the save fails, redisplay the form so the user can fix the problem and the submit it
          @payment_detail_count = PaymentDetail.count
           render('edit')
           end
         end

      
       def delete
         @payment_detail  = PaymentDetail.find(params[:id])
       end

       def destroy
    #     #I Find an existing object using the form parameters
         payment_detail = PaymentDetail.find(params[:id]).destroy 
         flash[:notice] = "Payment Detail destroyed successfully!"
         redirect_to(:action => 'index')
       end


          private

          def payment_detail_params
            params.require(:payment_detail).permit(:appointment_id, :total_project_price, :task_payment, :professional_fee, :remaining_project_payment)

          end


end
