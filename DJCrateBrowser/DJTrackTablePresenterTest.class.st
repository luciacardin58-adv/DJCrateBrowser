Class {
	#name : 'DJTrackTablePresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'running' }
DJTrackTablePresenterTest >> setUp [
	super setUp.

	 presenter := DJTrackTablePresenter new.
]

{ #category : 'tests' }
DJTrackTablePresenterTest >> testAddTrack [ 
    | track |
    track := DJTrackModel on: nil path: '/music/b.aiff' asFileReference.
    presenter addTrack: track.
    self assert: presenter tracks size equals: 1.
]

{ #category : 'tests' }
DJTrackTablePresenterTest >> testInitiallyEmpty [ 
    self assert: presenter tracks isEmpty
]

{ #category : 'tests' }
DJTrackTablePresenterTest >> testShowTracks [ 
    | tracks |
    tracks := OrderedCollection with:
        (DJTrackModel on: nil path: '/music/a.wav' asFileReference).
    presenter showTracks: tracks.
    self assert: presenter tracks size equals: 1.
]
