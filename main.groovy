


// def COLOR

// node('nodename'){

//     stage ('color') {

//         COLOR = "green"
//         echo "color is $COLOR"

//         sh """COLOR=${COLOR}
//         echo $COLOR"""

//     }
// }
hi()
 
def hi() {
    def proc = "git --help".execute()

    // sh(script: """ echo me """, returnStdout: true)
    def b = new StringBuffer()
    proc.consumeProcessErrorStream(b)

    println proc.text
    println b.toString()
}


