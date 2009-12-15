Field subclass: InputField [

    <category: 'Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e input
		value: (self value ifNil: ['']);
		action: [:val | self value: val]]
    ]
]
