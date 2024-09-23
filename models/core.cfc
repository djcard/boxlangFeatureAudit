component accessors="true" {

	property name="command" inject="CommandService";

	function findBoxLang( currentDirectory ){
		var system   = createObject( "java", "java.lang.System" ).getenv();
		var localenv = findlocalENV( currentDirectory );
		return system.keyExists( "BOXLANG_HOME" )
		 ? system.BOXLANG_HOME
		 : !isNull( localenv ) && localenv.len()
		 ? localenv
		 : ""
	}
	function runCommand( required base ){
		command.runCommandline( base );
	}

	function findlocalEnv( currentDirectory ){
		return fileExists( "#currentDirectory#.env" ) && !isNull(
			command.runCommandLine( "envFile get BOXLANG_HOME", true )
		)
		 ? command.runCommandLine( "envFile get BOXLANG_HOME", true )
		 : "";
	}

}
