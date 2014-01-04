class SearchTabsController < ApplicationController
  respond_to :json

  expose(:search_tabs)

  def index
  end
end
