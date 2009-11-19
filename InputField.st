Field subclass: InputField [

    <category: 'Odyssey-Iliad-Formula'>
    <comment: 'nil'>

    fieldContents [
	<category: 'building'>
	^[:e | 
	    e input
		value: self value;
		action: [:val | self value: val]]
    ]
]
