nextflow.enable.dsl = 2

params.input    = "${projectDir}/input.csv"     // or any starting file
params.outdir   = "${projectDir}/results"
params.container = "docker://ghcr.io/seirana/theranet:0.1" // optional if you run with Singularity

process A_PY {
  tag "A_PY"
  cpus 1; memory '2 GB'
  publishDir "${params.outdir}", mode: 'copy', saveAs: { "A/${it}" }

  input:
    path in_file

  output:
    path "a_out.txt"

  """
  python a.py ${in_file} > a_out.txt
  """
}

process B_BASH {
  tag "B_BASH"
  cpus 1; memory '1 GB'
  publishDir "${params.outdir}", mode: 'copy', saveAs: { "B/${it}" }

  input:
    path a_out

  output:
    path "b_out.txt"

  """
  bash b.bash ${a_out} > b_out.txt
  """
}

process C_PY {
  tag "C_PY"
  cpus 1; memory '2 GB'
  publishDir "${params.outdir}", mode: 'copy', saveAs: { "C/${it}" }

  input:
    path b_out

  output:
    path "final.txt"

  """
  python c.py ${b_out} > final.txt
  """
}

workflow {
  // single input file:
  a_ch = A_PY( file(params.input) )
  b_ch = B_BASH( a_ch )
  c_ch = C_PY( b_ch )
}
