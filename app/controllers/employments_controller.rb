class EmploymentsController < ApplicationController
  

        layout "companies" 

      def index
          @employments = Employment.sorted_id        
      end

      def show
         @employment  = Employment.find(params[:id])
      end


      def new
           @employment  = Employment.new({:id => " "})
           @employment_count = Employment.count + 1
      end

      def create
    # #Instantiate the new object using the form parameters
         @employment  = Employment.new(employment_params)
    # Save the object
         if @employment.save
              flash[:notice] = " Employment  #{@employment.id} created successfully!"
    # If the save succeed, it will redirect some where (this case, index action)
              redirect_to(@employment)      
        else 
    # If the save fails, redisplay the form so the user can fix the problem and the submit it
        @employment_count = Employment.count + 1
        render('new')
        end
      end


     def edit
         @employment  = Employment.find(params[:id])
         @employment_count = Employment.count
       end

       def update
      # Find an existing object using the form parameters
           @employment  = Employment.find(params[:id])       
      #  Update the object 
          if @employment.update_attributes(employment_params)
           flash[:notice] = " Contact Detail updated successfully!"
      #  If the update succeeds, it will redirect some where (this case, index action)
           redirect_to(:action => 'show', :id => @employment.id)
           else 
      #  If the save fails, redisplay the form so the user can fix the problem and the submit it
          @employment_count = Employment.count
           render('edit')
           end
         end

      
       def delete
         @employment  = Employment.find(params[:id])
       end

       def destroy
    #     #I Find an existing object using the form parameters
         employment = Employment.find(params[:id]).destroy 
         flash[:notice] = "Contact Detail destroyed successfully!"
         redirect_to(:action => 'index')
       end


          private

          def employment_params
            params.require(:employment).permit(:company_id, :professional_id, :validated, :creator)

          end


end
