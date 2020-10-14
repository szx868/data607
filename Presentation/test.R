library(RSelenium)
library(tidyverse)

cprof <- list(chromeOptions = 
                list(extensions = 
                       list(base64enc::base64encode("VPN_PROXY_MASTER.crx"))
                ))


rD <- rsDriver(port = 4449L,extraCapabilities=cprof, browser ="chrome",chromever = "latest")
remDr <- rD[["client"]]
remDr$setTimeout(type = 'page load', milliseconds = 120000)
remDr$setTimeout(type = 'implicit', milliseconds = 120000)
remDr$navigate("chrome-extension://lnfdmdhmfbimhhpaeocncdlhiodoblbd/popup/popup.html")

remDr$close()
rD$server$stop()
rm(rD, remDr)
gc()
system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)