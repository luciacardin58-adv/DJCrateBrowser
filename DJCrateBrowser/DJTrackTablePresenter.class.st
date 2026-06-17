"
Presents the track table with Title, Artist, Genre and BPM columns. Tracks are loaded from a playlist selection or added individually.
"
Class {
	#name : 'DJTrackTablePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table'
	],
	#category : 'DJCrateBrowser-Presenter',
	#package : 'DJCrateBrowser',
	#tag : 'Presenter'
}

{ #category : 'visiting' }
DJTrackTablePresenter >> acceptDrop: aTransfer [ 
    | newTracks |
    newTracks := aTransfer passenger collect: [ :fileRef |
        DJTrackModel on: nil path: fileRef ].
    newTracks do: [ :track | self addTrack: track ]
]

{ #category : 'adding' }
DJTrackTablePresenter >> addTrack: aDJTrackModel [ 
    table items: (table items copyWith: aDJTrackModel)
]

{ #category : 'adding' }
DJTrackTablePresenter >> addTracksForFiles: aCollectionOfFileReferences [ 
    | newTracks |
    newTracks := aCollectionOfFileReferences collect: [ :fileRef |
        DJTrackModel on: nil path: fileRef ].
    newTracks do: [ :track | self addTrack: track ].
]

{ #category : 'layout' }
DJTrackTablePresenter >> defaultLayout [ 
    ^ SpBoxLayout newTopToBottom
        add: table;
yourself

]

{ #category : 'initialization' }
DJTrackTablePresenter >> initializePresenters [

	table := self newTable.
	table
		addColumn:
			(SpStringTableColumn title: 'Title' evaluated: [ :t | t title ]);
		addColumn:
			(SpStringTableColumn title: 'Artist' evaluated: [ :t | t artist ]);
		addColumn:
			(SpStringTableColumn title: 'Genre' evaluated: [ :t | t genre ]);
		addColumn:
			(SpStringTableColumn title: 'BPM' evaluated: [ :t | t bpm ]);
		beResizable;
		dropEnabled: true;
		wantsDrop: [ :transfer | self wantsDrop: transfer ];
		acceptDrop: [ :transfer | self acceptDrop: transfer ]
]

{ #category : 'visiting' }
DJTrackTablePresenter >> isValidDrop: aCollectionOfFileReferences [ 
    "Accept the drop only if every dragged item is an audio file (not a directory)"
    ^ aCollectionOfFileReferences allSatisfy: [ :each |
        each isDirectory not and: [
            #('wav' 'aiff' 'aif') includes: each extension asLowercase ] ]
]

{ #category : 'showing' }
DJTrackTablePresenter >> showTracks: aCollection [ 
    table items: aCollection asOrderedCollection
]

{ #category : 'accessing' }
DJTrackTablePresenter >> tracks [ 
^ table items
]

{ #category : 'visiting' }
DJTrackTablePresenter >> wantsDrop: aTransfer [

^ self isValidDrop: aTransfer passenger
]
