class NetWorthsController < ApplicationController
 # def calculate_asset_total
 #   i = NetWorth.find(1).assets
 #   @numbers = i.each {|x| p x.asset_value.to_f}
 # end

  def index
    @q = NetWorth.ransack(params[:q])
    @net_worths = @q.result(:distinct => true).includes(:liabilities, :assets, :user).page(params[:page]).per(10)
    @user_net_worth = User.find(current_user.id).net_worths
    @user_number_net_worth = @user_net_worth.count
    @first_net_worth = @user_net_worth.select(1)
    @calculate_asset_total = Asset.sum(:asset_value)
    @calculate_liability_total = Liability.sum(:liabilities_value)
    @calculate_net_worth = @calculate_asset_total.to_i - @calculate_liability_total.to_i

    render("net_worths/index.html.erb")
  end

  def show
    @q = NetWorth.ransack(params[:q])
    @user = User.find(current_user.id)
    @asset = Asset.new
    @liability = Liability.new
    @net_worth = NetWorth.find(params[:id])
    @calculate_asset_total = Asset.sum(:asset_value)
    @calculate_liability_total = Liability.sum(:liabilities_value)
    @calculate_net_worth = @calculate_asset_total.to_i - @calculate_liability_total.to_i

    render("net_worths/show.html.erb")
  end

  def new
    @net_worth = NetWorth.new

    render("net_worths/new.html.erb")
  end

  def create
    @net_worth = NetWorth.new

    @net_worth.liabilities_id = params[:liabilities_id]
    @net_worth.net_worth_total_id = params[:net_worth_total_id]
    @net_worth.asset_total_id = params[:asset_total_id]
    @net_worth.user_id = params[:user_id]

    save_status = @net_worth.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/net_worths/new", "/create_net_worth"
        redirect_to("/net_worths")
      else
        redirect_back(:fallback_location => "/", :notice => "Net worth created successfully.")
      end
    else
      render("net_worths/new.html.erb")
    end
  end

  def edit
    @net_worth = NetWorth.find(params[:id])

    render("net_worths/edit.html.erb")
  end

  def update
    @net_worth = NetWorth.find(params[:id])

    @net_worth.liabilities_id = params[:liabilities_id]
    @net_worth.net_worth_total_id = params[:net_worth_total_id]
    @net_worth.asset_total_id = params[:asset_total_id]
    @net_worth.user_id = params[:user_id]

    save_status = @net_worth.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/net_worths/#{@net_worth.id}/edit", "/update_net_worth"
        redirect_to("/net_worths/#{@net_worth.id}", :notice => "Net worth updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Net worth updated successfully.")
      end
    else
      render("net_worths/edit.html.erb")
    end
  end

  def destroy
    @net_worth = NetWorth.find(params[:id])

    @net_worth.destroy

    if URI(request.referer).path == "/net_worths/#{@net_worth.id}"
      redirect_to("/", :notice => "Net worth deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Net worth deleted.")
    end
  end
end
