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
	#category : 'DJCrateBrowser-Models',
	#package : 'DJCrateBrowser',
	#tag : 'Models'
}

{ #category : 'initialization' }
DJTrackModel class >> on: aFileInfo path: aPath [
^ self new initWith: aFileInfo path: aPath 
]

{ #category : 'accessing' }
DJTrackModel >> artist [

	^ self hasMetadata
		  ifTrue: [ fileInfo artist ]
		  ifFalse: [ '' ]
]

{ #category : 'accessing' }
DJTrackModel >> bpm [ 
"BPM not calculated yet - return placeholder"
^ '--'
]

{ #category : 'accessing' }
DJTrackModel >> fileInfp [

^ fileInfo 
]

{ #category : 'accessing' }
DJTrackModel >> filePath [ 

^ filePath 
]

{ #category : 'accessing' }
DJTrackModel >> genre [ 
^ self hasMetadata 
ifTrue: [  fileInfo genre  ]
ifFalse: [ '' ]
]

{ #category : 'testing' }
DJTrackModel >> hasMetadata [ 

^ (fileInfo notNil and: [ fileInfo title notNil ])
]

{ #category : 'instance creation' }
DJTrackModel >> initWith: aFileInfo path: aPath [

fileInfo := aFileInfo .
filePath := aPath 
]

{ #category : 'accessing' }
DJTrackModel >> title [

	^ self hasMetadata 
		  ifTrue: [ fileInfo title ]
		  ifFalse: [ filePath basename ]
]
