class Admin::RegionsController < ApplicationController
  
  def index
    @region = Region.all
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:notice] = "地方を追加しました。"
      redirect_back fallback_location: admin_regions_path
    else
      @region = Region.all
      render :index
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      flash[:notice] ="更新しました。"
      redirect_to admin_regions_path(@region.id)
    else
      @region = Region.all
      render :index
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] = "削除しました。"
    redirect_to admin_regions_path
  end
  
  private
  
  def region_params
    params.require(:region).permit(:name,:image)
  end
  
end
