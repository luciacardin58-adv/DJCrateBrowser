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
	#category : 'DJCrateBrowser-Presenter',
	#package : 'DJCrateBrowser',
	#tag : 'Presenter'
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

	presenter := DJCrateBrowserPresenter application: self.
	presenter open
]
