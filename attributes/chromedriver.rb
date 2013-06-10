default['selenium']['chromedriver']['directory']

case node["os"]
when "linux"
  default['selenium']['chromedriver']['directory'] = "/usr/local/bin"
  case node["kernel"]["machine"]
  when "x86_64"
    default["selenium"]["chromedriver"]["url"] = "https://chromedriver.googlecode.com/files/chromedriver_linux64_2.0.zip"
  else
    default["selenium"]["chromedriver"]["url"] = "https://chromedriver.googlecode.com/files/chromedriver_linux32_2.0.zip"
  end
when "windows"
  default['selenium']['chromedriver']['directory'] = 'C:\selenium'
  default["selenium"]["chromedriver"]["url"] = "https://chromedriver.googlecode.com/files/chromedriver_win32_2.0.zip"
end
