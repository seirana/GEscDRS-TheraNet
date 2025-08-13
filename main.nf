nextflow.enable.dsl = 2

// --------- Parameters (shared) ----------
params.input   = "${projectDir}/data/input.csv"
params.outdir  = "${projectDir}/results"

// You can still run without -entry; see workflow "main" at bottom.
params.project = "GEScDRS"   // default routing if users don't pass -entry

// --------- Processes ----------
process A_PY {
  tag "A_PY"
  cpus 1
  memory '2 GB'
  publishDir "${params.outdir}/GEScDRS/A", mode: 'copy'
  input:
    path in_file
  output:
    path "a_out.txt"
  """
  a.py ${in_file} > a_out.txt
  """
}

process B_BASH {
  tag "B_BASH"
  cpus 1
  memory '1 GB'
  publishDir "${params.outdir}/GEScDRS/B", mode: 'copy'
  input:
    path a_out
  output:
    path "b_out.txt"
  """
  b.bash ${a_out} > b_out.txt
  """
}

process C_PY {
  tag "C_PY"
  cpus 1
  memory '2 GB'
  publishDir "${params.outdir}/GEScDRS/C", mode: 'copy'
  input:
    path b_out
  output:
    path "final.txt"
  """
  c.py ${b_out} > final.txt
  """
}

process D_PY {
  tag "D_PY"
  cpus 1
  memory '2 GB'
  publishDir "${params.outdir}/TheraNet", mode: 'copy'
  input:
    path in_file
  output:
    path "theranet_out.txt"
  """
  d.py ${in_file} > theranet_out.txt
  """
}

// --------- Workflows (entry points) ----------
workflow GEScDRS {
  a_ch = A_PY( file(params.input) )
  b_ch = B_BASH( a_ch )
  C_PY( b_ch )
}

workflow TheraNet {
  D_PY( file(params.input) )
}

// Optional default routing if users forget -entry
workflow {
  if ( params.project.toLowerCase() == 'theranet' )
    TheraNet()
  else
    GEScDRS()
}
