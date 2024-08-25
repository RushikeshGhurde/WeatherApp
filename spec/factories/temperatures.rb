# frozen_string_literal: true

# spec/factories/temperatures.rb
FactoryBot.define do
  factory :temperature do
    city
    date { Date.today }
    temperature { 25 }
  end
end
