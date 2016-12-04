class AssetsController < ApplicationController
  def index
    @q = Asset.ransack(params[:q])
    @assets = @q.result(:distinct => true).includes(:net_worth, :asset_type).page(params[:page]).per(10)

    render("assets/index.html.erb")
  end

  def show
    @asset = Asset.find(params[:id])

    render("assets/show.html.erb")
  end

  def new
    @asset = Asset.new

    render("assets/new.html.erb")
  end

  def create
    @asset = Asset.new

    @asset.asset_type_id = params[:asset_type_id]
    @asset.asset_value = params[:asset_value]
    @asset.user_id = params[:user_id]
    @asset.net_worth_id = params[:net_worth_id]

    save_status = @asset.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assets/new", "/create_asset"
        redirect_to("/assets")
      else
        redirect_back(:fallback_location => "/", :notice => "Asset created successfully.")
      end
    else
      render("assets/new.html.erb")
    end
  end

  def edit
    @asset = Asset.find(params[:id])

    render("assets/edit.html.erb")
  end

  def update
    @asset = Asset.find(params[:id])

    @asset.asset_type_id = params[:asset_type_id]
    @asset.asset_value = params[:asset_value]
    @asset.user_id = params[:user_id]
    @asset.net_worth_id = params[:net_worth_id]

    save_status = @asset.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assets/#{@asset.id}/edit", "/update_asset"
        redirect_to("/assets/#{@asset.id}", :notice => "Asset updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Asset updated successfully.")
      end
    else
      render("assets/edit.html.erb")
    end
  end

  def destroy
    @asset = Asset.find(params[:id])

    @asset.destroy

    if URI(request.referer).path == "/assets/#{@asset.id}"
      redirect_to("/", :notice => "Asset deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Asset deleted.")
    end
  end
end
