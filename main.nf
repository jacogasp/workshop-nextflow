include { ComputePi; Avg; SaveResult } from './modules/pi'

log.info """\

===================================
W O R K S H O P  -  N E X T F L O W
===================================

data directory   : ${params.data}
output directory : ${params.output}
"""

workflow {
    def input = Channel.fromPath(params.data)
    def results = ComputePi(input).collectFile(name: "pi.txt", newLine: true)
    def pi = Avg(results)
    SaveResult(pi)
}
