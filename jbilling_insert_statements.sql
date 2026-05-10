-- ============================================================
-- jBilling SBST — Triggering INSERT Statements
-- Rules covered : 49 / 50
-- Each block contains the exact rows that cause the GA to
-- trigger the named DMN business rule.
-- Rows are ordered in FK-safe insertion order.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_GOOD_STANDING
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 2, '2025-11-28', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 200.0, 1000.0, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 1, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-24', '2026-02-24', '2026-02-21', 54, 1149, 407, 366);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2024-05-16', '2027-01-05', '2026-04-20', '2024-05-16', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 298.74, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 1628.39, 0.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-11', 361.34, 0.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-11', 353.19, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 4, 238.6, 0.0, 0, 0, '2025-12-14', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_APPROACHING_LIMIT
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 1, '2025-12-09', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 850.0, 1000.0, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 1, 1, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-23', '2026-02-23', '2026-03-11', 1201, 1959, 1150, 287);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-04-09', '2026-12-20', '2026-02-25', '2025-04-09', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 435.37, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 484.52, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 1220.8, 0.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-11', 1039.45, 0.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-11', 487.28, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 3, 1, 3, 1169.5, 0.0, 0, 0, '2025-11-23', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 5, 1, 1237.54, 0.0, 0, 0, '2025-09-25', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_LIMIT_BREACHED
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 9, '2025-07-09', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 1200.0, 1000.0, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 5, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-17', '2026-02-17', '2026-03-10', 1025, 1526, 1995, 177);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2026-01-17', '2026-03-02', '2026-04-06', '2026-01-17', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 306.53, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 484.77, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 2, 24.52, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-13', 582.99, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 3, 4, 892.1, 0.0, 0, 0, '2025-09-19', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 4, 1, 1555.73, 0.0, 0, 0, '2025-12-27', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_PREPAID_LOW
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 9, '2024-12-23', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 20.0, 4826.26, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 0, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-23', '2026-02-23', '2026-03-06', 1496, 764, 1945, 7);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2025-04-17', '2027-02-02', '2026-05-27', '2025-04-17', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 317.08, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 498.11, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-22', 535.21, 371.18, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-01-02', 658.58, 67.64, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-02-15', 1197.91, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 3, 3, 4, 1469.27, 0.0, 0, 0, '2025-10-11', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 3, 4, 1781.55, 0.0, 0, 0, '2026-02-06', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_COLLECTIONS_ESCALATION
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 0, '2025-11-08', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 7712.25, 4485.31, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 1, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-26', '2026-02-26', '2026-02-17', 1578, 192, 1067, 340);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-08-11', '2026-09-10', '2026-03-31', '2025-08-11', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 318.29, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 374.92, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 1, 134.12, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-16', 1295.11, 1295.11, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2025-12-23', 524.02, 524.02, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2025-12-21', 1577.78, 1577.78, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (4, 1, '2026-02-04', 352.23, 352.23, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 1, 2, 1284.17, 0.0, 0, 0, '2025-12-19', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 1, 2, 3, 1190.16, 0.0, 0, 0, '2025-12-01', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_TRIAL_PERIOD_ACTIVE
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 1, '2025-08-17', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 0.0, 9823.71, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 1, 2, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-03-09', '2026-03-09', '2026-02-19', 0, 1117, 281, 164);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 2, 0, '2025-08-06', '2027-02-06', '2026-02-15', '2025-08-06', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 69.17, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 325.41, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 3, 5, 2, 905.39, 0.0, 0, 0, '2025-10-15', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 1, 2, 1, 1592.55, 0.0, 0, 0, '2025-10-02', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 1);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : credit_CHARGEBACK_RISK
-- DT   : DT1_CustomerCreditRisk
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 1, '2025-05-08', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 300.0, 315.99, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 1, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-17', '2026-02-17', '2026-02-18', 911, 1973, 993, 241);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2026-02-20', '2026-08-29', '2026-04-25', '2026-01-11', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 289.02, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 34.95, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 1, 60.31, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-04', 1702.88, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 4, 1, 3, 122.18, 0.0, 1, 0, '2025-11-30', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 4, 1, 4, 502.22, 0.0, 1, 0, '2026-02-25', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_FULLY_SETTLED
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 1, 6, '2025-03-26', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 3966.74, 206.3, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 2, 0, '2025-11-15', '2027-01-09', '2026-06-07', '2025-11-15', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 247.53, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 50.45, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-10', 500.0, 0.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2025-11-20', 323.5, 265.41, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-28', 364.66, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 225.92, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, 97.19, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 292.1, 0.0, 0, 0, '2025-12-02', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 2, 1, 1, 1370.9, 0.0, 0, 0, '2026-02-01', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 451.71);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_PARTIAL_PAYMENT
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 7, '2025-12-01', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 6190.1, 3084.62, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2024-11-12', '2027-02-04', '2026-03-07', '2024-11-12', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 103.94, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 446.88, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-03-02', 500.0, 150.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-01-09', 1951.5, 1746.42, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-06', 1278.24, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 151.93, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, 478.34, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 4, 4, 1071.34, 0.0, 0, 0, '2025-11-04', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 1, 2, 3, 1408.58, 0.0, 0, 0, '2026-02-07', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 487.61);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_OVERDUE_NO_PAYMENT
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 6, '2025-05-11', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 8486.72, 9674.81, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2025-11-08', '2026-07-21', '2026-06-10', '2025-11-08', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 33.44, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 77.98, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-15', 400.0, 400.0, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-02-11', 899.58, 153.1, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-19', 1462.01, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 64.29, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, 474.1, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 3, 1772.47, 0.0, 0, 0, '2026-03-01', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_DISPUTED_OVERDUE
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 5, '2025-11-02', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 1, 9113.15, 7644.43, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2025-02-06', '2026-02-11', '2026-04-22', '2025-01-18', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, -328.74, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 46.14, 1.0, 1);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-12-06', 1986.96, 11.13, 1, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-01-13', 415.97, 288.7, 3, 0, '2026-03-12 04:48:34', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-30', 4583.95, 0.0, 1, 0, '2026-03-12 04:48:34', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 195.89, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, -368.46, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 4, 1, 346.9, 0.0, 1, 0, '2026-03-11', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 5, 2, 1364.12, 0.0, 0, 0, '2025-11-16', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 314.64);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_WRITEOFF_ELIGIBLE
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 7, '2024-08-03', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 6668.95, 4424.19, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 3, 0, '2025-04-07', '2026-06-17', '2026-02-19', '2025-04-07', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 311.99, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 176.09, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-12-07', 600.0, 600.0, 1, 0, '2026-03-12 04:48:38', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-02-25', 1648.8, 1246.13, 1, 0, '2026-03-12 04:48:38', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-25', 196.64, 0.0, 1, 0, '2026-03-12 04:48:38', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 479.31, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, 178.73, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 1, 1, 663.45, 0.0, 0, 0, '2026-01-03', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_TAX_EXEMPT_CLEARED
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 4, '2025-09-03', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 9186.56, 7121.46, 2);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2024-04-23', '2026-05-27', '2026-04-16', '2026-02-17', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 4, 62.31, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, -1776.13, 1.0, 1);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-27', 1836.65, 0.0, 1, 0, '2026-03-12 04:48:39', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 3, 410.78, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 3, -498.88, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 5, 2, 1279.76, 0.0, 0, 0, '2025-11-28', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 3, 2, 1, 1678.59, 856.99, 0, 0, '2026-01-08', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 426.23);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 1);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 1);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : inv_CHARGEBACK_REVERSED
-- DT   : DT2_InvoiceSettlement
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 10, '2025-02-20', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 433.02, 2243.09, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 3, 0, '2025-07-15', '2026-08-17', '2026-03-01', '2025-07-15', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 207.03, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 335.86, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-11-24', 600.0, 600.0, 1, 0, '2026-03-12 04:48:42', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-27', 1742.39, 0.0, 1, 0, '2026-03-12 04:48:42', 1);

-- Table: invoice_line
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (1, 1, 1, 123.78, 0);
INSERT INTO invoice_line (id, invoice_id, type_id, amount, deleted) VALUES (2, 1, 2, 137.02, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 3, 1691.73, 0.0, 1, 0, '2025-10-09', 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_READY_POSTPAID
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 9, '2026-02-25', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 5015.89, 4653.45, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2024-12-14', '2026-03-03', '2026-03-11', '2024-12-14', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 396.26, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 429.04, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (4, 1, 2, 21.08, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 1268.55, 0.0, 1, 0, '2026-03-12 04:48:42', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 930.65, 0.0, 0, 0, '2026-01-05', 1);

-- Table: discount
INSERT INTO discount (id, entity_id, code, type, rate, start_date, end_date) VALUES (1, 1, 'DISC001', 'RATE', 21.15, '2026-02-04', '2026-07-31');

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_READY_PREPAID
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 10, '2025-01-21', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 500.0, 3104.22, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2025-05-07', '2027-01-12', '2026-03-11', '2025-05-07', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 93.5, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 290.23, 1.0, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 3, 1, 3, 99.27, 0.0, 0, 0, '2025-10-20', 1);

-- Table: discount
INSERT INTO discount (id, entity_id, code, type, rate, start_date, end_date) VALUES (1, 1, 'DISC001', 'RATE', 13.21, '2026-02-10', '2026-09-04');

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_BLOCKED_OVERDUE
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 4, '2026-01-16', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 9756.16, 1761.84, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2025-09-14', '2026-01-21', '2026-03-11', '2025-09-14', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 2, 2, 3, 0, '2024-09-06', '2026-12-18', '2026-03-28', '2024-09-06', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 412.31, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 462.48, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 2, 1, 230.12, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (4, 2, 2, 17.7, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-12', 445.05, 445.05, 1, 0, '2026-03-12 04:48:43', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-02-25', 1837.73, 1837.73, 1, 0, '2026-03-12 04:48:43', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 5, 2, 3, 1626.02, 0.0, 0, 0, '2025-11-28', 1);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_INSUFFICIENT_BALANCE
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 0, 1, '2025-03-02', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 50.0, 1869.04, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2024-04-13', '2026-12-25', '2026-03-11', '2024-04-13', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 1, 2, 3, 0, '2025-10-04', '2026-10-08', '2026-04-08', '2025-10-04', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 210.13, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 2, 1, 109.73, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-30', 1280.31, 887.12, 1, 0, '2026-03-12 04:48:43', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 3, 4, 1114.11, 0.0, 0, 0, '2025-10-06', 1);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_EXPIRING_NO_RENEWAL
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 6, '2025-12-06', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 3695.01, 5821.28, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2026-01-02', '2026-03-15', '2026-05-31', '2026-01-02', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 2, 2, 1, 0, '2024-08-06', '2026-07-20', '2026-04-08', '2024-08-06', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 257.01, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 2, 1, 352.35, 1.0, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 5, 4, 4, 1579.88, 0.0, 0, 0, '2025-12-26', 1);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_TRIAL_CONVERTING
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 10, '2024-08-15', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 1085.76, 2435.94, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2024-11-20', '2026-05-22', '2026-03-11', '2026-02-05', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 109.01, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 13.8, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 2, 23.45, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-12-25', 1000.81, 344.37, 1, 0, '2026-03-12 04:48:43', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 202.89, 0.0, 0, 0, '2026-01-14', 1);

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 999, 0);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 998, 30);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : order_DISCOUNT_EXPIRING
-- DT   : DT3_OrderBillingReadiness
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 7, '2025-09-03', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 5395.53, 812.29, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 1, 1, 0, '2025-06-15', '2027-01-03', '2026-03-11', '2025-07-04', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 399.58, 1.19, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 4, -479.98, 1.72, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 3, -1118.37, 6.2, 1);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-11-21', 2988.61, 1657.83, 2, 0, '2026-03-12 04:48:43', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 3, 4, 466.57, 495.43, 1, 0, '2025-10-13', 1);

-- Table: discount
INSERT INTO discount (id, entity_id, code, type, rate, start_date, end_date) VALUES (1, 1, 'DISC001', 'RATE', 20.32, '2026-02-07', '2026-03-12');

-- Table: preference
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (1, 1, 4, 988);
INSERT INTO preference (id, entity_id, type_id, int_value) VALUES (2, 1, 1, 8276);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : pay_SUCCESSFUL_AUTO
-- DT   : DT4_PaymentProcessing
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 5, '2025-10-20', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 5186.64, 5695.86, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 3, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-19', '2026-02-19', '2026-02-15', 1918, 1958, 1697, 249);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-15', 1951.04, 0.0, 1, 0, '2026-03-12 04:48:46', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 4, 1, 2, 500.0, 0.0, 0, 0, '2026-02-12', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 1183.71);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : pay_FAILED_RETRY_ELIGIBLE
-- DT   : DT4_PaymentProcessing
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 0, 3, '2024-12-08', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 5969.14, 1729.64, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 3, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-18', '2026-02-18', '2026-03-05', 463, 257, 1652, 322);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-05-09', 1889.03, 0.0, 1, 0, '2026-03-12 04:48:46', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 2, 4, 186.82, 0.0, 0, 0, '2025-11-20', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 186.82);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : pay_FAILED_MAX_RETRIES
-- DT   : DT4_PaymentProcessing
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 3, '2025-01-02', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 2700.19, 760.31, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 1, 3, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-03-12', '2026-03-12', '2026-03-01', 1621, 1112, 1111, 364);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-03-28', 1301.77, 0.0, 1, 0, '2026-03-12 04:48:46', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 3, 2, 2, 1197.87, 0.0, 0, 0, '2026-02-13', 1);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : pay_REFUND_ISSUED
-- DT   : DT4_PaymentProcessing
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 6, '2026-01-25', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 9836.37, 3950.24, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 1, 5, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-03-03', '2026-03-03', '2026-02-11', 66, 1136, 1769, 76);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-17', 804.89, 0.0, 1, 0, '2026-03-12 04:48:46', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 1, 1, 200.0, 0.0, 1, 0, '2025-11-14', 1);

-- Table: payment_invoice
INSERT INTO payment_invoice (id, payment_id, invoice_id, amount) VALUES (1, 1, 1, 513.63);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : pay_MANUAL_PENDING_MATCH
-- DT   : DT4_PaymentProcessing
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 0, 0, '2025-01-18', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 1757.93, 1839.73, 1);

-- Table: ach
INSERT INTO ach (id, user_id, bank_name, account_type) VALUES (1, 1, 'TestBank', 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 3, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-23', '2026-02-23', '2026-02-23', 325, 436, 305, 39);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-05-07', 1919.19, 0.0, 1, 0, '2026-03-12 04:48:47', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 4, 2, 300.0, 0.0, 0, 0, '2025-12-28', 1);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_CURRENT
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 9, '2024-07-29', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 4089.16, 8482.85, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-04-14', '2026-12-08', '2026-03-22', '2025-04-14', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 482.02, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 924.6, 0.0, 1, 0, '2026-03-12 04:48:47', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-11', 1052.94, 0.0, 1, 0, '2026-03-12 04:48:47', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-04-11', 1986.06, 0.0, 1, 0, '2026-03-12 04:48:47', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 1, 621.3, 0.0, 0, 0, '2025-09-18', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 3, 1, 2, 1654.08, 0.0, 0, 0, '2025-09-13', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_SOFT_REMINDER
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 8, '2024-03-31', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 10000.0, 1006.72, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2025-01-19', '2026-05-26', '2026-05-02', '2025-01-19', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 26.85, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-28', 498.48, 498.48, 1, 0, '2026-03-12 04:48:47', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 4, 3, 4, 830.77, 2008.99, 0, 0, '2025-12-16', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 110, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 115, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_FORMAL_WARNING
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 9, '2024-06-05', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 9473.6, 4584.19, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 0, '2024-03-28', '2026-07-27', '2026-05-16', '2024-03-28', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 416.42, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-21', 1176.52, 1176.52, 1, 0, '2026-03-12 04:48:50', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-02-28', 664.99, 664.99, 1, 0, '2026-03-12 04:48:50', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_SERVICE_SUSPENSION
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 2, '2024-12-19', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 4138.67, 8239.4, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 2, 0, '2025-09-30', '2027-01-22', '2026-02-20', '2025-09-30', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 325.64, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-31', 644.9, 644.9, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-01-06', 790.42, 790.42, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2026-02-19', 1583.58, 1583.58, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 2, 1517.67, 0.0, 0, 0, '2025-11-29', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_COLLECTIONS_REFERRAL
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 1, 7, '2025-09-17', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 4393.49, 9285.53, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2024-05-29', '2026-05-07', '2026-05-08', '2024-05-29', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 442.85, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-03-01', 373.18, 373.18, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2025-11-23', 1816.01, 1816.01, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (3, 1, '2025-11-14', 1006.86, 1006.86, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (4, 1, '2025-12-02', 541.8, 541.8, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 5, 4, 2, 1877.34, 0.0, 0, 0, '2025-11-07', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 2, 4, 3, 305.74, 0.0, 0, 0, '2025-10-04', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_PAYMENT_PLAN_ACTIVE
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 0, '2025-08-11', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 3689.58, 1813.79, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-12-12', '2027-01-11', '2026-03-21', '2025-12-12', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 262.71, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-14', 775.8, 775.8, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-02-17', 982.08, 982.08, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 4, 1, 1, 1072.51, 0.0, 0, 0, '2025-12-29', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 1);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : dun_DISPUTED_HOLD
-- DT   : DT5_DunningEscalation
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 0, '2024-05-09', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 2462.96, 9374.99, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 3, 0, '2024-07-31', '2026-03-05', '2026-05-14', '2024-07-31', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 78.14, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-09', 1274.04, 1274.04, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-11', 981.81, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 4, 5, 3, 1308.58, 0.0, 0, 0, '2025-12-11', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 4, 2, 3, 802.99, 0.0, 0, 0, '2025-12-12', 1);

-- Table: ageing_configuration
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (1, 1, 0, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (2, 1, 14, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (3, 1, 45, 0, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (4, 1, 60, 1, 1);
INSERT INTO ageing_configuration (status_id, entity_id, days, suspended, send_notification) VALUES (5, 1, 90, 1, 1);

-- Table: meta_field_name
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (1, 1, 'tax_exempt', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (2, 1, 'invoice_disputed', 'BOOLEAN', 'INVOICE');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (3, 1, 'payment_plan_active', 'BOOLEAN', 'CUSTOMER');
INSERT INTO meta_field_name (id, entity_id, name, data_type, entity_type) VALUES (4, 1, 'payment_plan_start_date', 'BOOLEAN', 'CUSTOMER');

-- Table: meta_field_value
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (1, 1, 0);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (2, 2, 1);
INSERT INTO meta_field_value (id, field_name_id, boolean_value) VALUES (3, 3, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : payout_ELIGIBLE_AUTO
-- DT   : DT6_PartnerPayoutEligibility
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 8, '2025-05-25', 1);

-- Table: partner
INSERT INTO partner (id, balance, due_payout, automatic_process, total_payments, total_payouts) VALUES (1, 1200.0, 1200.0, 1, 47729.12, 27594.17);

-- Table: partner_payout
INSERT INTO partner_payout (id, partner_id, starting_date, ending_date, payments_amount, refunds_amount, balance_left) VALUES (1, 1, '2026-02-07', '2026-03-11', 6184.76, 245.4, 1501.38);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : payout_ELIGIBLE_MANUAL
-- DT   : DT6_PartnerPayoutEligibility
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 6, '2025-04-27', 1);

-- Table: partner
INSERT INTO partner (id, balance, due_payout, automatic_process, total_payments, total_payouts) VALUES (1, 800.0, 800.0, 0, 22156.99, 9484.3);

-- Table: partner_payout
INSERT INTO partner_payout (id, partner_id, starting_date, ending_date, payments_amount, refunds_amount, balance_left) VALUES (1, 1, '2026-02-17', '2026-03-11', 1376.63, 311.57, 1742.39);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : payout_HELD_CUSTOMER_OVERDUE
-- DT   : DT6_PartnerPayoutEligibility
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 1, 3, '2024-04-21', 1);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-12-31', 1964.57, 1964.57, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2025-12-06', 1415.74, 1415.74, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: partner
INSERT INTO partner (id, balance, due_payout, automatic_process, total_payments, total_payouts) VALUES (1, 500.0, 500.0, 1, 8919.24, 33320.25);

-- Table: partner_payout
INSERT INTO partner_payout (id, partner_id, starting_date, ending_date, payments_amount, refunds_amount, balance_left) VALUES (1, 1, '2026-02-06', '2026-03-11', 5983.05, 497.96, 2244.71);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : payout_ANOMALY_ZERO_BALANCE
-- DT   : DT6_PartnerPayoutEligibility
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 7, '2025-02-12', 1);

-- Table: partner
INSERT INTO partner (id, balance, due_payout, automatic_process, total_payments, total_payouts) VALUES (1, 0.0, 400.0, 0, 12399.74, 1107.33);

-- Table: partner_payout
INSERT INTO partner_payout (id, partner_id, starting_date, ending_date, payments_amount, refunds_amount, balance_left) VALUES (1, 1, '2026-02-07', '2026-03-20', 5009.16, 239.99, 2470.67);
INSERT INTO partner_payout (id, partner_id, starting_date, ending_date, payments_amount, refunds_amount, balance_left) VALUES (2, 1, '2025-12-22', '2026-03-15', 2193.1, 258.44, 4854.83);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : payout_NOT_DUE
-- DT   : DT6_PartnerPayoutEligibility
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 10, '2024-08-14', 1);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-03', 1361.52, 25.62, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: partner
INSERT INTO partner (id, balance, due_payout, automatic_process, total_payments, total_payouts) VALUES (1, 4540.94, 0.0, 1, 34251.19, 49353.03);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : med_CLEAN_PROCESSED
-- DT   : DT7_MediationRecordStatus
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 0, 9, '2025-12-11', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 4825.65, 4749.24, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-11-23', '2026-04-02', '2026-05-15', '2025-11-23', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 125.12, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-20', 1239.83, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: mediation_record
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (1, 'KEY000001', 1, '2026-02-23');

-- Table: mediation_record_line
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (1, 1, 1, 248.28, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (2, 1, 1, 72.16, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, invoice_id, amount, status_id) VALUES (3, 1, 1, 1, 281.71, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, invoice_id, amount, status_id) VALUES (4, 1, 1, 1, 61.7, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (5, 1, 1, 467.83, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (6, 1, 1, 347.2, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (7, 1, 1, 368.8, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (9, 1, 1, 123.64, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (11, 1, 1, 69.71, 3);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (13, 1, 1, 208.45, 3);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : med_PARTIAL_ERRORS
-- DT   : DT7_MediationRecordStatus
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 2, 0, 10, '2024-10-06', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 1003.76, 8678.72, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2025-09-02', '2026-05-08', '2026-04-30', '2025-09-02', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 216.17, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-01-30', 1370.46, 102.01, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-03-03', 205.27, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: mediation_record
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (1, 'KEY000001', 3, '2026-03-03');

-- Table: mediation_record_line
INSERT INTO mediation_record_line (id, record_id, invoice_id, amount, status_id) VALUES (1, 1, 1, 476.09, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (2, 1, 19.94, 2);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (3, 1, 1, 346.57, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (4, 1, 1, 251.32, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (5, 1, 1, 30.37, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (6, 1, 1, 174.01, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (7, 1, 1, 498.33, 1);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (8, 1, 402.15, 1);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (9, 1, 75.98, 1);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (11, 1, 20.5, 3);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : med_FULL_ERROR
-- DT   : DT7_MediationRecordStatus
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 1, 10, '2025-05-27', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 3, 9429.71, 8035.95, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 1, 0, '2026-01-06', '2026-08-07', '2026-02-13', '2026-01-06', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 343.2, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-11-26', 1243.02, 897.2, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-04', 968.29, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: mediation_record
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (1, 'KEY000001', 2, '2026-02-16');

-- Table: mediation_record_line
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (1, 1, 172.3, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (2, 1, 436.26, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (3, 1, 361.07, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (4, 1, 364.94, 2);
INSERT INTO mediation_record_line (id, record_id, invoice_id, amount, status_id) VALUES (5, 1, 1, 315.19, 2);
INSERT INTO mediation_record_line (id, record_id, invoice_id, amount, status_id) VALUES (6, 1, 1, 143.61, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (7, 1, 12.4, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (9, 1, 117.61, 2);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : med_DUPLICATE_DETECTED
-- DT   : DT7_MediationRecordStatus
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 2, '2025-04-26', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 6515.46, 9392.19, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 3, 0, '2025-09-27', '2027-01-02', '2026-04-23', '2025-09-27', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 98.14, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2025-11-28', 1791.04, 1268.25, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-25', 1759.79, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: mediation_record
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (1, 'KEY000001', 2, '2026-03-04');
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (100, 'KEY000001', 3, '2026-03-05');
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (101, 'KEY000001', 2, '2026-03-08');

-- Table: mediation_record_line
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (1, 1, 23.23, 3);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (2, 1, 95.36, 3);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (3, 1, 466.51, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (5, 1, 443.12, 2);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (7, 1, 311.15, 3);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : med_REVENUE_LEAKAGE_RISK
-- DT   : DT7_MediationRecordStatus
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 5, '2025-03-16', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 3, 7006.89, 1262.23, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 2, 0, '2024-03-31', '2026-10-18', '2026-06-02', '2024-03-31', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 154.71, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-02-24', 1314.15, 937.72, 1, 0, '2026-03-12 04:48:51', 1);
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (2, 1, '2026-04-30', 1213.47, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: mediation_record
INSERT INTO mediation_record (id, jbillingkey, status_id, done) VALUES (1, 'KEY000001', 2, '2026-03-01');

-- Table: mediation_record_line
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (1, 1, 1, 296.99, 1);
INSERT INTO mediation_record_line (id, record_id, invoice_id, amount, status_id) VALUES (2, 1, 1, 17.99, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (3, 1, 1, 247.38, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (4, 1, 1, 221.29, 2);
INSERT INTO mediation_record_line (id, record_id, invoice_id, amount, status_id) VALUES (5, 1, 1, 458.45, 1);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (6, 1, 1, 287.02, 1);
INSERT INTO mediation_record_line (id, record_id, amount, status_id) VALUES (7, 1, 482.28, 2);
INSERT INTO mediation_record_line (id, record_id, order_id, amount, status_id) VALUES (8, 1, 1, 39.37, 2);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : bproc_SUCCESSFUL_RUN
-- DT   : DT8_BillingProcessHealth
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 10, '2025-11-11', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 6553.28, 9735.91, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 0, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-13', '2026-03-12', '2026-03-12', 500, 498, 88, 0);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 2, 0, '2025-05-28', '2026-07-06', '2026-04-26', '2025-05-28', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 40.93, 1.0, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : bproc_REVIEW_MODE
-- DT   : DT8_BillingProcessHealth
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 7, '2024-09-03', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 5091.69, 8358.54, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 1, 4, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-03-01', '2026-03-01', '2026-03-12', 500, 0, 1289, 0);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 2, 0, '2026-03-01', '2026-12-03', '2026-03-04', '2026-03-01', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 1, 291.19, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 425.97, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 2, 104.68, 1.0, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : bproc_PARTIAL_FAILURE
-- DT   : DT8_BillingProcessHealth
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 3, 1, 8, '2024-06-23', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 1893.19, 493.13, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 4, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-14', '2026-02-14', '2026-03-12', 500, 450, 1884, 50);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 0, '2025-07-29', '2026-03-20', '2026-02-18', '2025-07-29', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 389.09, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 1, 131.06, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 1, 328.33, 1.0, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : bproc_TIMEOUT_INCOMPLETE  [NOT COVERED — no INSERT generated]
-- DT   : DT8_BillingProcessHealth
-- ──────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────
-- Rule : bproc_ZERO_OUTPUT_ALERT
-- DT   : DT8_BillingProcessHealth
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 5, '2024-09-16', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 2, 7100.5, 2103.15, 1);

-- Table: billing_process
INSERT INTO billing_process (id, entity_id, billing_date, is_review, retries_to_use, period_unit_id) VALUES (1, 1, '2026-03-12', 0, 1, 3);

-- Table: billing_process_run
INSERT INTO billing_process_run (id, process_id, run_date, started, finished, invoices_generated, invoices_processed, payments_successful, payments_failed) VALUES (1, 1, '2026-02-26', '2026-02-26', '2026-03-12', 0, 1413, 413, 280);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2025-03-18', '2026-01-23', '2026-02-15', '2025-03-18', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 2, 2, 3, 0, '2025-11-02', '2026-01-14', '2026-04-21', '2025-11-02', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 484.28, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (4, 2, 1, 403.07, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 1, 69.61, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (5, 1, 2, 44.65, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (7, 1, 2, 418.79, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (9, 1, 2, 490.42, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (11, 1, 1, 359.0, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (13, 1, 2, 242.7, 1.0, 0);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : sub_HEALTHY_LONG_TERM
-- DT   : DT9_SubscriptionLifecycle
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 0, 5, '2026-02-26', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 1, 1, 6210.0, 3549.71, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 2, 2, 1, 0, '2024-05-05', '2026-11-25', '2026-02-19', '2025-02-05', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 2, 2, 2, 0, '2024-10-28', '2026-04-06', '2026-05-19', '2024-10-28', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 198.6, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 2, 2, 428.33, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 1, 2, 473.93, 1.0, 0);

-- Table: invoice
INSERT INTO invoice (id, user_id, due_date, total, balance, status_id, deleted, create_datetime, currency_id) VALUES (1, 1, '2026-04-11', 1267.22, 0.0, 1, 0, '2026-03-12 04:48:51', 1);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 2, 1, 3, 1886.91, 0.0, 0, 0, '2025-10-16', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 1, 4, 1044.02, 0.0, 0, 0, '2025-11-06', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (3, 1, 2, 1, 3, 903.2, 0.0, 0, 0, '2026-01-07', 1);


-- ──────────────────────────────────────────────────────────────────────
-- Rule : sub_CHURN_RISK
-- DT   : DT9_SubscriptionLifecycle
-- ──────────────────────────────────────────────────────────────────────
-- Table: entity
INSERT INTO entity (id, description, enabled, currency_id, language_id) VALUES (1, 'Test Entity', 1, 1, 1);

-- Table: base_user
INSERT INTO base_user (id, entity_id, user_name, deleted, status_id, account_locked, failed_attempts, create_datetime, currency_id) VALUES (1, 1, 'user1', 0, 1, 1, 9, '2024-06-21', 1);

-- Table: customer
INSERT INTO customer (id, auto_payment, balance_type, dynamic_balance, credit_limit, invoicing_type) VALUES (1, 0, 2, 3690.63, 4128.51, 1);

-- Table: purchase_order
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (1, 1, 1, 2, 3, 0, '2025-03-04', '2026-05-27', '2026-02-23', '2025-11-12', 1);
INSERT INTO purchase_order (id, user_id, billing_type_id, period_id, status_id, deleted, active_since, active_until, next_billable_day, create_datetime, currency_id) VALUES (2, 1, 1, 2, 1, 0, '2025-05-09', '2026-06-01', '2026-05-08', '2025-05-09', 1);

-- Table: order_line
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (1, 1, 2, 63.41, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (2, 1, 2, 422.61, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (3, 2, 2, 398.78, 1.0, 0);
INSERT INTO order_line (id, order_id, type_id, amount, quantity, deleted) VALUES (4, 2, 1, 50.71, 1.0, 0);

-- Table: payment
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (1, 1, 1, 1, 1, 341.09, 0.0, 0, 0, '2025-12-27', 1);
INSERT INTO payment (id, user_id, attempt, result_id, method_id, amount, balance, is_refund, deleted, create_datetime, currency_id) VALUES (2, 1, 5, 2, 4, 1000.1, 0.0, 0, 0, '2025-12-05', 1);

