component accessors="true" {

	property name="core"  inject="core@boxlangFeatureAudit";
	property name="print" inject="PrintBuffer";

	/***
	 * @source     The file or folder you wish to audit. Defaults to the current directory
	 * @reportFile The output file for the results. Defaults to the 
	 * @missing    If true, will only show the CFML BIFs and Components which are missing from boxlang. Defaults to false
	 * @aggregate  Instead of showing file by file, will aggregate the results. Defaults to false.
	 * @summarize  Will roll up the results even more. Includes the number of files and the different file extensions. This will override the aggregate property. Defaults to false.
	 * @quiet      If true, will not output the details to the console. The files processed will still be shown.
	 * */
	function run(
		string source     = getcwd(),
		string reportFile = "",
		boolean missing    = false,
		boolean aggregate  = false,
		boolean summarize  = false,
		boolean quiet      = false
	){
		var boxlocation = core.findBoxLang( getCwd() );
		if ( !boxlocation.len() ) {
			print.line( "Boxlang is not installed. Please install or make sure that the BOXLANG_HOME variable is set." )
			return;
		}

		if ( !core.doesFileExist( boxlocation ) ) {
			print.line( "It doesn't appear that Boxlang is installed at #boxlocation#. Please check the system variable BOXLANG_HOME." );
			return;
		}

		var base = "!java -cp #boxlocation# ortus.boxlang.compiler.FeatureAudit";
		base     = base & ( arguments.missing ? " --missing" : "" );
		base     = base & ( arguments.source.len() ? " --source #arguments.source#" : "" );
		base     = base & (
			arguments.summarize
			 ? " --aggregate summary"
			 : arguments.aggregate
			 ? " --aggregate"
			 : ""
		);
		base = base & (
			arguments.quiet
			 ? " --quiet"
			 : ""
		);

		base = base & ( arguments.reportFile.len() ? " --reportFile #arguments.reportFile#" : "" )
		core.runCommand( base );
	}

}
