# ERD Professionnel – Plateforme Conseil & Vente Informatique

Sections: Utilisateurs, Catalogue, Reconditionné, Recommandation, Commandes, Services, Accessoires sur demande, Contenu, Avis, Audit.

UTILISATEURS
roles(id, name, description)
users(id, role_id, email, password_hash, status, created_at)
user_profiles(id, user_id, first_name, last_name, phone, preferred_budget, preferred_usage)

CATALOGUE
brands(id, name, logo_url)
categories(id, parent_id, name, slug)
products(id, brand_id, category_id, name, slug, description, condition, price, warranty_months)
product_specs(product_id, cpu, ram, storage, gpu, display, battery, weight)
product_images(id, product_id, image_url, sort_order)
inventory(id, product_id, quantity, reserved_quantity)

RECONDITIONNE
refurbished_reports(id, product_id, grade, battery_health, replaced_parts, tests_performed, inspected_at)

RECOMMANDATION
use_cases(id, name)
product_use_scores(product_id, use_case_id, score)

COMMANDES
orders(id, user_id, status, total_amount)
order_items(id, order_id, product_id, quantity, unit_price)
payments(id, order_id, provider, status, amount)

SERVICES
service_requests(id, user_id, service_type, device_description, status)
service_updates(id, service_request_id, note, created_at)

ACCESSOIRES SUR DEMANDE
accessory_requests(id, user_id, accessory_name, description, status)

CONTENU
articles(id, author_id, title, slug, content, status)

AVIS
reviews(id, user_id, product_id, rating, comment)

AUDIT
audit_logs(id, user_id, action, entity_type, entity_id, created_at)
