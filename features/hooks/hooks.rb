# frozen_string_literal: true

require 'report_builder'
require 'date'

today_date = DateTime.now
@current_date = today_date.to_s.tr(':', '-')

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = "log/report_#{@current_date}"
    config.report_types = [:html]
    config.report_title = 'AME QA Challenge - REST API'
    config.compress_image = true
    config.additional_info = { 'App': 'Web', 'Execution Date': @current_date }
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
