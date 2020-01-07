# frozen_string_literal: true

require_relative './spec_helper.rb'
require_relative '../daily_cost.rb'

# rubocop:disable Metrics/BlockLength
describe 'daily_cost' do
  it 'A single and for multiple individual periods' do
    all_time_periods = %w[daily weekly monthly]
    # time interval
    start_date = Date.new(2019, 2, 1)
    end_date = Date.new(2019, 2, 3)
    time_period_costs = [
      {
        time_period: all_time_periods[0], # daily
        cost: 10.0
      }
    ]
    cost_array = daily_cost(start_date, end_date, time_period_costs)
    expect(cost_array[0][:cost]).to eq 10
    expect(cost_array.length).to eq 3
  end

  it 'Mixed daily, weekly and monthly periods' do
    all_time_periods = %w[daily weekly monthly]
    # time interval
    start_date = Date.new(2019, 2, 1)
    end_date = Date.new(2019, 2, 3)
    time_period_costs = [
      {
        time_period: all_time_periods[0], # daily
        cost: 10.0
      },
      {
        time_period: all_time_periods[1], # weekly
        cost: 7.0
      },
      {
        time_period: all_time_periods[2], # monthly
        cost: 28.0
      }
    ]
    cost_array = daily_cost(start_date, end_date, time_period_costs)
    expect(cost_array[0][:cost]).to eq 12
    expect(cost_array.length).to eq 3
  end

  it 'A single and for multiple individual periods' do
    all_time_periods = %w[daily weekly monthly]
    # time interval
    start_date = Date.new(2019, 2, 1)
    end_date = Date.new(2019, 2, 3)
    time_period_costs = [
      {
        time_period: all_time_periods[0], # daily
        cost: 10.0
      }
    ]
    cost_array = daily_cost(start_date, end_date, time_period_costs)
    expect(cost_array[0][:cost]).to eq 10
    expect(cost_array.length).to eq 3
  end

  it 'Returns an error for wrong time interval given' do
    all_time_periods = %w[daily weekly monthly]
    # time interval
    start_date = Date.new(2019, 2, 5)
    end_date = Date.new(2019, 2, 3)
    time_period_costs = [
      {
        time_period: all_time_periods[0], # daily
        cost: 10.0
      }
    ]
    cost_array = daily_cost(start_date, end_date, time_period_costs)
    expect(cost_array).to eq nil
  end

  it 'Returns an error for wrong time interval given' do
    all_time_periods = %w[daily weekly monthly]
    # time interval
    start_date = Date.new(2019, 2, 1)
    end_date = Date.new(2019, 2, 3)
    time_period_costs1 = [
      {
        time_period: all_time_periods[0], # daily
        cost: -10.0
      }
    ]
    time_period_costs2 = [
      {
        time_period: 'daily1',
        cost: 10.0
      }
    ]
    cost_array = daily_cost(start_date, end_date, time_period_costs1)
    expect(cost_array).to eq nil
    cost_array = daily_cost(start_date, end_date, time_period_costs2)
    expect(cost_array).to eq nil
  end
end
# rubocop:enable Metrics/BlockLength
