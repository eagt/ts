class ProfessionalsController < ApplicationController
  
  def index
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def new
    @professional = Professional.new
  end

  def create
    #@professional = Professional.new(params[:professional])  =>  # Not the final implementation!
    @professional = Professional.new(professional_params)
      if @professional.save
        flash[:success] = "Welcome to TS App!"
      # Handle a successful save.
         redirect_to @professional
      else
       render 'new'
      end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

private

    def professional_params
      params.require(:professional).permit(:name, :email, :password,
                                   :password_confirmation)
    end



end
