/**
* My BDD Test
*/
component extends="testbox.system.BaseSpec"{

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

			beforeEach(()=>{
				var system = createObject( "java", "java.lang.System" );
				sep=server.separator.file;
				fakeCore = new root.models.core();
				testObj = createMock(object=fakeCore);
			})
			it( "When the BOX_LANG property is not set, return a blank string ", function(){
				var testme = testObj.findBoxLang();
				expect(testme.len()).tobegt(0);
			});
		});
	}

}

