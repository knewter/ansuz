module DashboardHelper
  def render_dashboard_box dashboard_box
    render :partial => 'shared/render_dashboard_box', :locals => { :dashboard_box => dashboard_box }
  end
end
