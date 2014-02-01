class SearchTabsController < ApplicationController
  respond_to :json

  expose(:search_tabs) { current_user.search_tabs }
  expose(:search_tab, attributes: :search_tab_params)

  def index
  end

  def create
    save_search_tab
  end

  def update
    save_search_tab
  end

  def destroy
    search_tab.destroy
    render json: {}
  end

  private

  def save_search_tab
    if search_tab.save
      render 'search_tabs/show'
    else
      respond_with search_tab
    end
  end

  def search_tab_params
    params.require(:search_tab).permit(:scheme_prefix, :scheme_suffix)
  end
end
