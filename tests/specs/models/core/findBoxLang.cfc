/**
 * My BDD Test
 */
component extends="testbox.system.BaseSpec" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

	/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "findBoxlang", function(){
			beforeEach( () => {
				
				fakePath    = mockData( $num = 1, $type = "words:1" )[ 1 ];
				fakeCommand = createStub();
				fakeCommand.$( method = "runCommandline" );
				fakeCore = new root.models.core();
				testObj  = createMock( object = fakeCore );
				testObj.setCommand( fakeCommand );
			} )
			it( "When the BOX_LANG property is not set, return a blank string ", function(){
				var testme = testObj.findBoxLang( fakePath );
				expect( testme.len() ).tobegt( 0 );
			} );
		} );
	}

}

