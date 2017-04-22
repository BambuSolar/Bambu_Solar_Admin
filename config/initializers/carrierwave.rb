CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      # Configuration for Amazon S3 should be made available through an Environment variable.
      # For local installations, export the env variable through the shell OR
      # if using Passenger, set an Apache environment variable.
      #
      # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
      #
      # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAI36TJPWXUMTWUHKA',
      :aws_secret_access_key => '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',
      :region                => 'us-west-2'
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

  config.fog_directory    = 'bambu-energia-en-movimiento'
end