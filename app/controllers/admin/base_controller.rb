class Admin::BaseController < ApplicationController
  layout "layouts/admin/admin_application"
  
  include Admin::BaseHelper
end
