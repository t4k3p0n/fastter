require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'fastter'
    config.asset_host = 'https://s3.amazonaws.com/fastter'
    # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
    config.fog_public = false # ←コレ
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1',
      # path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end

end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/