Before do
  Capybara.reset_sessions!
end

After do |scenario|
  add_screenshot(scenario)

  if scenario.failed?
    add_screenshot_error
  end
end

def add_screenshot(scenario)
  time_now = Time.now.strftime("%y.%m.%d-%H:%M")
  name_scenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
  name_scenario = name_scenario.gsub(' ','_').downcase!
  screenshot = "reports/screenshots/#{name_scenario}-#{time_now}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Screenshot :)')
end

def add_screenshot_error
  time_now = Time.now.strftime("%y.%m.%d-%H:%M")
  label = 'error'
  name_scenario = scenario.failed?.gsub(/[^A-Za-z0-9]/, '')
  name_scenario = name_scenario.gsub(' ','_').downcase!
  screenshot = "reports/screenshots/#{label}-#{name_scenario}-#{time_now}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Screenshot :)')
end