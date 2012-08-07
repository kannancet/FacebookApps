class ApplicationController < ActionController::Base
  protect_from_forgery

=begin
  This is used to create custom JSON error messages for the web-service 
=end
  rescue_from Exception, :with => :render_error
  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  rescue_from ActionController::RoutingError, :with => :render_not_found
  rescue_from ActionController::UnknownController, :with => :render_not_found
  rescue_from AbstractController::ActionNotFound, :with => :render_not_found
  
=begin
   This function is used to check the ACL-Bootstrap Authentication key.
=end  
  def authenticate_user
    auth_token = request.headers["auth_key"]
    if auth_token == SERVER_AUTH_KEY
      return true
    else
      render  :status=>401,
              :json =>{:Response => "Fail",
                       :Data => nil,
                       :Message => "Unauthorized access."}
    end     
  end
  
=begin
  Custom '404' error message. 
=end
  def render_not_found(exception)
    render :status=>404,
           :json=>{:Message=>"Page not found",
                   :Response => "Fail",
                   :Data => exception.message}
  end
 
=begin
  Custom error message for application level errors. 
=end  
  def render_error(exception)
    render :status=>401,
           :json=>{:Message=>"OOps!!! Some thing went wrong.",
                   :Response => "Fail",
                   :Data => exception.message}
  end

=begin
  No route found exception 
=end  
  def no_route_found
    render :status=>404,
           :json=>{:Message=>"Invalid API URL.This API is not defined.",
                   :Response => "Fail",
                   :Data => nil}  
  end
  
end
