component accessors="true" {
    property name="command" inject="CommandService";

    function findBoxLang(){
        var system = createObject( "java", "java.lang.System" ).getenv();
        return system.keyExists("BOXLANG_HOME") 
            ? system.BOXLANG_HOME 
            : "";
    }
    function runCommand( required base ){
        command.runCommandline(base);
    }
}