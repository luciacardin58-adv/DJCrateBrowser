Class {
	#name : 'DJPlayListsManagerTests',
	#superclass : 'TestCase',
	#instVars : [
		'manager',
		'tempFolder'
	],
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'running' }
DJPlayListsManagerTests >> setUp [

	super setUp.

	"Use a temp folder so we don't pollute ~/Documents"
	tempFolder := (FileLocator temp asFileReference
	               / 'DJCrateBrowserTest') asFileReference.
	tempFolder ensureCreateDirectory.
	manager := DJPlaylistManager new.
	manager playlistsFolder: tempFolder
]

{ #category : 'running' }
DJPlayListsManagerTests >> tearDown [ 
    tempFolder deleteAll.
]

{ #category : 'tests' }
DJPlayListsManagerTests >> testAvailablePlaylistsAfterCreate [ 
    manager createPlaylistNamed: 'WarmUp'.
    manager createPlaylistNamed: 'MainSet'.
    self assert: manager availablePlaylists size equals: 2.
]

{ #category : 'tests' }
DJPlayListsManagerTests >> testCreatePlaylist [ 
    | pl |
    pl := manager createPlaylistNamed: 'DiscoNight'.
    self assert: pl name equals: 'DiscoNight'.
    self assert: (tempFolder / 'DiscoNight.m3u') exists.
]

{ #category : 'tests' }
DJPlayListsManagerTests >> testFolderIsCreatedOnInit [ 
    self assert: tempFolder exists
]

{ #category : 'tests' }
DJPlayListsManagerTests >> testNoPlaylistsInitially [ 
    self assert: manager availablePlaylists isEmpty
]
