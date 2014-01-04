class SearchTabsController < ApplicationController
  respond_to :json

  expose(:search_tabs) { current_user.search_tabs }

  def index
  end
end
