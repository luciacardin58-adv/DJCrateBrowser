"
Left panel (playlists top + folders bottom)
"
Class {
	#name : 'DJLeftPanelPresenter',
	#superclass : 'Object',
	#instVars : [
		'playlistList',
		'folderTree',
		'onPlaylistSelectedBlock',
		'onFolderFileDroppedBlock'
	],
	#category : 'DJCrateBrowser-Presenter',
	#package : 'DJCrateBrowser',
	#tag : 'Presenter'
}

{ #category : 'properties' }
DJLeftPanelPresenter >> childrenOf: aNode [ 
    aNode isDirectory ifFalse: [ ^ #() ].
    ^ (aNode entries select: [ :e |
        e isDirectory or: [
            #('wav' 'aiff' 'aif') includes: e extension asLowercase ] ])
        asSortedCollection: [ :a :b | a basename < b basename ]
]

{ #category : 'initialization' }
DJLeftPanelPresenter >> connectPresenters [ 
    playlistList whenSelectionChangedDo: [ :sel |
        sel selectedItem ifNotNil: [ :pl |
            onPlaylistSelectedBlock ifNotNil: [ onPlaylistSelectedBlock value: pl ] ] ]
]

{ #category : 'layout' }
DJLeftPanelPresenter >> defaultLayout [ 
    ^ SpPanedLayout newTopToBottom
        positionOfSlider: 40;
        add: (SpBoxLayout newTopToBottom
            add: (self newLabel label: 'Playlists') expand: false;
            add: playlistList;
            yourself);
        add: (SpBoxLayout newTopToBottom
            add: (self newLabel label: 'Folders') expand: false;
            add: folderTree;
            yourself);
        yourself
]

{ #category : 'initialization' }
DJLeftPanelPresenter >> initializePresenters [

	playlistList := self newList.
	playlistList display: [ :pl | pl name ].
	 folderTree := self newTree.
    folderTree
        children: [ :node | self childrenOf: node ];
        display: [ :node | node basename ]
]

{ #category : 'API - loading' }
DJLeftPanelPresenter >> loadPlaylists: aCollection [
playlistList items: aCollection 
]

{ #category : 'accessing' }
DJLeftPanelPresenter >> onFolderFileDropped: aBlock [

	onFolderFileDroppedBlock := aBlock
]

{ #category : 'accessing' }
DJLeftPanelPresenter >> onPlaylistSelected: aBlock [ 
    onPlaylistSelectedBlock := aBlock
]

{ #category : 'API - loading' }
DJLeftPanelPresenter >> setRootFolder: aFileReference [
folderTree roots: {  aFileReference }
]
