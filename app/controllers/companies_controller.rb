class CompaniesController < ApplicationController
	  
  def index
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
      @company = Company.new
  end

  def create
    # @company = Company.new(params[:company]) =>   Not the final implementation!
      @company = Company.new(company_params) 
      if @company.save
        flash[:success] = "Welcome to TS App!"
      # Handle a successful save.
        redirect_to @company
      else
       render 'new'
      end
  end

  def edit
    # begin
    # rescue
    # end
  end

  def update
  end

  def delete
  end

  def destroy
  end


  private

    def company_params
      params.require(:name).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end

