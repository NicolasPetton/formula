Field subclass: SelectField [
    | multiple options optionLabelBlock |

    <category: 'Formula'>
    <comment: nil>

    optionLabelBlock [
	<category: 'accessing'>
	^optionLabelBlock ifNil: [self defaultOptionLabelBlock]
    ]

    optionLabelBlock: aBlock [
	<category: 'accessing'>
	optionOptionLabelBlock := aBlock
    ]

    multiple [
	<category: 'accessing'>
	^multiple ifNil: [false]
    ]

    multiple: aBoolean [
	<category: 'accessing'>
	multiple := aBoolean
    ]

    defaultOptionLabelBlock [
	<category: 'defaults'>
	^[:option | option printString]
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [{}]
    ]

    options: aCollection [
	<category: 'accessing'>
	options := aCollection
    ]

    options: aCollection labels: aBlock [
	<category: 'accessing'>
	self options: aCollection.
	self optionLabelBlock: aBlock
    ]

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e select build: [:select |
		self multiple ifTrue: [
		    select beMultiple].
		self options do: [:each |
		    select option 
			selected: self value = each;
			action: [self value: each;
			text: (self optionLabelBlock value: each)]]]]
    ]
]
