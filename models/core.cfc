component accessors="true" {

	property name="command" inject="CommandService";
	//property name="print" inject="PrintBuffer";

	function findBoxLang( currentDirectory ){
		var system   = createObject( "java", "java.lang.System" ).getenv();
		
		var sep = server.separator.file.replace("\\","\","all");
		var localenv = findlocalENV( currentDirectory );
		var boxSource =  system.keyExists( "BOXLANG_HOME" )
		 ? system.BOXLANG_HOME			
		 : system.keyExists("boxlang-home")
		 	? system["boxlang-home"]
		 	: !isNull( localenv ) && localenv.len()
				? localenv
				: ""

		var fileName = filterFile(boxSource);
		return filename;	
	}

	function filterFile(dir){
		var found = directoryList(dir&"\lib").filter((item)=>{
			return item.findNoCase("boxlang-") && item.findNoCase("-all.jar");
		});

		return found.len() ? found[1] : "";
	}


	function runCommand( required base ){
		command.runCommandline( base );
	}

	function findlocalEnv( currentDirectory ){
		return doesFileExist( "#currentDirectory#.env" ) && !isNull(
			command.runCommandLine( "envFile get BOXLANG_HOME", true )
		)
		 ? command.runCommandLine( "envFile get BOXLANG_HOME", true )
		 : "";
	}

	function doesFileExist(pather){
		return fileExists( pather )
	}

}
