Before do
  Capybara.reset_sessions!
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
  if scenario.failed?
    add_screenshot(scenario_name.downcase!, 'failed')
  else
    add_screenshot(scenario_name.downcase!, 'passed')
  end
end

def add_screenshot(file_name, report)
    time_now = Time.now.strftime("%y.%m.%d-%H:%M")
    file_path = "reports/screenshot/test_#{report}"
    picture = "#{file_path}/#{file_name}-#{time_now}.png"
    page.save_screenshot(picture)
    embed(picture, 'image/png', 'screenshot')
end