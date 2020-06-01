# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/初期.jpg'), 'image/jpg') }
    association :user
  end
end
