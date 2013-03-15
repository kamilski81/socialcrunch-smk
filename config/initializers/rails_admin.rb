RailsAdmin.config do |config|
  config.authenticate_with do
    begin
      authenticate_or_request_with_http_basic do |username, password|
        username == 'scrunch' && password == 'scrunch.123'
      end
    rescue => err
      logger.error("RailsAdmin exception was thrown #{err.backtrace.join("\n\t")}")
      throw(:warden)
    end
  end

  config.excluded_models = ['Response']
end