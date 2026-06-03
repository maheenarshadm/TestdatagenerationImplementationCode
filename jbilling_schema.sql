-- =============================================================================
-- jBilling Community Edition — Canonical PostgreSQL Schema
-- Reconstructed from jBilling 4.x source, Hibernate mappings,
-- and official documentation.  
-- =============================================================================

-- ---------------------------------------------------------------------------
-- ENTITY (Company / Tenant)
-- ---------------------------------------------------------------------------
CREATE TABLE entity (
    id                  INTEGER      PRIMARY KEY,
    external_id         VARCHAR(100),
    description         VARCHAR(200) NOT NULL,
    create_datetime     TIMESTAMP    NOT NULL DEFAULT NOW(),
    enabled             SMALLINT     NOT NULL DEFAULT 1,   -- 1=active 0=disabled
    currency_id         INTEGER      NOT NULL,
    language_id         INTEGER      NOT NULL DEFAULT 1,
    timezone            VARCHAR(50),
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- CURRENCY
-- ---------------------------------------------------------------------------
CREATE TABLE currency (
    id          INTEGER      PRIMARY KEY,
    symbol      VARCHAR(10)  NOT NULL,
    code        VARCHAR(10)  NOT NULL,   -- ISO 4217 e.g. 'USD','EUR'
    name        VARCHAR(50)  NOT NULL,
    country_code VARCHAR(5),
    in_use      SMALLINT     NOT NULL DEFAULT 1
);

-- ---------------------------------------------------------------------------
-- LANGUAGE
-- ---------------------------------------------------------------------------
CREATE TABLE language (
    id          INTEGER     PRIMARY KEY,
    code        VARCHAR(10) NOT NULL,
    description VARCHAR(50) NOT NULL
);

-- ---------------------------------------------------------------------------
-- BASE_USER  (customer, admin, partner …)
-- ---------------------------------------------------------------------------
CREATE TABLE base_user (
    id                  INTEGER      PRIMARY KEY,
    entity_id           INTEGER      NOT NULL REFERENCES entity(id),
    user_name           VARCHAR(50)  NOT NULL,
    password            VARCHAR(100),
    deleted             SMALLINT     NOT NULL DEFAULT 0,
    language_id         INTEGER      NOT NULL DEFAULT 1,
    currency_id         INTEGER      NOT NULL,
    create_datetime     TIMESTAMP    NOT NULL DEFAULT NOW(),
    last_status_change  TIMESTAMP,
    status_id           INTEGER,          -- 1=Active 2=Suspended 3=Deleted
    subscriber_status   INTEGER,          -- 1=Active 2=Pending 3=Unsubscribed
    failed_attempts     SMALLINT     NOT NULL DEFAULT 0,
    is_parent           SMALLINT     NOT NULL DEFAULT 0,
    parent_id           INTEGER      REFERENCES base_user(id),
    encrypted_password  VARCHAR(100),
    account_locked      SMALLINT     NOT NULL DEFAULT 0,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- CUSTOMER  (extends base_user for customer-specific data)
-- ---------------------------------------------------------------------------
CREATE TABLE customer (
    id                      INTEGER      PRIMARY KEY REFERENCES base_user(id),
    invoicing_type          INTEGER      NOT NULL DEFAULT 1,  -- 1=auto 2=manual
    auto_payment_type       INTEGER,      -- 1=CC 2=ACH 3=Cheque
    auto_payment            SMALLINT     NOT NULL DEFAULT 0,
    last_invoice_id         INTEGER,
    balance_type            INTEGER      NOT NULL DEFAULT 1,  -- 1=no limit 2=pre-paid 3=credit
    dynamic_balance         NUMERIC(22,2) NOT NULL DEFAULT 0,
    credit_limit            NUMERIC(22,2),
    due_date_value          INTEGER,      -- payment due days offset
    due_date_unit_id        INTEGER,      -- 1=day 2=week 3=month
    partner_id              INTEGER,
    exclude_aging           SMALLINT     NOT NULL DEFAULT 0,
    notes                   TEXT,
    optlock                 INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- CONTACT  (customer contact / address info)
-- ---------------------------------------------------------------------------
CREATE TABLE contact (
    id              INTEGER      PRIMARY KEY,
    user_id         INTEGER      REFERENCES base_user(id),
    entity_id       INTEGER      REFERENCES entity(id),
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    organization    VARCHAR(100),
    address_1       VARCHAR(200),
    address_2       VARCHAR(200),
    city            VARCHAR(50),
    state_province  VARCHAR(50),
    postal_code     VARCHAR(20),
    country_code    VARCHAR(5),
    phone_number    VARCHAR(30),
    email           VARCHAR(200),
    create_datetime TIMESTAMP    NOT NULL DEFAULT NOW(),
    deleted         SMALLINT     NOT NULL DEFAULT 0,
    is_primary      SMALLINT     NOT NULL DEFAULT 0,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ITEM_TYPE  (product category)
-- ---------------------------------------------------------------------------
CREATE TABLE item_type (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      NOT NULL REFERENCES entity(id),
    description     VARCHAR(200) NOT NULL,
    order_line_type_id INTEGER   NOT NULL DEFAULT 1,  -- 1=item 2=tax 3=penalty
    internal        SMALLINT     NOT NULL DEFAULT 0,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ITEM  (product / service / plan)
-- ---------------------------------------------------------------------------
CREATE TABLE item (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      NOT NULL REFERENCES entity(id),
    internal_number VARCHAR(50),
    gl_code         VARCHAR(50),
    description     VARCHAR(200) NOT NULL,
    price_manual    SMALLINT     NOT NULL DEFAULT 0,
    deleted         SMALLINT     NOT NULL DEFAULT 0,
    has_decimals    SMALLINT     NOT NULL DEFAULT 0,
    is_percentage   SMALLINT     NOT NULL DEFAULT 0,  -- for tax/discount items
    activation_status INTEGER    NOT NULL DEFAULT 1,  -- 1=active 2=inactive
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ITEM_TYPE_MAP  (item ↔ category M:M)
-- ---------------------------------------------------------------------------
CREATE TABLE item_type_map (
    item_id         INTEGER      NOT NULL REFERENCES item(id),
    item_type_id    INTEGER      NOT NULL REFERENCES item_type(id),
    PRIMARY KEY (item_id, item_type_id)
);

-- ---------------------------------------------------------------------------
-- ITEM_PRICE  (price per currency / date range)
-- ---------------------------------------------------------------------------
CREATE TABLE item_price (
    id              INTEGER      PRIMARY KEY,
    item_id         INTEGER      NOT NULL REFERENCES item(id),
    currency_id     INTEGER      NOT NULL REFERENCES currency(id),
    price           NUMERIC(22,10) NOT NULL,
    since           DATE,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PLAN  (subscription plan — bundles items)
-- ---------------------------------------------------------------------------
CREATE TABLE plan (
    id              INTEGER      PRIMARY KEY,
    item_id         INTEGER      NOT NULL REFERENCES item(id),  -- plan is itself an item
    period_id       INTEGER      NOT NULL,   -- 1=monthly 2=quarterly 3=annual
    description     VARCHAR(200),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PLAN_ITEM  (items included in a plan)
-- ---------------------------------------------------------------------------
CREATE TABLE plan_item (
    id              INTEGER      PRIMARY KEY,
    plan_id         INTEGER      NOT NULL REFERENCES plan(id),
    item_id         INTEGER      NOT NULL REFERENCES item(id),
    quantity        NUMERIC(22,10) NOT NULL DEFAULT 1,
    price           NUMERIC(22,10),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- DISCOUNT  (discount definition)
-- ---------------------------------------------------------------------------
CREATE TABLE discount (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      NOT NULL REFERENCES entity(id),
    code            VARCHAR(50)  NOT NULL,
    description     VARCHAR(200),
    type            VARCHAR(30)  NOT NULL,  -- RATE,FLAT_AMOUNT,BUY_X_GET_Y,NEXT_BILLING_PERIOD
    rate            NUMERIC(22,10),         -- % for RATE type
    start_date      DATE,
    end_date        DATE,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PURCHASE_ORDER  (subscription / one-time order)
-- ---------------------------------------------------------------------------
CREATE TABLE purchase_order (
    id                  INTEGER      PRIMARY KEY,
    user_id             INTEGER      NOT NULL REFERENCES base_user(id),
    billing_type_id     INTEGER      NOT NULL DEFAULT 1, -- 1=pre-paid 2=post-paid
    period_id           INTEGER      NOT NULL,           -- 1=one-time 2=monthly…
    period_value        INTEGER      NOT NULL DEFAULT 1,
    active_since        DATE,
    active_until        DATE,
    create_datetime     TIMESTAMP    NOT NULL DEFAULT NOW(),
    next_billable_day   DATE,
    status_id           INTEGER      NOT NULL DEFAULT 1, -- 1=active 2=suspended 3=finished
    deleted             SMALLINT     NOT NULL DEFAULT 0,
    notify              SMALLINT     NOT NULL DEFAULT 1,
    due_date_value      INTEGER,
    due_date_unit_id    INTEGER,
    is_current          SMALLINT     NOT NULL DEFAULT 1,
    notes               TEXT,
    currency_id         INTEGER      NOT NULL,
    cycle_starts        DATE,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ORDER_LINE  (line items on an order)
-- ---------------------------------------------------------------------------
CREATE TABLE order_line (
    id              INTEGER      PRIMARY KEY,
    order_id        INTEGER      NOT NULL REFERENCES purchase_order(id),
    item_id         INTEGER      REFERENCES item(id),
    type_id         INTEGER      NOT NULL DEFAULT 1, -- 1=item 2=tax 3=penalty 4=discount
    description     VARCHAR(200),
    amount          NUMERIC(22,10) NOT NULL,
    quantity        NUMERIC(22,10) NOT NULL DEFAULT 1,
    price           NUMERIC(22,10),
    deleted         SMALLINT     NOT NULL DEFAULT 0,
    use_item        SMALLINT     NOT NULL DEFAULT 1,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- INVOICE  (generated invoice)
-- ---------------------------------------------------------------------------
CREATE TABLE invoice (
    id                  INTEGER      PRIMARY KEY,
    user_id             INTEGER      NOT NULL REFERENCES base_user(id),
    create_datetime     TIMESTAMP    NOT NULL DEFAULT NOW(),
    due_date            DATE,
    total               NUMERIC(22,2) NOT NULL DEFAULT 0,
    to_process          SMALLINT     NOT NULL DEFAULT 1, -- 1=needs processing 0=done
    balance             NUMERIC(22,2) NOT NULL DEFAULT 0, -- outstanding amount
    carried_balance     NUMERIC(22,2) NOT NULL DEFAULT 0,
    in_process_payments SMALLINT     NOT NULL DEFAULT 0,
    payment_attempts    SMALLINT     NOT NULL DEFAULT 0,
    is_review           SMALLINT     NOT NULL DEFAULT 0,
    currency_id         INTEGER      NOT NULL,
    deleted             SMALLINT     NOT NULL DEFAULT 0,
    status_id           INTEGER      NOT NULL DEFAULT 1, -- 1=unpaid 2=paid 3=voided
    last_reminder       DATE,
    reminder_count      SMALLINT     NOT NULL DEFAULT 0,
    paper_invoice_batch_id INTEGER,
    delegated_invoice_id INTEGER     REFERENCES invoice(id),  -- parent invoice
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- INVOICE_LINE  (line items on an invoice)
-- ---------------------------------------------------------------------------
CREATE TABLE invoice_line (
    id              INTEGER      PRIMARY KEY,
    invoice_id      INTEGER      NOT NULL REFERENCES invoice(id),
    item_id         INTEGER      REFERENCES item(id),
    type_id         INTEGER      NOT NULL DEFAULT 1,
    description     VARCHAR(200),
    amount          NUMERIC(22,10) NOT NULL,
    quantity        NUMERIC(22,10),
    price           NUMERIC(22,10),
    deleted         SMALLINT     NOT NULL DEFAULT 0,
    source_user_id  INTEGER      REFERENCES base_user(id),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PAYMENT  (payment transaction record)
-- ---------------------------------------------------------------------------
CREATE TABLE payment (
    id                  INTEGER      PRIMARY KEY,
    user_id             INTEGER      NOT NULL REFERENCES base_user(id),
    attempt             SMALLINT     NOT NULL DEFAULT 1,
    result_id           INTEGER,     -- 1=successful 2=failed 3=processor_unavailable 4=entered 5=refunded
    method_id           INTEGER,     -- 1=CC 2=ACH 3=cheque 4=paypal
    amount              NUMERIC(22,2) NOT NULL,
    balance             NUMERIC(22,2) NOT NULL DEFAULT 0,
    create_datetime     TIMESTAMP    NOT NULL DEFAULT NOW(),
    update_datetime     TIMESTAMP,
    currency_id         INTEGER      NOT NULL,
    is_refund           SMALLINT     NOT NULL DEFAULT 0,
    deleted             SMALLINT     NOT NULL DEFAULT 0,
    payment_date        DATE,
    payout_id           INTEGER,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PAYMENT_INVOICE  (M:M — payment applied to invoice(s))
-- ---------------------------------------------------------------------------
CREATE TABLE payment_invoice (
    id              INTEGER      PRIMARY KEY,
    payment_id      INTEGER      NOT NULL REFERENCES payment(id),
    invoice_id      INTEGER      NOT NULL REFERENCES invoice(id),
    amount          NUMERIC(22,2) NOT NULL,
    create_datetime TIMESTAMP    NOT NULL DEFAULT NOW(),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- CREDIT_CARD  (stored card data — PCI-masked)
-- ---------------------------------------------------------------------------
CREATE TABLE credit_card (
    id              INTEGER      PRIMARY KEY,
    cc_number       VARCHAR(200) NOT NULL,  -- tokenised / masked
    cc_expiry       CHAR(6),               -- MMYYYY
    name            VARCHAR(100),
    type            VARCHAR(30),           -- VISA,MASTERCARD,AMEX,DISCOVER
    deleted         SMALLINT     NOT NULL DEFAULT 0,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ACH  (bank account for direct debit)
-- ---------------------------------------------------------------------------
CREATE TABLE ach (
    id              INTEGER      PRIMARY KEY,
    user_id         INTEGER      REFERENCES base_user(id),
    aba_routing     VARCHAR(20),
    bank_account    VARCHAR(50),
    account_type    INTEGER,    -- 1=checking 2=savings
    bank_name       VARCHAR(50),
    account_name    VARCHAR(50),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- BILLING_PROCESS  (batch billing run)
-- ---------------------------------------------------------------------------
CREATE TABLE billing_process (
    id                  INTEGER      PRIMARY KEY,
    entity_id           INTEGER      NOT NULL REFERENCES entity(id),
    billing_date        DATE         NOT NULL,
    period_unit_id      INTEGER      NOT NULL,
    period_value        INTEGER      NOT NULL DEFAULT 1,
    is_review           SMALLINT     NOT NULL DEFAULT 0,
    retries_to_use      INTEGER      NOT NULL DEFAULT 0,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- BILLING_PROCESS_RUN  (execution instance of a billing process)
-- ---------------------------------------------------------------------------
CREATE TABLE billing_process_run (
    id                  INTEGER      PRIMARY KEY,
    process_id          INTEGER      NOT NULL REFERENCES billing_process(id),
    run_date            TIMESTAMP    NOT NULL,
    started             TIMESTAMP,
    finished            TIMESTAMP,
    invoices_generated  INTEGER      NOT NULL DEFAULT 0,
    invoices_processed  INTEGER      NOT NULL DEFAULT 0,
    payments_successful INTEGER      NOT NULL DEFAULT 0,
    payments_failed     INTEGER      NOT NULL DEFAULT 0,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ORDER_PROCESS  (links billing-run to invoice generated from an order)
-- ---------------------------------------------------------------------------
CREATE TABLE order_process (
    id              INTEGER      PRIMARY KEY,
    order_id        INTEGER      NOT NULL REFERENCES purchase_order(id),
    invoice_id      INTEGER      NOT NULL REFERENCES invoice(id),
    process_id      INTEGER      REFERENCES billing_process(id),
    run_id          INTEGER      REFERENCES billing_process_run(id),
    periods_included INTEGER     NOT NULL DEFAULT 1,
    period_start    DATE,
    period_end      DATE,
    is_new          SMALLINT     NOT NULL DEFAULT 1,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PLUGGABLE_TASK  (plugin instances)
-- ---------------------------------------------------------------------------
CREATE TABLE pluggable_task (
    id                  INTEGER      PRIMARY KEY,
    entity_id           INTEGER      NOT NULL REFERENCES entity(id),
    type_id             INTEGER      NOT NULL,
    processing_order    INTEGER      NOT NULL DEFAULT 1,
    notes               TEXT,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PLUGGABLE_TASK_PARAMETER  (plugin configuration key/value)
-- ---------------------------------------------------------------------------
CREATE TABLE pluggable_task_parameter (
    id          INTEGER      PRIMARY KEY,
    task_id     INTEGER      NOT NULL REFERENCES pluggable_task(id),
    name        VARCHAR(50)  NOT NULL,
    int_value   INTEGER,
    str_value   VARCHAR(500),
    float_value NUMERIC(22,10),
    optlock     INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- USER_ROLE  (M:M user ↔ role)
-- ---------------------------------------------------------------------------
CREATE TABLE user_role (
    user_id     INTEGER  NOT NULL REFERENCES base_user(id),
    role_id     INTEGER  NOT NULL,  -- 1=SuperAdmin 2=Admin 3=Customer 4=Partner 5=Clerk
    PRIMARY KEY (user_id, role_id)
);

-- ---------------------------------------------------------------------------
-- META_FIELD_NAME  (custom field definitions)
-- ---------------------------------------------------------------------------
CREATE TABLE meta_field_name (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      REFERENCES entity(id),
    name            VARCHAR(100) NOT NULL,
    data_type       VARCHAR(30)  NOT NULL, -- STRING,INTEGER,DECIMAL,BOOLEAN,DATE,LIST
    entity_type     VARCHAR(30)  NOT NULL, -- CUSTOMER,INVOICE,ORDER,PAYMENT,PRODUCT
    mandatory       SMALLINT     NOT NULL DEFAULT 0,
    display_order   INTEGER,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- META_FIELD_VALUE  (custom field values per entity record)
-- ---------------------------------------------------------------------------
CREATE TABLE meta_field_value (
    id              INTEGER      PRIMARY KEY,
    field_name_id   INTEGER      NOT NULL REFERENCES meta_field_name(id),
    string_value    VARCHAR(500),
    integer_value   INTEGER,
    decimal_value   NUMERIC(22,10),
    boolean_value   SMALLINT,
    date_value      DATE,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- NOTIFICATION_MESSAGE  (email/SMS notification templates)
-- ---------------------------------------------------------------------------
CREATE TABLE notification_message (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      NOT NULL REFERENCES entity(id),
    type_id         INTEGER      NOT NULL,  -- 1=invoice 2=payment ok 3=payment failed …
    use_flag        SMALLINT     NOT NULL DEFAULT 1,
    language_id     INTEGER,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PREFERENCE  (entity-level configuration parameters)
-- ---------------------------------------------------------------------------
CREATE TABLE preference (
    id              INTEGER      PRIMARY KEY,
    entity_id       INTEGER      REFERENCES entity(id),
    type_id         INTEGER      NOT NULL,
    int_value       INTEGER,
    str_value       VARCHAR(500),
    float_value     NUMERIC(22,10),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- ORDER_PERIOD  (billing cycle definitions)
-- ---------------------------------------------------------------------------
CREATE TABLE order_period (
    id          INTEGER     PRIMARY KEY,
    entity_id   INTEGER     NOT NULL REFERENCES entity(id),
    unit_id     INTEGER     NOT NULL,   -- 1=day 2=week 3=month 4=year
    value       INTEGER     NOT NULL DEFAULT 1,
    optlock     INTEGER     NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- REPORT  (saved report definitions)
-- ---------------------------------------------------------------------------
CREATE TABLE report (
    id          INTEGER      PRIMARY KEY,
    entity_id   INTEGER      REFERENCES entity(id),
    name        VARCHAR(100) NOT NULL,
    file_name   VARCHAR(200),
    type_id     INTEGER,
    optlock     INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- REPORT_USER  (M:M reports accessible per user)
-- ---------------------------------------------------------------------------
CREATE TABLE report_user (
    report_id   INTEGER NOT NULL REFERENCES report(id),
    user_id     INTEGER NOT NULL REFERENCES base_user(id),
    PRIMARY KEY (report_id, user_id)
);

-- ---------------------------------------------------------------------------
-- MEDIATION_RECORD  (CDR / usage event record)
-- ---------------------------------------------------------------------------
CREATE TABLE mediation_record (
    id              INTEGER      PRIMARY KEY,
    process_id      INTEGER,
    done            TIMESTAMP,
    jbillingkey     VARCHAR(200),
    status_id       INTEGER      NOT NULL DEFAULT 1, -- 1=done 2=error 3=partial
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- MEDIATION_RECORD_LINE  (individual usage lines from mediation)
-- ---------------------------------------------------------------------------
CREATE TABLE mediation_record_line (
    id              INTEGER      PRIMARY KEY,
    record_id       INTEGER      NOT NULL REFERENCES mediation_record(id),
    order_id        INTEGER      REFERENCES purchase_order(id),
    invoice_id      INTEGER      REFERENCES invoice(id),
    amount          NUMERIC(22,10),
    quantity        NUMERIC(22,10),
    status_id       INTEGER      NOT NULL DEFAULT 1,
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PARTNER  (reseller / agent)
-- ---------------------------------------------------------------------------
CREATE TABLE partner (
    id                  INTEGER      PRIMARY KEY REFERENCES base_user(id),
    balance             NUMERIC(22,2) NOT NULL DEFAULT 0,
    total_payments      NUMERIC(22,2) NOT NULL DEFAULT 0,
    total_refunds       NUMERIC(22,2) NOT NULL DEFAULT 0,
    total_payouts       NUMERIC(22,2) NOT NULL DEFAULT 0,
    rate                NUMERIC(10,2),           -- commission %
    one_time_rate       NUMERIC(10,2),
    type                INTEGER      NOT NULL DEFAULT 1, -- 1=referral 2=reseller
    period_unit_id      INTEGER,
    period_value        INTEGER,
    due_payout          NUMERIC(22,2) NOT NULL DEFAULT 0,
    automatic_process   SMALLINT     NOT NULL DEFAULT 0,
    optlock             INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- PARTNER_PAYOUT  (commission payout records)
-- ---------------------------------------------------------------------------
CREATE TABLE partner_payout (
    id              INTEGER      PRIMARY KEY,
    partner_id      INTEGER      NOT NULL REFERENCES partner(id),
    starting_date   DATE         NOT NULL,
    ending_date     DATE         NOT NULL,
    payments_amount NUMERIC(22,2) NOT NULL DEFAULT 0,
    refunds_amount  NUMERIC(22,2) NOT NULL DEFAULT 0,
    balance_left    NUMERIC(22,2) NOT NULL DEFAULT 0,
    payment_id      INTEGER      REFERENCES payment(id),
    optlock         INTEGER      NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------------------------
-- AGEING_CONFIGURATION  (dunning/collections ladder)
-- ---------------------------------------------------------------------------
CREATE TABLE ageing_configuration (
    status_id       INTEGER      PRIMARY KEY,
    entity_id       INTEGER      NOT NULL REFERENCES entity(id),
    days            INTEGER      NOT NULL DEFAULT 0,
    suspended       SMALLINT     NOT NULL DEFAULT 0,
    send_notification SMALLINT   NOT NULL DEFAULT 1,
    optlock         INTEGER      NOT NULL DEFAULT 0
);
