class UpdatesDeletesController < ApplicationController
  


        layout "companies" 

      def index
          @updates_deletes = UpdatesDelete.sorted_id        
      end

      def show
         @updates_delete  = UpdatesDelete.find(params[:id])
      end


      def new
           @updates_delete  = UpdatesDelete.new({:element => " "})
           @updates_delete_count = UpdatesDelete.count + 1
      end

      def create
    # #Instantiate the new object using the form parameters
         @updates_delete  = UpdatesDelete.new(updates_delete_params)
    # Save the object
         if @updates_delete.save
              flash[:notice] = " Contact Detail #{@updates_delete.id} created successfully!"
    # If the save succeed, it will redirect some where (this case, index action)
              redirect_to(@updates_delete)      
        else 
    # If the save fails, redisplay the form so the user can fix the problem and the submit it
        @updates_delete = UpadatesDelete.count + 1
        render('new')
        end
      end


     def edit
         @updates_delete  = UpdatesDelete.find(params[:id])
         @updates_delete_count = UpdatesDelete.count
       end

       def update
      # Find an existing object using the form parameters
           @updates_delete  = UpdatesDelete.find(params[:id])       
      #  Update the object 
          if @updates_delete.update_attributes(updates_delete_params)
           flash[:notice] = " Upadates Delete updated successfully!"
      #  If the update succeeds, it will redirect some where (this case, index action)
           redirect_to(:action => 'show', :id => @updates_delete.id)
           else 
      #  If the save fails, redisplay the form so the user can fix the problem and the submit it
          @updates_delete_count = UpdatesDelete.count
           render('edit')
           end
         end

      
       def delete
         @updates_delete  = UpdatesDelete.find(params[:id])
       end

       def destroy
    #     #I Find an existing object using the form parameters
         updates_delete = UpdatesDelete.find(params[:id]).destroy 
         flash[:notice] = "Updates Deletes destroyed successfully!"
         redirect_to(:action => 'index')
       end


          private

          def updates_delete_params
            params.require(:updates_delete).permit(:company_id, :branch_id, :professional_id, :client_id, :user_id, :contact_details_id, :employment_id, :payment_detail_id, :table_name, :column_name, :element, :action_taken, :reason, :new_element)

          end


end
