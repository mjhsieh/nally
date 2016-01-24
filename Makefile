# Mengjuei Hsieh, University of California Irvine

default:
	@echo Please read the Makefile to decide which rule to run

debug:
	xcodebuild -configuration Debug

all:
	xcodebuild

clean:
	xcodebuild clean;	\
	rm -fr build;		\
	rm -f Nally.xcodeproj/${USER}.*

install: all
	rm -r /Applications/Nally.app; mv build/Release/Nally.app /Applications/

test: all
	build/Release/Nally.app/Contents/MacOS/Nally

release: all
	python Scripts/package.py build/Release/Nally.app http://nally.googlecode.com/files
