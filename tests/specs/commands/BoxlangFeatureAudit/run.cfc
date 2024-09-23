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
		describe( "Audit", function(){

			beforeEach(()=>{
				sep=server.separator.file;
				fakeCore = new root.models.core();
				mockCore = createmock(object=fakeCore);
				fakeCWD = mockData($num=1,$type="words:1")[1];
				fakeReport = mockData($num=1,$type="words:1")[1];
				fakePath = mockData($num=1,$type="words:1")[1];
				mockCore.$(method="findBoxLang",returns=fakePath);
				mockCore.$(method="runCommand");
				fakeSource = mockData($num=1,$type="words:1")[1];
				testObjA = new root.commands.BoxlangFeatureAudit.audit();
				testObj = createMock(object=testObjA);
				testObj.$(method="getCwd",returns=fakeCWD);
				testObj.setCore(mockCore);
			})
			it( "When no source is submitted, call getCWD 1x and submit that as the source file. ", function(){
				testObj.run();
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD#");
			});

			it( "When a source is submitted, call getCWD 0x and use the submitted source file. ", function(){
				testObj.run(fakePath);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(0);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakepath#");
			});
			it( "When missing is true, include --missing in the command ", function(){
				testObj.run(missing=true);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --missing --source #fakeCWD#");
			});
			it( "When aggregate is true, include --aggregate but not summary in the command ", function(){
				testObj.run(aggregate=true);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD# --aggregate");
			});

			it( "When summarize is true, include --aggregate summary in the command ", function(){
				testObj.run(summarize=true);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD# --aggregate summary");
			});

			it( "When both aggregate and summarize are  true, include --aggregate summary in the command ", function(){
				testObj.run(aggregate=true,summarize=true);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD# --aggregate summary");
			});


			it( "When quiet is true, include --quiet in the command ", function(){
				testObj.run(quiet=true);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD# --quiet");
			});

			it( "When reportFile is not submitted, do not include it in the command ", function(){
				testObj.run();
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD#");
			});

			it( "When reportFile is submitted, include it in the command ", function(){
				testObj.run(reportFile=fakeReport);
				expect(testObj.$callLog()).toHaveKey("getCWD");
				expect(testObj.$callLog()["getCWD"].len()).tobe(1);
				expect(mockCore.$callLog()).toHaveKey("runCommand");
				expect(mockCore.$callLog()["runCommand"].len()).tobe(1);
				expect(mockCore.$callLog()["runCommand"][1][1]).tobe("!java -cp #fakepath##sep#lib#sep#boxlang-1.0.0-beta13-all.jar ortus.boxlang.compiler.FeatureAudit --source #fakeCWD# --reportFile #fakeReport#");
			});

		});
	}

}

