require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/初期.jpg') }
  let(:img) { Rack::Test::UploadedFile.new(image_path) }

  it 'user, imgで投稿できる' do
    post = Post.new(
      user: user,
      img: img
    )
    expect(post).to be_valid
  end

  
end
