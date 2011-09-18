class BooksController < InheritedResources::Base
  before_filter :authenticate_admin!, :except => :show
end
