# frozen_string_literal: true

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
