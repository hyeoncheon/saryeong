# vim: set ts=2 sw=2 expandtab:
class AppLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    "#{timestamp.to_formatted_s(:db)} [#{severity}] #{msg}\n"
  end
end

LOGGER = AppLogger.new('log/application.log', 'daily')
