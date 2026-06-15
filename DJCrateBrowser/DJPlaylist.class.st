"
An ordered collection of tracks saved and loaded as M3U files.
"
Class {
	#name : 'DJPlaylist',
	#superclass : 'Object',
	#instVars : [
		'name',
		'tracks'
	],
	#category : 'DJCrateBrowser-Playlist',
	#package : 'DJCrateBrowser',
	#tag : 'Playlist'
}

{ #category : 'instance creation' }
DJPlaylist class >> fromFile: aFileReference [ 
    | playlist lines |
    playlist := self named: aFileReference basenameWithoutExtension.
    lines := aFileReference readStream contents lines.
    lines do: [ :line |
        (line isEmpty or: [ line startsWith: '#' ]) ifFalse: [
            | ref |
            ref := line asFileReference.
            playlist addTrack: (DJTrackModel on: nil path: ref) ] ].
    ^ playlist
]

{ #category : 'instance creation' }
DJPlaylist class >> named: aString [
| pl |
	
	pl :=  self new.
	pl setName: aString. 
	^ pl
]

{ #category : 'adding' }
DJPlaylist >> addTrack: aDJTrackModel [

tracks add: aDJTrackModel 
]

{ #category : 'initialization' }
DJPlaylist >> initialize [
   super initialize .
	tracks := OrderedCollection new
]

{ #category : 'accessing' }
DJPlaylist >> name [ 
^ name

]

{ #category : 'fileout' }
DJPlaylist >> saveTo: aFileReference [

	aFileReference writeStreamDo: [ :stream |
			stream
				nextPutAll: '#EXTM3U';
				cr.
			tracks do: [ :track |
					stream
						nextPutAll: '#EXTINF:0,';
						nextPutAll: track artist;
						nextPutAll: ' - ';
						nextPutAll: track title;
						cr;
						nextPutAll: track filePath fullName;
						cr ] ]
]

{ #category : 'accessing' }
DJPlaylist >> tracks [ 

^ tracks
]
