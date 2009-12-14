Iliad.ILWidget subclass: Formula [
    | model fields |
	
    <category: 'Formula'>
    <comment: nil>

    Formula class >> on: anObject [
	<category: 'instance creation'>
	^self new
	    setModel: anObject;
	    yourself
    ]

    fields [
	<category: 'accessing'>
	^fields ifNil: [fields := OrderedCollection new]
    ]

    addField: aField [
	<category: 'adding'>
	self fields add: aField
    ]

    inputOn: aSelector [
	<category: 'adding'>
	^self addField: (InputField on: aSelector of: model)
    ]

    checkboxOn: aSelector [
	<category: 'adding'>
	^self addField: (CheckboxField on: aSelector of: model)
    ]

    passwordOn: aSelector [
	<category: 'adding'>
	^self addField: (PasswordField on: aSelector of: model)
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e table tbody build: self tableContents]
    ]

    tableContents [
	<category: 'building'>
	^[:tbody |
	    self fields do: [:each |
		tbody build: each contents]]
    ]

    save [
	<category: 'actions'>
	self validate.
	self isValid ifTrue: [
	    self commit]
    ]

    commit [
	<category: 'actions'>
	self fields do: [:each |
	    each commit]
    ]

    validate [
	<category: 'actions'>
	self fields do: [:each | each validate]
    ]

    isValid [
	<category: 'testing'>
	self fields do: [:each |
	    each isValid ifFalse: [^false]].
	^true
    ]

    setModel: anObject [
	<category: 'private'>
	model := anObject
    ]
]
