FROM mambaorg/micromamba:1.5.8

# Ensure the base env is auto-activated in CMD/RUN
ARG MAMBA_DOCKERFILE_ACTIVATE=1

# Copy and install the environment
COPY --chown=$MAMBA_USER:$MAMBA_USER env/environment.yml /tmp/environment.yml
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean -a -y

# Good default workdir; Nextflow will mount its task dir here anyway
WORKDIR /workspace

# Keep entrypoint neutral so Nextflow can run any command (python available on PATH)
ENTRYPOINT ["/usr/bin/env"]
