CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Figaro.env.AWS_ACCESS_KEY_ID,                        # required unless using use_iam_profile
    aws_secret_access_key: Figaro.env.AWS_SECRET_ACCESS_KEY,                        # required unless using use_iam_profile
    region:                Figaro.env.AWS_REGION,                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = Figaro.env.AWS_DIRECTORY                                      # required
end