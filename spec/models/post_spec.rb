# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/初期.jpg') }
  let(:img) { Rack::Test::UploadedFile.new(image_path) }


end
