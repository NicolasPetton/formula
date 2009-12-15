Field subclass: CheckboxField [

    <category: 'Formula'>
    <comment: nil>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e checkbox
		checked: self value ifNil: [false];
		action: [:boolean | self value: boolean]]
    ]
]
