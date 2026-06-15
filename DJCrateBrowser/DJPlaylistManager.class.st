"
Responsible for locating, creating and listing DJPlaylist instances on disk. On initialisation ensures ~/Documents/PharoDJCrate/Playlists/ exists. Acts as the single access point between the UI and the playlist file system.
"
Class {
	#name : 'DJPlaylistManager',
	#superclass : 'Object',
	#instVars : [
		'playlistsFolder'
	],
	#category : 'DJCrateBrowser-Playlist',
	#package : 'DJCrateBrowser',
	#tag : 'Playlist'
}

{ #category : 'accessing' }
DJPlaylistManager class >> default [ 
^ self new init.
]

{ #category : 'accessing' }
DJPlaylistManager >> availablePlaylists [ 
    ^ (playlistsFolder filesMatching: '*.m3u')
        collect: [ :f | DJPlaylist fromFile: f ]
]

{ #category : 'file in/out' }
DJPlaylistManager >> createPlaylistNamed: aString [ 
    | file playlist |
    file := playlistsFolder / (aString , '.m3u').
    playlist := DJPlaylist named: aString.
    playlist saveTo: file.
    ^ playlist
]

{ #category : 'initialization' }
DJPlaylistManager >> initialize [ 

  playlistsFolder := (FileLocator home / 'Documents' / 'PharoDJCrate' / 'Playlists') asFileReference.
    playlistsFolder ensureCreateDirectory.
]

{ #category : 'accessing' }
DJPlaylistManager >> playlistsFolder [ 
^ playlistsFolder 
]
