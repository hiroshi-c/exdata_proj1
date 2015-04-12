### Note about day of the week string
I tried several options to switch day of the week string as English
on my Japanese version of Windows OS.
Unfortunately, none of options works for it.
I could put ugly code like below or switch entire OS language.

However, I understand that the purpose of exploratory graph is
understanding the data but not the final presentation.
Therefore, I think Japanese axis string is enough for this project and I did not insert such ugly code to fix this issue.

	xlabels <- c(
		as.double(strptime("2007-02-01 00:00", format="%Y-%m-%d %H:%M")),
		as.double(strptime("2007-02-02 00:00", format="%Y-%m-%d %H:%M")),
		as.double(strptime("2007-02-03 00:00", format="%Y-%m-%d %H:%M")))
	axis(1, at=xlabels, labels=c("Thu", "Fri", "Sat"))
