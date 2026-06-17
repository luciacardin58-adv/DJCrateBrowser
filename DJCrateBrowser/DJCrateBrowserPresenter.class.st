"
Top-level presenter of the DJCrateBrowser application. Arranges a DJLeftPanelPresenter (playlists and folder tree) and a DJTrackTablePresenter (track table) side by side using a horizontal SpPanedLayout. Coordinates communication between the two panels.
"
Class {
	#name : 'DJCrateBrowserPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'leftPanel',
		'trackTable'
	],
	#category : 'DJCrateBrowser-Presenter',
	#package : 'DJCrateBrowser',
	#tag : 'Presenter'
}

{ #category : 'initialization' }
DJCrateBrowserPresenter >> connectPresenters [ 
    leftPanel onPlaylistSelected: [ :playlist |
        trackTable showTracks: playlist tracks ].
    leftPanel onFolderFileDropped: [ :trackModel |
        trackTable addTrack: trackModel ]
]

{ #category : 'layout' }
DJCrateBrowserPresenter >> defaultLayout [

	
	^ SpPanedLayout newLeftToRight
		  add: leftPanel;
		  add: trackTable;
		  positionOfSlider: 200;
		  yourself
]

{ #category : 'initialization' }
DJCrateBrowserPresenter >> initializePresenters [ 
    leftPanel  := self instantiate: DJLeftPanelPresenter.
    trackTable := self instantiate: DJTrackTablePresenter.
]

{ #category : 'initialization' }
DJCrateBrowserPresenter >> initializeWindow: aWindow [ 
    aWindow
        title: 'DJCrateBrowser';
        initialExtent: 900 @ 600.
]

{ #category : 'accessing' }
DJCrateBrowserPresenter >> leftPanel [ 

^ leftPanel 
]
