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
		describe( "findLocalEnv should", function(){
			beforeEach( () => {
				fakeHome    = mockData( $num = 1, $type = "words:1" )[ 1 ];
				fakeCommand = createStub();
				fakeCommand.$( method = "runCommandline" );
				fakeCore = new root.models.core();
				testObj  = createMock( object = fakeCore );
				testObj.setCommand( fakeCommand );
				testObj.$(method="doesFileExist",returns=true);
			} )
			it( "When the BOX_LANG property is not set in the local .env file, return a blank string ", function(){
				var testme = testObj.findlocalEnv( expandPath( "/" ) );
				expect( testme.len() ).tobe( 0 );
			} );
			it( "When the BOX_LANG property is set in the local .env file, return that value ", function(){
				fakeCommand.$( method = "runCommandline", returns = fakeHome );
				testObj.setCommand( fakeCommand );
				var testme = testObj.findlocalEnv( expandPath( "/" ) );
				expect( testme.len() ).tobegt( 0 );
				expect( testme ).tobe( fakeHome );
			} );
		} );
	}

}

