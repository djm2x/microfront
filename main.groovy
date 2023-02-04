


// def COLOR

// node('nodename'){

//     stage ('color') {

//         COLOR = "green"
//         echo "color is $COLOR"

//         sh """COLOR=${COLOR}
//         echo $COLOR"""

//     }
// }
def apps = [
    [APP_NAME: "BMW", DOMAINE: "750i", DOMAINE_PREFIX: 300000, SUB_DOMAINE: '', APP_PORT: '5000', EXPOSED_PORT: '5020'],
]

// apps.each { e -> println "$e $e.type -> $e.price" }

// for (e in apps) {
//     println "$car.brand $car.type -> $car.price"
// }

def folder = 'remote-app'

def commit = sh('git rev-parse HEAD')
def changes = sh('git diff HEAD@{2} $COMMIT --name-only|grep .')


println(r);

// def script = "./docker-run.bat"
// def pb = new ProcessBuilder(script).inheritIO()

// def variable = "Variable value"

// Map<String, String> env = pb.environment()
// env.put( "variable", variable )

// Process p = pb.start()
// p.waitFor()

def sh(e) {
    def proc = e.execute()

    // sh(script: """ echo me """, returnStdout: true)
    def b = new StringBuffer()
    proc.consumeProcessErrorStream(b)
    println b.toString()

    return proc.text
}


