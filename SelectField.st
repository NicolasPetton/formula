Field subclass: SelectField [
    | options optionLabelBlock |

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
		self options do: [:each |
		    select option 
			selected: self value = each;
			action: [self value: each;
			text: (self optionLabelBlock value: each)]]]]
    ]
]
