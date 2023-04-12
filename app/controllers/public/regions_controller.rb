class Public::RegionsController < ApplicationController
  
  
  def show
    @region = Region.find_by(id:params[:id])
  end
  private

  def post_params
    params.require(:region).permit(:name,:post_id)
  end
end
