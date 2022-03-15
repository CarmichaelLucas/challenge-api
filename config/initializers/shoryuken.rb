Shoryuken.active_job_queue_name_prefixing = true

Shoryuken.configure_client do |config|
  config.sqs_client = Aws::SQS::Client.new(
    region: 'us-east-1',
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    endpoint: ENV["AWS_SQS_ENDPOINT"] || 'https://sqs.us-east-1.amazonaws.com/863785012552/wishlist-email-service.fifo',
    verify_checksums: false
  )
end

Shoryuken.configure_server do |config|
  config.sqs_client = Aws::SQS::Client.new(
    region: 'us-east-1',
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    endpoint: ENV["AWS_SQS_ENDPOINT"] || 'https://sqs.us-east-1.amazonaws.com/863785012552/wishlist-email-service.fifo',
    verify_checksums: false
  )
end