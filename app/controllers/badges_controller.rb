class BadgesController < ApplicationController
  include BadgesHelper

  def issue_badge
    first_name, last_name = params[:hero_name].split(" ")
    post_badge("#{params[:hero_id]}@gmail.com", first_name, last_name, params[:badge_template_activities][0][:id], Time.new.to_s)
    redirect_to hero_path(params[:hero_id])
  end
end
