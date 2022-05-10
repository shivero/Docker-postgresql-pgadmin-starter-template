-- create some dummy tables
CREATE TABLE IF NOT EXISTS myApp_dev.public.companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS myApp_dev.public.addresses (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zip_code VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_adresses_companies FOREIGN KEY (company_id) REFERENCES myApp_dev.public.companies(id)
);

CREATE TABLE IF NOT EXISTS myApp_dev.public.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS myApp_dev.public.orders (
    id SERIAL PRIMARY KEY,
    company_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_companies FOREIGN KEY (company_id) REFERENCES myApp_dev.public.companies(id),
    CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES myApp_dev.public.products(id)
);