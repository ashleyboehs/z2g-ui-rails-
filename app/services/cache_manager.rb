require 'fileutils'
require 'json'

class CacheManager
    CACHE_EXPIRY = 3600
    CACHE_DIR = Rails.root.join('cache')

  @@zenhub_cache = {}
  @@github_cache = {}

  def self.save_caches
      FileUtils.mkdir_p(CACHE_DIR)
    File.write(File.join(CACHE_DIR, 'zenhub_cache.json'), JSON.pretty_generate(@@zenhub_cache))
    File.write(File.join(CACHE_DIR, 'github_cache.json'), JSON.pretty_generate(@@github_cache))
    Rails.logger.info "Saved caches to #{CACHE_DIR}/"
  end

  def self.load_caches
      return unless File.directory?(CACHE_DIR)

    zenhub_cache_file = File.join(CACHE_DIR, 'zenhub_cache.json')
    github_cache_file = File.join(CACHE_DIR, 'github_cache.json')

    if File.exist?(zenhub_cache_file)
      @@zenhub_cache = JS
ON.parse(File.read(zenhub_cache_file), symbolize_names: true)
      Rails.logger.info "Loaded ZenHub cache from #{zenhub_cache_file}"
    end

    if File.exist?(github_cache_file)
      @@github_cache = JSON.parse(File.read(github_cache_file), symbolize_names: true)
      Rails.logger.info "Loaded GitHub cache from #{github_cache_file}"
    end
  end
end
