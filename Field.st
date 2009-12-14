Iliad.ILWidget subclass: Field [
    | conditions errors key labelContents value action |

    <category: 'Formula'>
    <comment: 'nil'>

    Field class >> on: aSelector of: anObject [
	<category: 'instance creation'>
	^self new
	    on: aSelector
	    of: anObject;
	    yourself
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: aSymbol [
	<category: 'accessing'>
	key := aSymbol
    ]

    label: aString [
	<category: 'accessing'>
	self labelContents: [:e | e text: aString]
    ]

    labelContents: aBlock [
	<category: 'accessing'>
	labelContents := aBlock
    ]

    labelContents [
	<category: 'accessing'>
	^labelContents
    ]

    value [
	<category: 'accessing'>
	^value
    ]

    value: anObject [
	<category: 'accessing'>
	value := anObject
    ]

    errors [
	^errors ifNil: [{}]
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    addCondition: aCondition [
	<category: 'conditions'>
	self conditions add: aCondition
    ]

    addCondition: aBlock labelled: anotherBlock [
	<category: 'conditions'>
	self addCondition: (Condition new
	    conditionBlock: aBlock;
	    labelBlock: anotherBlock;
	    yourself)
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	self conditions do: [:each |
	    (each validate: self value) ifFalse: [
		self errors add: (each labelFor: self value)]].
	self markDirty
    ]

    commit [
	<category: 'actions'>
	self action value: self value
    ]

    contents [
	<category: 'building'>
	^[:table |
	    table tr build: [:tr |
		self isValid ifFalse: [
		    tr cssClass: 'error'].
		tr td 
		    build: self labelContents.
		tr td 
		    build: self fieldContents;
		    build: self errorsContents]]
    ]

    fieldContents [
	<category: 'building'>
	self subclassResponsibility
    ]

    errorsContents [
	<category: 'building'>
	^[:e |
	    self errors notEmpty ifTrue: [
		e div 
		    class: 'errors';
		    build: [:div |
			div text: self errors first]]]
    ]

    isValid [
	<category: 'testing'>
	^self errors isEmpty
    ]

    on: aSelector of: anObject [
	<category: 'private'>
	key ifNil: [key := aSelector].
	labelContents ifNil: [self label: aSelector asString].
	value := anObject perform: aSelector.
	action := [:val | 
	    anObject perform: (aSelector, ':') asSymbol with: val]
    ]
]
