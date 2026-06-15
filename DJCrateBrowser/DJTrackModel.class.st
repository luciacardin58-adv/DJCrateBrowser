"
Domain model for a single track in the browser. Wraps a DJAudioFileInfo and its file path, providing display values for title, artist, genre and BPM. When no metadata is available, title falls back to the filename and BPM returns
"
Class {
	#name : 'DJTrackModel',
	#superclass : 'Object',
	#instVars : [
		'filePath',
		'fileInfo'
	],
	#category : 'DJCrateBrowser',
	#package : 'DJCrateBrowser'
}

{ #category : 'initialization' }
DJTrackModel class >> on: aFileInfo path: aPath [
^ self new initWith: aFileInfo path: aPath 
]

{ #category : 'initialization' }
DJTrackModel >> initWith: aFileInfo path: aPath [

fileInfo := aFileInfo .
filePath := aPath 
]
