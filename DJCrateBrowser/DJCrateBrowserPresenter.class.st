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
	#category : 'DJCrateBrowser-Application',
	#package : 'DJCrateBrowser',
	#tag : 'Application'
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
        positionOfSlider: 25;
        add: leftPanel;
        add: trackTable;
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
