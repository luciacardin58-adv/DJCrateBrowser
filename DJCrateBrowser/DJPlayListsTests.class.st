Class {
	#name : 'DJPlayListsTests',
	#superclass : 'TestCase',
	#instVars : [
		'playlist'
	],
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'running' }
DJPlayListsTests >> setUp [

	super setUp.

	playlist := DJPlaylist named: 'TestSet'
]

{ #category : 'tests' }
DJPlayListsTests >> testAddTrack [ 
    | track |
    track := DJTrackModel on: nil path: '/music/track.wav' asFileReference.
    playlist addTrack: track.
    self assert: playlist tracks size equals: 1
]

{ #category : 'tests' }
DJPlayListsTests >> testNewPlaylistIsEmpty [ 
    self assert: playlist tracks isEmpty
]

{ #category : 'tests' }
DJPlayListsTests >> testPlaylistHasName [ 
    self assert: playlist name equals: 'TestSet'
]

{ #category : 'tests' }
DJPlayListsTests >> testSaveAndReload [ 
    "Save a playlist with one track, reload it, check track path survives round-trip"
    | track tempFile reloaded |
    track := DJTrackModel on: nil path: '/music/house/track.wav' asFileReference.
    playlist addTrack: track.
 
    tempFile := FileLocator temp asFileReference / 'test-playlist.m3u'.
    playlist saveTo: tempFile.
 
    reloaded := DJPlaylist fromFile: tempFile.
    self assert: reloaded name equals: 'test-playlist'.
    self assert: reloaded tracks size equals: 1.
    self assert: reloaded tracks first filePath fullName equals: '/music/house/track.wav'.
 
    tempFile ensureDelete.
]

{ #category : 'tests' }
DJPlayListsTests >> testSaveProducesM3UHeader [ 
    | tempFile content |
    tempFile := FileLocator temp asFileReference / 'header-test.m3u'.
    playlist saveTo: tempFile.
    content := tempFile readStream contents.
    self assert: (content includesSubstring: '#EXTM3U').
    tempFile ensureDelete.
]
