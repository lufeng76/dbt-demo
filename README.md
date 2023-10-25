# Dbt BigQuery Integration Demo

Data Build Tool (dbt) is a cutting-edge open-source data modeling and transformation tool. It enables engineers and data analysts to transform and structure data in a dependable and scalable manner. Dbt is used to build data pipelines for data warehousing and business intelligence applications.

Dbt aids in automating the process of creating data models. Users can create SQL queries and use code to automate repetitive activities. Additionally, it provides functions like testing and version control that guarantee the consistency and accuracy of the data. Snowflake, Redshift, BigQuery, and other databases are among the many that dbt can operate with.

<img src="img/dbt.png" width="100%" />

***Figure 1***

In this demo, we demostrate how to use the dbt with BigQuery for the SQL pipeline generation, test autumation and documentation generation. We also demostrate how to integrate the dbt with the orchestration serivce Cloud Composer, and how to implement the CI/CD process with dbt and Cloud Build.

## Solution Architecture

Here is the solution architecure to build a ELT data analytics pipeline on BigQuery using dbt and other Google Cloud native tooling. 

<img src="img/arch.png" width="100%" />

***Figure 2***

As shown in the architecture diagram, dbt is responsible for developing and running the ELT pineline inside BigQuery. Cloud Composer (managed Airflow Service) is responsible for end-to-end data pipeline orchestration, including data ingestion and data extraction. The dbt pipeline is integrated with Cloud Composer as part of the DAG workflow. The other important tools in this solution include:
* Google Source Repository (GSR) -   Provides Git version control to support collaborative development of any application or service; basically "Git server hosted in the cloud"
* Google Cloud Build (GCB) - Allow users to create fast, consistent, reliable builds across all languages. Automatically build containers or *non-container artifacts on commits to your Git repository.
* Artifact Registry (AR) - Evolution of Container Registry, single place for container images and language packages (such as Maven and npm)


## Environment variables

Change these varaibles in your environment

```bash
export PROJECT=lufeng-demo
export SUBNET=default
export DBT_VM=dbt
export DBT_DATASET=dbt
export LOCATION=US
```

## Deploy cbt cli
We need to deploy the dbt client and configure it to connect to BigQuery

### 1. Create a VM 
```
gcloud compute instances create ${DBT_VM} \
  --project ${PROJECT} \
  --zone us-central1-a \
  --machine-type n1-standard-2 \
  --subnet ${SUBNET} \
  --scopes https://www.googleapis.com/auth/cloud-platform
```

### 2. install the dbt CLI
