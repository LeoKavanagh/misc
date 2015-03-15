import os
import subprocess


#Get all the files (and ignore the folders)
#in the current folder
allfiles = [f for f in os.listdir(os.curdir) if os.path.isfile(f)]

countSuccess = 0
countFailure = 0

#Only convert files ending in '.pdf'
for filename in [f for f in allfiles if f[-4:] == '.pdf']:
	
	print "filename is ", filename
	
	#Change file.pdf to file.txt
	output = filename.replace('.pdf', '.txt')
	#print "output is ", output
	
	#If filename.txt already exists in this directory,
	#let the new file be called filenameNew.txt
	while output in allfiles:
		output = output.replace('.txt', 'New.txt')
		#print "output changed to ", output
	
	#Run pdftotext on filename here, save as output.txt
	#Try catch doesn't catch anything but the script still handles errors fine.
	#that's a bug to be fixed

	try:
		x = subprocess.call(["pdftotext", filename, output])
		#print "return value is", x
		countSuccess += not x
		countFailure += x
	except (OSError, SyntaxError):
		print "exception"
	
print "Converted ", countSuccess,  "file(s) from pdf to txt"
print "Failed to convert", countFailure, "file(s) from pdf to txt"
