Class {
	#name : 'DJLeftPanelTest',
	#superclass : 'TestCase',
	#category : 'DJCrateBrowser-Tests',
	#package : 'DJCrateBrowser',
	#tag : 'Tests'
}

{ #category : 'tests' }
DJLeftPanelTest >> testCanSetOnFolderFileDroppedBlock [ 
    | presenter |
    presenter := DJLeftPanelPresenter new.
    presenter onFolderFileDropped: [ :t | t ].
    self assert: true.
]

{ #category : 'tests' }
DJLeftPanelTest >> testCanSetOnPlaylistSelectedBlock [

	| presenter fired |
	presenter := DJLeftPanelPresenter new.
	fired := false.
	presenter onPlaylistSelected: [ :pl | fired := true ].
	self deny: fired 
]
