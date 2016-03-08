class ClientsController < ApplicationController
  

  def index
    @clients = Client.sorted_lname
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new({:name => " "})
    @client_count = Client.count + 1
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "Cleint #{@client.name.upcase} created successfuly!!" 
      redirect_to(@client)
    else
      @client_count = Client.count + 1
      render('new')
      # Note: A method has to been created to make sure that an user with the same details can be entered
    end
  end

  def edit
     @client = Client.find(params[:id])
     @client_count = Client.count
  end

  def update
     @client = Client.find(params[:id])
     if @client.update_attributes(client_params)
      flash[:notice] = " Client #{@client.name.upcase} updated successfully!"
  #  If the update succeeds, it will redirect some where (this case, index action)
      redirect_to(:action => 'show', :id => @client.id)
     else 
      @clienty_count = Client.count
       redenr ('edit')
     end
  end



  def delete
    @client = Client.find(params[:id])
  end

  def destroy
    client = Client.find(params[:id]).destroy 
     flash[:notice] = "Client #{client.name.upcase} destroyed successfully!"
     redirect_to(:action => 'index')
  end



  private
  def client_params
    params.require(:client).permit(:id_code, :discipline, :company_id, :name, :last_name, :email, :dod, :photo, :contact_details_id, :creator, :logged_as)



  end
end
