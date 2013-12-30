class SearchController < ApplicationController
  respond_to :html, :json

  def index
    respond_to do |format|
      format.html
      format.json { respond_with hit: 'bien sur!' }
    end
  end

end
