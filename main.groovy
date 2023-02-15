


// def COLOR

// node('nodename'){

//     stage ('color') {

//         COLOR = "green"
//         echo "color is $COLOR"

//         sh """COLOR=${COLOR}
//         echo $COLOR"""

//     }
// }


// for (e in apps) {
//     println "$car.brand $car.type -> $car.price"
// }

def main() {

  def apps = [
    [name: "home", port: '4200', exposed_port: '6000', path: 'home', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "product", port: '4200', exposed_port: '6001', path: 'product', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "remote-app", port: '4200', exposed_port: '6002', path: 'remote-app', domaine: "194.163.148.222", domaine_prefix: ''],
    [name: "shell", port: '4200', exposed_port: '6003', path: 'shell', domaine: "194.163.148.222", domaine_prefix: ''],
  ];

  def commit = sh("git rev-parse HEAD")
  // def changes = sh("git diff HEAD@{1} $commit --name-only | grep .")
    def changes = sh("git diff HEAD@{1} $(git rev-parse HEAD) --name-only")
  apps.each { e ->

    println(changes);

    // if(changes == '' || changes == null) {
    //   println("echo '$e.name no changes, no build' ");
    //   return;
    // }

    // println("echo '$e.name has some changes, building...' ");

    // println(commit)
    // println(changes)
  }


}

main();

// def script = "./docker-run.bat"
// def pb = new ProcessBuilder(script).inheritIO()

// def variable = "Variable value"

// Map<String, String> env = pb.environment()
// env.put( "variable", variable )

// Process p = pb.start()
// p.waitFor()

def sh(e) {
  try {
    Process proc = e.execute()

      // def b = new StringBuffer()
      // proc.consumeProcessErrorStream(b)
      // println b.toString()

    return proc.text
  } catch (err) {
      println(err)
  }
}


