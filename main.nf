nextflow.enable.dsl = 2

params.input    = "${projectDir}/input.csv"
params.script   = "${projectDir}/run.py"
params.outdir   = "${projectDir}/results"
params.container = "docker://ghcr.io/seirana/theranet:0.1"  // Option A default
// For Option B, you can override via CLI: -params-file params.yml or -with-singularity and set process.container

process RUN_THERANET {
  tag "theranet"
  cpus 2
  memory '4 GB'
  publishDir params.outdir, mode: 'copy'

  // Nextflow will use the container defined in nextflow.config (profiles.singularity)
  // or you can uncomment to bind it here:
  // container params.container

  input:
    path input_csv
    path script_file

  output:
    path "output/**", optional: true
    path "results/**", optional: true
    stdout into run_stdout

  script:
  """
  mkdir -p output results
  # If your run.py needs arguments, edit this line accordingly:
  python ${script_file} ${input_csv} > output/stdout.log 2>&1 || true
  """
}

workflow {
  RUN_THERANET( file(params.input), file(params.script) )
}
