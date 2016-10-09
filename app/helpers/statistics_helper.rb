module StatisticsHelper
  def visits_by_day
    area_chart Visit.group_by_day(:started_at).count, id: "visits-chart", height: "500px", xtitle: "Day", ytitle: "Visits", colors: ["pink", "#000"]
  end

  def registrations_by_day
    area_chart User.group_by_day(:created_at).count, id: "registrations-chart", height: "500px", xtitle: "Day", ytitle: "Registrations", colors: ["pink", "#000"]
  end

  def action_events
    pie_chart Ahoy::Event.where(name: "action_event").group(:user_id).count, id: "events-chart"
  end
end
