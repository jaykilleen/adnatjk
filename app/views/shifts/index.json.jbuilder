json.status "OK"
json.shifts @shifts do |shift|
  json.id shift.id
  json.user shift.user
  json.organisation shift.organisation
  json.date shift.start.to_date.strftime("%a, %-d %b %y")
  json.start shift.start.strftime("%I:%M%p")
  json.finish shift.finish.strftime("%I:%M%p")
  json.break_length shift.break_length
  json.hours_worked shift.hours_worked
  json.cost number_to_currency(shift.cost)
  json.created_at shift.created_at
  json.updated_at shift.updated_at
end
