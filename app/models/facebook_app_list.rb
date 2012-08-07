class FacebookAppList < ActiveRecord::Base

  searchable do
    text :app_name
  end

  
end
