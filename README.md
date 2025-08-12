# GEscDRS-TheraNet

GEscDRS-TheraNet is a Nexflow pipeline designed to link scRNA-seq with polygenic disease risk at the single-cell resolution, independent of annotated cell types, and suggest drugs for the disease.  

It provides comprehensive functionalities for:  
 - GE-scDRS Identifying cells exhibiting excess expression across disease-associated genes implicated by Whole Exome Sequencing (WES) or genome-wide association studies (GWASs).  
 - TheraNet identifies the list of possible effective approved drugs based on drug and disease target gene interactions.   

The pipeline is compatible with any Linux system and requires only two dependencies:  
 - Nextflow (workflow manager)  
 - Singularity  (as the container engine)

In [Quick Start](quick-start), you can follow the instructions to install the requirements and run simple samples.
To know the details of the functions and needed data types and formats, check the [Documents](documents).

# Table of contents
- [Pipeline structure](#pipeline-structure)
- [Key features](#key-features)
	- [Input data type](#input-data-type)
	- [Database management](#database-management)
- [Quick Start](#quick-start)
	- [Prerequisites and Configuration](#prerequisites-and-configuration)
    	- [Pre-configuration](#pre-configuration)
    	- [Custom configuration](#custom-configuration)
	- [Installing dependencies](#installing-dependencies)
		- [Step 1: Install Nextflow](#step-1-Install-nextflow)
		- [Step 2: Install Singularity ](#step-2-Install-singularity )	
	- [Example workflows](#example-workflows)
		- [Running GEscDRS](#running-gescdrs)
		- [Running TheraNet](#running-theranet)
- [Documentation](#documentation)
- [Funding](#funding)

# Pipeline Structure
After installing Netwflow and Singularity, you no longer need to install additional software.
Nextflow automatically downloads all necessary containers and tools.

![Image Alt Text](https://github.com/seirana/GEscDRS-TheraNet/blob/main/Images/Pipeline%20Structure.png)
#...................................................................................................................................................
#Key features
##Input data
TOFU-MAaPO accepts the following types of input:

Single- or paired-end metagenomic shotgun sequencing FASTQ files
A CSV file listing samples and their associated FASTQ files
Direct download of sequencing data from SRA using project, sample, or run IDs
##Database management
The pipeline can download and install the required databases for GTDBtk, MetaPhlAn, and HUMAnN. Refer to the usage documentation for more details.

The following tools need manual creation or the download of required databases:

Bowtie2 (for host genome removal)
Kraken2 (with Braken)
Sylph
Salmon

#...................................................................................................................................................
# Quick Start
## Prerequisites and Configuration
GEscDRS-TheraNet requires significant computational resources. Ensure your system meets the following minimum requirements:

CPU: At least 16 cores.
RAM: At least 32 GB (e.g., GEscDRS may require up to 360 GB).

### Pre-configuration
GEscDRS-TheraNet includes a pre-configured quickstart profile for local testing with the least requirements.

Note: The quickstart profile is not recommended for real metagenome data analysis usage.
For large datasets, it is recommended to run the pipeline on a high-performance computing (HPC) system.

### Custom configuration
To fully utilize GEscDRS-TheraNet on an HPC or other systems, you must create a custom configuration file specifying:

Available CPU cores and memory.
Scheduler settings (e.g., local or SLURM).
Paths for reference databases.
Please take a look at the installation and configuration documentation for details. ???????

## Installing dependencies
### Step 1: Install Nextflow
Nextflow requires Bash 3.2 (or later) and Java 17 (or later, up to 24) to be installed. Follow the instructions from [Nextflow installation guidance](https://www.nextflow.io/docs/latest/install.html#install-page) to check requirements and step-by-step installation.

### Step 2: Install Singularity 
You can install Singularity via the [Singularity Quickstart Guide](https://docs.sylabs.io/guides/3.9/user-guide/quick_start.html) or
Conda (no sudo rights required):
```bash
# Create a new conda environment for Singularity
conda create --name sing_env -c conda-forge -c bioconda singularity=3.8 
# Activate environment
conda activate sing_env
# Check whether Singularity has been successfully installed
singularity --version
# Also, make sure you can run an example container
singularity run library://sylabsed/examples/lolcow
```
## Downloading GEscDRS-TheraNet
Use the following command to download or update the pipeline:
```bash
nextflow pull ikmb/GEscDRS-TheraNet
```
You will find the pipeline code stored in ${HOME}/.nextflow/assets/ikmb/gescdrs-theranet.

## Example workflows
* Running GEscDRS	
* Running TheraNet
  
### Running GEscDRS	
In your first run, to download required databases, add the --updatemetaphlan flag; in subsequent runs, skip the update flag (remove line 6 from the following code).
```bash
nextflow run ikmb/tofu-maapo \
    -profile custom \
    -c tofu.config \
    --reads '*_R{1,2}.fastq.gz' \
    --metaphlan \
    --updatemetaphlan \
    --metaphlan_db '/path/to/store/metaphlan/db' \
    --outdir results
```
	
### Running TheraNet
In your first run, to download required databases, add the --updatemetaphlan flag; in subsequent runs, skip the update flag(remove line 6 from the following code).
```bash
nextflow run ikmb/tofu-maapo \
    -profile custom \
    -c tofu.config \
    --reads '*_R{1,2}.fastq.gz' \
    --metaphlan \
    --updatemetaphlan \
    --metaphlan_db '/path/to/store/metaphlan/db' \
    --outdir results
```
For detailed usage options, please take a look at the usage documentation.	????

# Documentation 
????
All further documentation about the pipeline can be found in the docs/ directory or under the links below:
Installation and configuration
Add host genomes to GEscDRS-TheraNet
Available options
Outputs structure

# Funding
The project was funded by the German Research Foundation (DFG) Research Unit ????.
