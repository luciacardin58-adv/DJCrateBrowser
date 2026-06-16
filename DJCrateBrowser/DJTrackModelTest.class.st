Class {
	#name : 'DJTrackModelTest',
	#superclass : 'TestCase',
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'tests' }
DJTrackModelTest >> testArtistEmptyWhenNoFileInfo [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track artist equals: ''
]

{ #category : 'tests' }
DJTrackModelTest >> testBpmIsPlaceholderWhenUnknown [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track bpm equals: '--'
]

{ #category : 'tests' }
DJTrackModelTest >> testGenreEmptyWhenNoFileInfo [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track genre equals: ''
]

{ #category : 'tests' }
DJTrackModelTest >> testTitleFallsBackToFilename [ 
    "When no fileInfo, title returns the file basename"
    | track |
    track := DJTrackModel on: nil path: '/music/techno/phausto-TechnoTrack.wav' asFileReference.
    self assert: track title equals: 'phausto-TechnoTrack.wav'
]
