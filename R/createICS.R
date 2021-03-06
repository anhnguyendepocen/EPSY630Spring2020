library(stringr)

ics_header <- "BEGIN:VCALENDAR
VERSION:2.0
PRODID:http://www.example.com/calendarapplication/
CALSCALE:GREGORIAN
METHOD:PUBLISH"

ics_body <- "
BEGIN:VEVENT
DTSTART:20060912T060000Z
DTEND:20060912T070000Z
UID:461092315540@example.com
LOCATION:Somewhere
SUMMARY:new2
DESCRIPTION:Beschreibung des Termines
END:VEVENT"

ics_footer <- "
END:VCALENDAR"

# Input data.frame must have these columns:
# * `starttime`
# * `endtime`
# * `summary`
# * `description`
# * `location`

#' Create an ICS file from a data.frame
#' 
#' Adapted from https://github.com/cutterkom/convert-csv-to-ics-in-R
#' 
createICS <- function(df) {
	# ics_header <- readLines("ics_template/template_header.ics", warn = F)
	# ics_body <- readLines("ics_template/template_body.ics", warn = F)
	# ics_footer <- readLines("ics_template/template_footer.ics", warn = F)
	
	# iterate over events and insert events data
	ics_events <- ""
	
	for(i in 1:nrow(df)) {
		ics_body <- str_replace(ics_body, "SUMMARY:.*", paste0("SUMMARY:", df$summary[i]))
		ics_body <- str_replace(ics_body, "LOCATION:.*", paste0("LOCATION:", df$location[i]))
		ics_body <- str_replace(ics_body, "DESCRIPTION:.*", paste0("DESCRIPTION:", df$description[i]))
		ics_body <- str_replace(ics_body, "DTSTART:.*", paste0("DTSTART:", df$starttime[i]))
		ics_body <- str_replace(ics_body, "DTEND:.*", paste0("DTEND:", df$endtime[i]))
		# create unique identifier
		ics_body <- str_replace(ics_body, "UID:.*", paste0("UID:", paste0(df$starttime[i], df$endtime[i])))
		ics_events <- append(ics_events, ics_body)
	}
	
	# combine template parts to one vector
	ics_events <- append(ics_header, ics_events)
	ics_events <- append(ics_events, ics_footer)
	
	# write(ics_events, file = "output/events.ics")
	return(ics_events)
}

if(FALSE) {
	meetups$starttime <- as.POSIXct(paste0(meetups$Date, ' ', '4:15'))
	meetups$endtime <- as.POSIXct(paste0(meetups$Date, ' ', '7:05'))
	meetups$summary <- meetups$Topic
	meetups$description <- ''
	meetups$location <- 'University at Albany'
	
	ics <- createICS(meetups)
	cat(ics)
}
