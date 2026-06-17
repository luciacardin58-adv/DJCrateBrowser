"
""Entry point for DJCrateBrowser. Manages the playlist manager and opens the main window
"
Class {
	#name : 'DJCrateBrowserApp',
	#superclass : 'SpApplication',
	#instVars : [
		'playlistManager',
		'presenter'
	],
	#category : 'DJCrateBrowser-Application',
	#package : 'DJCrateBrowser',
	#tag : 'Application'
}

{ #category : 'accessing' }
DJCrateBrowserApp class >> start [ 
^ self new run
]

{ #category : 'initialization' }
DJCrateBrowserApp >> initialize [ 
super initialize.
playlistManager := DJPlaylistManager default 
]

{ #category : 'accessing' }
DJCrateBrowserApp >> playlistManager [ 

^ playlistManager 
]

{ #category : 'running' }
DJCrateBrowserApp >> run [

	presenter := DJCrateBrowserPresenter new application: self.
	presenter open
]
