class VisitsController < ApplicationController
  def create
    @link = link.find_by(:slug => params[:slug])

    if @link
      Visit.create(:link_id => @link_id, :ip_address => request.remote_ip)
      redirect_to "http://#{@link.target.url}"
    else
      raise ActionController::RoutingError.new('Not Found') 
  end
end
