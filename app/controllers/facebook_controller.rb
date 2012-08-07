class FacebookController < ApplicationController
  
  before_filter :authenticate_user

=begin
  This function is used to render the app list. 
=end
  def get_app_list
    page = params[:page].blank? ? 1 : params[:page]
    apps = (FacebookAppList.search do 
             fulltext ""
             paginate :page => page, :per_page => 12
            end).results
    next_page = apps.last_page? ? -1 : (page.to_i + 1)
    previous_page = apps.first_page? ? -1 : (page.to_i - 1)
    @response_data = ::Response::Data.new(:TotalPages => apps.num_pages, 
                                          :Message => "Successfully fetched #{apps.size} apps.", 
                                          :NextPage => next_page, 
                                          :PreviousPage => previous_page, 
                                          :CurrentPage => page, 
                                          :Response => "success")
    @response_data.Data = ActiveSupport::JSON.decode(apps.to_json(:only => [:id, :app_name, :app_url]))
     render "facebook/response"
  end
  
end
