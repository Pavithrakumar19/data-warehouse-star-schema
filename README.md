# data-warehouse-star-schema
Built a dimensional Data Warehouse from raw OLTP data by transforming a One Big Table into a validated Star Schema with fact-dimension modeling and revenue integrity checks.

##E-Commerce Data Warehouse — Star Schema Implementation
## Project Overview

This project demonstrates the design and implementation of a Star Schema Data Warehouse for an E-commerce transactional dataset.

The objective was to:

*Transform a One Big Table (OLTP export)

*Design dimensional model

*Build fact and dimension tables

*Validate data integrity


## Source Dataset

Raw dataset: orders_obt.csv
Rows: 10,000
Grain: Order Line Item Level

Each row represents:

One product within one order

This ensures:

Fact table row count equals source row count

No aggregation loss

Accurate analytical queries

-Star Schema Design
-Fact Table

### Key Modeling Concepts Implemented
#### Surrogate Keys

All dimensions use auto-increment integer keys for optimized joins and warehouse best practices.

#### Degenerate Dimension

order_id is stored in fact table since it has no additional attributes.

#### Referential Integrity

Foreign key constraints ensure valid dimension mappings.
