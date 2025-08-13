FROM mambaorg/micromamba:1.5.8

# Copy environment and install
COPY env/environment.yml /tmp/environment.yml
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean -a -y

ENV PATH=/opt/conda/bin:$PATH
WORKDIR /workspace
# Do not force a command; Nextflow will supply it
ENTRYPOINT ["/usr/bin/env"]
