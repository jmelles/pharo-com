Class {
	#name : #BaselineOfPharoWin32,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPharoWin32'
}

{ #category : #baselines }
BaselineOfPharoWin32 >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec
		   package: #'VTable-FFI-Extension'; 
			package: #'PharoWin32' with: [ spec requires: #('VTable-FFI-Extension') ];
			package: #'PharoWin32-Registry' with: [ spec requires: #('PharoWin32') ];

			package: #'PharoWin32-Tests' with: [ spec requires: #('PharoWin32') ];
			package: #'PharoWin32-Registry-Tests' with: [ spec requires: #('PharoWin32-Registry') ];

			package: #'PharoCOM' with: [ spec requires: #('PharoWin32' 'PharoWin32-Registry') ];
			package: #'PharoCOM-Tests' with: [ spec requires: #('PharoCOM') ].
		
		spec 
			group: 'core' with: #('PharoCOM');
			group: 'registry' with: #('PharoWin32-Registry' 'core');
			group: 'com' with: #('PharoCOM' 'core' 'registry');
			group: 'default' with: #('com' 'tests');
			group: 'tests' with: #('PharoWin32-Tests' 'PharoCOM-Tests' 'PharoWin32-Registry-Tests') ]
]
