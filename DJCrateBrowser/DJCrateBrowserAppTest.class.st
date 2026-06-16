Class {
	#name : 'DJCrateBrowserAppTest',
	#superclass : 'TestCase',
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'tests' }
DJCrateBrowserAppTest >> testHasPlaylistManager [ 
    | app |
    app := DJCrateBrowserApp new.
    self assert: app playlistManager isNotNil.
]

{ #category : 'tests' }
DJCrateBrowserAppTest >> testPlaylistManagerIsCorrectClass [ 
    | app |
    app := DJCrateBrowserApp new.
    self assert: (app playlistManager isKindOf: DJPlaylistManager).
]
