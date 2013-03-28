class StaticController < ApplicationController
  def about
  end

  def age_gate
    render :nothing => true, :layout => "age_gate"
  end
end