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
## Downloading GEscDRS-TheraNet
## Configuration
### Quickstart profile
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
