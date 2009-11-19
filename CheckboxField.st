Field subclass: CheckboxField [

    <category: 'Odyssey-Iliad-Formula'>
    <comment: 'nil'>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e checkbox
		checked: self value;
		action: [:boolean | self value: boolean]]
    ]
]
