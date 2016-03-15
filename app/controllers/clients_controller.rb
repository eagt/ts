class ClientsController < ApplicationController
  
  layout "professional"

  before_action :set_locale
  before_action :current_user

  def index
    if !@is_company && params[:company_id]
      @clients = @current_user.clients.where(company_id: params[:company_id])
    elsif @is_company && params[:professional_id]
      @clients = @current_user.clients.joins(:professionals).where(professionals: {id: params[:professional_id]})
    else
      @clients = @current_user.clients
    end    
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    begin
      @client = @current_user.clients.new()
    rescue Exception => e # Catch exceptions 
      flash[:notice] = e.to_s
      redirect_to([@current_user, :clients])
    end
  end

  def create    
    # Instantiate a new object using form parameters
    @client = Client.new(client_params) 
    if @client.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "#{t(:client)} #{t(:create_success)}"
      redirect_to([@current_user, :clients])
      # begin   
      #   @current_user.clients << @client
      #   # If save succeeds, redirect to the index action
      #   flash[:notice] = "#{t(:client)} #{t(:create_success)}"
      #   redirect_to([@current_user, :clients])
      # rescue Exception => e # Catch exceptions if it can't create the children of a company
      #   # If there is an exception delete the objects created and redirect to index
      #   if @client then @client.destroy end

      #   flash[:notice] = "#{t(:client)}->" + e.to_s
      #   redirect_to([@current_user, :clients])        
      # end
    else
      # If save fails, redisplay the from so user can fix problems
      render('new')
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    # Find and existing object using form parameters
    @client = Client.find(params[:id])
    # Update the object
    if @client.update_attributes(client_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "#{t(:client)} #{t(:update_success)}"
      redirect_to([@current_user, @client])
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end

  def delete
    @client = Client.find(params[:id])
  end

  def destroy
    client = Client.find(params[:id]).destroy
    flash[:notice] = "#{t(:client)} '#{client.first_name}' #{t(:destroy_success)}"
    redirect_to([@current_user, :clients])
  end

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

  def client_params
    params.require(:client).permit(:id_code, :id_token, :discipline, :company_id, :branch_id, :first_name, :last_name, :email, :dod, :photo, :contact_details_id, :creator, :logged_as)
  end

end
