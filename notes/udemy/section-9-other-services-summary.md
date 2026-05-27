# Section 9: Other Services

## What this section covers

This is a short catch-all section with a few services that can still appear in exam questions.

## 1. AWS Tag Editor

- Bulk tag-management utility across resources and regions.
- Useful for:
  - finding tagged and untagged resources
  - adding/updating/removing tags at scale
- Relevant because tagging often underpins:
  - cost allocation
  - governance
  - automation targeting

## 2. Amazon QuickSight

- Serverless BI/dashboarding service.
- Used to build:
  - visualizations
  - dashboards
  - ad hoc analysis
- Common sources include:
  - RDS
  - Aurora
  - Athena
  - Redshift
  - S3
- Good mental model:
  - QuickSight is the reporting/visualization layer, not the ETL layer.

## 3. AWS Glue

- Managed serverless `ETL` service.
- Core use cases:
  - extract/transform/load data between stores
  - convert formats such as `CSV` to `Parquet`
  - prepare data for analytics systems like Athena and Redshift
- Key components/features:
  - Glue jobs
  - Glue Data Catalog
  - crawlers
  - job bookmarks
  - Glue DataBrew
  - Glue Studio
  - streaming ETL
- High-value exam notes:
  - `Glue Data Catalog` is shared metadata used by services like Athena
  - `Job Bookmarks` prevent reprocessing previously handled data
  - Parquet conversion is a classic optimization for Athena queries

## What to memorize for DOP-C02

- Tag Editor is bulk tag management.
- QuickSight is BI/dashboarding.
- Glue is ETL and metadata cataloging.
- Glue crawlers populate the Data Catalog.
- Glue job bookmarks help with incremental processing.

## Lecture map

- Lecture 237: Tag Editor
- Lecture 238: QuickSight
- Lecture 239: Glue
