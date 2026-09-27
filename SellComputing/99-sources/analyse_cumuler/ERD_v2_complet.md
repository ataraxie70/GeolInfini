# ERD V2 COMPLET

# Plateforme de Conseil, Vente d'Ordinateurs et Services Informatiques

Version : 2.0

Statut : Modèle de Données Métier

Basé sur le Domain Model DDD v1

---

# 1. Principes de Modélisation

## Objectifs

Le modèle de données doit permettre :

* gestion complète du catalogue ;
* recommandations intelligentes ;
* gestion du reconditionné ;
* commandes ;
* maintenance ;
* contenus ;
* analytics ;
* évolutivité future.

---

## Convention

Toutes les tables possèdent :

```text
id UUID PK
created_at TIMESTAMP
updated_at TIMESTAMP
deleted_at TIMESTAMP NULL
```

Soft Delete obligatoire.

---

# 2. IAM / RBAC

## roles

```text
id
name
description
```

---

## permissions

```text
id
code
name
description
```

---

## role_permissions

```text
role_id
permission_id
```

---

## users

```text
id
email
password_hash
status
last_login_at
```

---

## user_sessions

```text
id
user_id
token_hash
expires_at
```

---

## password_resets

```text
id
user_id
token
expires_at
```

---

## audit_logs

```text
id
user_id
action
entity_type
entity_id
payload_json
ip_address
```

---

# 3. Customer Context

## customer_profiles

```text
id
user_id
first_name
last_name
phone
birth_date
```

---

## customer_addresses

```text
id
customer_id
label
country
city
district
address_line_1
address_line_2
postal_code
```

---

## customer_preferences

```text
id
customer_id
preferred_budget
preferred_usage
preferred_screen_size
preferred_brands
```

---

## customer_devices

```text
id
customer_id
product_id
serial_number
purchase_date
```

---

## recommendation_history

```text
id
customer_id
recommendation_id
```

---

# 4. Catalogue Context

## brands

```text
id
name
slug
logo_url
website
```

---

## categories

```text
id
parent_id
name
slug
icon
```

---

## product_collections

```text
id
name
slug
description
```

---

## products

```text
id
brand_id
category_id
collection_id
name
slug
description
short_description
status
```

---

## product_variants

```text
id
product_id
sku
ean
condition
price
currency
```

condition :

```text
NEW
REFURBISHED
USED
```

---

## product_images

```text
id
variant_id
url
alt_text
sort_order
```

---

## product_documents

```text
id
variant_id
name
url
document_type
```

---

# 5. Product Specifications

## product_specs

```text
id
variant_id
cpu
cpu_generation
ram
ram_type
storage
storage_type
gpu
display_size
display_resolution
battery
weight
os
```

---

## specification_templates

```text
id
name
category_id
```

---

## specification_values

```text
id
template_id
variant_id
key
value
```

---

# 6. Product Usage Scoring

## use_cases

```text
id
name
slug
```

Exemples :

* bureautique
* étudiant
* programmation
* gaming
* montage
* mobilité

---

## product_use_scores

```text
product_id
use_case_id
score
```

---

## recommendation_rules

```text
id
name
priority
rule_json
```

---

## recommendations

```text
id
customer_id
recommendation_score
recommendation_data
```

---

## recommendation_results

```text
id
recommendation_id
product_id
rank
score
```

---

# 7. Reconditionné

## refurbished_reports

```text
id
variant_id
grade
overall_score
```

---

## battery_reports

```text
id
report_id
health_percentage
cycle_count
```

---

## component_replacements

```text
id
report_id
component_name
replacement_date
```

---

## quality_checks

```text
id
report_id
check_type
status
```

---

## refurbishment_photos

```text
id
report_id
url
```

---

## refurbishment_certificates

```text
id
report_id
certificate_url
```

---

# 8. Inventory

## warehouses

```text
id
name
location
```

---

## stock_items

```text
id
variant_id
warehouse_id
quantity
reserved_quantity
```

---

## stock_movements

```text
id
stock_item_id
movement_type
quantity
```

---

## inventory_adjustments

```text
id
stock_item_id
reason
quantity
```

---

# 9. Ordering Context

## carts

```text
id
customer_id
status
```

---

## cart_items

```text
id
cart_id
variant_id
quantity
```

---

## orders

```text
id
customer_id
order_number
status
total_amount
```

---

## order_items

```text
id
order_id
variant_id
quantity
unit_price
```

---

## order_status_history

```text
id
order_id
status
```

---

## shipments

```text
id
order_id
carrier
tracking_number
status
```

---

## shipment_events

```text
id
shipment_id
event_type
description
```

---

# 10. Payments

## payment_methods

```text
id
name
provider
```

---

## payments

```text
id
order_id
payment_method_id
amount
status
```

---

## payment_transactions

```text
id
payment_id
provider_reference
status
```

---

## refunds

```text
id
payment_id
amount
reason
```

---

# 11. Maintenance Context

## service_types

```text
id
name
description
```

---

## service_requests

```text
id
customer_id
service_type_id
status
priority
```

---

## service_devices

```text
id
request_id
device_brand
device_model
serial_number
```

---

## diagnoses

```text
id
request_id
description
cost_estimate
```

---

## interventions

```text
id
request_id
technician_id
description
```

---

## service_updates

```text
id
request_id
note
```

---

## technicians

```text
id
user_id
speciality
```

---

# 12. Accessoires sur Demande

## accessory_requests

```text
id
customer_id
name
description
```

---

## suppliers

```text
id
name
phone
email
```

---

## supplier_quotes

```text
id
request_id
supplier_id
price
availability
```

---

## accessory_orders

```text
id
request_id
supplier_quote_id
status
```

---

# 13. CMS

## articles

```text
id
author_id
title
slug
content
status
```

---

## article_categories

```text
id
name
slug
```

---

## article_tags

```text
id
name
slug
```

---

## article_tag_links

```text
article_id
tag_id
```

---

## videos

```text
id
title
url
```

---

## faqs

```text
id
question
answer
```

---

# 14. Reviews

## reviews

```text
id
customer_id
product_id
rating
comment
```

---

## review_votes

```text
id
review_id
customer_id
vote_type
```

---

# 15. Notifications

## notification_channels

```text
id
name
```

---

## notification_templates

```text
id
channel_id
name
```

---

## notifications

```text
id
customer_id
template_id
status
```

---

## notification_logs

```text
id
notification_id
sent_at
```

---

# 16. Analytics

## page_views

```text
id
customer_id
url
```

---

## search_events

```text
id
customer_id
query
```

---

## recommendation_events

```text
id
recommendation_id
```

---

## comparison_events

```text
id
customer_id
```

---

## purchase_events

```text
id
order_id
```

---

# 17. SEO

## seo_metadata

```text
id
entity_type
entity_id
meta_title
meta_description
canonical_url
```

---

## redirects

```text
id
source_url
target_url
```

---

# 18. Indexes Critiques

## Produits

```sql
products(slug)
products(status)
```

---

## Recherche

```sql
products(name)
brands(name)
categories(name)
```

---

## Catalogue

```sql
product_variants(product_id)
product_specs(variant_id)
```

---

## Commandes

```sql
orders(customer_id)
orders(order_number)
```

---

## Services

```sql
service_requests(customer_id)
```

---

# 19. Relations Principales

```text
Customer
 ├── Orders
 ├── Recommendations
 ├── Reviews
 ├── ServiceRequests
 └── AccessoryRequests

Product
 ├── Variants
 ├── Specs
 ├── Images
 ├── Scores
 └── RefurbishedReports

Order
 ├── OrderItems
 ├── Payment
 └── Shipment

ServiceRequest
 ├── Device
 ├── Diagnosis
 ├── Intervention
 └── Updates
```

---

# 20. Statistiques ERD V2

```text
IAM                 7 tables
Customer            5 tables
Catalogue          10 tables
Specifications      3 tables
Recommendation      5 tables
Refurbished         6 tables
Inventory           4 tables
Ordering            7 tables
Payments            4 tables
Maintenance         7 tables
Accessory Request   4 tables
CMS                 5 tables
Reviews             2 tables
Notifications       4 tables
Analytics           5 tables
SEO                 2 tables

TOTAL ≈ 80 tables
```

---

# Conclusion

Cet ERD V2 constitue une fondation de niveau production permettant :

* la vente d'ordinateurs ;
* la gestion du reconditionné ;
* la recommandation intelligente ;
* les services techniques ;
* les accessoires à la demande ;
* le CMS ;
* l'administration ;
* les analytics ;
* une évolution future vers une plateforme de référence du conseil informatique.

Étape suivante :
**Architecture Applicative (DDD + Clean Architecture + Hexagonal Architecture + Modular Monolith NestJS)**
qui définira précisément :

* les modules backend ;
* les aggregates ;
* les repositories ;
* les services métier ;
* les cas d'usage ;
* les API REST ;
* les événements de domaine ;
* l'organisation du code source.
