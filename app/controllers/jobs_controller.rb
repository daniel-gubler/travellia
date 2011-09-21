class JobsController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => :show
end
