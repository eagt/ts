class BranchesController < ApplicationController
  layout "companies"  

  def index
      @branches = Branch.sorted_discipline
  end


  def show
     @branche  = Branch.find(params[:id])
  end
  def new
  end

  def edit
  end

  def delete
  end
end
