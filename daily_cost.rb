# frozen_string_literal: true

require 'date'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
def daily_cost(start_date, end_date, time_period_costs)
  return nil unless time_period_costs.is_a? Array

  # calculate the day cost value from time_period_costs
  day_cost = 0
  time_period_costs.each do |cost_item|
    case cost_item[:time_period]
    when 'daily'
      day_cost += cost_item[:cost]
    when 'weekly'
      day_cost += cost_item[:cost] / 7
    when 'monthly'
      days_of_month = Date.new(end_date.year, end_date.month, -1).day
      day_cost += cost_item[:cost] / days_of_month
    else
      return nil
    end
  end

  return nil unless day_cost.positive?

  # make daily cost array per each day from start date to end date
  cost_array = []
  (start_date..end_date).each do |date|
    cost_array.push(
      date: date,
      cost: day_cost
    )
  end

  return nil unless cost_array.length.positive?

  cost_array
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/AbcSize
