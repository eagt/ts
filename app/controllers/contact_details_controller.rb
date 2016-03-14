class ContactDetailsController < ApplicationController
  
        layout "companies" 

      def index
          @contact_details = ContactDetail.sorted_id        
      end

      def show
         @contact_detail  = ContactDetail.find(params[:id])
      end


      def new
           @contact_detail  = ContactDetail.new({:address_type => " "})
           @contact_detail_count = ContactDetail.count + 1
      end

      def create
    # #Instantiate the new object using the form parameters
         @contact_detail  = ContactDetail.new(contact_detail_params)
    # Save the object
         if @contact_detail.save
              flash[:notice] = " Contact Detail #{@contact_detail.id} created successfully!"
    # If the save succeed, it will redirect some where (this case, index action)
              redirect_to(@contact_detail)      
        else 
    # If the save fails, redisplay the form so the user can fix the problem and the submit it
        @contact_detail_count = ContactDetail.count + 1
        render('new')
        end
      end


     def edit
         @contact_detail  = ContactDetail.find(params[:id])
         @contact_detail_count = ContactDetail.count
       end

       def update
      # Find an existing object using the form parameters
           @contact_detail  = ContactDetail.find(params[:id])       
      #  Update the object 
          if @contact_detail.update_attributes(contact_detail_params)
           flash[:notice] = " Contact Detail updated successfully!"
      #  If the update succeeds, it will redirect some where (this case, index action)
           redirect_to(:action => 'show', :id => @contact_detail.id)
           else 
      #  If the save fails, redisplay the form so the user can fix the problem and the submit it
          @contact_detail_count = ContactDetail.count
           render('edit')
           end
         end

      
       def delete
         @contact_detail  = ContactDetail.find(params[:id])
       end

       def destroy
    #     #I Find an existing object using the form parameters
         contact_detail = ContactDetail.find(params[:id]).destroy 
         flash[:notice] = "Contact Detail destroyed successfully!"
         redirect_to(:action => 'index')
       end


          private

          def contact_detail_params
            params.require(:contact_detail).permit(:company_id, :branch_id, :professional_id, :client_id, :user_id, :address_type, :address, :city, :state, :country, :telephone)

          end


end
