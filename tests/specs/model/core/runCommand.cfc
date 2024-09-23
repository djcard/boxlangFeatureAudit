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
		describe( "RunCommand", function(){

			beforeEach(()=>{
				fakeCommand =createStub();
				fakeCommand.$(method="runCommandline");
				fakeCore = new root.models.core();
				testObj = createMock(object=fakeCore);
				testObj.setCommand(fakeCommand)
			})
			it( "Run the runCommandline method 1x passing in the submitted statement ", function(){
				var statement = mockData($num=1,$type="words:5")[1];
				testObj.runCommand(statement);
				expect(fakeCommand.$callLog()).tohaveKey("runCommandline");
				expect(fakeCommand.$callLog()["runCommandline"].len()).tobe(1);
				expect(fakeCommand.$callLog()["runCommandline"][1][1]).tobe(statement);
			});
		});
	}

}

