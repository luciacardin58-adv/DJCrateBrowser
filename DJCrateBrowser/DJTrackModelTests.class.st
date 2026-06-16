Class {
	#name : 'DJTrackModelTests',
	#superclass : 'TestCase',
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'tests' }
DJTrackModelTests >> testArtistEmptyWhenNoFileInfo [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track artist equals: ''
]

{ #category : 'tests' }
DJTrackModelTests >> testBpmIsPlaceholderWhenUnknown [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track bpm equals: '--'
]

{ #category : 'tests' }
DJTrackModelTests >> testGenreEmptyWhenNoFileInfo [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    self assert: track genre equals: ''
]

{ #category : 'tests' }
DJTrackModelTests >> testTitleFallsBackToFilename [ 
    "When no fileInfo, title returns the file basename"
    | track |
    track := DJTrackModel on: nil path: '/music/techno/phausto-TechnoTrack.wav' asFileReference.
    self assert: track title equals: 'phausto-TechnoTrack.wav'
]
