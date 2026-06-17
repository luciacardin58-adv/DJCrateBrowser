Class {
	#name : 'DJTrackTablePresenterDropTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'tempFolder'
	],
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> > testAddTracksForFilesAppendsNotReplaces [ 
    | wavFile aiffFile |
    wavFile := self createFileNamed: 'one.wav'.
    aiffFile := self createFileNamed: 'two.aiff'.
    presenter addTracksForFiles: { wavFile }.
    presenter addTracksForFiles: { aiffFile }.
    self assert: presenter tracks size equals: 2.
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> createFileNamed: aString [ 
    | file |
    file := tempFolder / aString.
    file writeStreamDo: [ :s | s nextPutAll: 'fake' ].
    ^ file
]

{ #category : 'running' }
DJTrackTablePresenterDropTest >> setUp [
	super setUp.


    presenter := DJTrackTablePresenter new.
    tempFolder := (FileLocator temp asFileReference / 'DJDropTest') asFileReference.
    tempFolder ensureCreateDirectory.
]

{ #category : 'running' }
DJTrackTablePresenterDropTest >> tearDown [ 
    tempFolder deleteAll.
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testAddTracksForFilesAddsToTable [ 
    | wavFile |
    wavFile := self createFileNamed: 'track.wav'.
    presenter addTracksForFiles: { wavFile }.
    self assert: presenter tracks size equals: 1.
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testAddTracksForFilesCreatesCorrectModel [ 
    | wavFile track |
    wavFile := self createFileNamed: 'mytrack.wav'.
    presenter addTracksForFiles: { wavFile }.
    track := presenter tracks first.
    self assert: track title equals: 'mytrack.wav'.
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testValidDropAcceptsAiff [ 
    | aiffFile |
    aiffFile := self createFileNamed: 'track.aiff'.
    self assert: (presenter isValidDrop: { aiffFile }).
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testValidDropAcceptsMultipleAudioFiles [ 
    | wavFile aiffFile |
    wavFile := self createFileNamed: 'one.wav'.
    aiffFile := self createFileNamed: 'two.aiff'.
    self assert: (presenter isValidDrop: { wavFile . aiffFile }).
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testValidDropAcceptsWav [ 
    | wavFile |
    wavFile := self createFileNamed: 'track.wav'.
    self assert: (presenter isValidDrop: { wavFile }).
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testValidDropRejectsDirectory [ 
    self deny: (presenter isValidDrop: { tempFolder }).
]

{ #category : 'as yet unclassified' }
DJTrackTablePresenterDropTest >> testValidDropRejectsOtherExtensions [ 
    | mp3File |
    mp3File := self createFileNamed: 'track.mp3'.
    self deny: (presenter isValidDrop: { mp3File }).
]
