class StaticController < ApplicationController

  def generic
    respond_to do |format|
      format.html
    end
  end

  def about
    @body_id = "about_page"
    generic
  end
end