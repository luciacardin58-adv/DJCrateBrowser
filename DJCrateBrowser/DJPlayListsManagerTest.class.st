Class {
	#name : 'DJPlayListsManagerTest',
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
DJPlayListsManagerTest >> setUp [

	super setUp.

	"Use a temp folder so we don't pollute ~/Documents"
	tempFolder := (FileLocator temp asFileReference
	               / 'DJCrateBrowserTest') asFileReference.
	tempFolder ensureCreateDirectory.
	manager := DJPlaylistManager new.
	manager playlistsFolder: tempFolder
]

{ #category : 'running' }
DJPlayListsManagerTest >> tearDown [ 
    tempFolder deleteAll.
]

{ #category : 'tests' }
DJPlayListsManagerTest >> testAvailablePlaylistsAfterCreate [ 
    manager createPlaylistNamed: 'WarmUp'.
    manager createPlaylistNamed: 'MainSet'.
    self assert: manager availablePlaylists size equals: 2.
]

{ #category : 'tests' }
DJPlayListsManagerTest >> testCreatePlaylist [ 
    | pl |
    pl := manager createPlaylistNamed: 'DiscoNight'.
    self assert: pl name equals: 'DiscoNight'.
    self assert: (tempFolder / 'DiscoNight.m3u') exists.
]

{ #category : 'tests' }
DJPlayListsManagerTest >> testFolderIsCreatedOnInit [ 
    self assert: tempFolder exists
]

{ #category : 'tests' }
DJPlayListsManagerTest >> testNoPlaylistsInitially [ 
    self assert: manager availablePlaylists isEmpty
]
