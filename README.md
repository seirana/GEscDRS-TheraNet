# GEscDRS-TheraNet

GEscDRS-TheraNet is a Nexflow pipeline designed to link scRNA-seq with polygenic disease risk at the single-cell resolution, independent of annotated cell types, and suggest drugs for the disease.  

It provides comprehensive functionalities for:  
 - GE-scDRS Identifying cells exhibiting excess expression across disease-associated genes implicated by Whole Exome Sequencing (WES) or genome-wide association studies (GWASs).  
 - TheraNet identifies the list of possible effective approved drugs based on drug and disease target gene interactions.   

The pipeline is compatible with any Linux system and requires only two dependencies:  
 - Nextflow (workflow manager)  
 - Singularity  (as the container engine)

# Table of contents
- [Pipeline structure](#pipeline-structure)
- [Key features](#key-features)
	- [Input data type](#input-data-type)
	- [Database management](#database-management)
	- [GEscDRS](#gescdrs)
	- [TheraNet](#theranet)
- [Quick start](#quick-start)
	- [Prerequisites](#prerequisites)
	- [Installing dependencies](#installing-dependencies)
		- [Step 1: Install Nextflow](#step-1-Install-nextflow)
		- [Step 2: Install Singularity ](#step-2-Install-singularity )
	- [Downloading GEscDRS-TheraNet](#downloading-gescdrs-theranet)
	- [Configuration](#configuration)
		- [Quickstart profile](#quickstart-profile)
		- [Custom configuration](#custom-configuration)
	- [Example workflows](#example-workflows)
		- [Running GEscDRS](#running-gescdrs)	
		- [Running TheraNet](#running-theranet)
- [Documentation](#documentation)
- [Funding](#funding)

# Pipeline Structure
After installing Netwflow and Singularity, you no longer need to install additional software.
Nextflow automatically downloads all necessary containers and tools.

![Image Alt Text](https://github.com/seirana/GEscDRS-TheraNet/blob/main/Images/Pipeline%20Structure.png)

# Key features
## Input data
GEscDRS-TheraNet needs the following input data:	
A CSV file listing 
A CSV file listing
## Database management
The pipeline can download and install the required databases for .....
## GEscDRS
## TheraNet
# Quick start
## Prerequisites
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

## Configuration
After downloading GEscDRS-TheraNet, a basic quickstart profile is created in the Nextflow pipeline code folder, which allows you to run quality control analysis with local FASTQ files. See the following quickstart example below. All further analyses of the quickstart example require the creation of a separate custom configuration file.

### Quickstart profile
GEscDRS-TheraNet includes a pre-configured quickstart profile for local testing:
* Cores: Limited to 4 per process.
* RAM: Limited to 32 GB.
* Directory: Designed to run in the user's home directory.  
> Note: The quickstart profile is not recommended for real metagenome data analysis usage.

### Custom configuration

## Example workflows:
### Running GEscDRS	
### Running TheraNet
# Prerequisites
GEscDRS-THeraNet requires significant computational resources. Ensure your system meets the following minimum requirements:

CPU: At least ?? cores.
RAM: At least ?? GB (e.g., Semibin may require up to ?? GB, and GTDB-TK up to ?? GB).
For large datasets, it is recommended to run the pipeline on a high-performance computing (HPC) system.

# Documentation
All further documentation about the pipeline can be found in the docs/ directory or under the links below:
Installation and configuration
Add host genomes to GEscDRS-TheraNet
Available options
Outputs structure

# Funding
The project was funded by the German Research Foundation (DFG) Research Unit .....
