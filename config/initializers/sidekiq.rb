
Sidekiq.configure_server do |config|
  config.redis = {
      url: 'redis://h:p0ecdc881139158ca85b95c91613d216c51468f002eb225f2bba4d9533c12dd4e@ec2-34-203-164-221.compute-1.amazonaws.com:17129'
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
      url: 'redis://h:p0ecdc881139158ca85b95c91613d216c51468f002eb225f2bba4d9533c12dd4e@ec2-34-203-164-221.compute-1.amazonaws.com:17129'
  }
end