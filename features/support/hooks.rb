After do |scenario|
    if(scenario.failed?)
      timeNow = Time.now.strftime("%y.%m.%d-%H:%M")
        page.driver.browser.save_screenshot("reports/ERROR-#{scenario.title}--#{timeNow}.png")
        embed("reports/ERROR-#{scenario.title}--#{timeNow}.png", "image/png", "SCREENSHOT - ERROR-#{scenario.title}--#{timeNow}.png")
    end
    Capybara.reset_sessions!
  end