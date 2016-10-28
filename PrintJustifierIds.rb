def PrintJustifierIds(justifierLink = nil)
	begin
		require 'watir-webdriver'
		# Chrome driver
		Selenium::WebDriver::Chrome.driver_path = File.expand_path('C:/Tellus/bin/Drivers/ChromeDriver/chromedriver.exe')
		
		driver = Watir::Browser.new :chrome
		driver.goto(justifierLink)
		sleep 10
		xpathForNameField = "//*[contains(@class,'testplan') and contains(@class,'Unchecked')]"
		elementsArray = driver.elements(:xpath => xpathForNameField)
		
		namesFieldArray = Array.new
		file = File.open("JustifierIDs.txt", 'w')
		elementsArray.each{ |ele|
		    t = ele.attribute_value("name")
			namesFieldArray.push(t)
		}		
		file.write(namesFieldArray.uniq.join("\n"))
		
	rescue Exception => e
	  puts e
	  puts "Exception occured"
	ensure
		driver.quit
	end




end
PrintJustifierIds("http://is.factset.com/justifier#24485?statusIds=0&automated=true&groupBy=default")