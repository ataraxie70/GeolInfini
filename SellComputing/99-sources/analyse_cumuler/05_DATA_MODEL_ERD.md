# 05 — Modèle de données ERD

## 1. Convention de base

Toutes les tables principales doivent suivre une convention homogène :

- `id` de type UUID ;
- `created_at` ;
- `updated_at` ;
- `deleted_at` nullable ;
- audit de modification lorsque pertinent.

## 2. Noyau IAM

### roles

- id
- name
- description

### permissions

- id
- code
- name
- description

### role_permissions

- role_id
- permission_id

### users

- id
- email
- password_hash
- status
- last_login_at

### user_sessions

- id
- user_id
- token_hash
- expires_at

### audit_logs

- id
- user_id
- action
- entity_type
- entity_id
- payload_json
- ip_address

## 3. Profil client

### customer_profiles

- id
- user_id
- first_name
- last_name
- phone
- birth_date

### customer_addresses

- id
- customer_id
- label
- country
- city
- district
- address_line_1
- address_line_2
- postal_code

### customer_preferences

- id
- customer_id
- preferred_budget
- preferred_usage
- preferred_screen_size
- preferred_brands

## 4. Catalogue

### brands

- id
- name
- slug
- logo_url
- website

### categories

- id
- parent_id
- name
- slug
- icon

### product_collections

- id
- name
- slug
- description

### products

- id
- brand_id
- category_id
- collection_id
- name
- slug
- description
- short_description
- status

### product_variants

- id
- product_id
- sku
- ean
- condition
- price
- currency

### product_images

- id
- variant_id
- url
- alt_text
- sort_order

### product_documents

- id
- variant_id
- name
- url
- document_type

## 5. Spécifications

### product_specs

- id
- variant_id
- cpu
- cpu_generation
- ram
- ram_type
- storage
- storage_type
- gpu
- display_size
- display_resolution
- battery
- weight
- os

### specification_templates

- id
- name
- category_id

### specification_values

- id
- template_id
- variant_id
- key
- value

## 6. Recommandation

### use_cases

- id
- name
- slug

### product_use_scores

- product_id
- use_case_id
- score

### recommendation_rules

- id
- name
- priority
- rule_json

### recommendations

- id
- customer_id
- recommendation_score
- recommendation_data

### recommendation_results

- id
- recommendation_id
- product_id
- rank
- score

## 7. Reconditionné

### refurbished_reports

- id
- variant_id
- grade
- overall_score

### battery_reports

- id
- report_id
- health_percentage
- cycle_count

### component_replacements

- id
- report_id
- component_name
- replacement_date

### quality_checks

- id
- report_id
- check_type
- status

### refurbishment_photos

- id
- report_id
- url

## 8. Commandes

### orders

- id
- user_id
- status
- total_amount

### order_items

- id
- order_id
- product_id
- quantity
- unit_price

### payments

- id
- order_id
- provider
- status
- amount

## 9. Services et demandes

### service_requests

- id
- user_id
- service_type
- device_description
- status

### service_updates

- id
- service_request_id
- note
- created_at

### accessory_requests

- id
- user_id
- accessory_name
- description
- status

## 10. Contenu et avis

### articles

- id
- author_id
- title
- slug
- content
- status

### reviews

- id
- user_id
- product_id
- rating
- comment

## 11. Contraintes de cohérence

- suppression logique contrôlée ;
- index sur les clés de recherche ;
- unicité des slugs ;
- intégrité référentielle stricte ;
- historisation des changements critiques ;
- ségrégation claire entre données publiques et privées.

## 12. Remarque de conception

Le modèle relationnel doit rester lisible, normalisé et extensible.  
La logique de recommandation ne doit pas être encodée uniquement dans le schéma ; elle doit aussi exister au niveau applicatif.
