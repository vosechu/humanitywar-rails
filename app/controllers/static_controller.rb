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

  def age_gate
    render :nothing => true, :layout => "age_gate"
  end
end