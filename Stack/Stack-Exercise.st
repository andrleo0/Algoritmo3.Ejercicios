!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'SB 10/14/2022 15:01:24'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'SB 10/14/2022 15:01:33'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'SB 10/14/2022 15:01:43'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'winterIsHere winterIsEverything theWindsOfWinter winterIsHereUpper winterIsNotHere'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'SB 10/14/2022 15:53:57'!
setUp

	winterIsHere := 'winter is coming'.
	winterIsEverything := 'winning is everything'.
	theWindsOfWinter := 'The winds of Winter'.
	winterIsHereUpper := 'Winter is here'.
	winterIsNotHere := 'winter is not coming'! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 10/27/2022 20:34:10'!
test01StackAfterUseFindShouldBeTheSame

	| stack foundSentences searcher|
	stack := OOStack new.
	stack push: 'calor que calor'.
	stack push: 'pelear en el lodo'.
	stack push: 'el dolor es de adultos'.
	stack push: 'amar es de joven'.
	searcher := SentenceFinderByPrefix with: 'ca' on: stack. 
	foundSentences := searcher find.
	self assert: (stack pop = 'amar es de joven' and:[stack pop = 'el dolor es de adultos'] 
	and:[stack pop = 'pelear en el lodo'] and:[stack pop = 'calor que calor']). 
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 10/27/2022 20:39:28'!
test02SearcherFindTheOnlySentenceAtStack

	| stack foundSentences searcher |
	stack := OOStack new.
	stack push: 'calor que calor'.
	searcher := SentenceFinderByPrefix with: 'ca'  on: stack. 
	foundSentences := searcher find.
	self assert: (foundSentences includes: 'calor que calor') 
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 10/27/2022 20:44:26'!
test03SearcherWontFindTheOnlySentenceAtStack

	| stack sentenceDictionary searcher |
	stack := OOStack new.
	stack push: 'calor que calor'.
	searcher := SentenceFinderByPrefix with: 'se' on: stack. 
	sentenceDictionary := searcher find.
	self assert: (sentenceDictionary isEmpty) 
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 10/27/2022 20:45:06'!
test04SearcherIsCaseSensitive

	| stack sentenceDictionary searcher|
	stack := OOStack new.
	stack push: winterIsHere.
	stack push: 	winterIsEverything.
	stack push: winterIsHereUpper.
	searcher := SentenceFinderByPrefix with: 'Wint'  on: stack. 
	sentenceDictionary := searcher find.
	self assert: (sentenceDictionary includes: winterIsHereUpper ) ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'AG 10/27/2022 20:47:46'!
test08SearcherFindAllTheSentencesAtStack

	| stack sentenceDictionary searcher |
	stack := OOStack new.
	stack push: winterIsHere.
	stack push: winterIsNotHere.
	stack push: winterIsHereUpper.
	searcher := SentenceFinderByPrefix with: 'wint'  on: stack. 
	sentenceDictionary := searcher find.
	self assert: ((sentenceDictionary includes: winterIsHere) and: [sentenceDictionary includes: winterIsNotHere]).! !


!SentenceFinderByPrefixTest methodsFor: 'error test' stamp: 'AG 10/27/2022 20:45:56'!
test05SearcherWontFindIfNotAPrefix

	| stack lista buscador|
	stack := OOStack new.
	stack push: winterIsHere.
	stack push: 	winterIsEverything.
	stack push: theWindsOfWinter.
	buscador := SentenceFinderByPrefix with: 'Wint'  on: stack. 
	lista := buscador find.
	self assert: (lista isEmpty ) ! !

!SentenceFinderByPrefixTest methodsFor: 'error test' stamp: 'AG 10/27/2022 20:52:14'!
test06PrefixShouldNotBeEmpty

	| stack |
	stack := OOStack new.
	self
		should: [ SentenceFinderByPrefix with: '' on: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'error test' stamp: 'AG 10/27/2022 20:52:46'!
test07PrefixShouldNotContainEmptySpaces

	| stack |
	stack := OOStack new.
	self
		should: [ SentenceFinderByPrefix with: 'hola mundo' on: stack.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixContainsEmptySpaceErrorDescription equals: anError messageText ]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:47:49'!
isEmpty

	^contents isEmpty.! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:48:17'!
isNotEmpty

	^self isEmpty not.! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:48:51'!
pop

	| stackTop |
	stackTop := self top.
	contents removeLast.
	^stackTop.
	 ! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:55:47'!
push: aSentence
	
	^contents add: aSentence.! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:56:18'!
size
	
	^contents size. ! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:49:10'!
top
	
	^self state top.! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 19:07:35'!
topStackIsEmpty
	
	^self class error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations' stamp: 'AG 10/27/2022 18:47:29'!
topStackIsNotEmpty
	
	^ contents last.! !


!OOStack methodsFor: 'initialization' stamp: 'AG 10/27/2022 18:47:37'!
initialize
	
	contents := OrderedCollection new.! !


!OOStack methodsFor: 'private' stamp: 'AG 10/27/2022 18:50:19'!
state

	^OOStackState stateFor: self.  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'inspecting' stamp: 'AG 10/27/2022 19:09:27'!
top

	self subclassResponsibility. ! !


!OOStackState methodsFor: 'initialize' stamp: 'AG 10/27/2022 18:58:02'!
initializeFor: aStack

	stack := aStack. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'initialization' stamp: 'AG 10/27/2022 19:03:49'!
for: aStack 
	
	^self new initializeFor: aStack ! !


!OOStackState class methodsFor: 'instance creation' stamp: 'AG 10/27/2022 18:52:52'!
canHandle: aStack

	self subclassResponsibility. ! !

!OOStackState class methodsFor: 'instance creation' stamp: 'AG 10/27/2022 18:52:16'!
stateFor: aStack

	^(self subclasses detect:[:aStackStateClass | aStackStateClass canHandle: aStack] )for: aStack. ! !


!classDefinition: #OOEmptyStackState category: 'Stack-Exercise'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackState methodsFor: 'inspecting' stamp: 'AG 10/27/2022 18:46:39'!
top

	^stack topStackIsEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackState class' category: 'Stack-Exercise'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'instance creation' stamp: 'AG 10/27/2022 18:54:07'!
canHandle: aStack

	^aStack isEmpty.! !


!classDefinition: #OONotEmptyStackState category: 'Stack-Exercise'!
OOStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmptyStackState methodsFor: 'inspecting' stamp: 'AG 10/27/2022 18:45:13'!
top
	
	^ stack topStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyStackState class' category: 'Stack-Exercise'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'instance creation' stamp: 'AG 10/27/2022 18:54:29'!
canHandle: aStack
	
	^aStack isNotEmpty. ! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'selectedSentenses prefix stack stackSize auxiliarReverseStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'AG 10/27/2022 20:14:13'!
find
	
	selectedSentenses := OrderedCollection new.
	
	auxiliarReverseStack := OOStack new.
	
	self findAllSentencesbyPrefixInStack.
	
	self rebulidOriginalStack.
	
	^selectedSentenses. ! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'AG 10/27/2022 20:11:21'!
initializeWith: aPrefix on: aStack

	prefix := aPrefix.
	stack := aStack. 
	stackSize := stack size.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AG 10/27/2022 20:28:03'!
addToFoudSentenceIfPrefix: sentenceExtract

	(sentenceExtract beginsWith: prefix) ifTrue: [selectedSentenses add: sentenceExtract]. ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AG 10/27/2022 20:28:36'!
findASentencesbyPrefixOnTopOfStack
			
	| sentenceExtract |
	sentenceExtract := stack pop.
	self addToFoudSentenceIfPrefix: sentenceExtract.
	auxiliarReverseStack push: sentenceExtract.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AG 10/27/2022 20:18:54'!
findAllSentencesbyPrefixInStack

	stackSize timesRepeat: [self findASentencesbyPrefixOnTopOfStack ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AG 10/27/2022 20:30:37'!
pushSentencesToOriginalStack

	stack push: auxiliarReverseStack pop. ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AG 10/27/2022 20:29:42'!
rebulidOriginalStack

	stackSize timesRepeat: [self pushSentencesToOriginalStack].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: 'prefix stack'!

!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'AG 10/27/2022 20:37:37'!
with: aPrefix on: aStack
		
	self assertAPrefixNotEmpty: aPrefix.
	self assertAPrefixWithoutSpaces: aPrefix.
	
	^self new initializeWith: aPrefix on: aStack. 
	 
! !


!SentenceFinderByPrefix class methodsFor: 'errors descriptions' stamp: 'SB 10/14/2022 15:41:54'!
prefixContainsEmptySpaceErrorDescription
	
	^ 'Prefix contains an empty space'! !

!SentenceFinderByPrefix class methodsFor: 'errors descriptions' stamp: 'SB 10/14/2022 15:22:48'!
prefixEmptyErrorDescription
	
	^ 'Prefix is empty'! !


!SentenceFinderByPrefix class methodsFor: 'verifications' stamp: 'AG 10/27/2022 20:50:19'!
assertAPrefixNotEmpty: aPrefix

	(aPrefix isEmpty) ifTrue: [ self error: self prefixEmptyErrorDescription ].! !

!SentenceFinderByPrefix class methodsFor: 'verifications' stamp: 'AG 10/27/2022 20:55:45'!
assertAPrefixWithoutSpaces: aPrefix

	(aPrefix findString: ' ') asNumber isZero ifFalse: [ self error: self prefixContainsEmptySpaceErrorDescription ].! !
