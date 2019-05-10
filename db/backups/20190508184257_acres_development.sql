PGDMP     9    *                w            acres_development    9.5.14    9.5.14 t   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    308245    acres_development    DATABASE     �   CREATE DATABASE acres_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
 !   DROP DATABASE acres_development;
             acres_admin    false                        2615    308999    acres    SCHEMA        CREATE SCHEMA acres;
    DROP SCHEMA acres;
             acres_admin    false            	            2615    318984    demo    SCHEMA        CREATE SCHEMA demo;
    DROP SCHEMA demo;
             acres_admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                        3079    12401    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    309002    accounts    TABLE     %  CREATE TABLE acres.accounts (
    id bigint NOT NULL,
    company character varying NOT NULL,
    subdomain character varying NOT NULL,
    status boolean,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.accounts;
       acres         acres_admin    false    8            �            1259    309000    accounts_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.accounts_id_seq;
       acres       acres_admin    false    226    8            �           0    0    accounts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.accounts_id_seq OWNED BY acres.accounts.id;
            acres       acres_admin    false    225            �            1259    309014    app_configs    TABLE       CREATE TABLE acres.app_configs (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    icon character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.app_configs;
       acres         acres_admin    false    8            �            1259    309012    app_configs_id_seq    SEQUENCE     z   CREATE SEQUENCE acres.app_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE acres.app_configs_id_seq;
       acres       acres_admin    false    228    8            �           0    0    app_configs_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE acres.app_configs_id_seq OWNED BY acres.app_configs.id;
            acres       acres_admin    false    227            
           1259    309367    ar_internal_metadata    TABLE     �   CREATE TABLE acres.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE acres.ar_internal_metadata;
       acres         acres_admin    false    8            �            1259    309026    bank_commission_editions    TABLE     �  CREATE TABLE acres.bank_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    bank_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 +   DROP TABLE acres.bank_commission_editions;
       acres         acres_admin    false    8            �            1259    309024    bank_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.bank_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE acres.bank_commission_editions_id_seq;
       acres       acres_admin    false    230    8            �           0    0    bank_commission_editions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE acres.bank_commission_editions_id_seq OWNED BY acres.bank_commission_editions.id;
            acres       acres_admin    false    229            8           1259    339384    bank_commission_rate_trackers    TABLE     �  CREATE TABLE acres.bank_commission_rate_trackers (
    id bigint NOT NULL,
    start_date timestamp without time zone,
    old_rate double precision DEFAULT 0.0,
    new_rate double precision DEFAULT 0.0,
    bank_id bigint,
    user_id bigint,
    status character varying DEFAULT 'enable'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 0   DROP TABLE acres.bank_commission_rate_trackers;
       acres         acres_admin    false    8            7           1259    339382 $   bank_commission_rate_trackers_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.bank_commission_rate_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE acres.bank_commission_rate_trackers_id_seq;
       acres       acres_admin    false    312    8            �           0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE acres.bank_commission_rate_trackers_id_seq OWNED BY acres.bank_commission_rate_trackers.id;
            acres       acres_admin    false    311            �            1259    309040    banks    TABLE     �  CREATE TABLE acres.banks (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    phone character varying,
    address character varying,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number_of_remaining_days integer DEFAULT 0,
    company_remaining_commission_rate double precision DEFAULT 0.0
);
    DROP TABLE acres.banks;
       acres         acres_admin    false    8            �            1259    309038    banks_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.banks_id_seq;
       acres       acres_admin    false    8    232            �           0    0    banks_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.banks_id_seq OWNED BY acres.banks.id;
            acres       acres_admin    false    231            �            1259    309057    commission_settings    TABLE     �  CREATE TABLE acres.commission_settings (
    id bigint NOT NULL,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE acres.commission_settings;
       acres         acres_admin    false    8            �            1259    309055    commission_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.commission_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.commission_settings_id_seq;
       acres       acres_admin    false    234    8            �           0    0    commission_settings_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.commission_settings_id_seq OWNED BY acres.commission_settings.id;
            acres       acres_admin    false    233            �            1259    309073    commissions    TABLE       CREATE TABLE acres.commissions (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    notary_name character varying,
    bank_name character varying,
    contributor_name character varying,
    producer_name character varying,
    company_name character varying,
    contributor_commission_percentage double precision DEFAULT 0.0,
    contributor_commission double precision DEFAULT 0.0,
    producer_commission_percentage double precision DEFAULT 0.0,
    producer_commission double precision DEFAULT 0.0,
    bank_commission_percentage double precision DEFAULT 0.0,
    bank_commission double precision DEFAULT 0.0,
    company_commission_percentage double precision DEFAULT 0.0,
    company_commission double precision DEFAULT 0.0,
    amount_credit double precision DEFAULT 0.0,
    total_amount double precision DEFAULT 0.0,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.commissions;
       acres         acres_admin    false    8            �            1259    309071    commissions_id_seq    SEQUENCE     z   CREATE SEQUENCE acres.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE acres.commissions_id_seq;
       acres       acres_admin    false    8    236            �           0    0    commissions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE acres.commissions_id_seq OWNED BY acres.commissions.id;
            acres       acres_admin    false    235            �            1259    309095 	   companies    TABLE       CREATE TABLE acres.companies (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    brand_file_name character varying,
    brand_content_type character varying,
    brand_file_size integer,
    brand_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.companies;
       acres         acres_admin    false    8            �            1259    309093    companies_id_seq    SEQUENCE     x   CREATE SEQUENCE acres.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE acres.companies_id_seq;
       acres       acres_admin    false    238    8            �           0    0    companies_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acres.companies_id_seq OWNED BY acres.companies.id;
            acres       acres_admin    false    237            �            1259    309107    config_options    TABLE     x  CREATE TABLE acres.config_options (
    id bigint NOT NULL,
    app_name character varying,
    admin_name character varying,
    admin_email character varying,
    admin_password character varying,
    admin_role character varying DEFAULT 'Admin'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE acres.config_options;
       acres         acres_admin    false    8            �            1259    309105    config_options_id_seq    SEQUENCE     }   CREATE SEQUENCE acres.config_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE acres.config_options_id_seq;
       acres       acres_admin    false    8    240            �           0    0    config_options_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE acres.config_options_id_seq OWNED BY acres.config_options.id;
            acres       acres_admin    false    239            �            1259    309119    credit_details    TABLE     ,  CREATE TABLE acres.credit_details (
    id bigint NOT NULL,
    installment_payment character varying,
    installment_date date,
    commission double precision DEFAULT 0.0,
    cumulative_amount double precision DEFAULT 0.0,
    paid_by_bank character varying DEFAULT 'Non'::character varying,
    paid_to_contributor_or_producer character varying DEFAULT 'Non'::character varying,
    "creditUid" bigint NOT NULL,
    credit_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE acres.credit_details;
       acres         acres_admin    false    8            �            1259    309117    credit_details_id_seq    SEQUENCE     }   CREATE SEQUENCE acres.credit_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE acres.credit_details_id_seq;
       acres       acres_admin    false    242    8            �           0    0    credit_details_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE acres.credit_details_id_seq OWNED BY acres.credit_details.id;
            acres       acres_admin    false    241            �            1259    309135    credits    TABLE     2  CREATE TABLE acres.credits (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    bank_id integer,
    amount double precision,
    bank_name character varying,
    customer_name character varying,
    producer_id integer,
    producer_name character varying,
    contributor_id integer,
    contributor_name character varying,
    notary_name character varying,
    hypoplus character varying,
    total_commission_bank double precision,
    total_commission_producer double precision,
    total_commission_contributor double precision,
    total_commission_company double precision,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.credits;
       acres         acres_admin    false    8            �            1259    309133    credits_id_seq    SEQUENCE     v   CREATE SEQUENCE acres.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE acres.credits_id_seq;
       acres       acres_admin    false    244    8            �           0    0    credits_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE acres.credits_id_seq OWNED BY acres.credits.id;
            acres       acres_admin    false    243            �            1259    309147 	   customers    TABLE     6  CREATE TABLE acres.customers (
    id bigint NOT NULL,
    gender character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    full_name character varying
);
    DROP TABLE acres.customers;
       acres         acres_admin    false    8            �            1259    309145    customers_id_seq    SEQUENCE     x   CREATE SEQUENCE acres.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE acres.customers_id_seq;
       acres       acres_admin    false    246    8            �           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acres.customers_id_seq OWNED BY acres.customers.id;
            acres       acres_admin    false    245            �            1259    309159    friendly_id_slugs    TABLE     �   CREATE TABLE acres.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 $   DROP TABLE acres.friendly_id_slugs;
       acres         acres_admin    false    8            �            1259    309157    friendly_id_slugs_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE acres.friendly_id_slugs_id_seq;
       acres       acres_admin    false    8    248            �           0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE acres.friendly_id_slugs_id_seq OWNED BY acres.friendly_id_slugs.id;
            acres       acres_admin    false    247            �            1259    309174    logs    TABLE     I  CREATE TABLE acres.logs (
    id bigint NOT NULL,
    file_name character varying,
    no_record double precision,
    error character varying,
    status boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.logs;
       acres         acres_admin    false    8            �            1259    309172    logs_id_seq    SEQUENCE     s   CREATE SEQUENCE acres.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE acres.logs_id_seq;
       acres       acres_admin    false    250    8            �           0    0    logs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE acres.logs_id_seq OWNED BY acres.logs.id;
            acres       acres_admin    false    249            �            1259    309186    mail_configurations    TABLE     �  CREATE TABLE acres.mail_configurations (
    id bigint NOT NULL,
    host character varying,
    user_name character varying,
    password character varying,
    domain character varying,
    address character varying,
    port integer,
    authentication character varying,
    enable_starttls_auto boolean,
    ssl boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE acres.mail_configurations;
       acres         acres_admin    false    8            �            1259    309184    mail_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.mail_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.mail_configurations_id_seq;
       acres       acres_admin    false    252    8            �           0    0    mail_configurations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.mail_configurations_id_seq OWNED BY acres.mail_configurations.id;
            acres       acres_admin    false    251            �            1259    309198    notaries    TABLE     9  CREATE TABLE acres.notaries (
    id bigint NOT NULL,
    full_name character varying,
    address character varying,
    phone character varying,
    email character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.notaries;
       acres         acres_admin    false    8            �            1259    309196    notaries_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.notaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.notaries_id_seq;
       acres       acres_admin    false    254    8            �           0    0    notaries_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.notaries_id_seq OWNED BY acres.notaries.id;
            acres       acres_admin    false    253            >           1259    397247    payment_delays    TABLE     ?  CREATE TABLE acres.payment_delays (
    id bigint NOT NULL,
    first_installment character varying,
    monthly_deadlines_before_payment integer,
    monthly_installments character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE acres.payment_delays;
       acres         acres_admin    false    8            =           1259    397245    payment_delays_id_seq    SEQUENCE     }   CREATE SEQUENCE acres.payment_delays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE acres.payment_delays_id_seq;
       acres       acres_admin    false    8    318            �           0    0    payment_delays_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE acres.payment_delays_id_seq OWNED BY acres.payment_delays.id;
            acres       acres_admin    false    317                        1259    309210    profiles    TABLE     �  CREATE TABLE acres.profiles (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    address character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.profiles;
       acres         acres_admin    false    8            �            1259    309208    profiles_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.profiles_id_seq;
       acres       acres_admin    false    8    256            �           0    0    profiles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.profiles_id_seq OWNED BY acres.profiles.id;
            acres       acres_admin    false    255                       1259    309222    roles    TABLE     �   CREATE TABLE acres.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.roles;
       acres         acres_admin    false    8                       1259    309220    roles_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.roles_id_seq;
       acres       acres_admin    false    258    8            �           0    0    roles_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.roles_id_seq OWNED BY acres.roles.id;
            acres       acres_admin    false    257            	           1259    309359    schema_migrations    TABLE     Q   CREATE TABLE acres.schema_migrations (
    version character varying NOT NULL
);
 $   DROP TABLE acres.schema_migrations;
       acres         acres_admin    false    8                       1259    309233    super_admin_configs    TABLE       CREATE TABLE acres.super_admin_configs (
    id bigint NOT NULL,
    login character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE acres.super_admin_configs;
       acres         acres_admin    false    8                       1259    309231    super_admin_configs_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.super_admin_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.super_admin_configs_id_seq;
       acres       acres_admin    false    260    8            �           0    0    super_admin_configs_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.super_admin_configs_id_seq OWNED BY acres.super_admin_configs.id;
            acres       acres_admin    false    259                       1259    309244    user_commission_editions    TABLE     �  CREATE TABLE acres.user_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    commission_setting_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 +   DROP TABLE acres.user_commission_editions;
       acres         acres_admin    false    8                       1259    309242    user_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.user_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE acres.user_commission_editions_id_seq;
       acres       acres_admin    false    262    8            �           0    0    user_commission_editions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE acres.user_commission_editions_id_seq OWNED BY acres.user_commission_editions.id;
            acres       acres_admin    false    261                       1259    309258    users    TABLE     ]  CREATE TABLE acres.users (
    id bigint NOT NULL,
    full_name character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    role character varying NOT NULL,
    status character varying DEFAULT 'enable'::character varying NOT NULL,
    receives_notifications boolean DEFAULT false,
    created_by bigint,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    receives_summaries boolean DEFAULT false
);
    DROP TABLE acres.users;
       acres         acres_admin    false    8                       1259    309256    users_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.users_id_seq;
       acres       acres_admin    false    264    8            �           0    0    users_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.users_id_seq OWNED BY acres.users.id;
            acres       acres_admin    false    263                       1259    318987    accounts    TABLE     $  CREATE TABLE demo.accounts (
    id bigint NOT NULL,
    company character varying NOT NULL,
    subdomain character varying NOT NULL,
    status boolean,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.accounts;
       demo         acres_admin    false    9                       1259    318985    accounts_id_seq    SEQUENCE     v   CREATE SEQUENCE demo.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.accounts_id_seq;
       demo       acres_admin    false    268    9            �           0    0    accounts_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE demo.accounts_id_seq OWNED BY demo.accounts.id;
            demo       acres_admin    false    267                       1259    318999    app_configs    TABLE       CREATE TABLE demo.app_configs (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    icon character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.app_configs;
       demo         acres_admin    false    9                       1259    318997    app_configs_id_seq    SEQUENCE     y   CREATE SEQUENCE demo.app_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE demo.app_configs_id_seq;
       demo       acres_admin    false    270    9            �           0    0    app_configs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE demo.app_configs_id_seq OWNED BY demo.app_configs.id;
            demo       acres_admin    false    269            4           1259    319352    ar_internal_metadata    TABLE     �   CREATE TABLE demo.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE demo.ar_internal_metadata;
       demo         acres_admin    false    9                       1259    319011    bank_commission_editions    TABLE     �  CREATE TABLE demo.bank_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    bank_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 *   DROP TABLE demo.bank_commission_editions;
       demo         acres_admin    false    9                       1259    319009    bank_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.bank_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE demo.bank_commission_editions_id_seq;
       demo       acres_admin    false    272    9            �           0    0    bank_commission_editions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE demo.bank_commission_editions_id_seq OWNED BY demo.bank_commission_editions.id;
            demo       acres_admin    false    271            :           1259    339410    bank_commission_rate_trackers    TABLE     �  CREATE TABLE demo.bank_commission_rate_trackers (
    id bigint NOT NULL,
    start_date timestamp without time zone,
    old_rate double precision DEFAULT 0.0,
    new_rate double precision DEFAULT 0.0,
    bank_id bigint,
    user_id bigint,
    status character varying DEFAULT 'enable'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 /   DROP TABLE demo.bank_commission_rate_trackers;
       demo         acres_admin    false    9            9           1259    339408 $   bank_commission_rate_trackers_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.bank_commission_rate_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE demo.bank_commission_rate_trackers_id_seq;
       demo       acres_admin    false    314    9            �           0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE demo.bank_commission_rate_trackers_id_seq OWNED BY demo.bank_commission_rate_trackers.id;
            demo       acres_admin    false    313                       1259    319025    banks    TABLE     �  CREATE TABLE demo.banks (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    phone character varying,
    address character varying,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number_of_remaining_days integer DEFAULT 0,
    company_remaining_commission_rate double precision DEFAULT 0.0
);
    DROP TABLE demo.banks;
       demo         acres_admin    false    9                       1259    319023    banks_id_seq    SEQUENCE     s   CREATE SEQUENCE demo.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE demo.banks_id_seq;
       demo       acres_admin    false    274    9            �           0    0    banks_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE demo.banks_id_seq OWNED BY demo.banks.id;
            demo       acres_admin    false    273                       1259    319042    commission_settings    TABLE     �  CREATE TABLE demo.commission_settings (
    id bigint NOT NULL,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 %   DROP TABLE demo.commission_settings;
       demo         acres_admin    false    9                       1259    319040    commission_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.commission_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE demo.commission_settings_id_seq;
       demo       acres_admin    false    276    9            �           0    0    commission_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE demo.commission_settings_id_seq OWNED BY demo.commission_settings.id;
            demo       acres_admin    false    275                       1259    319058    commissions    TABLE     
  CREATE TABLE demo.commissions (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    notary_name character varying,
    bank_name character varying,
    contributor_name character varying,
    producer_name character varying,
    company_name character varying,
    contributor_commission_percentage double precision DEFAULT 0.0,
    contributor_commission double precision DEFAULT 0.0,
    producer_commission_percentage double precision DEFAULT 0.0,
    producer_commission double precision DEFAULT 0.0,
    bank_commission_percentage double precision DEFAULT 0.0,
    bank_commission double precision DEFAULT 0.0,
    company_commission_percentage double precision DEFAULT 0.0,
    company_commission double precision DEFAULT 0.0,
    amount_credit double precision DEFAULT 0.0,
    total_amount double precision DEFAULT 0.0,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.commissions;
       demo         acres_admin    false    9                       1259    319056    commissions_id_seq    SEQUENCE     y   CREATE SEQUENCE demo.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE demo.commissions_id_seq;
       demo       acres_admin    false    9    278            �           0    0    commissions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE demo.commissions_id_seq OWNED BY demo.commissions.id;
            demo       acres_admin    false    277                       1259    319080 	   companies    TABLE       CREATE TABLE demo.companies (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    brand_file_name character varying,
    brand_content_type character varying,
    brand_file_size integer,
    brand_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.companies;
       demo         acres_admin    false    9                       1259    319078    companies_id_seq    SEQUENCE     w   CREATE SEQUENCE demo.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE demo.companies_id_seq;
       demo       acres_admin    false    280    9            �           0    0    companies_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE demo.companies_id_seq OWNED BY demo.companies.id;
            demo       acres_admin    false    279                       1259    319092    config_options    TABLE     w  CREATE TABLE demo.config_options (
    id bigint NOT NULL,
    app_name character varying,
    admin_name character varying,
    admin_email character varying,
    admin_password character varying,
    admin_role character varying DEFAULT 'Admin'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE demo.config_options;
       demo         acres_admin    false    9                       1259    319090    config_options_id_seq    SEQUENCE     |   CREATE SEQUENCE demo.config_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE demo.config_options_id_seq;
       demo       acres_admin    false    282    9            �           0    0    config_options_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE demo.config_options_id_seq OWNED BY demo.config_options.id;
            demo       acres_admin    false    281                       1259    319104    credit_details    TABLE     +  CREATE TABLE demo.credit_details (
    id bigint NOT NULL,
    installment_payment character varying,
    installment_date date,
    commission double precision DEFAULT 0.0,
    cumulative_amount double precision DEFAULT 0.0,
    paid_by_bank character varying DEFAULT 'Non'::character varying,
    paid_to_contributor_or_producer character varying DEFAULT 'Non'::character varying,
    "creditUid" bigint NOT NULL,
    credit_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE demo.credit_details;
       demo         acres_admin    false    9                       1259    319102    credit_details_id_seq    SEQUENCE     |   CREATE SEQUENCE demo.credit_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE demo.credit_details_id_seq;
       demo       acres_admin    false    284    9            �           0    0    credit_details_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE demo.credit_details_id_seq OWNED BY demo.credit_details.id;
            demo       acres_admin    false    283                       1259    319120    credits    TABLE     1  CREATE TABLE demo.credits (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    bank_id integer,
    amount double precision,
    bank_name character varying,
    customer_name character varying,
    producer_id integer,
    producer_name character varying,
    contributor_id integer,
    contributor_name character varying,
    notary_name character varying,
    hypoplus character varying,
    total_commission_bank double precision,
    total_commission_producer double precision,
    total_commission_contributor double precision,
    total_commission_company double precision,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.credits;
       demo         acres_admin    false    9                       1259    319118    credits_id_seq    SEQUENCE     u   CREATE SEQUENCE demo.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.credits_id_seq;
       demo       acres_admin    false    9    286            �           0    0    credits_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE demo.credits_id_seq OWNED BY demo.credits.id;
            demo       acres_admin    false    285                        1259    319132 	   customers    TABLE     5  CREATE TABLE demo.customers (
    id bigint NOT NULL,
    gender character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    full_name character varying
);
    DROP TABLE demo.customers;
       demo         acres_admin    false    9                       1259    319130    customers_id_seq    SEQUENCE     w   CREATE SEQUENCE demo.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE demo.customers_id_seq;
       demo       acres_admin    false    288    9            �           0    0    customers_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE demo.customers_id_seq OWNED BY demo.customers.id;
            demo       acres_admin    false    287            "           1259    319144    friendly_id_slugs    TABLE     �   CREATE TABLE demo.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 #   DROP TABLE demo.friendly_id_slugs;
       demo         acres_admin    false    9            !           1259    319142    friendly_id_slugs_id_seq    SEQUENCE        CREATE SEQUENCE demo.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE demo.friendly_id_slugs_id_seq;
       demo       acres_admin    false    290    9            �           0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE demo.friendly_id_slugs_id_seq OWNED BY demo.friendly_id_slugs.id;
            demo       acres_admin    false    289            $           1259    319159    logs    TABLE     H  CREATE TABLE demo.logs (
    id bigint NOT NULL,
    file_name character varying,
    no_record double precision,
    error character varying,
    status boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.logs;
       demo         acres_admin    false    9            #           1259    319157    logs_id_seq    SEQUENCE     r   CREATE SEQUENCE demo.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE demo.logs_id_seq;
       demo       acres_admin    false    292    9            �           0    0    logs_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE demo.logs_id_seq OWNED BY demo.logs.id;
            demo       acres_admin    false    291            &           1259    319171    mail_configurations    TABLE     �  CREATE TABLE demo.mail_configurations (
    id bigint NOT NULL,
    host character varying,
    user_name character varying,
    password character varying,
    domain character varying,
    address character varying,
    port integer,
    authentication character varying,
    enable_starttls_auto boolean,
    ssl boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 %   DROP TABLE demo.mail_configurations;
       demo         acres_admin    false    9            %           1259    319169    mail_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.mail_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE demo.mail_configurations_id_seq;
       demo       acres_admin    false    9    294            �           0    0    mail_configurations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE demo.mail_configurations_id_seq OWNED BY demo.mail_configurations.id;
            demo       acres_admin    false    293            (           1259    319183    notaries    TABLE     8  CREATE TABLE demo.notaries (
    id bigint NOT NULL,
    full_name character varying,
    address character varying,
    phone character varying,
    email character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.notaries;
       demo         acres_admin    false    9            '           1259    319181    notaries_id_seq    SEQUENCE     v   CREATE SEQUENCE demo.notaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.notaries_id_seq;
       demo       acres_admin    false    296    9            �           0    0    notaries_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE demo.notaries_id_seq OWNED BY demo.notaries.id;
            demo       acres_admin    false    295            @           1259    397264    payment_delays    TABLE     >  CREATE TABLE demo.payment_delays (
    id bigint NOT NULL,
    first_installment character varying,
    monthly_deadlines_before_payment integer,
    monthly_installments character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE demo.payment_delays;
       demo         acres_admin    false    9            ?           1259    397262    payment_delays_id_seq    SEQUENCE     |   CREATE SEQUENCE demo.payment_delays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE demo.payment_delays_id_seq;
       demo       acres_admin    false    320    9            �           0    0    payment_delays_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE demo.payment_delays_id_seq OWNED BY demo.payment_delays.id;
            demo       acres_admin    false    319            *           1259    319195    profiles    TABLE     �  CREATE TABLE demo.profiles (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    address character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.profiles;
       demo         acres_admin    false    9            )           1259    319193    profiles_id_seq    SEQUENCE     v   CREATE SEQUENCE demo.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.profiles_id_seq;
       demo       acres_admin    false    298    9            �           0    0    profiles_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE demo.profiles_id_seq OWNED BY demo.profiles.id;
            demo       acres_admin    false    297            ,           1259    319207    roles    TABLE     �   CREATE TABLE demo.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE demo.roles;
       demo         acres_admin    false    9            +           1259    319205    roles_id_seq    SEQUENCE     s   CREATE SEQUENCE demo.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE demo.roles_id_seq;
       demo       acres_admin    false    9    300            �           0    0    roles_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE demo.roles_id_seq OWNED BY demo.roles.id;
            demo       acres_admin    false    299            3           1259    319344    schema_migrations    TABLE     P   CREATE TABLE demo.schema_migrations (
    version character varying NOT NULL
);
 #   DROP TABLE demo.schema_migrations;
       demo         acres_admin    false    9            .           1259    319218    super_admin_configs    TABLE       CREATE TABLE demo.super_admin_configs (
    id bigint NOT NULL,
    login character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 %   DROP TABLE demo.super_admin_configs;
       demo         acres_admin    false    9            -           1259    319216    super_admin_configs_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.super_admin_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE demo.super_admin_configs_id_seq;
       demo       acres_admin    false    302    9            �           0    0    super_admin_configs_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE demo.super_admin_configs_id_seq OWNED BY demo.super_admin_configs.id;
            demo       acres_admin    false    301            0           1259    319229    user_commission_editions    TABLE     �  CREATE TABLE demo.user_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    commission_setting_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 *   DROP TABLE demo.user_commission_editions;
       demo         acres_admin    false    9            /           1259    319227    user_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE demo.user_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE demo.user_commission_editions_id_seq;
       demo       acres_admin    false    9    304            �           0    0    user_commission_editions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE demo.user_commission_editions_id_seq OWNED BY demo.user_commission_editions.id;
            demo       acres_admin    false    303            2           1259    319243    users    TABLE     \  CREATE TABLE demo.users (
    id bigint NOT NULL,
    full_name character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    role character varying NOT NULL,
    status character varying DEFAULT 'enable'::character varying NOT NULL,
    receives_notifications boolean DEFAULT false,
    created_by bigint,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    receives_summaries boolean DEFAULT false
);
    DROP TABLE demo.users;
       demo         acres_admin    false    9            1           1259    319241    users_id_seq    SEQUENCE     s   CREATE SEQUENCE demo.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE demo.users_id_seq;
       demo       acres_admin    false    306    9            �           0    0    users_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE demo.users_id_seq OWNED BY demo.users.id;
            demo       acres_admin    false    305            �            1259    308249    accounts    TABLE     &  CREATE TABLE public.accounts (
    id bigint NOT NULL,
    company character varying NOT NULL,
    subdomain character varying NOT NULL,
    status boolean,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.accounts;
       public         acres_admin    false    6            �            1259    308247    accounts_id_seq    SEQUENCE     x   CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public       acres_admin    false    6    184            �           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
            public       acres_admin    false    183            �            1259    308261    app_configs    TABLE       CREATE TABLE public.app_configs (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    icon character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.app_configs;
       public         acres_admin    false    6            �            1259    308259    app_configs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.app_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.app_configs_id_seq;
       public       acres_admin    false    6    186            �           0    0    app_configs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.app_configs_id_seq OWNED BY public.app_configs.id;
            public       acres_admin    false    185            �            1259    308614    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         acres_admin    false    6            �            1259    308273    bank_commission_editions    TABLE     �  CREATE TABLE public.bank_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    bank_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.bank_commission_editions;
       public         acres_admin    false    6            �            1259    308271    bank_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bank_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.bank_commission_editions_id_seq;
       public       acres_admin    false    188    6            �           0    0    bank_commission_editions_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.bank_commission_editions_id_seq OWNED BY public.bank_commission_editions.id;
            public       acres_admin    false    187            6           1259    339358    bank_commission_rate_trackers    TABLE     �  CREATE TABLE public.bank_commission_rate_trackers (
    id bigint NOT NULL,
    start_date timestamp without time zone,
    old_rate double precision DEFAULT 0.0,
    new_rate double precision DEFAULT 0.0,
    bank_id bigint,
    user_id bigint,
    status character varying DEFAULT 'enable'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 1   DROP TABLE public.bank_commission_rate_trackers;
       public         acres_admin    false    6            5           1259    339356 $   bank_commission_rate_trackers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bank_commission_rate_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.bank_commission_rate_trackers_id_seq;
       public       acres_admin    false    6    310            �           0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.bank_commission_rate_trackers_id_seq OWNED BY public.bank_commission_rate_trackers.id;
            public       acres_admin    false    309            �            1259    308287    banks    TABLE     �  CREATE TABLE public.banks (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    phone character varying,
    address character varying,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number_of_remaining_days integer DEFAULT 0,
    company_remaining_commission_rate double precision DEFAULT 0.0
);
    DROP TABLE public.banks;
       public         acres_admin    false    6            �            1259    308285    banks_id_seq    SEQUENCE     u   CREATE SEQUENCE public.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banks_id_seq;
       public       acres_admin    false    190    6            �           0    0    banks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;
            public       acres_admin    false    189            �            1259    308304    commission_settings    TABLE     �  CREATE TABLE public.commission_settings (
    id bigint NOT NULL,
    commission_percentage double precision DEFAULT 0.0,
    hypoplus_commission_percentage double precision DEFAULT 0.0,
    first_installment double precision DEFAULT 0.0,
    number_of_dates integer DEFAULT 0,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.commission_settings;
       public         acres_admin    false    6            �            1259    308302    commission_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commission_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.commission_settings_id_seq;
       public       acres_admin    false    192    6            �           0    0    commission_settings_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.commission_settings_id_seq OWNED BY public.commission_settings.id;
            public       acres_admin    false    191            �            1259    308320    commissions    TABLE       CREATE TABLE public.commissions (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    notary_name character varying,
    bank_name character varying,
    contributor_name character varying,
    producer_name character varying,
    company_name character varying,
    contributor_commission_percentage double precision DEFAULT 0.0,
    contributor_commission double precision DEFAULT 0.0,
    producer_commission_percentage double precision DEFAULT 0.0,
    producer_commission double precision DEFAULT 0.0,
    bank_commission_percentage double precision DEFAULT 0.0,
    bank_commission double precision DEFAULT 0.0,
    company_commission_percentage double precision DEFAULT 0.0,
    company_commission double precision DEFAULT 0.0,
    amount_credit double precision DEFAULT 0.0,
    total_amount double precision DEFAULT 0.0,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.commissions;
       public         acres_admin    false    6            �            1259    308318    commissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.commissions_id_seq;
       public       acres_admin    false    194    6            �           0    0    commissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.commissions_id_seq OWNED BY public.commissions.id;
            public       acres_admin    false    193            �            1259    308342 	   companies    TABLE       CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    brand_file_name character varying,
    brand_content_type character varying,
    brand_file_size integer,
    brand_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.companies;
       public         acres_admin    false    6            �            1259    308340    companies_id_seq    SEQUENCE     y   CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public       acres_admin    false    196    6            �           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
            public       acres_admin    false    195            �            1259    308354    config_options    TABLE     y  CREATE TABLE public.config_options (
    id bigint NOT NULL,
    app_name character varying,
    admin_name character varying,
    admin_email character varying,
    admin_password character varying,
    admin_role character varying DEFAULT 'Admin'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.config_options;
       public         acres_admin    false    6            �            1259    308352    config_options_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.config_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.config_options_id_seq;
       public       acres_admin    false    6    198            �           0    0    config_options_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.config_options_id_seq OWNED BY public.config_options.id;
            public       acres_admin    false    197            �            1259    308366    credit_details    TABLE     -  CREATE TABLE public.credit_details (
    id bigint NOT NULL,
    installment_payment character varying,
    installment_date date,
    commission double precision DEFAULT 0.0,
    cumulative_amount double precision DEFAULT 0.0,
    paid_by_bank character varying DEFAULT 'Non'::character varying,
    paid_to_contributor_or_producer character varying DEFAULT 'Non'::character varying,
    "creditUid" bigint NOT NULL,
    credit_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.credit_details;
       public         acres_admin    false    6            �            1259    308364    credit_details_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.credit_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.credit_details_id_seq;
       public       acres_admin    false    6    200            �           0    0    credit_details_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.credit_details_id_seq OWNED BY public.credit_details.id;
            public       acres_admin    false    199            �            1259    308382    credits    TABLE     3  CREATE TABLE public.credits (
    id bigint NOT NULL,
    credit_id bigint,
    production_date date,
    acte_date date,
    customer_id integer,
    bank_id integer,
    amount double precision,
    bank_name character varying,
    customer_name character varying,
    producer_id integer,
    producer_name character varying,
    contributor_id integer,
    contributor_name character varying,
    notary_name character varying,
    hypoplus character varying,
    total_commission_bank double precision,
    total_commission_producer double precision,
    total_commission_contributor double precision,
    total_commission_company double precision,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.credits;
       public         acres_admin    false    6            �            1259    308380    credits_id_seq    SEQUENCE     w   CREATE SEQUENCE public.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.credits_id_seq;
       public       acres_admin    false    6    202            �           0    0    credits_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.credits_id_seq OWNED BY public.credits.id;
            public       acres_admin    false    201            �            1259    308394 	   customers    TABLE     7  CREATE TABLE public.customers (
    id bigint NOT NULL,
    gender character varying,
    address character varying,
    city character varying,
    country character varying,
    phone character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    full_name character varying
);
    DROP TABLE public.customers;
       public         acres_admin    false    6            �            1259    308392    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public       acres_admin    false    6    204            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
            public       acres_admin    false    203            �            1259    308406    friendly_id_slugs    TABLE     �   CREATE TABLE public.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 %   DROP TABLE public.friendly_id_slugs;
       public         acres_admin    false    6            �            1259    308404    friendly_id_slugs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.friendly_id_slugs_id_seq;
       public       acres_admin    false    206    6            �           0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;
            public       acres_admin    false    205            �            1259    308421    logs    TABLE     J  CREATE TABLE public.logs (
    id bigint NOT NULL,
    file_name character varying,
    no_record double precision,
    error character varying,
    status boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.logs;
       public         acres_admin    false    6            �            1259    308419    logs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public       acres_admin    false    6    208            �           0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
            public       acres_admin    false    207            �            1259    308433    mail_configurations    TABLE     �  CREATE TABLE public.mail_configurations (
    id bigint NOT NULL,
    host character varying,
    user_name character varying,
    password character varying,
    domain character varying,
    address character varying,
    port integer,
    authentication character varying,
    enable_starttls_auto boolean,
    ssl boolean,
    slug character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.mail_configurations;
       public         acres_admin    false    6            �            1259    308431    mail_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mail_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.mail_configurations_id_seq;
       public       acres_admin    false    210    6            �           0    0    mail_configurations_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.mail_configurations_id_seq OWNED BY public.mail_configurations.id;
            public       acres_admin    false    209            �            1259    308445    notaries    TABLE     :  CREATE TABLE public.notaries (
    id bigint NOT NULL,
    full_name character varying,
    address character varying,
    phone character varying,
    email character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.notaries;
       public         acres_admin    false    6            �            1259    308443    notaries_id_seq    SEQUENCE     x   CREATE SEQUENCE public.notaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.notaries_id_seq;
       public       acres_admin    false    6    212            �           0    0    notaries_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.notaries_id_seq OWNED BY public.notaries.id;
            public       acres_admin    false    211            <           1259    397230    payment_delays    TABLE     @  CREATE TABLE public.payment_delays (
    id bigint NOT NULL,
    first_installment character varying,
    monthly_deadlines_before_payment integer,
    monthly_installments character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 "   DROP TABLE public.payment_delays;
       public         acres_admin    false    6            ;           1259    397228    payment_delays_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.payment_delays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.payment_delays_id_seq;
       public       acres_admin    false    316    6            �           0    0    payment_delays_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.payment_delays_id_seq OWNED BY public.payment_delays.id;
            public       acres_admin    false    315            �            1259    308457    profiles    TABLE     �  CREATE TABLE public.profiles (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    address character varying,
    slug character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.profiles;
       public         acres_admin    false    6            �            1259    308455    profiles_id_seq    SEQUENCE     x   CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public       acres_admin    false    6    214            �           0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
            public       acres_admin    false    213            �            1259    308469    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         acres_admin    false    6            �            1259    308467    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       acres_admin    false    6    216            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       acres_admin    false    215            �            1259    308606    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         acres_admin    false    6            �            1259    308480    super_admin_configs    TABLE       CREATE TABLE public.super_admin_configs (
    id bigint NOT NULL,
    login character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.super_admin_configs;
       public         acres_admin    false    6            �            1259    308478    super_admin_configs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.super_admin_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.super_admin_configs_id_seq;
       public       acres_admin    false    6    218            �           0    0    super_admin_configs_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.super_admin_configs_id_seq OWNED BY public.super_admin_configs.id;
            public       acres_admin    false    217            �            1259    308491    user_commission_editions    TABLE     �  CREATE TABLE public.user_commission_editions (
    id bigint NOT NULL,
    date_effet date,
    completed character varying DEFAULT 'no'::character varying,
    old_value double precision,
    new_value double precision,
    commission_setting_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.user_commission_editions;
       public         acres_admin    false    6            �            1259    308489    user_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.user_commission_editions_id_seq;
       public       acres_admin    false    220    6            �           0    0    user_commission_editions_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.user_commission_editions_id_seq OWNED BY public.user_commission_editions.id;
            public       acres_admin    false    219            �            1259    308505    users    TABLE     ^  CREATE TABLE public.users (
    id bigint NOT NULL,
    full_name character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    role character varying NOT NULL,
    status character varying DEFAULT 'enable'::character varying NOT NULL,
    receives_notifications boolean DEFAULT false,
    created_by bigint,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    receives_summaries boolean DEFAULT false
);
    DROP TABLE public.users;
       public         acres_admin    false    6            �            1259    308503    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       acres_admin    false    6    222            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       acres_admin    false    221            
           2604    309005    id    DEFAULT     h   ALTER TABLE ONLY acres.accounts ALTER COLUMN id SET DEFAULT nextval('acres.accounts_id_seq'::regclass);
 9   ALTER TABLE acres.accounts ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    225    226    226            	
           2604    309017    id    DEFAULT     n   ALTER TABLE ONLY acres.app_configs ALTER COLUMN id SET DEFAULT nextval('acres.app_configs_id_seq'::regclass);
 <   ALTER TABLE acres.app_configs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    228    227    228            

           2604    309029    id    DEFAULT     �   ALTER TABLE ONLY acres.bank_commission_editions ALTER COLUMN id SET DEFAULT nextval('acres.bank_commission_editions_id_seq'::regclass);
 I   ALTER TABLE acres.bank_commission_editions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    230    229    230            v
           2604    339387    id    DEFAULT     �   ALTER TABLE ONLY acres.bank_commission_rate_trackers ALTER COLUMN id SET DEFAULT nextval('acres.bank_commission_rate_trackers_id_seq'::regclass);
 N   ALTER TABLE acres.bank_commission_rate_trackers ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    312    311    312            
           2604    309043    id    DEFAULT     b   ALTER TABLE ONLY acres.banks ALTER COLUMN id SET DEFAULT nextval('acres.banks_id_seq'::regclass);
 6   ALTER TABLE acres.banks ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    232    231    232            
           2604    309060    id    DEFAULT     ~   ALTER TABLE ONLY acres.commission_settings ALTER COLUMN id SET DEFAULT nextval('acres.commission_settings_id_seq'::regclass);
 D   ALTER TABLE acres.commission_settings ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    233    234    234            
           2604    309076    id    DEFAULT     n   ALTER TABLE ONLY acres.commissions ALTER COLUMN id SET DEFAULT nextval('acres.commissions_id_seq'::regclass);
 <   ALTER TABLE acres.commissions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    235    236    236            #
           2604    309098    id    DEFAULT     j   ALTER TABLE ONLY acres.companies ALTER COLUMN id SET DEFAULT nextval('acres.companies_id_seq'::regclass);
 :   ALTER TABLE acres.companies ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    238    237    238            $
           2604    309110    id    DEFAULT     t   ALTER TABLE ONLY acres.config_options ALTER COLUMN id SET DEFAULT nextval('acres.config_options_id_seq'::regclass);
 ?   ALTER TABLE acres.config_options ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    239    240    240            &
           2604    309122    id    DEFAULT     t   ALTER TABLE ONLY acres.credit_details ALTER COLUMN id SET DEFAULT nextval('acres.credit_details_id_seq'::regclass);
 ?   ALTER TABLE acres.credit_details ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    242    241    242            +
           2604    309138    id    DEFAULT     f   ALTER TABLE ONLY acres.credits ALTER COLUMN id SET DEFAULT nextval('acres.credits_id_seq'::regclass);
 8   ALTER TABLE acres.credits ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    244    243    244            ,
           2604    309150    id    DEFAULT     j   ALTER TABLE ONLY acres.customers ALTER COLUMN id SET DEFAULT nextval('acres.customers_id_seq'::regclass);
 :   ALTER TABLE acres.customers ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    245    246    246            -
           2604    309162    id    DEFAULT     z   ALTER TABLE ONLY acres.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('acres.friendly_id_slugs_id_seq'::regclass);
 B   ALTER TABLE acres.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    248    247    248            .
           2604    309177    id    DEFAULT     `   ALTER TABLE ONLY acres.logs ALTER COLUMN id SET DEFAULT nextval('acres.logs_id_seq'::regclass);
 5   ALTER TABLE acres.logs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    250    249    250            /
           2604    309189    id    DEFAULT     ~   ALTER TABLE ONLY acres.mail_configurations ALTER COLUMN id SET DEFAULT nextval('acres.mail_configurations_id_seq'::regclass);
 D   ALTER TABLE acres.mail_configurations ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    252    251    252            0
           2604    309201    id    DEFAULT     h   ALTER TABLE ONLY acres.notaries ALTER COLUMN id SET DEFAULT nextval('acres.notaries_id_seq'::regclass);
 9   ALTER TABLE acres.notaries ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    254    253    254            
           2604    397250    id    DEFAULT     t   ALTER TABLE ONLY acres.payment_delays ALTER COLUMN id SET DEFAULT nextval('acres.payment_delays_id_seq'::regclass);
 ?   ALTER TABLE acres.payment_delays ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    318    317    318            1
           2604    309213    id    DEFAULT     h   ALTER TABLE ONLY acres.profiles ALTER COLUMN id SET DEFAULT nextval('acres.profiles_id_seq'::regclass);
 9   ALTER TABLE acres.profiles ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    255    256    256            2
           2604    309225    id    DEFAULT     b   ALTER TABLE ONLY acres.roles ALTER COLUMN id SET DEFAULT nextval('acres.roles_id_seq'::regclass);
 6   ALTER TABLE acres.roles ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    257    258    258            3
           2604    309236    id    DEFAULT     ~   ALTER TABLE ONLY acres.super_admin_configs ALTER COLUMN id SET DEFAULT nextval('acres.super_admin_configs_id_seq'::regclass);
 D   ALTER TABLE acres.super_admin_configs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    260    259    260            4
           2604    309247    id    DEFAULT     �   ALTER TABLE ONLY acres.user_commission_editions ALTER COLUMN id SET DEFAULT nextval('acres.user_commission_editions_id_seq'::regclass);
 I   ALTER TABLE acres.user_commission_editions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    261    262    262            6
           2604    309261    id    DEFAULT     b   ALTER TABLE ONLY acres.users ALTER COLUMN id SET DEFAULT nextval('acres.users_id_seq'::regclass);
 6   ALTER TABLE acres.users ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    263    264    264            =
           2604    318990    id    DEFAULT     f   ALTER TABLE ONLY demo.accounts ALTER COLUMN id SET DEFAULT nextval('demo.accounts_id_seq'::regclass);
 8   ALTER TABLE demo.accounts ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    268    267    268            >
           2604    319002    id    DEFAULT     l   ALTER TABLE ONLY demo.app_configs ALTER COLUMN id SET DEFAULT nextval('demo.app_configs_id_seq'::regclass);
 ;   ALTER TABLE demo.app_configs ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    269    270    270            ?
           2604    319014    id    DEFAULT     �   ALTER TABLE ONLY demo.bank_commission_editions ALTER COLUMN id SET DEFAULT nextval('demo.bank_commission_editions_id_seq'::regclass);
 H   ALTER TABLE demo.bank_commission_editions ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    272    271    272            z
           2604    339413    id    DEFAULT     �   ALTER TABLE ONLY demo.bank_commission_rate_trackers ALTER COLUMN id SET DEFAULT nextval('demo.bank_commission_rate_trackers_id_seq'::regclass);
 M   ALTER TABLE demo.bank_commission_rate_trackers ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    314    313    314            A
           2604    319028    id    DEFAULT     `   ALTER TABLE ONLY demo.banks ALTER COLUMN id SET DEFAULT nextval('demo.banks_id_seq'::regclass);
 5   ALTER TABLE demo.banks ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    273    274    274            H
           2604    319045    id    DEFAULT     |   ALTER TABLE ONLY demo.commission_settings ALTER COLUMN id SET DEFAULT nextval('demo.commission_settings_id_seq'::regclass);
 C   ALTER TABLE demo.commission_settings ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    276    275    276            M
           2604    319061    id    DEFAULT     l   ALTER TABLE ONLY demo.commissions ALTER COLUMN id SET DEFAULT nextval('demo.commissions_id_seq'::regclass);
 ;   ALTER TABLE demo.commissions ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    277    278    278            X
           2604    319083    id    DEFAULT     h   ALTER TABLE ONLY demo.companies ALTER COLUMN id SET DEFAULT nextval('demo.companies_id_seq'::regclass);
 9   ALTER TABLE demo.companies ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    280    279    280            Y
           2604    319095    id    DEFAULT     r   ALTER TABLE ONLY demo.config_options ALTER COLUMN id SET DEFAULT nextval('demo.config_options_id_seq'::regclass);
 >   ALTER TABLE demo.config_options ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    282    281    282            [
           2604    319107    id    DEFAULT     r   ALTER TABLE ONLY demo.credit_details ALTER COLUMN id SET DEFAULT nextval('demo.credit_details_id_seq'::regclass);
 >   ALTER TABLE demo.credit_details ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    284    283    284            `
           2604    319123    id    DEFAULT     d   ALTER TABLE ONLY demo.credits ALTER COLUMN id SET DEFAULT nextval('demo.credits_id_seq'::regclass);
 7   ALTER TABLE demo.credits ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    286    285    286            a
           2604    319135    id    DEFAULT     h   ALTER TABLE ONLY demo.customers ALTER COLUMN id SET DEFAULT nextval('demo.customers_id_seq'::regclass);
 9   ALTER TABLE demo.customers ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    288    287    288            b
           2604    319147    id    DEFAULT     x   ALTER TABLE ONLY demo.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('demo.friendly_id_slugs_id_seq'::regclass);
 A   ALTER TABLE demo.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    290    289    290            c
           2604    319162    id    DEFAULT     ^   ALTER TABLE ONLY demo.logs ALTER COLUMN id SET DEFAULT nextval('demo.logs_id_seq'::regclass);
 4   ALTER TABLE demo.logs ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    292    291    292            d
           2604    319174    id    DEFAULT     |   ALTER TABLE ONLY demo.mail_configurations ALTER COLUMN id SET DEFAULT nextval('demo.mail_configurations_id_seq'::regclass);
 C   ALTER TABLE demo.mail_configurations ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    294    293    294            e
           2604    319186    id    DEFAULT     f   ALTER TABLE ONLY demo.notaries ALTER COLUMN id SET DEFAULT nextval('demo.notaries_id_seq'::regclass);
 8   ALTER TABLE demo.notaries ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    296    295    296            �
           2604    397267    id    DEFAULT     r   ALTER TABLE ONLY demo.payment_delays ALTER COLUMN id SET DEFAULT nextval('demo.payment_delays_id_seq'::regclass);
 >   ALTER TABLE demo.payment_delays ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    319    320    320            f
           2604    319198    id    DEFAULT     f   ALTER TABLE ONLY demo.profiles ALTER COLUMN id SET DEFAULT nextval('demo.profiles_id_seq'::regclass);
 8   ALTER TABLE demo.profiles ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    297    298    298            g
           2604    319210    id    DEFAULT     `   ALTER TABLE ONLY demo.roles ALTER COLUMN id SET DEFAULT nextval('demo.roles_id_seq'::regclass);
 5   ALTER TABLE demo.roles ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    299    300    300            h
           2604    319221    id    DEFAULT     |   ALTER TABLE ONLY demo.super_admin_configs ALTER COLUMN id SET DEFAULT nextval('demo.super_admin_configs_id_seq'::regclass);
 C   ALTER TABLE demo.super_admin_configs ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    302    301    302            i
           2604    319232    id    DEFAULT     �   ALTER TABLE ONLY demo.user_commission_editions ALTER COLUMN id SET DEFAULT nextval('demo.user_commission_editions_id_seq'::regclass);
 H   ALTER TABLE demo.user_commission_editions ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    304    303    304            k
           2604    319246    id    DEFAULT     `   ALTER TABLE ONLY demo.users ALTER COLUMN id SET DEFAULT nextval('demo.users_id_seq'::regclass);
 5   ALTER TABLE demo.users ALTER COLUMN id DROP DEFAULT;
       demo       acres_admin    false    305    306    306            �	           2604    308252    id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    184    183    184            �	           2604    308264    id    DEFAULT     p   ALTER TABLE ONLY public.app_configs ALTER COLUMN id SET DEFAULT nextval('public.app_configs_id_seq'::regclass);
 =   ALTER TABLE public.app_configs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    185    186    186            �	           2604    308276    id    DEFAULT     �   ALTER TABLE ONLY public.bank_commission_editions ALTER COLUMN id SET DEFAULT nextval('public.bank_commission_editions_id_seq'::regclass);
 J   ALTER TABLE public.bank_commission_editions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    187    188    188            r
           2604    339361    id    DEFAULT     �   ALTER TABLE ONLY public.bank_commission_rate_trackers ALTER COLUMN id SET DEFAULT nextval('public.bank_commission_rate_trackers_id_seq'::regclass);
 O   ALTER TABLE public.bank_commission_rate_trackers ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    310    309    310            �	           2604    308290    id    DEFAULT     d   ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);
 7   ALTER TABLE public.banks ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    189    190    190            �	           2604    308307    id    DEFAULT     �   ALTER TABLE ONLY public.commission_settings ALTER COLUMN id SET DEFAULT nextval('public.commission_settings_id_seq'::regclass);
 E   ALTER TABLE public.commission_settings ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    191    192    192            �	           2604    308323    id    DEFAULT     p   ALTER TABLE ONLY public.commissions ALTER COLUMN id SET DEFAULT nextval('public.commissions_id_seq'::regclass);
 =   ALTER TABLE public.commissions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    193    194    194            �	           2604    308345    id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    195    196    196            �	           2604    308357    id    DEFAULT     v   ALTER TABLE ONLY public.config_options ALTER COLUMN id SET DEFAULT nextval('public.config_options_id_seq'::regclass);
 @   ALTER TABLE public.config_options ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    197    198    198            �	           2604    308369    id    DEFAULT     v   ALTER TABLE ONLY public.credit_details ALTER COLUMN id SET DEFAULT nextval('public.credit_details_id_seq'::regclass);
 @   ALTER TABLE public.credit_details ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    199    200    200            �	           2604    308385    id    DEFAULT     h   ALTER TABLE ONLY public.credits ALTER COLUMN id SET DEFAULT nextval('public.credits_id_seq'::regclass);
 9   ALTER TABLE public.credits ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    201    202    202            �	           2604    308397    id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    204    203    204            �	           2604    308409    id    DEFAULT     |   ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);
 C   ALTER TABLE public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    205    206    206            �	           2604    308424    id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    208    207    208            �	           2604    308436    id    DEFAULT     �   ALTER TABLE ONLY public.mail_configurations ALTER COLUMN id SET DEFAULT nextval('public.mail_configurations_id_seq'::regclass);
 E   ALTER TABLE public.mail_configurations ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    210    209    210            �	           2604    308448    id    DEFAULT     j   ALTER TABLE ONLY public.notaries ALTER COLUMN id SET DEFAULT nextval('public.notaries_id_seq'::regclass);
 :   ALTER TABLE public.notaries ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    212    211    212            ~
           2604    397233    id    DEFAULT     v   ALTER TABLE ONLY public.payment_delays ALTER COLUMN id SET DEFAULT nextval('public.payment_delays_id_seq'::regclass);
 @   ALTER TABLE public.payment_delays ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    315    316    316            �	           2604    308460    id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    213    214    214            �	           2604    308472    id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    216    215    216            �	           2604    308483    id    DEFAULT     �   ALTER TABLE ONLY public.super_admin_configs ALTER COLUMN id SET DEFAULT nextval('public.super_admin_configs_id_seq'::regclass);
 E   ALTER TABLE public.super_admin_configs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    217    218    218            �	           2604    308494    id    DEFAULT     �   ALTER TABLE ONLY public.user_commission_editions ALTER COLUMN id SET DEFAULT nextval('public.user_commission_editions_id_seq'::regclass);
 J   ALTER TABLE public.user_commission_editions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    219    220    220            
           2604    308508    id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    221    222    222            8          0    309002    accounts 
   TABLE DATA               b   COPY acres.accounts (id, company, subdomain, status, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    226   w<      �           0    0    accounts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.accounts_id_seq', 1, false);
            acres       acres_admin    false    225            :          0    309014    app_configs 
   TABLE DATA               Z   COPY acres.app_configs (id, name, url, icon, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    228   �<      �           0    0    app_configs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('acres.app_configs_id_seq', 1, false);
            acres       acres_admin    false    227            `          0    309367    ar_internal_metadata 
   TABLE DATA               Q   COPY acres.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    266   �<      <          0    309026    bank_commission_editions 
   TABLE DATA               �   COPY acres.bank_commission_editions (id, date_effet, completed, old_value, new_value, bank_id, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    230    =      �           0    0    bank_commission_editions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('acres.bank_commission_editions_id_seq', 31, true);
            acres       acres_admin    false    229            �          0    339384    bank_commission_rate_trackers 
   TABLE DATA               �   COPY acres.bank_commission_rate_trackers (id, start_date, old_rate, new_rate, bank_id, user_id, status, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    312   �>      �           0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('acres.bank_commission_rate_trackers_id_seq', 8, true);
            acres       acres_admin    false    311            >          0    309040    banks 
   TABLE DATA                 COPY acres.banks (id, name, description, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, phone, address, slug, user_id, created_at, updated_at, number_of_remaining_days, company_remaining_commission_rate) FROM stdin;
    acres       acres_admin    false    232   j?      �           0    0    banks_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('acres.banks_id_seq', 12, true);
            acres       acres_admin    false    231            @          0    309057    commission_settings 
   TABLE DATA               �   COPY acres.commission_settings (id, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    234   �@      �           0    0    commission_settings_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.commission_settings_id_seq', 53, true);
            acres       acres_admin    false    233            B          0    309073    commissions 
   TABLE DATA               �  COPY acres.commissions (id, credit_id, production_date, acte_date, customer_id, notary_name, bank_name, contributor_name, producer_name, company_name, contributor_commission_percentage, contributor_commission, producer_commission_percentage, producer_commission, bank_commission_percentage, bank_commission, company_commission_percentage, company_commission, amount_credit, total_amount, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    236   ~B      �           0    0    commissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('acres.commissions_id_seq', 3671, true);
            acres       acres_admin    false    235            D          0    309095 	   companies 
   TABLE DATA               �   COPY acres.companies (id, name, address, city, country, phone, slug, brand_file_name, brand_content_type, brand_file_size, brand_updated_at, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    238   !\      �           0    0    companies_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.companies_id_seq', 1, true);
            acres       acres_admin    false    237            F          0    309107    config_options 
   TABLE DATA               �   COPY acres.config_options (id, app_name, admin_name, admin_email, admin_password, admin_role, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    240   �\      �           0    0    config_options_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('acres.config_options_id_seq', 1, false);
            acres       acres_admin    false    239            H          0    309119    credit_details 
   TABLE DATA               �   COPY acres.credit_details (id, installment_payment, installment_date, commission, cumulative_amount, paid_by_bank, paid_to_contributor_or_producer, "creditUid", credit_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    242   �\      �           0    0    credit_details_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('acres.credit_details_id_seq', 222, true);
            acres       acres_admin    false    241            J          0    309135    credits 
   TABLE DATA               i  COPY acres.credits (id, credit_id, production_date, acte_date, customer_id, bank_id, amount, bank_name, customer_name, producer_id, producer_name, contributor_id, contributor_name, notary_name, hypoplus, total_commission_bank, total_commission_producer, total_commission_contributor, total_commission_company, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    244   �\      �           0    0    credits_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('acres.credits_id_seq', 3673, true);
            acres       acres_admin    false    243            L          0    309147 	   customers 
   TABLE DATA               �   COPY acres.customers (id, gender, address, city, country, phone, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at, full_name) FROM stdin;
    acres       acres_admin    false    246   �x      �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('acres.customers_id_seq', 480, true);
            acres       acres_admin    false    245            N          0    309159    friendly_id_slugs 
   TABLE DATA               e   COPY acres.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    acres       acres_admin    false    248   ��      �           0    0    friendly_id_slugs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('acres.friendly_id_slugs_id_seq', 1, false);
            acres       acres_admin    false    247            P          0    309174    logs 
   TABLE DATA               m   COPY acres.logs (id, file_name, no_record, error, status, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    250   �      �           0    0    logs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('acres.logs_id_seq', 24, true);
            acres       acres_admin    false    249            R          0    309186    mail_configurations 
   TABLE DATA               �   COPY acres.mail_configurations (id, host, user_name, password, domain, address, port, authentication, enable_starttls_auto, ssl, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    252   ��      �           0    0    mail_configurations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.mail_configurations_id_seq', 1, false);
            acres       acres_admin    false    251            T          0    309198    notaries 
   TABLE DATA               h   COPY acres.notaries (id, full_name, address, phone, email, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    254   �      �           0    0    notaries_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.notaries_id_seq', 75, true);
            acres       acres_admin    false    253            �          0    397247    payment_delays 
   TABLE DATA               �   COPY acres.payment_delays (id, first_installment, monthly_deadlines_before_payment, monthly_installments, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    318   ��      �           0    0    payment_delays_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('acres.payment_delays_id_seq', 1, false);
            acres       acres_admin    false    317            V          0    309210    profiles 
   TABLE DATA               �   COPY acres.profiles (id, first_name, last_name, phone, address, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    256   ��      �           0    0    profiles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.profiles_id_seq', 1, false);
            acres       acres_admin    false    255            X          0    309222    roles 
   TABLE DATA               @   COPY acres.roles (id, name, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    258   ��      �           0    0    roles_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('acres.roles_id_seq', 3, true);
            acres       acres_admin    false    257            _          0    309359    schema_migrations 
   TABLE DATA               3   COPY acres.schema_migrations (version) FROM stdin;
    acres       acres_admin    false    265   (�      Z          0    309233    super_admin_configs 
   TABLE DATA               `   COPY acres.super_admin_configs (id, login, email, password, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    260   ۛ      �           0    0    super_admin_configs_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.super_admin_configs_id_seq', 1, false);
            acres       acres_admin    false    259            \          0    309244    user_commission_editions 
   TABLE DATA               �   COPY acres.user_commission_editions (id, date_effet, completed, old_value, new_value, commission_setting_id, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    262   ��      �           0    0    user_commission_editions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('acres.user_commission_editions_id_seq', 1, false);
            acres       acres_admin    false    261            ^          0    309258    users 
   TABLE DATA               �  COPY acres.users (id, full_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, status, receives_notifications, created_by, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, receives_summaries) FROM stdin;
    acres       acres_admin    false    264   �      �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('acres.users_id_seq', 58, true);
            acres       acres_admin    false    263            b          0    318987    accounts 
   TABLE DATA               a   COPY demo.accounts (id, company, subdomain, status, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    268   �      �           0    0    accounts_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.accounts_id_seq', 1, false);
            demo       acres_admin    false    267            d          0    318999    app_configs 
   TABLE DATA               Y   COPY demo.app_configs (id, name, url, icon, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    270   .�      �           0    0    app_configs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('demo.app_configs_id_seq', 1, false);
            demo       acres_admin    false    269            �          0    319352    ar_internal_metadata 
   TABLE DATA               P   COPY demo.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    308   K�      f          0    319011    bank_commission_editions 
   TABLE DATA               �   COPY demo.bank_commission_editions (id, date_effet, completed, old_value, new_value, bank_id, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    272   ��      �           0    0    bank_commission_editions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('demo.bank_commission_editions_id_seq', 1, false);
            demo       acres_admin    false    271            �          0    339410    bank_commission_rate_trackers 
   TABLE DATA               �   COPY demo.bank_commission_rate_trackers (id, start_date, old_rate, new_rate, bank_id, user_id, status, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    314   ��      �           0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('demo.bank_commission_rate_trackers_id_seq', 2, true);
            demo       acres_admin    false    313            h          0    319025    banks 
   TABLE DATA                 COPY demo.banks (id, name, description, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, phone, address, slug, user_id, created_at, updated_at, number_of_remaining_days, company_remaining_commission_rate) FROM stdin;
    demo       acres_admin    false    274   '�      �           0    0    banks_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('demo.banks_id_seq', 12, true);
            demo       acres_admin    false    273            j          0    319042    commission_settings 
   TABLE DATA               �   COPY demo.commission_settings (id, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, slug, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    276   �      �           0    0    commission_settings_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('demo.commission_settings_id_seq', 45, true);
            demo       acres_admin    false    275            l          0    319058    commissions 
   TABLE DATA               �  COPY demo.commissions (id, credit_id, production_date, acte_date, customer_id, notary_name, bank_name, contributor_name, producer_name, company_name, contributor_commission_percentage, contributor_commission, producer_commission_percentage, producer_commission, bank_commission_percentage, bank_commission, company_commission_percentage, company_commission, amount_credit, total_amount, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    278   ��      �           0    0    commissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('demo.commissions_id_seq', 1217, true);
            demo       acres_admin    false    277            n          0    319080 	   companies 
   TABLE DATA               �   COPY demo.companies (id, name, address, city, country, phone, slug, brand_file_name, brand_content_type, brand_file_size, brand_updated_at, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    280   ��      �           0    0    companies_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.companies_id_seq', 1, true);
            demo       acres_admin    false    279            p          0    319092    config_options 
   TABLE DATA               �   COPY demo.config_options (id, app_name, admin_name, admin_email, admin_password, admin_role, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    282   R�      �           0    0    config_options_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('demo.config_options_id_seq', 1, false);
            demo       acres_admin    false    281            r          0    319104    credit_details 
   TABLE DATA               �   COPY demo.credit_details (id, installment_payment, installment_date, commission, cumulative_amount, paid_by_bank, paid_to_contributor_or_producer, "creditUid", credit_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    284   o�                  0    0    credit_details_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('demo.credit_details_id_seq', 1, false);
            demo       acres_admin    false    283            t          0    319120    credits 
   TABLE DATA               h  COPY demo.credits (id, credit_id, production_date, acte_date, customer_id, bank_id, amount, bank_name, customer_name, producer_id, producer_name, contributor_id, contributor_name, notary_name, hypoplus, total_commission_bank, total_commission_producer, total_commission_contributor, total_commission_company, slug, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    286   ��                 0    0    credits_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('demo.credits_id_seq', 1217, true);
            demo       acres_admin    false    285            v          0    319132 	   customers 
   TABLE DATA               �   COPY demo.customers (id, gender, address, city, country, phone, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at, full_name) FROM stdin;
    demo       acres_admin    false    288   ��                 0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('demo.customers_id_seq', 442, true);
            demo       acres_admin    false    287            x          0    319144    friendly_id_slugs 
   TABLE DATA               d   COPY demo.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    demo       acres_admin    false    290   ��                 0    0    friendly_id_slugs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('demo.friendly_id_slugs_id_seq', 1, false);
            demo       acres_admin    false    289            z          0    319159    logs 
   TABLE DATA               l   COPY demo.logs (id, file_name, no_record, error, status, slug, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    292   ��                 0    0    logs_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('demo.logs_id_seq', 7, true);
            demo       acres_admin    false    291            |          0    319171    mail_configurations 
   TABLE DATA               �   COPY demo.mail_configurations (id, host, user_name, password, domain, address, port, authentication, enable_starttls_auto, ssl, slug, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    294   ��                 0    0    mail_configurations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('demo.mail_configurations_id_seq', 1, false);
            demo       acres_admin    false    293            ~          0    319183    notaries 
   TABLE DATA               g   COPY demo.notaries (id, full_name, address, phone, email, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    296   ��                 0    0    notaries_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.notaries_id_seq', 61, true);
            demo       acres_admin    false    295            �          0    397264    payment_delays 
   TABLE DATA               �   COPY demo.payment_delays (id, first_installment, monthly_deadlines_before_payment, monthly_installments, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    320   %�                 0    0    payment_delays_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('demo.payment_delays_id_seq', 1, false);
            demo       acres_admin    false    319            �          0    319195    profiles 
   TABLE DATA               �   COPY demo.profiles (id, first_name, last_name, phone, address, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    298   B�                 0    0    profiles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.profiles_id_seq', 1, false);
            demo       acres_admin    false    297            �          0    319207    roles 
   TABLE DATA               ?   COPY demo.roles (id, name, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    300   _�      	           0    0    roles_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('demo.roles_id_seq', 4, true);
            demo       acres_admin    false    299            �          0    319344    schema_migrations 
   TABLE DATA               2   COPY demo.schema_migrations (version) FROM stdin;
    demo       acres_admin    false    307   ��      �          0    319218    super_admin_configs 
   TABLE DATA               _   COPY demo.super_admin_configs (id, login, email, password, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    302   ��      
           0    0    super_admin_configs_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('demo.super_admin_configs_id_seq', 1, false);
            demo       acres_admin    false    301            �          0    319229    user_commission_editions 
   TABLE DATA               �   COPY demo.user_commission_editions (id, date_effet, completed, old_value, new_value, commission_setting_id, user_id, created_at, updated_at) FROM stdin;
    demo       acres_admin    false    304   ��                 0    0    user_commission_editions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('demo.user_commission_editions_id_seq', 1, false);
            demo       acres_admin    false    303            �          0    319243    users 
   TABLE DATA               �  COPY demo.users (id, full_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, status, receives_notifications, created_by, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, receives_summaries) FROM stdin;
    demo       acres_admin    false    306   ��                 0    0    users_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('demo.users_id_seq', 50, true);
            demo       acres_admin    false    305                      0    308249    accounts 
   TABLE DATA               c   COPY public.accounts (id, company, subdomain, status, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    184   k                 0    0    accounts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);
            public       acres_admin    false    183                      0    308261    app_configs 
   TABLE DATA               [   COPY public.app_configs (id, name, url, icon, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    186   �                 0    0    app_configs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.app_configs_id_seq', 1, false);
            public       acres_admin    false    185            6          0    308614    ar_internal_metadata 
   TABLE DATA               R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       acres_admin    false    224                   0    308273    bank_commission_editions 
   TABLE DATA               �   COPY public.bank_commission_editions (id, date_effet, completed, old_value, new_value, bank_id, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    188   T                 0    0    bank_commission_editions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.bank_commission_editions_id_seq', 1, false);
            public       acres_admin    false    187            �          0    339358    bank_commission_rate_trackers 
   TABLE DATA               �   COPY public.bank_commission_rate_trackers (id, start_date, old_rate, new_rate, bank_id, user_id, status, created_at, updated_at) FROM stdin;
    public       acres_admin    false    310   q                 0    0 $   bank_commission_rate_trackers_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.bank_commission_rate_trackers_id_seq', 1, false);
            public       acres_admin    false    309                      0    308287    banks 
   TABLE DATA                 COPY public.banks (id, name, description, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, phone, address, slug, user_id, created_at, updated_at, number_of_remaining_days, company_remaining_commission_rate) FROM stdin;
    public       acres_admin    false    190   �                 0    0    banks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banks_id_seq', 1, false);
            public       acres_admin    false    189                      0    308304    commission_settings 
   TABLE DATA               �   COPY public.commission_settings (id, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    192   �                 0    0    commission_settings_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.commission_settings_id_seq', 1, false);
            public       acres_admin    false    191                      0    308320    commissions 
   TABLE DATA               �  COPY public.commissions (id, credit_id, production_date, acte_date, customer_id, notary_name, bank_name, contributor_name, producer_name, company_name, contributor_commission_percentage, contributor_commission, producer_commission_percentage, producer_commission, bank_commission_percentage, bank_commission, company_commission_percentage, company_commission, amount_credit, total_amount, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    194   �                 0    0    commissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.commissions_id_seq', 1, false);
            public       acres_admin    false    193                      0    308342 	   companies 
   TABLE DATA               �   COPY public.companies (id, name, address, city, country, phone, slug, brand_file_name, brand_content_type, brand_file_size, brand_updated_at, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    196   �                 0    0    companies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companies_id_seq', 1, false);
            public       acres_admin    false    195                      0    308354    config_options 
   TABLE DATA               �   COPY public.config_options (id, app_name, admin_name, admin_email, admin_password, admin_role, created_at, updated_at) FROM stdin;
    public       acres_admin    false    198                    0    0    config_options_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.config_options_id_seq', 1, false);
            public       acres_admin    false    197                      0    308366    credit_details 
   TABLE DATA               �   COPY public.credit_details (id, installment_payment, installment_date, commission, cumulative_amount, paid_by_bank, paid_to_contributor_or_producer, "creditUid", credit_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    200                    0    0    credit_details_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.credit_details_id_seq', 1, false);
            public       acres_admin    false    199                       0    308382    credits 
   TABLE DATA               j  COPY public.credits (id, credit_id, production_date, acte_date, customer_id, bank_id, amount, bank_name, customer_name, producer_id, producer_name, contributor_id, contributor_name, notary_name, hypoplus, total_commission_bank, total_commission_producer, total_commission_contributor, total_commission_company, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    202   <                 0    0    credits_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.credits_id_seq', 1, false);
            public       acres_admin    false    201            "          0    308394 	   customers 
   TABLE DATA               �   COPY public.customers (id, gender, address, city, country, phone, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at, full_name) FROM stdin;
    public       acres_admin    false    204   Y                 0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
            public       acres_admin    false    203            $          0    308406    friendly_id_slugs 
   TABLE DATA               f   COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    public       acres_admin    false    206   v                 0    0    friendly_id_slugs_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);
            public       acres_admin    false    205            &          0    308421    logs 
   TABLE DATA               n   COPY public.logs (id, file_name, no_record, error, status, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    208   �                 0    0    logs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.logs_id_seq', 1, false);
            public       acres_admin    false    207            (          0    308433    mail_configurations 
   TABLE DATA               �   COPY public.mail_configurations (id, host, user_name, password, domain, address, port, authentication, enable_starttls_auto, ssl, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    210   �                 0    0    mail_configurations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.mail_configurations_id_seq', 1, false);
            public       acres_admin    false    209            *          0    308445    notaries 
   TABLE DATA               i   COPY public.notaries (id, full_name, address, phone, email, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    212   �                 0    0    notaries_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.notaries_id_seq', 1, false);
            public       acres_admin    false    211            �          0    397230    payment_delays 
   TABLE DATA               �   COPY public.payment_delays (id, first_installment, monthly_deadlines_before_payment, monthly_installments, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    316   �                 0    0    payment_delays_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_delays_id_seq', 1, false);
            public       acres_admin    false    315            ,          0    308457    profiles 
   TABLE DATA               �   COPY public.profiles (id, first_name, last_name, phone, address, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    214                    0    0    profiles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);
            public       acres_admin    false    213            .          0    308469    roles 
   TABLE DATA               A   COPY public.roles (id, name, created_at, updated_at) FROM stdin;
    public       acres_admin    false    216   $                 0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 8, true);
            public       acres_admin    false    215            5          0    308606    schema_migrations 
   TABLE DATA               4   COPY public.schema_migrations (version) FROM stdin;
    public       acres_admin    false    223   �      0          0    308480    super_admin_configs 
   TABLE DATA               a   COPY public.super_admin_configs (id, login, email, password, created_at, updated_at) FROM stdin;
    public       acres_admin    false    218                     0    0    super_admin_configs_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.super_admin_configs_id_seq', 1, false);
            public       acres_admin    false    217            2          0    308491    user_commission_editions 
   TABLE DATA               �   COPY public.user_commission_editions (id, date_effet, completed, old_value, new_value, commission_setting_id, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    220   �      !           0    0    user_commission_editions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.user_commission_editions_id_seq', 1, false);
            public       acres_admin    false    219            4          0    308505    users 
   TABLE DATA               �  COPY public.users (id, full_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, status, receives_notifications, created_by, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, receives_summaries) FROM stdin;
    public       acres_admin    false    222   �      "           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
            public       acres_admin    false    221            �
           2606    309010    accounts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.accounts DROP CONSTRAINT accounts_pkey;
       acres         acres_admin    false    226    226            �
           2606    309022    app_configs_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY acres.app_configs
    ADD CONSTRAINT app_configs_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY acres.app_configs DROP CONSTRAINT app_configs_pkey;
       acres         acres_admin    false    228    228                       2606    309374    ar_internal_metadata_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY acres.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 W   ALTER TABLE ONLY acres.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       acres         acres_admin    false    266    266            �
           2606    309035    bank_commission_editions_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT bank_commission_editions_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT bank_commission_editions_pkey;
       acres         acres_admin    false    230    230            O           2606    339395 "   bank_commission_rate_trackers_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY acres.bank_commission_rate_trackers
    ADD CONSTRAINT bank_commission_rate_trackers_pkey PRIMARY KEY (id);
 i   ALTER TABLE ONLY acres.bank_commission_rate_trackers DROP CONSTRAINT bank_commission_rate_trackers_pkey;
       acres         acres_admin    false    312    312            �
           2606    309053 
   banks_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.banks DROP CONSTRAINT banks_pkey;
       acres         acres_admin    false    232    232            �
           2606    309069    commission_settings_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.commission_settings
    ADD CONSTRAINT commission_settings_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.commission_settings DROP CONSTRAINT commission_settings_pkey;
       acres         acres_admin    false    234    234            �
           2606    309091    commissions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY acres.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY acres.commissions DROP CONSTRAINT commissions_pkey;
       acres         acres_admin    false    236    236            �
           2606    309103    companies_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY acres.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY acres.companies DROP CONSTRAINT companies_pkey;
       acres         acres_admin    false    238    238            �
           2606    309116    config_options_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY acres.config_options
    ADD CONSTRAINT config_options_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY acres.config_options DROP CONSTRAINT config_options_pkey;
       acres         acres_admin    false    240    240            �
           2606    309131    credit_details_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY acres.credit_details
    ADD CONSTRAINT credit_details_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY acres.credit_details DROP CONSTRAINT credit_details_pkey;
       acres         acres_admin    false    242    242            �
           2606    309143    credits_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY acres.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY acres.credits DROP CONSTRAINT credits_pkey;
       acres         acres_admin    false    244    244            �
           2606    309155    customers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY acres.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY acres.customers DROP CONSTRAINT customers_pkey;
       acres         acres_admin    false    246    246            �
           2606    309167    friendly_id_slugs_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY acres.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY acres.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       acres         acres_admin    false    248    248            �
           2606    309182 	   logs_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY acres.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY acres.logs DROP CONSTRAINT logs_pkey;
       acres         acres_admin    false    250    250            �
           2606    309194    mail_configurations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.mail_configurations
    ADD CONSTRAINT mail_configurations_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.mail_configurations DROP CONSTRAINT mail_configurations_pkey;
       acres         acres_admin    false    252    252            �
           2606    309206    notaries_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.notaries
    ADD CONSTRAINT notaries_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.notaries DROP CONSTRAINT notaries_pkey;
       acres         acres_admin    false    254    254            [           2606    397255    payment_delays_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY acres.payment_delays
    ADD CONSTRAINT payment_delays_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY acres.payment_delays DROP CONSTRAINT payment_delays_pkey;
       acres         acres_admin    false    318    318            �
           2606    309218    profiles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.profiles DROP CONSTRAINT profiles_pkey;
       acres         acres_admin    false    256    256            �
           2606    309230 
   roles_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.roles DROP CONSTRAINT roles_pkey;
       acres         acres_admin    false    258    258                       2606    309366    schema_migrations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY acres.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 Q   ALTER TABLE ONLY acres.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       acres         acres_admin    false    265    265            �
           2606    309241    super_admin_configs_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.super_admin_configs
    ADD CONSTRAINT super_admin_configs_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.super_admin_configs DROP CONSTRAINT super_admin_configs_pkey;
       acres         acres_admin    false    260    260            �
           2606    309253    user_commission_editions_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT user_commission_editions_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT user_commission_editions_pkey;
       acres         acres_admin    false    262    262                       2606    309271 
   users_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.users DROP CONSTRAINT users_pkey;
       acres         acres_admin    false    264    264                       2606    318995    accounts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY demo.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY demo.accounts DROP CONSTRAINT accounts_pkey;
       demo         acres_admin    false    268    268                       2606    319007    app_configs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY demo.app_configs
    ADD CONSTRAINT app_configs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY demo.app_configs DROP CONSTRAINT app_configs_pkey;
       demo         acres_admin    false    270    270            I           2606    319359    ar_internal_metadata_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY demo.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 V   ALTER TABLE ONLY demo.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       demo         acres_admin    false    308    308                       2606    319020    bank_commission_editions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY demo.bank_commission_editions
    ADD CONSTRAINT bank_commission_editions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY demo.bank_commission_editions DROP CONSTRAINT bank_commission_editions_pkey;
       demo         acres_admin    false    272    272            S           2606    339421 "   bank_commission_rate_trackers_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY demo.bank_commission_rate_trackers
    ADD CONSTRAINT bank_commission_rate_trackers_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY demo.bank_commission_rate_trackers DROP CONSTRAINT bank_commission_rate_trackers_pkey;
       demo         acres_admin    false    314    314                       2606    319038 
   banks_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.banks DROP CONSTRAINT banks_pkey;
       demo         acres_admin    false    274    274                       2606    319054    commission_settings_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY demo.commission_settings
    ADD CONSTRAINT commission_settings_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY demo.commission_settings DROP CONSTRAINT commission_settings_pkey;
       demo         acres_admin    false    276    276                       2606    319076    commissions_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY demo.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY demo.commissions DROP CONSTRAINT commissions_pkey;
       demo         acres_admin    false    278    278                       2606    319088    companies_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY demo.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY demo.companies DROP CONSTRAINT companies_pkey;
       demo         acres_admin    false    280    280                       2606    319101    config_options_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY demo.config_options
    ADD CONSTRAINT config_options_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY demo.config_options DROP CONSTRAINT config_options_pkey;
       demo         acres_admin    false    282    282                        2606    319116    credit_details_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY demo.credit_details
    ADD CONSTRAINT credit_details_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY demo.credit_details DROP CONSTRAINT credit_details_pkey;
       demo         acres_admin    false    284    284            #           2606    319128    credits_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY demo.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY demo.credits DROP CONSTRAINT credits_pkey;
       demo         acres_admin    false    286    286            &           2606    319140    customers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY demo.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY demo.customers DROP CONSTRAINT customers_pkey;
       demo         acres_admin    false    288    288            )           2606    319152    friendly_id_slugs_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY demo.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY demo.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       demo         acres_admin    false    290    290            0           2606    319167 	   logs_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY demo.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY demo.logs DROP CONSTRAINT logs_pkey;
       demo         acres_admin    false    292    292            3           2606    319179    mail_configurations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY demo.mail_configurations
    ADD CONSTRAINT mail_configurations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY demo.mail_configurations DROP CONSTRAINT mail_configurations_pkey;
       demo         acres_admin    false    294    294            6           2606    319191    notaries_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY demo.notaries
    ADD CONSTRAINT notaries_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY demo.notaries DROP CONSTRAINT notaries_pkey;
       demo         acres_admin    false    296    296            ^           2606    397272    payment_delays_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY demo.payment_delays
    ADD CONSTRAINT payment_delays_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY demo.payment_delays DROP CONSTRAINT payment_delays_pkey;
       demo         acres_admin    false    320    320            9           2606    319203    profiles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY demo.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY demo.profiles DROP CONSTRAINT profiles_pkey;
       demo         acres_admin    false    298    298            ;           2606    319215 
   roles_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.roles DROP CONSTRAINT roles_pkey;
       demo         acres_admin    false    300    300            G           2606    319351    schema_migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY demo.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY demo.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       demo         acres_admin    false    307    307            =           2606    319226    super_admin_configs_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY demo.super_admin_configs
    ADD CONSTRAINT super_admin_configs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY demo.super_admin_configs DROP CONSTRAINT super_admin_configs_pkey;
       demo         acres_admin    false    302    302            A           2606    319238    user_commission_editions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY demo.user_commission_editions
    ADD CONSTRAINT user_commission_editions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY demo.user_commission_editions DROP CONSTRAINT user_commission_editions_pkey;
       demo         acres_admin    false    304    304            E           2606    319256 
   users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.users DROP CONSTRAINT users_pkey;
       demo         acres_admin    false    306    306            �
           2606    308257    accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         acres_admin    false    184    184            �
           2606    308269    app_configs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.app_configs
    ADD CONSTRAINT app_configs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.app_configs DROP CONSTRAINT app_configs_pkey;
       public         acres_admin    false    186    186            �
           2606    308621    ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         acres_admin    false    224    224            �
           2606    308282    bank_commission_editions_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT bank_commission_editions_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT bank_commission_editions_pkey;
       public         acres_admin    false    188    188            K           2606    339369 "   bank_commission_rate_trackers_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.bank_commission_rate_trackers
    ADD CONSTRAINT bank_commission_rate_trackers_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.bank_commission_rate_trackers DROP CONSTRAINT bank_commission_rate_trackers_pkey;
       public         acres_admin    false    310    310            �
           2606    308300 
   banks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_pkey;
       public         acres_admin    false    190    190            �
           2606    308316    commission_settings_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.commission_settings
    ADD CONSTRAINT commission_settings_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.commission_settings DROP CONSTRAINT commission_settings_pkey;
       public         acres_admin    false    192    192            �
           2606    308338    commissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.commissions DROP CONSTRAINT commissions_pkey;
       public         acres_admin    false    194    194            �
           2606    308350    companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public         acres_admin    false    196    196            �
           2606    308363    config_options_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.config_options
    ADD CONSTRAINT config_options_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.config_options DROP CONSTRAINT config_options_pkey;
       public         acres_admin    false    198    198            �
           2606    308378    credit_details_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.credit_details
    ADD CONSTRAINT credit_details_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.credit_details DROP CONSTRAINT credit_details_pkey;
       public         acres_admin    false    200    200            �
           2606    308390    credits_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.credits DROP CONSTRAINT credits_pkey;
       public         acres_admin    false    202    202            �
           2606    308402    customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public         acres_admin    false    204    204            �
           2606    308414    friendly_id_slugs_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       public         acres_admin    false    206    206            �
           2606    308429 	   logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public         acres_admin    false    208    208            �
           2606    308441    mail_configurations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mail_configurations
    ADD CONSTRAINT mail_configurations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.mail_configurations DROP CONSTRAINT mail_configurations_pkey;
       public         acres_admin    false    210    210            �
           2606    308453    notaries_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.notaries
    ADD CONSTRAINT notaries_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.notaries DROP CONSTRAINT notaries_pkey;
       public         acres_admin    false    212    212            X           2606    397238    payment_delays_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.payment_delays
    ADD CONSTRAINT payment_delays_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.payment_delays DROP CONSTRAINT payment_delays_pkey;
       public         acres_admin    false    316    316            �
           2606    308465    profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public         acres_admin    false    214    214            �
           2606    308477 
   roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         acres_admin    false    216    216            �
           2606    308613    schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         acres_admin    false    223    223            �
           2606    308488    super_admin_configs_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.super_admin_configs
    ADD CONSTRAINT super_admin_configs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.super_admin_configs DROP CONSTRAINT super_admin_configs_pkey;
       public         acres_admin    false    218    218            �
           2606    308500    user_commission_editions_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT user_commission_editions_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT user_commission_editions_pkey;
       public         acres_admin    false    220    220            �
           2606    308518 
   users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         acres_admin    false    222    222            �
           1259    309011    index_accounts_on_user_id    INDEX     P   CREATE INDEX index_accounts_on_user_id ON acres.accounts USING btree (user_id);
 ,   DROP INDEX acres.index_accounts_on_user_id;
       acres         acres_admin    false    226            �
           1259    309023    index_app_configs_on_user_id    INDEX     ]   CREATE UNIQUE INDEX index_app_configs_on_user_id ON acres.app_configs USING btree (user_id);
 /   DROP INDEX acres.index_app_configs_on_user_id;
       acres         acres_admin    false    228            �
           1259    309036 )   index_bank_commission_editions_on_bank_id    INDEX     p   CREATE INDEX index_bank_commission_editions_on_bank_id ON acres.bank_commission_editions USING btree (bank_id);
 <   DROP INDEX acres.index_bank_commission_editions_on_bank_id;
       acres         acres_admin    false    230            �
           1259    309037 )   index_bank_commission_editions_on_user_id    INDEX     p   CREATE INDEX index_bank_commission_editions_on_user_id ON acres.bank_commission_editions USING btree (user_id);
 <   DROP INDEX acres.index_bank_commission_editions_on_user_id;
       acres         acres_admin    false    230            P           1259    339406 .   index_bank_commission_rate_trackers_on_bank_id    INDEX     z   CREATE INDEX index_bank_commission_rate_trackers_on_bank_id ON acres.bank_commission_rate_trackers USING btree (bank_id);
 A   DROP INDEX acres.index_bank_commission_rate_trackers_on_bank_id;
       acres         acres_admin    false    312            Q           1259    339407 .   index_bank_commission_rate_trackers_on_user_id    INDEX     z   CREATE INDEX index_bank_commission_rate_trackers_on_user_id ON acres.bank_commission_rate_trackers USING btree (user_id);
 A   DROP INDEX acres.index_bank_commission_rate_trackers_on_user_id;
       acres         acres_admin    false    312            �
           1259    309054    index_banks_on_user_id    INDEX     J   CREATE INDEX index_banks_on_user_id ON acres.banks USING btree (user_id);
 )   DROP INDEX acres.index_banks_on_user_id;
       acres         acres_admin    false    232            �
           1259    309070 $   index_commission_settings_on_user_id    INDEX     m   CREATE UNIQUE INDEX index_commission_settings_on_user_id ON acres.commission_settings USING btree (user_id);
 7   DROP INDEX acres.index_commission_settings_on_user_id;
       acres         acres_admin    false    234            �
           1259    309092    index_commissions_on_user_id    INDEX     V   CREATE INDEX index_commissions_on_user_id ON acres.commissions USING btree (user_id);
 /   DROP INDEX acres.index_commissions_on_user_id;
       acres         acres_admin    false    236            �
           1259    309104    index_companies_on_user_id    INDEX     Y   CREATE UNIQUE INDEX index_companies_on_user_id ON acres.companies USING btree (user_id);
 -   DROP INDEX acres.index_companies_on_user_id;
       acres         acres_admin    false    238            �
           1259    309132 !   index_credit_details_on_credit_id    INDEX     `   CREATE INDEX index_credit_details_on_credit_id ON acres.credit_details USING btree (credit_id);
 4   DROP INDEX acres.index_credit_details_on_credit_id;
       acres         acres_admin    false    242            �
           1259    309144    index_credits_on_user_id    INDEX     N   CREATE INDEX index_credits_on_user_id ON acres.credits USING btree (user_id);
 +   DROP INDEX acres.index_credits_on_user_id;
       acres         acres_admin    false    244            �
           1259    309156    index_customers_on_user_id    INDEX     R   CREATE INDEX index_customers_on_user_id ON acres.customers USING btree (user_id);
 -   DROP INDEX acres.index_customers_on_user_id;
       acres         acres_admin    false    246            �
           1259    309169 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX        CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON acres.friendly_id_slugs USING btree (slug, sluggable_type);
 E   DROP INDEX acres.index_friendly_id_slugs_on_slug_and_sluggable_type;
       acres         acres_admin    false    248    248            �
           1259    309168 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON acres.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 O   DROP INDEX acres.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       acres         acres_admin    false    248    248    248            �
           1259    309170 '   index_friendly_id_slugs_on_sluggable_id    INDEX     l   CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON acres.friendly_id_slugs USING btree (sluggable_id);
 :   DROP INDEX acres.index_friendly_id_slugs_on_sluggable_id;
       acres         acres_admin    false    248            �
           1259    309171 )   index_friendly_id_slugs_on_sluggable_type    INDEX     p   CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON acres.friendly_id_slugs USING btree (sluggable_type);
 <   DROP INDEX acres.index_friendly_id_slugs_on_sluggable_type;
       acres         acres_admin    false    248            �
           1259    309183    index_logs_on_user_id    INDEX     H   CREATE INDEX index_logs_on_user_id ON acres.logs USING btree (user_id);
 (   DROP INDEX acres.index_logs_on_user_id;
       acres         acres_admin    false    250            �
           1259    309195 $   index_mail_configurations_on_user_id    INDEX     m   CREATE UNIQUE INDEX index_mail_configurations_on_user_id ON acres.mail_configurations USING btree (user_id);
 7   DROP INDEX acres.index_mail_configurations_on_user_id;
       acres         acres_admin    false    252            �
           1259    309207    index_notaries_on_user_id    INDEX     P   CREATE INDEX index_notaries_on_user_id ON acres.notaries USING btree (user_id);
 ,   DROP INDEX acres.index_notaries_on_user_id;
       acres         acres_admin    false    254            Y           1259    397261    index_payment_delays_on_user_id    INDEX     \   CREATE INDEX index_payment_delays_on_user_id ON acres.payment_delays USING btree (user_id);
 2   DROP INDEX acres.index_payment_delays_on_user_id;
       acres         acres_admin    false    318            �
           1259    309219    index_profiles_on_user_id    INDEX     W   CREATE UNIQUE INDEX index_profiles_on_user_id ON acres.profiles USING btree (user_id);
 ,   DROP INDEX acres.index_profiles_on_user_id;
       acres         acres_admin    false    256            �
           1259    309254 7   index_user_commission_editions_on_commission_setting_id    INDEX     �   CREATE INDEX index_user_commission_editions_on_commission_setting_id ON acres.user_commission_editions USING btree (commission_setting_id);
 J   DROP INDEX acres.index_user_commission_editions_on_commission_setting_id;
       acres         acres_admin    false    262            �
           1259    309255 )   index_user_commission_editions_on_user_id    INDEX     p   CREATE INDEX index_user_commission_editions_on_user_id ON acres.user_commission_editions USING btree (user_id);
 <   DROP INDEX acres.index_user_commission_editions_on_user_id;
       acres         acres_admin    false    262            �
           1259    309272    index_users_on_email    INDEX     M   CREATE UNIQUE INDEX index_users_on_email ON acres.users USING btree (email);
 '   DROP INDEX acres.index_users_on_email;
       acres         acres_admin    false    264                        1259    309273 #   index_users_on_reset_password_token    INDEX     k   CREATE UNIQUE INDEX index_users_on_reset_password_token ON acres.users USING btree (reset_password_token);
 6   DROP INDEX acres.index_users_on_reset_password_token;
       acres         acres_admin    false    264            	           1259    318996    index_accounts_on_user_id    INDEX     O   CREATE INDEX index_accounts_on_user_id ON demo.accounts USING btree (user_id);
 +   DROP INDEX demo.index_accounts_on_user_id;
       demo         acres_admin    false    268                       1259    319008    index_app_configs_on_user_id    INDEX     \   CREATE UNIQUE INDEX index_app_configs_on_user_id ON demo.app_configs USING btree (user_id);
 .   DROP INDEX demo.index_app_configs_on_user_id;
       demo         acres_admin    false    270                       1259    319021 )   index_bank_commission_editions_on_bank_id    INDEX     o   CREATE INDEX index_bank_commission_editions_on_bank_id ON demo.bank_commission_editions USING btree (bank_id);
 ;   DROP INDEX demo.index_bank_commission_editions_on_bank_id;
       demo         acres_admin    false    272                       1259    319022 )   index_bank_commission_editions_on_user_id    INDEX     o   CREATE INDEX index_bank_commission_editions_on_user_id ON demo.bank_commission_editions USING btree (user_id);
 ;   DROP INDEX demo.index_bank_commission_editions_on_user_id;
       demo         acres_admin    false    272            T           1259    339432 .   index_bank_commission_rate_trackers_on_bank_id    INDEX     y   CREATE INDEX index_bank_commission_rate_trackers_on_bank_id ON demo.bank_commission_rate_trackers USING btree (bank_id);
 @   DROP INDEX demo.index_bank_commission_rate_trackers_on_bank_id;
       demo         acres_admin    false    314            U           1259    339433 .   index_bank_commission_rate_trackers_on_user_id    INDEX     y   CREATE INDEX index_bank_commission_rate_trackers_on_user_id ON demo.bank_commission_rate_trackers USING btree (user_id);
 @   DROP INDEX demo.index_bank_commission_rate_trackers_on_user_id;
       demo         acres_admin    false    314                       1259    319039    index_banks_on_user_id    INDEX     I   CREATE INDEX index_banks_on_user_id ON demo.banks USING btree (user_id);
 (   DROP INDEX demo.index_banks_on_user_id;
       demo         acres_admin    false    274                       1259    319055 $   index_commission_settings_on_user_id    INDEX     l   CREATE UNIQUE INDEX index_commission_settings_on_user_id ON demo.commission_settings USING btree (user_id);
 6   DROP INDEX demo.index_commission_settings_on_user_id;
       demo         acres_admin    false    276                       1259    319077    index_commissions_on_user_id    INDEX     U   CREATE INDEX index_commissions_on_user_id ON demo.commissions USING btree (user_id);
 .   DROP INDEX demo.index_commissions_on_user_id;
       demo         acres_admin    false    278                       1259    319089    index_companies_on_user_id    INDEX     X   CREATE UNIQUE INDEX index_companies_on_user_id ON demo.companies USING btree (user_id);
 ,   DROP INDEX demo.index_companies_on_user_id;
       demo         acres_admin    false    280            !           1259    319117 !   index_credit_details_on_credit_id    INDEX     _   CREATE INDEX index_credit_details_on_credit_id ON demo.credit_details USING btree (credit_id);
 3   DROP INDEX demo.index_credit_details_on_credit_id;
       demo         acres_admin    false    284            $           1259    319129    index_credits_on_user_id    INDEX     M   CREATE INDEX index_credits_on_user_id ON demo.credits USING btree (user_id);
 *   DROP INDEX demo.index_credits_on_user_id;
       demo         acres_admin    false    286            '           1259    319141    index_customers_on_user_id    INDEX     Q   CREATE INDEX index_customers_on_user_id ON demo.customers USING btree (user_id);
 ,   DROP INDEX demo.index_customers_on_user_id;
       demo         acres_admin    false    288            *           1259    319154 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX     ~   CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON demo.friendly_id_slugs USING btree (slug, sluggable_type);
 D   DROP INDEX demo.index_friendly_id_slugs_on_slug_and_sluggable_type;
       demo         acres_admin    false    290    290            +           1259    319153 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON demo.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 N   DROP INDEX demo.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       demo         acres_admin    false    290    290    290            ,           1259    319155 '   index_friendly_id_slugs_on_sluggable_id    INDEX     k   CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON demo.friendly_id_slugs USING btree (sluggable_id);
 9   DROP INDEX demo.index_friendly_id_slugs_on_sluggable_id;
       demo         acres_admin    false    290            -           1259    319156 )   index_friendly_id_slugs_on_sluggable_type    INDEX     o   CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON demo.friendly_id_slugs USING btree (sluggable_type);
 ;   DROP INDEX demo.index_friendly_id_slugs_on_sluggable_type;
       demo         acres_admin    false    290            .           1259    319168    index_logs_on_user_id    INDEX     G   CREATE INDEX index_logs_on_user_id ON demo.logs USING btree (user_id);
 '   DROP INDEX demo.index_logs_on_user_id;
       demo         acres_admin    false    292            1           1259    319180 $   index_mail_configurations_on_user_id    INDEX     l   CREATE UNIQUE INDEX index_mail_configurations_on_user_id ON demo.mail_configurations USING btree (user_id);
 6   DROP INDEX demo.index_mail_configurations_on_user_id;
       demo         acres_admin    false    294            4           1259    319192    index_notaries_on_user_id    INDEX     O   CREATE INDEX index_notaries_on_user_id ON demo.notaries USING btree (user_id);
 +   DROP INDEX demo.index_notaries_on_user_id;
       demo         acres_admin    false    296            \           1259    397278    index_payment_delays_on_user_id    INDEX     [   CREATE INDEX index_payment_delays_on_user_id ON demo.payment_delays USING btree (user_id);
 1   DROP INDEX demo.index_payment_delays_on_user_id;
       demo         acres_admin    false    320            7           1259    319204    index_profiles_on_user_id    INDEX     V   CREATE UNIQUE INDEX index_profiles_on_user_id ON demo.profiles USING btree (user_id);
 +   DROP INDEX demo.index_profiles_on_user_id;
       demo         acres_admin    false    298            >           1259    319239 7   index_user_commission_editions_on_commission_setting_id    INDEX     �   CREATE INDEX index_user_commission_editions_on_commission_setting_id ON demo.user_commission_editions USING btree (commission_setting_id);
 I   DROP INDEX demo.index_user_commission_editions_on_commission_setting_id;
       demo         acres_admin    false    304            ?           1259    319240 )   index_user_commission_editions_on_user_id    INDEX     o   CREATE INDEX index_user_commission_editions_on_user_id ON demo.user_commission_editions USING btree (user_id);
 ;   DROP INDEX demo.index_user_commission_editions_on_user_id;
       demo         acres_admin    false    304            B           1259    319257    index_users_on_email    INDEX     L   CREATE UNIQUE INDEX index_users_on_email ON demo.users USING btree (email);
 &   DROP INDEX demo.index_users_on_email;
       demo         acres_admin    false    306            C           1259    319258 #   index_users_on_reset_password_token    INDEX     j   CREATE UNIQUE INDEX index_users_on_reset_password_token ON demo.users USING btree (reset_password_token);
 5   DROP INDEX demo.index_users_on_reset_password_token;
       demo         acres_admin    false    306            �
           1259    308258    index_accounts_on_user_id    INDEX     Q   CREATE INDEX index_accounts_on_user_id ON public.accounts USING btree (user_id);
 -   DROP INDEX public.index_accounts_on_user_id;
       public         acres_admin    false    184            �
           1259    308270    index_app_configs_on_user_id    INDEX     ^   CREATE UNIQUE INDEX index_app_configs_on_user_id ON public.app_configs USING btree (user_id);
 0   DROP INDEX public.index_app_configs_on_user_id;
       public         acres_admin    false    186            �
           1259    308283 )   index_bank_commission_editions_on_bank_id    INDEX     q   CREATE INDEX index_bank_commission_editions_on_bank_id ON public.bank_commission_editions USING btree (bank_id);
 =   DROP INDEX public.index_bank_commission_editions_on_bank_id;
       public         acres_admin    false    188            �
           1259    308284 )   index_bank_commission_editions_on_user_id    INDEX     q   CREATE INDEX index_bank_commission_editions_on_user_id ON public.bank_commission_editions USING btree (user_id);
 =   DROP INDEX public.index_bank_commission_editions_on_user_id;
       public         acres_admin    false    188            L           1259    339380 .   index_bank_commission_rate_trackers_on_bank_id    INDEX     {   CREATE INDEX index_bank_commission_rate_trackers_on_bank_id ON public.bank_commission_rate_trackers USING btree (bank_id);
 B   DROP INDEX public.index_bank_commission_rate_trackers_on_bank_id;
       public         acres_admin    false    310            M           1259    339381 .   index_bank_commission_rate_trackers_on_user_id    INDEX     {   CREATE INDEX index_bank_commission_rate_trackers_on_user_id ON public.bank_commission_rate_trackers USING btree (user_id);
 B   DROP INDEX public.index_bank_commission_rate_trackers_on_user_id;
       public         acres_admin    false    310            �
           1259    308301    index_banks_on_user_id    INDEX     K   CREATE INDEX index_banks_on_user_id ON public.banks USING btree (user_id);
 *   DROP INDEX public.index_banks_on_user_id;
       public         acres_admin    false    190            �
           1259    308317 $   index_commission_settings_on_user_id    INDEX     n   CREATE UNIQUE INDEX index_commission_settings_on_user_id ON public.commission_settings USING btree (user_id);
 8   DROP INDEX public.index_commission_settings_on_user_id;
       public         acres_admin    false    192            �
           1259    308339    index_commissions_on_user_id    INDEX     W   CREATE INDEX index_commissions_on_user_id ON public.commissions USING btree (user_id);
 0   DROP INDEX public.index_commissions_on_user_id;
       public         acres_admin    false    194            �
           1259    308351    index_companies_on_user_id    INDEX     Z   CREATE UNIQUE INDEX index_companies_on_user_id ON public.companies USING btree (user_id);
 .   DROP INDEX public.index_companies_on_user_id;
       public         acres_admin    false    196            �
           1259    308379 !   index_credit_details_on_credit_id    INDEX     a   CREATE INDEX index_credit_details_on_credit_id ON public.credit_details USING btree (credit_id);
 5   DROP INDEX public.index_credit_details_on_credit_id;
       public         acres_admin    false    200            �
           1259    308391    index_credits_on_user_id    INDEX     O   CREATE INDEX index_credits_on_user_id ON public.credits USING btree (user_id);
 ,   DROP INDEX public.index_credits_on_user_id;
       public         acres_admin    false    202            �
           1259    308403    index_customers_on_user_id    INDEX     S   CREATE INDEX index_customers_on_user_id ON public.customers USING btree (user_id);
 .   DROP INDEX public.index_customers_on_user_id;
       public         acres_admin    false    204            �
           1259    308416 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX     �   CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);
 F   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type;
       public         acres_admin    false    206    206            �
           1259    308415 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 P   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       public         acres_admin    false    206    206    206            �
           1259    308417 '   index_friendly_id_slugs_on_sluggable_id    INDEX     m   CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);
 ;   DROP INDEX public.index_friendly_id_slugs_on_sluggable_id;
       public         acres_admin    false    206            �
           1259    308418 )   index_friendly_id_slugs_on_sluggable_type    INDEX     q   CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);
 =   DROP INDEX public.index_friendly_id_slugs_on_sluggable_type;
       public         acres_admin    false    206            �
           1259    308430    index_logs_on_user_id    INDEX     I   CREATE INDEX index_logs_on_user_id ON public.logs USING btree (user_id);
 )   DROP INDEX public.index_logs_on_user_id;
       public         acres_admin    false    208            �
           1259    308442 $   index_mail_configurations_on_user_id    INDEX     n   CREATE UNIQUE INDEX index_mail_configurations_on_user_id ON public.mail_configurations USING btree (user_id);
 8   DROP INDEX public.index_mail_configurations_on_user_id;
       public         acres_admin    false    210            �
           1259    308454    index_notaries_on_user_id    INDEX     Q   CREATE INDEX index_notaries_on_user_id ON public.notaries USING btree (user_id);
 -   DROP INDEX public.index_notaries_on_user_id;
       public         acres_admin    false    212            V           1259    397244    index_payment_delays_on_user_id    INDEX     ]   CREATE INDEX index_payment_delays_on_user_id ON public.payment_delays USING btree (user_id);
 3   DROP INDEX public.index_payment_delays_on_user_id;
       public         acres_admin    false    316            �
           1259    308466    index_profiles_on_user_id    INDEX     X   CREATE UNIQUE INDEX index_profiles_on_user_id ON public.profiles USING btree (user_id);
 -   DROP INDEX public.index_profiles_on_user_id;
       public         acres_admin    false    214            �
           1259    308501 7   index_user_commission_editions_on_commission_setting_id    INDEX     �   CREATE INDEX index_user_commission_editions_on_commission_setting_id ON public.user_commission_editions USING btree (commission_setting_id);
 K   DROP INDEX public.index_user_commission_editions_on_commission_setting_id;
       public         acres_admin    false    220            �
           1259    308502 )   index_user_commission_editions_on_user_id    INDEX     q   CREATE INDEX index_user_commission_editions_on_user_id ON public.user_commission_editions USING btree (user_id);
 =   DROP INDEX public.index_user_commission_editions_on_user_id;
       public         acres_admin    false    220            �
           1259    308519    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public         acres_admin    false    222            �
           1259    308520 #   index_users_on_reset_password_token    INDEX     l   CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public         acres_admin    false    222            v           2606    309304    fk_rails_1cc89d251d    FK CONSTRAINT     |   ALTER TABLE ONLY acres.commissions
    ADD CONSTRAINT fk_rails_1cc89d251d FOREIGN KEY (user_id) REFERENCES acres.users(id);
 H   ALTER TABLE ONLY acres.commissions DROP CONSTRAINT fk_rails_1cc89d251d;
       acres       acres_admin    false    2818    264    236            x           2606    309314    fk_rails_2c2a63743f    FK CONSTRAINT     �   ALTER TABLE ONLY acres.credit_details
    ADD CONSTRAINT fk_rails_2c2a63743f FOREIGN KEY (credit_id) REFERENCES acres.credits(id);
 K   ALTER TABLE ONLY acres.credit_details DROP CONSTRAINT fk_rails_2c2a63743f;
       acres       acres_admin    false    244    2784    242            |           2606    309334    fk_rails_2f5753a5dd    FK CONSTRAINT     �   ALTER TABLE ONLY acres.mail_configurations
    ADD CONSTRAINT fk_rails_2f5753a5dd FOREIGN KEY (user_id) REFERENCES acres.users(id);
 P   ALTER TABLE ONLY acres.mail_configurations DROP CONSTRAINT fk_rails_2f5753a5dd;
       acres       acres_admin    false    2818    252    264            �           2606    309354    fk_rails_36e1c960d7    FK CONSTRAINT     �   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT fk_rails_36e1c960d7 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 U   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT fk_rails_36e1c960d7;
       acres       acres_admin    false    264    262    2818            �           2606    397256    fk_rails_3beb8741ab    FK CONSTRAINT        ALTER TABLE ONLY acres.payment_delays
    ADD CONSTRAINT fk_rails_3beb8741ab FOREIGN KEY (user_id) REFERENCES acres.users(id);
 K   ALTER TABLE ONLY acres.payment_delays DROP CONSTRAINT fk_rails_3beb8741ab;
       acres       acres_admin    false    264    2818    318            t           2606    309294    fk_rails_465b63d453    FK CONSTRAINT     v   ALTER TABLE ONLY acres.banks
    ADD CONSTRAINT fk_rails_465b63d453 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 B   ALTER TABLE ONLY acres.banks DROP CONSTRAINT fk_rails_465b63d453;
       acres       acres_admin    false    232    2818    264            �           2606    339401    fk_rails_50b9584c52    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_50b9584c52 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 Z   ALTER TABLE ONLY acres.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_50b9584c52;
       acres       acres_admin    false    264    2818    312                       2606    309349    fk_rails_5eff3e81e7    FK CONSTRAINT     �   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT fk_rails_5eff3e81e7 FOREIGN KEY (commission_setting_id) REFERENCES acres.commission_settings(id);
 U   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT fk_rails_5eff3e81e7;
       acres       acres_admin    false    234    2770    262            q           2606    309279    fk_rails_7835cd6bc7    FK CONSTRAINT     |   ALTER TABLE ONLY acres.app_configs
    ADD CONSTRAINT fk_rails_7835cd6bc7 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 H   ALTER TABLE ONLY acres.app_configs DROP CONSTRAINT fk_rails_7835cd6bc7;
       acres       acres_admin    false    228    264    2818            }           2606    309339    fk_rails_8c64c61308    FK CONSTRAINT     y   ALTER TABLE ONLY acres.notaries
    ADD CONSTRAINT fk_rails_8c64c61308 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.notaries DROP CONSTRAINT fk_rails_8c64c61308;
       acres       acres_admin    false    254    264    2818            {           2606    309329    fk_rails_8fc980bf44    FK CONSTRAINT     u   ALTER TABLE ONLY acres.logs
    ADD CONSTRAINT fk_rails_8fc980bf44 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 A   ALTER TABLE ONLY acres.logs DROP CONSTRAINT fk_rails_8fc980bf44;
       acres       acres_admin    false    250    2818    264            y           2606    309319    fk_rails_9001739776    FK CONSTRAINT     x   ALTER TABLE ONLY acres.credits
    ADD CONSTRAINT fk_rails_9001739776 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 D   ALTER TABLE ONLY acres.credits DROP CONSTRAINT fk_rails_9001739776;
       acres       acres_admin    false    264    244    2818            z           2606    309324    fk_rails_9917eeaf5d    FK CONSTRAINT     z   ALTER TABLE ONLY acres.customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES acres.users(id);
 F   ALTER TABLE ONLY acres.customers DROP CONSTRAINT fk_rails_9917eeaf5d;
       acres       acres_admin    false    246    264    2818            p           2606    309274    fk_rails_b1e30bebc8    FK CONSTRAINT     y   ALTER TABLE ONLY acres.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.accounts DROP CONSTRAINT fk_rails_b1e30bebc8;
       acres       acres_admin    false    226    264    2818            u           2606    309299    fk_rails_c901e64655    FK CONSTRAINT     �   ALTER TABLE ONLY acres.commission_settings
    ADD CONSTRAINT fk_rails_c901e64655 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 P   ALTER TABLE ONLY acres.commission_settings DROP CONSTRAINT fk_rails_c901e64655;
       acres       acres_admin    false    234    2818    264            s           2606    309289    fk_rails_ce41058218    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT fk_rails_ce41058218 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 U   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT fk_rails_ce41058218;
       acres       acres_admin    false    2818    230    264            �           2606    339396    fk_rails_d4f3af1ab5    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_d4f3af1ab5 FOREIGN KEY (bank_id) REFERENCES acres.banks(id);
 Z   ALTER TABLE ONLY acres.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_d4f3af1ab5;
       acres       acres_admin    false    232    2767    312            ~           2606    309344    fk_rails_e424190865    FK CONSTRAINT     y   ALTER TABLE ONLY acres.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.profiles DROP CONSTRAINT fk_rails_e424190865;
       acres       acres_admin    false    2818    256    264            w           2606    309309    fk_rails_e57cb42012    FK CONSTRAINT     z   ALTER TABLE ONLY acres.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 F   ALTER TABLE ONLY acres.companies DROP CONSTRAINT fk_rails_e57cb42012;
       acres       acres_admin    false    264    2818    238            r           2606    309284    fk_rails_f1ee247f8f    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT fk_rails_f1ee247f8f FOREIGN KEY (bank_id) REFERENCES acres.banks(id);
 U   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT fk_rails_f1ee247f8f;
       acres       acres_admin    false    232    2767    230            �           2606    319289    fk_rails_1cc89d251d    FK CONSTRAINT     z   ALTER TABLE ONLY demo.commissions
    ADD CONSTRAINT fk_rails_1cc89d251d FOREIGN KEY (user_id) REFERENCES demo.users(id);
 G   ALTER TABLE ONLY demo.commissions DROP CONSTRAINT fk_rails_1cc89d251d;
       demo       acres_admin    false    306    278    2885            �           2606    319299    fk_rails_2c2a63743f    FK CONSTRAINT     �   ALTER TABLE ONLY demo.credit_details
    ADD CONSTRAINT fk_rails_2c2a63743f FOREIGN KEY (credit_id) REFERENCES demo.credits(id);
 J   ALTER TABLE ONLY demo.credit_details DROP CONSTRAINT fk_rails_2c2a63743f;
       demo       acres_admin    false    286    2851    284            �           2606    319319    fk_rails_2f5753a5dd    FK CONSTRAINT     �   ALTER TABLE ONLY demo.mail_configurations
    ADD CONSTRAINT fk_rails_2f5753a5dd FOREIGN KEY (user_id) REFERENCES demo.users(id);
 O   ALTER TABLE ONLY demo.mail_configurations DROP CONSTRAINT fk_rails_2f5753a5dd;
       demo       acres_admin    false    2885    306    294            �           2606    319339    fk_rails_36e1c960d7    FK CONSTRAINT     �   ALTER TABLE ONLY demo.user_commission_editions
    ADD CONSTRAINT fk_rails_36e1c960d7 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 T   ALTER TABLE ONLY demo.user_commission_editions DROP CONSTRAINT fk_rails_36e1c960d7;
       demo       acres_admin    false    2885    304    306            �           2606    397273    fk_rails_3beb8741ab    FK CONSTRAINT     }   ALTER TABLE ONLY demo.payment_delays
    ADD CONSTRAINT fk_rails_3beb8741ab FOREIGN KEY (user_id) REFERENCES demo.users(id);
 J   ALTER TABLE ONLY demo.payment_delays DROP CONSTRAINT fk_rails_3beb8741ab;
       demo       acres_admin    false    2885    306    320            �           2606    319279    fk_rails_465b63d453    FK CONSTRAINT     t   ALTER TABLE ONLY demo.banks
    ADD CONSTRAINT fk_rails_465b63d453 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 A   ALTER TABLE ONLY demo.banks DROP CONSTRAINT fk_rails_465b63d453;
       demo       acres_admin    false    274    306    2885            �           2606    339427    fk_rails_50b9584c52    FK CONSTRAINT     �   ALTER TABLE ONLY demo.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_50b9584c52 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 Y   ALTER TABLE ONLY demo.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_50b9584c52;
       demo       acres_admin    false    314    306    2885            �           2606    319334    fk_rails_5eff3e81e7    FK CONSTRAINT     �   ALTER TABLE ONLY demo.user_commission_editions
    ADD CONSTRAINT fk_rails_5eff3e81e7 FOREIGN KEY (commission_setting_id) REFERENCES demo.commission_settings(id);
 T   ALTER TABLE ONLY demo.user_commission_editions DROP CONSTRAINT fk_rails_5eff3e81e7;
       demo       acres_admin    false    2837    304    276            �           2606    319264    fk_rails_7835cd6bc7    FK CONSTRAINT     z   ALTER TABLE ONLY demo.app_configs
    ADD CONSTRAINT fk_rails_7835cd6bc7 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 G   ALTER TABLE ONLY demo.app_configs DROP CONSTRAINT fk_rails_7835cd6bc7;
       demo       acres_admin    false    306    2885    270            �           2606    319324    fk_rails_8c64c61308    FK CONSTRAINT     w   ALTER TABLE ONLY demo.notaries
    ADD CONSTRAINT fk_rails_8c64c61308 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 D   ALTER TABLE ONLY demo.notaries DROP CONSTRAINT fk_rails_8c64c61308;
       demo       acres_admin    false    296    2885    306            �           2606    319314    fk_rails_8fc980bf44    FK CONSTRAINT     s   ALTER TABLE ONLY demo.logs
    ADD CONSTRAINT fk_rails_8fc980bf44 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 @   ALTER TABLE ONLY demo.logs DROP CONSTRAINT fk_rails_8fc980bf44;
       demo       acres_admin    false    306    292    2885            �           2606    319304    fk_rails_9001739776    FK CONSTRAINT     v   ALTER TABLE ONLY demo.credits
    ADD CONSTRAINT fk_rails_9001739776 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 C   ALTER TABLE ONLY demo.credits DROP CONSTRAINT fk_rails_9001739776;
       demo       acres_admin    false    286    2885    306            �           2606    319309    fk_rails_9917eeaf5d    FK CONSTRAINT     x   ALTER TABLE ONLY demo.customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES demo.users(id);
 E   ALTER TABLE ONLY demo.customers DROP CONSTRAINT fk_rails_9917eeaf5d;
       demo       acres_admin    false    306    288    2885            �           2606    319259    fk_rails_b1e30bebc8    FK CONSTRAINT     w   ALTER TABLE ONLY demo.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 D   ALTER TABLE ONLY demo.accounts DROP CONSTRAINT fk_rails_b1e30bebc8;
       demo       acres_admin    false    306    268    2885            �           2606    319284    fk_rails_c901e64655    FK CONSTRAINT     �   ALTER TABLE ONLY demo.commission_settings
    ADD CONSTRAINT fk_rails_c901e64655 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 O   ALTER TABLE ONLY demo.commission_settings DROP CONSTRAINT fk_rails_c901e64655;
       demo       acres_admin    false    2885    276    306            �           2606    319274    fk_rails_ce41058218    FK CONSTRAINT     �   ALTER TABLE ONLY demo.bank_commission_editions
    ADD CONSTRAINT fk_rails_ce41058218 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 T   ALTER TABLE ONLY demo.bank_commission_editions DROP CONSTRAINT fk_rails_ce41058218;
       demo       acres_admin    false    272    2885    306            �           2606    339422    fk_rails_d4f3af1ab5    FK CONSTRAINT     �   ALTER TABLE ONLY demo.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_d4f3af1ab5 FOREIGN KEY (bank_id) REFERENCES demo.banks(id);
 Y   ALTER TABLE ONLY demo.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_d4f3af1ab5;
       demo       acres_admin    false    314    274    2834            �           2606    319329    fk_rails_e424190865    FK CONSTRAINT     w   ALTER TABLE ONLY demo.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 D   ALTER TABLE ONLY demo.profiles DROP CONSTRAINT fk_rails_e424190865;
       demo       acres_admin    false    2885    306    298            �           2606    319294    fk_rails_e57cb42012    FK CONSTRAINT     x   ALTER TABLE ONLY demo.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES demo.users(id);
 E   ALTER TABLE ONLY demo.companies DROP CONSTRAINT fk_rails_e57cb42012;
       demo       acres_admin    false    2885    280    306            �           2606    319269    fk_rails_f1ee247f8f    FK CONSTRAINT     �   ALTER TABLE ONLY demo.bank_commission_editions
    ADD CONSTRAINT fk_rails_f1ee247f8f FOREIGN KEY (bank_id) REFERENCES demo.banks(id);
 T   ALTER TABLE ONLY demo.bank_commission_editions DROP CONSTRAINT fk_rails_f1ee247f8f;
       demo       acres_admin    false    274    272    2834            e           2606    308551    fk_rails_1cc89d251d    FK CONSTRAINT     ~   ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT fk_rails_1cc89d251d FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.commissions DROP CONSTRAINT fk_rails_1cc89d251d;
       public       acres_admin    false    222    2751    194            g           2606    308561    fk_rails_2c2a63743f    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_details
    ADD CONSTRAINT fk_rails_2c2a63743f FOREIGN KEY (credit_id) REFERENCES public.credits(id);
 L   ALTER TABLE ONLY public.credit_details DROP CONSTRAINT fk_rails_2c2a63743f;
       public       acres_admin    false    200    2717    202            k           2606    308581    fk_rails_2f5753a5dd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mail_configurations
    ADD CONSTRAINT fk_rails_2f5753a5dd FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.mail_configurations DROP CONSTRAINT fk_rails_2f5753a5dd;
       public       acres_admin    false    210    222    2751            o           2606    308601    fk_rails_36e1c960d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT fk_rails_36e1c960d7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT fk_rails_36e1c960d7;
       public       acres_admin    false    2751    220    222            �           2606    397239    fk_rails_3beb8741ab    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_delays
    ADD CONSTRAINT fk_rails_3beb8741ab FOREIGN KEY (user_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.payment_delays DROP CONSTRAINT fk_rails_3beb8741ab;
       public       acres_admin    false    2751    316    222            c           2606    308541    fk_rails_465b63d453    FK CONSTRAINT     x   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT fk_rails_465b63d453 FOREIGN KEY (user_id) REFERENCES public.users(id);
 C   ALTER TABLE ONLY public.banks DROP CONSTRAINT fk_rails_465b63d453;
       public       acres_admin    false    222    190    2751            �           2606    339375    fk_rails_50b9584c52    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_50b9584c52 FOREIGN KEY (user_id) REFERENCES public.users(id);
 [   ALTER TABLE ONLY public.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_50b9584c52;
       public       acres_admin    false    222    2751    310            n           2606    308596    fk_rails_5eff3e81e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT fk_rails_5eff3e81e7 FOREIGN KEY (commission_setting_id) REFERENCES public.commission_settings(id);
 V   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT fk_rails_5eff3e81e7;
       public       acres_admin    false    192    2703    220            `           2606    308526    fk_rails_7835cd6bc7    FK CONSTRAINT     ~   ALTER TABLE ONLY public.app_configs
    ADD CONSTRAINT fk_rails_7835cd6bc7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.app_configs DROP CONSTRAINT fk_rails_7835cd6bc7;
       public       acres_admin    false    186    222    2751            l           2606    308586    fk_rails_8c64c61308    FK CONSTRAINT     {   ALTER TABLE ONLY public.notaries
    ADD CONSTRAINT fk_rails_8c64c61308 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.notaries DROP CONSTRAINT fk_rails_8c64c61308;
       public       acres_admin    false    2751    212    222            j           2606    308576    fk_rails_8fc980bf44    FK CONSTRAINT     w   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT fk_rails_8fc980bf44 FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.logs DROP CONSTRAINT fk_rails_8fc980bf44;
       public       acres_admin    false    2751    208    222            h           2606    308566    fk_rails_9001739776    FK CONSTRAINT     z   ALTER TABLE ONLY public.credits
    ADD CONSTRAINT fk_rails_9001739776 FOREIGN KEY (user_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.credits DROP CONSTRAINT fk_rails_9001739776;
       public       acres_admin    false    222    2751    202            i           2606    308571    fk_rails_9917eeaf5d    FK CONSTRAINT     |   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT fk_rails_9917eeaf5d;
       public       acres_admin    false    222    2751    204            _           2606    308521    fk_rails_b1e30bebc8    FK CONSTRAINT     {   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.accounts DROP CONSTRAINT fk_rails_b1e30bebc8;
       public       acres_admin    false    2751    184    222            d           2606    308546    fk_rails_c901e64655    FK CONSTRAINT     �   ALTER TABLE ONLY public.commission_settings
    ADD CONSTRAINT fk_rails_c901e64655 FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.commission_settings DROP CONSTRAINT fk_rails_c901e64655;
       public       acres_admin    false    222    192    2751            b           2606    308536    fk_rails_ce41058218    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT fk_rails_ce41058218 FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT fk_rails_ce41058218;
       public       acres_admin    false    2751    222    188            �           2606    339370    fk_rails_d4f3af1ab5    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_rate_trackers
    ADD CONSTRAINT fk_rails_d4f3af1ab5 FOREIGN KEY (bank_id) REFERENCES public.banks(id);
 [   ALTER TABLE ONLY public.bank_commission_rate_trackers DROP CONSTRAINT fk_rails_d4f3af1ab5;
       public       acres_admin    false    310    2700    190            m           2606    308591    fk_rails_e424190865    FK CONSTRAINT     {   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.profiles DROP CONSTRAINT fk_rails_e424190865;
       public       acres_admin    false    214    222    2751            f           2606    308556    fk_rails_e57cb42012    FK CONSTRAINT     |   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.companies DROP CONSTRAINT fk_rails_e57cb42012;
       public       acres_admin    false    2751    222    196            a           2606    308531    fk_rails_f1ee247f8f    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT fk_rails_f1ee247f8f FOREIGN KEY (bank_id) REFERENCES public.banks(id);
 V   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT fk_rails_f1ee247f8f;
       public       acres_admin    false    190    188    2700            8      x������ � �      :      x������ � �      `   ?   x�K�+�,���M�+�LI-K��/ ��-u�t�M�-�L��,�-�M�Hq��qqq �op      <   �  x������0Ec�
7`<��)b*p��gK��2Gb��
�� @B���������݊�馂v���$:��p4��D���m��A��VY<K���̺����sI�������Gґ[;RGpXmD�9�[yW�.�5=�WNMo��ZWex�LyY��cT���
�E�u���Ъ��E��QOSVo�@�6�mo�F���.�=���p�"�T>v���>B����.)~W�FLn��X R��aώ�>��# =?US���ж@�~�*��G�25�[Y'D��)ޝ�,b�HϏ�Ɛ�z�����,�NpV��0NI:[�*�@���?�K���t7hQ��<R�u�ؠk����^�c��m�?2#����Ɲ�� �f+D&���q�      �   �   x���Mn1���)��X���'`�J��ɀZi���������mnB<���@��j�ގo��I;}�|��m)��(cF��\eНn���:�ىc�[=n�{�n��H���[���fk����[�߆qN8�XG�������Q��_�E:��en�ީFط�����@�e\{�����$���G�3K��q      >   	  x����m�0���^ D��� 7q #MR8�P���U��Cb�0J�"<���{�0t��p������a�\�@<��Á��eGX�d��
��)�j�9jV�$�b���B�5�>���z���7 9��p2�W�eb�Ħ:#S8O���N�,=Oy�&��#{�� 5F)��&�K7��ڳ���{DY�D�"5K����:>x͋A�y,J��;�#1�C�/iO�u1�� �*T�I�Z�O@�b�Yi�_���C      @   �  x���ˑ�0�FN�(|IBAL�?��언�J��]" 6i����ߊ�}�_�ǋ���=�w\k�5n�u�g��䒚ʫ�/$�3����r<�A�����JE<����l��\�c�*?� �m*���h2�.��A6�T�2B��K�!�f��V�U-�z� �m*_��qG^JR��D���z-�5H���@;�"Z�ι".���vj�0&�:�il�9�3Ψ�uV�O�9h3��pŶ��sЊa���Ql��@;�jy"Q�w�s�
2�:ëi��sЊ�N����sЊa
�L�YH�X�UqE�eVH�ط��q��/$�$�mt�!��7�Sn��^<�D��a+�g��)gQ�e��;�B`�rNe|��1s��:媖��Z���
�u�y�rƃ\�3��^��Ɠ��u�@{oT�S�G_4ט7�SΫ��[s��9x�ܾ�>����E�j�D�F ��W	r      B      x��][zI�~ƫ�i�I|y���"�
�Ie�1B��Y��u���Y��	d%B �=��?�➑��Bϔ��9�t'��#��3��챛?n7?�~|�������=t���v3_��l�W������f?���nw��==��O����]�k������
��|��.f�ra�8�ef$��@>���Likg*�� 3�p'Pϥ����"���NHnAV:-�i+h��z������3���j����n�%�c��<�����v��B����97�x��Z��oJ��8|75�Dj���u�xӐL&L&x��c�8'F�(3����a�nߟ��,����3���Z����X
r!N^'���8z�nKAY+eUFIQ?l/�U��d"R�)<��v,v]�w�sVWro<�������ƴ<P0��0Rh���"=2�������,_�W�y�1z5����SsfҶ����\�r��xb.�����jƦ�����}�|���-���j;_���7���^h�xۅ.�.�E ���%�RVE"���u'�N=�R��-^� 1E�%� ���^���a��#�A�����4�Y��_u�M�E��m �_s%��|�|�R�I�Q��HL�t��~_
�/���!��:�p���`�$�"[���W[��ڝ��SK��N�mr�B�2hC�߽cs���`�B��� ������2w/�����v��r�j�a�-�������]���A&^'����?�8��B�>��fDE@���� `�Oy��9_m~B�/�n~C�n'&�B*1��^�&�&����,�����Ni��z����0>z��P-|�����]���ǐ���C��V#�6������!��X SJ�r�<��'�o5{~{;b~����]�=�oh��k:V��0��'6��%(�U���g�(�d���~Og�޾���g�:vl��h#��(7���W��y�)c�ה������6��q��G�Y�q{]h?N��D���ɘ�ɔ��B�o͢��V�VO��P,�&�Gi�;�!{S2�*h"B4��?�������~�M�w�'l�-���%8`��ֵ��Gw����v�n&2�;Lf&�T�d&��	�I
�M�c�T�\y��C~�z�8-���<��K���:���e9��Q��f
�Y�;dJX�S�5��x2�H�;5�!{6d��q)� ���b���b�\a�	x�M.lp�n~�XP�0*��JK���K)��*c��\���c�\�fڅ�R����.6D*�;�a�؇`M,D�� �������׉}dPcH��r�$fo���H�߲ >%�u��#aQq�P��-f���H`V-�.P4���М��u�������Z^��x�އ:����&��lM�8��u^��j����iʃ��@��P�t�Z�s��۬v�^���Mۯ�ML:bVG06)ڏ��"kI�_�o���jbԐr#�� ��ޝ��X�;G/��%����|�MgZ7S$:��u��@��ȥ.�r4#(YG6�������\��˧����^�i�|Clhל�C �fʠCP����z8}��BP��BcM[4f!.�^Vϫn��m��k~�i� 'ꊍ�k�d�[�AU�p��A���h���E�ด�Z�-�u嬶�ص�fF�x�\*��dH�ɐ�OS#��b�z]���+�����1Sn*>͚?���3O��D�Q�t�;�Z&>���f�$Gf�,{݅���~��Y�&bRo�5�ձRh���P��!�r�=�VI���,��+c�}ؽ��6�n�}�YK��#L�Jm���ԲuG��US�T'NN����f�~=��Ϩ&�v6��\��^�;�*��e�Nq��Ө�SaV>1i���Ѡ&TW�@��YـSȵ�����"ސ��ƴ�[<"q�0��?��w����B���6_"�j$P,��U����"��w����r��SB/~+9ݓ2낫�f�A���t�"�.��Q�v�e#�*�h�0����L&,�D.��y�C����e��v���q� \�?�3,~��nI�\���[1�(��9��ǃ��f��uk�H�[�WZ�ZR?P�r)��v�F�4ܨ�)�3p���ْ^_��c��p	�l$[�h
S��('�2�����9*��e�ڝjs���v����v�08�D�`�Qs��Kx���h�c���ֹ�f4;� �����{�7͏'(z�9H0r
X�/��*8�޿�=v?w�_�q.>7DQxhg��5��sz� �L� I"�kf.�y��J̹<-"{����r��|��dO �Q���Z+�j��d��.�@�l����^%z$#|7C" ��<�Ld�="�y{{��H� ����Ƕ�Ѱ��t�����uFO�k�u��v���&U�PP����zڜ��[�Aܘm:S/��P.�o���l�}�ؾ8���SF�9��k �6��5�l���P�%J,���m�,z�9P�����G�x��S��S�ؖ8h\b�|̾���@��p
X�޸z�l�P<v�
k`��F�ꐲ1B}������ni�ƥ�D���D�MH��?��.�"]lqn��u�B���$ι�re\{����g��=9����'7��j?9P��	�7a~���G�ʌ���˗�����K�k}O��q���G�ꥬ5P�h9n ��X��Z�ށ:S������w�GB~�;Ԅ�q;�٘׊��W��ه���I�4+�
�ꎽ����窒X}~X�?��0��Ԕ��>SV�Y��ՙuRA�l�5$���j12{4�v�̋R�%�2/�}�v��ԫ�O=�ːbd���N�(�0��);����u�Ԅ
"q:� �##]�8�9LO��g�a�8�A��#�1Q���i�sEWu���[�ٲ�)�0�zg2cn|6�����}_ߊ5���C�f������Z����^�ɔbVs^1�Q�]�H'�7bʩ�%�����R�)Ԏ�nG��a#��BJiR�ҹ=�%��%��X��,Q$P;�C�'(ZT�
J�� $N�r�a,����+�z��3	�:���А:eB�3a#x�Pv�|�gG�q���:�u��+�3l&��F��OH����O�E�����U�y�ϑ'��W�{���H��(PorYG����RQ41�������Z{[�+O��YơX�$]��$�#8���U|̄�sx���U8Q���N�f#obm��b�C�(��bp�J;^Q3w��cqHze=��9}��KR&7�m�䕩�`�	�b;R��	�� ��DI���������ګ�?�o9#ϳpǧ��6�ds��KF����H�N��`(���!�:����I)&����
���u���J��Q�N��!&pl���R!G~mg���x��zI,��b�~�52I��7��_{T�����=�|�P�5�F��RT�{"1z��mȪ������4��q	Q�CAu�o�<�������3�u���}߽�b��}\�M�FuB�~�ړ8���j�\�OJZ�� i����Db�|�gU�F�f�m�P�j/�>�r?*�����|�E6S.�B͙'��cBkd�ޏZ��������� �,����$�'��+��|h����|uD,�;GQFw�*:��e���X������q����;?ܮIF����ip�z5�{C�t1;Ø�F�Ƭ60zgj����s��u	~����k�����.^���j�����9D�uFW'��=�ֈ<�xk����jA�~I"1|����o�O����Z$F�"z_�}��ql�o"[mk�����s������i�~�~��c'{5=�F�Si�T=�������B�|��X��qO`�uD%ʃF��.���q0�b�s�$��p��]�|�s�����*�o{���ܯ�o�����.wy@�ԽFOb�GN�y[�Q �z�Փ�f�:�y`ܹ�ݗ��-Wz�`d�JT������<��N}u��Z��bz=/�I��D��X��G��L�r�[��\uf$��`Pd�%��S�!���7s&o���&Cvy��O㕇���J���z� �	  �յI���<cs:�jQ�)q&�k�S:Ɂ��
���^�'1Zĵ����Ǽ�q��Nui��t�H�C��A"��(��%���I&��s��n��|z���84u!^,� 1|�r��5b:�\��n+� &�[�'r����9�9^�:+��m�-�_O�F$1<�ÓG���lk�����$J$����b��vַ&�e��|Z�t����N8�ֺ�!�1�	D��r|�5'b����&����8LYA����������c
�`dy��̏F���������S�'�Hsg�U�l�!s���(f�J�gҩ3�T��A`J�ZPJ$��A�ZmK_9���n��}���aF׈If!��|��$�9�I���ld��u��֏�8y��x��L]�=��r��Ad����"�~��؊� @�~�7���ؔ�9��}{ ���Ic�[�F㬨X�u�+l�2�P]���O6��")_cj}���6O����A��ϗ���G��
�-+�Ġ9�xk�[,F8�U�l�kN��/�˳'18˃*ޘ#_b��,G��**��{�s����frxch�ξ��Ё�lJ�gSZ$f�G6��"�X�p��g�^o�ۛ����G H���'1x�ơ�d���^�B�����5n�����HOz�{���!!�$^��p����Db����*.}[Y#�o竴���MC$�̣n�=��)�K���1%7*A@��v���Ј���6��dB���$�����b*�^��Nm��.�h�(���'ҷ8c�9�� ��ap�������缬Wl�����ʕ�z��2[o/��ەՙ�Db�̬���J�f��0����4�d�����%C� gmZ��kr����զ"���������r�i�[�$|��#��q�!mg1�A�s�(�������r�|�^���L��ԪPm3'C�0冡�K���d��gS��H�8�`��B=s=�����o�����N$���g]<��2��o�klBW�N�����9<���?�a�W�?&a�v����		G�DP�B���J=���,O�_��k����n5H��
�������_�+�Q��hc��	�GcG,��w���+���8�0z"0�$F�X��������W���&h=�*�Ġ݌(���o�{-O�Ŭ��|F4��������d���5X:���ǆ��@w	�f`p����t"10�-�+B�"�~~���༺�S����Ǿ�ٞt!��g"��G���t�C���+�?�sh���_�����JG��jV2^	��'�~-���G�?~O,�n���a#������fdc�����̅�F˿��x`%zj$�곴b�������F�:n��f��i��Yޔ ����ѥ����Ɗq"ˏ�����i����'�K�L��ZT��r���{��s�qT�!���-��E��2T�}����A�5�W���%�SS�Vk57�n�*aT�(�֫V�;�t��ջ��v���Pn��tG����S�ϭ�>��n]��(;���i���2�}(M��#�M�x�7���Db�j���2��2:v֭�k�{�A���ڡ��-�Ok4�06���H��r�{�V��K�'1���p����U����k{U�gGUGד]�M��;�tT�v����vS��T��Jԓ��O�s�X�t�1�=�T>�ߔ�a�կ�H$F�"�Wk*��TJm��?���S���#�W
S>���:����*H0��7
��hS�A)_�F�9"����e���W��PZ�� ���m0��Έ���t�¾���Ck[��V��
c"��vP��8��*�R���B����H
zcW	;�`�e0*�/�\Y�|�[��j���4�ӥsn�X�O{/j��k��7A�QQBe�ȨRgp<u������Z����/�I��y��w��|����GMn�,��=��t�v��F<MCuFV�B������[���ׂ[L��U�i���݀ߑS��]�{��N3!y�O�A$31�Q����K�.��D3��SM�о�]I$FB^Нo8�7;�0/V|��1��WQ^��j�`�������H,�@e���1�L�=#dӚ���Z� 1�a��� ����/O�r^�PcZ3Ab.԰�U���2\q��?�۾=��'|t��1��%(��/.�˿'1r= �[-��
UL�^y�E7_������&���ۢ�աV�H���t$1f`)�*�;rx�?�m%�@�}}AQ"1H�@z�����"5
)��"T��q!��Y��-�&��G�������閛�?P1m�5jҼ�Ws�� 1�F܀y����C�����j����:�H3-7$��Kn8F�6-�HT�E	 ]Z�m\�r����%�V���H˼��:g�+������yt�!i��4H���������=��      D   a   x�3�tL.J-��v�qtr�Sp�r�tr�u����u����62267017446�L+��C #N#CK]#]CsC+#c+S3=s#3s33<R\1z\\\ HK1      F      x������ � �      H      x������ � �      J      x��]Mv�8�^;O�U��~�?лy��͜�7�DK,S����<Q�9�bA
 �ʔR�o����N�� �Z�'�9���r��sf�\g\�>��ۧ�/�a.���bӴ�զ����<vO��ﻮ,�l]�z�/�������iw��jW4//m�1/��a?x�m��6��N�p��\e�]��_\�K�ϹfƊ+�/B��D�jay�i2��K4��-����o�b�a[T��嘝Tl^���	��ob.!�	�	�ɅY�����g�f]�ח�l˃ﺾ}���/w�r:�ri�%H�:B�*�	����J�<�u��mW;��U>�_�=,ɪ<�uY����v�rW,��sc��"Bfb`�r&a��xlƭʅߢ-���Wǲ�[_TE}��6E}�ۏg���V��������ޏ����p�Ƨ%�D&Z�h��pH8~��o��\��|�n���-
��][���W'���m#�<�e:/a��_��M�Zf�o���_~`|�-��Srvf_� ��@j3U�q-���^��.7%� mӿ�C\�Z]!\�
�KpU<y�����V���ZP����*��l� B��V0x�6n.҉�a�0R��o�]_��gJhS}��\��+�匌������#�s�'*5(e��h�ɨؼ�U2�*�Z��{������/� v������@��䉁�#�톼5o�,-�]�3v�^�Q�tX�c�Mn[Ld,n1!(>^��u�UŦl�I����$���ڂ���&Wi!X@��G��md�r����;V��3"�;a�!�`���֨D��%ɣCeH�zl�m��zl����,lJx���օ�M_-f�rk��"B��~+ks��v�D�DH�����*[��W��륅`�ߨ��3�m!+��l.rƘ
��*|4�3O>�h�š8�%*�k*��Y�l6~۴�C���v	bֈY�/�d���N��#��3̻@����qZ'r:�E��H(��t��k�;%��O���+; oE�)ގeS��uU���k1~�x��E��"~���_�Is�vGP���A��R����l���]�~�����5�w_�ޖ¦��n���wp{����[��/�E���9ܥ���[����̛�[�A�L����0*[��0�"$��_��}S7w�8�KP?O���V�j���/ϫm�:�2vM��b|u ���0N�Q�D��I���ɏ�J,+_��zۖp�M����Vm�m��-�c ����"�Ñ����*�,�ȧt ˮ��l�K0��o�Ì�r_}�H��5�l�-~<�|f�v ���l�8�c�!<>l+
��� =qE�lٓ�_��>�<�\f/����Ȁ������|�W�@.��/2Ɲ�";����ժ�3�ueV�~sO�0Q��X�ʿ&BV�ɀ��ld�X�lQk�a�\m�����Vm��R�O�~s�w]7�d�])� /���Z,��:-X*��Y=r�'s"��"$�����L>aܥ��Y�!��wu��O?�:p:�$�(B��s���oT
_�!���I���e���V�����$�Y¹\m���	gl��R�	"����ҙ�)�_>ه'��ǔ��}q̆�����`�8īl�� BZi�ȅ��!b׿��O���R�W!o��mT�`&9����r���O[����d�p�����$e?N���c�<r�,��k"$��ڥ}����p�$s�`���^��Ќ�$$�~?��+"D^�U<O���j1�w�Q�U:��U�Đ�lc��� i_<nm����S�1��)z":w62���pK�F��]������$�͚����(/9��:"��4��_Oꑫ�8���"�~޽$�),�I4F�PV`���η�ң'�Vw���-���LS>X!wte�b�6���|Z��ּ�/
_���^�!
���?����g׹8*�y �G����P1^![�k���Vd,]��4��W����_? ����%U�E���dJT3u����ny�=&�~Ά	�w�WD�����D��Eʋ���	C*�z�/*�w��n�~��9�KF�A/�ɰ5�|μ@�L�V�?�$7�}���|�.�xWEy�A�|�qJ���E]�2����2����E��?�{�rp8��?����9�("�&nJ&n��&������e�}2G��{;9��J��?���|��M[doe]ߓ�:�З��R�t��E��g'�D���ޫEu,�O.j�k��m0dhDH@�Kb$�sp����xί��"�.�,�:��LuSt��{��q)���P%<��|- >�� b���D�ѹ3)��8yN���_OFuGP S���������E�8H���R 72�W�a�����2�T��}M�&��`"�Lw�11��7'b����vW�h�e3>�(B"��)5s��ߊ���|ݿ��=!�/������i!c>0)O�����LD��F|�c���^x$1�m>�'�q�*URwv�.��o��R�Hk���9n��CUS�P��YƮ���D�Z븎ѣ�ҥÒ�euh��"â.���B���[Z?����1�zE�Y!f#�i�d+b�̭	<o_�3�TVm�/�n��� a�����)#@�|:���gLuJ�d�
s��;`}�g0��z^���P�R��Ƚ�x�K���C��|] ����� �I�(\$K\��ɡ�l�u���u_��:�t�_b&�;��<z��<"��N{>��4�p�"�*�+��zq����G�aa�s�G�A��ЍP�Ggy�)}gH�����*��s�o~W����� �5'=� B�| +-h쫈w�t%���t��jE����A�hѼ�Ǵr�ޑO�s�ȍ�e3�ї�� +a&k`��J�X�'�-wx_}��c���GU-���3�T�H!��Z�3���Z�:�ѱ&*��"�߾��_{Dj�	-��(B�hٵzj2"la��"�
K��&�4o��F�޵M�RV{]��dub!j4���9�R�~�Lҥ-Jpګ���$w6�*k_T�b��5�/D�-�vy��,��о����پ�����{���x9W��D��x9��ג��*��"�*���tSS�Aj�$��^�"����7�t��h���9���U+uʡ�ӝ>s�[�}ݬ��z_�m��u[��]������@&�*�]��~������=�0�,���_�U���q�{,u���ڿnʬy��C�`�Rh7g!d��V�-��bJ��gK���\t�ޫ߱4��V",0w,�]�~,�]-�<B�K�=>5<��幌���R'�Ls���2+��B}U�� �EU5�f�J��iF�	i $R�G�u��!Ko�n��q},�e���8O��@R0K+�Q���S2U��,�\��0��,�w�4�����'졒�^�P�>�A�y�-�C��a��� 9f�"�� +8&b��8OU
C�A�_n�YUn����v��L�"�3A�A�n����`p����k������7O�ٽy8Du�'u �u�M>�7C�&DE�*i���}s��聀|���r�j��bM'V�܀��4	������QBZ���/C�lh�Ou�g�I��?=�䁪H3=�i	RE� "?�M"�4��B�� �4���9gۭ�����W��e���ش�VB��$A����k'EZ��/<��%�_|�\t$l��M��n�wš��w�k�HN&4�q�m7��Wq����3t�O�p?�cB4��cGbF�m���΂z���t&��:	3Sgh�k��Z����<�͌5�1a����  2���9 <4���(B�h͝IC61��G��������}�<�θBhFMo�Q�Xp�LB�0�ܙ����7��2C��חi���o����?YL	�S�B�"�Đw|J)��T�,Ij��a�DgE{WD�����C}7�D{��)���<q�| �:�G�<��X%Y�D�|&���G� �  C��5��*6��E�Z>I�u�F�O��E�>v�M��}��b��j�\!L����MQ~(�A�fڈy�rWV<UtD�Ltd��ƿ�C�>z'��`F����؈Ȓ��|9a�м�k�>ʺ�^��[Qﮟ0z���t���f�,_	"�;2g&�F�96c1K��8�k:4¯����A�7���9]?4
�������[>s14H��=�y*k�ŏ��嘗�>���c�sT�Գ"D�J�PƤᴎ�������"k����z��<;�zy�
�]Q:����O,�I��,v�L��cS�5�ծ���oű��E[䮍ts�0 ��,�"$�N䴞�4�p�ㆌy$��T������cm�doF!|~�o��*)���g�9�?���g�N���4�=y������ţ 	�� o�al2T2l6��6h��#1��<��!F>��1��an|�%%�;:П�v���@�s�!`F�C0���:�Q�d�����l �o1?q�$t�طu٬|U �z�67�O�g�C|K�RA���	��)�7M��;_�8w�g�a���֪��R�X�&��I��4s�%G���z�p��s;�����:��c� ����?A��l$�����:�S�5����֛U��Ɏ��ܫ���;���5���!@^����p=�sr�Y�.�.owr-|9{Ln�l���6�MS�/�I���" ₉6BD"*c��}��lꦬ��c��?^���қ�����i�i!�`�q�L��&�+"����f��.�M91���$;O�i�Z��4�SSJ
ssf�q(r�S�7��]]��_ݲٜ"�,'	
Z97����HEC�rY�9����Y�6'+C��#�';�F�.ÄGBO����(B�'�YR���K4�fo~s�
�;X��IK��JVr��g��V�K\c�y%�Y�����	�Fb5OVcÃ`V'Ǚ��У�?���R����:���Qzp��E��x�!�2sp��d>���&K�"�Mن}��X��Ԙ�(B�.`�N��<\�O�Y�S�[�����jA��CQn}�z�݀;����1b�i���]��ScP���v�F�4DnR��F�{Ʈ+opj7��ir�d,�R|�
��rW�P>�A�"$�N'"ד�Pb�d�����%��������Rޓ~�مМ��ȇ>v�w���#l��E!�}��_ԔQ�7M\ |�)�<�������L"5C~P0]�|Ul*�!>�k#܌bEV��2%�dH�����So_��)*�����(E`;��z�[��=rK���g!u��c"�ӬJ��f�|��jh�� ��䨦Ԫ��W���"���y��S�w2_$:ώ_�
���}��V�r�+�����y���tw!�h�a�٘�#���������	d34Ұ����,M��n�Mÿ�9���6~W7���z�٣�;ky�}�{F�p-�����?b�Z2I�D���T����ַx����%}Jz�m�-6m�147.שVhFf" �� �9�'�S�O4p�bg��,�l�w������}7�7x���陙�>��V��]2�yG����&�\���Tff��"���N��;�B�<y�6�N�|-���|���,}�Wg9;�*D9Xk	�Z���<ۦ�g/FU6�&{i��p��s�zLV!�`���Qb)�u��j�?Z�
���vd9�M�`a�O��~*�)=�a���D�\8D�0
���hv���>�-Dw7� XN�"�#�9�%5�?}tx�L�n�-Rw�[ޕ�Y���A�|��FE+S�I�&�s�L�#�}U������f/�K Ăk�P0��L0�ZK;��,U<&��_D���n��r[��'[� D��E�8�<!���&���w�������;�O}8KCS�o=�3����Jՙ�&��<��e)h�̩E:�e*_'Ђ|���)��MS�c���'t��!�8p	A��	"�QΙ�W^Tl_�I� m�cW��@��Cg��m�n�}f9lx�ܣ B6�6[|�ȤWI��.�E�������ɻ��<�A:�i0��J��&�I����w����1������Ͼ��y�,��||�%YQ���Q���˫�a��>0y�����k|{T�l���r�Bù]� x���(B^'-�abS4U�'n�5=MhT�
 ����a9ݺD��̒13:Q7�A:_�ǿ�c)3�s2v� ��=@SNxM:��D��L=�7�my��t�˧-��d:2���L��ɻ�x:-g���zp	�b^�qM���:΄	M�xw5�����%?�%������rD�ъ,�
"�P�;y�ݤ\��6�t���ϕ)�ǻ�+�=����A��Ƿ+
)�p:�4�L���ٺ��|�ri��`l�{����̕�,�	"�0�GQZ8��~2�n:��)���hE�]0���<�1��K�2�7�F_��*MV{�S'~��X-<��ˤ{��-3�=�nj�p�:׆L�b�3��+����<*��szh<�r���sj[}5������ ���O�(B^&�2NN+�'�H|i=a۷�-��7��S��-/8Gl�
=�"�mO���:-9a��ۋ9�Ԍk"��N��υ�Nb2�5*1z��W��n�l�R�8�k��Ҽ� n�͘3_D�!�דP���d�Q����䃛fw.�tN�}0�<K���L�UzxуF�.f����Y�+p����0��w���Y�kI�,$���-��T�B�I��lP�bJ4�~GR:�z���Bh�~��zR���������k��k,#^�Q�z��kk4,ˉhFO�"$�x�<�oL���\���G�V�M�m2�������#ܳ���t�4���!$�T�!_:�j1l����>��	��U6u��CDg�GO]L�Y7M�"$x2�N3�M:�Ӫ����	*������۫s�4U�E_����˗����      L      x��]Y�㸒��<�.@ $�s��IH%.j.�V�g>��0}�񠔠���1a����y	�#p0Ӽ���������ʒTGI��&���/)�B�IQ��l�q����j3��μ�yL�R9�C�t4���tC��h��˦1[
�BqR�H_AW�x:۾�"	���Z����Φ���w[G�޽�צ�(xH8�fy"^A;ן��!BA~���Ls2��F�W��E+�D��+�w7�mk����>0	]k���8�!������5�1�G�ؚM��S�i��<���&;l�vc�ƺ��6�o���UP�B�Br��C��[3F��-ưF�)c�$I�MG���1��e�ٽ9 P�z�8ѹ��+�l���M7��馦��K��|�9uc�C*�z��2D<t�
�&��'0���c��~%I�fJ$L�{�Tf�>��4zg�Ǫ1���)�ծw��`��3$}m!��ǲ1sʬ��%�7�����L�r!��{���\c�p����S�y���qA����n�3����ǒ �4N�\�?��=����*,3IZ&i��ߠ�둙nWYȍ��
�Ty�+v>{h�a5������C� ,3������C��]7bHԏ���h��K�dF�n�E�_Q�!H�L�obݠ3-9}e졢jH��@�4��E�=�������پ7 " Y��e�^B��ն���!��^K�%���]���<,!��y��?�;c�>M{�Q?�̀b�3Z�H@�kvx�j���р,�e��\��!�?�����Y%��22-�om�2��
Qh~TnО�7P�X�io�j�PP�A'"�+h0�ٌ]o��k[L�"D�kUɭj_�Ѷ==JH����,�)�3�Tt���m�4[ۛ~�(��-xIJe/!<f��E�*�W���Z"����!� P]����C�����"���9�C��͡��dڎ����it4@!� ��d�2�Ѡ�(BdA��E΍��j�%a+BABKQr������0bQC����g"2.t!��L;��z�*Nd"s�<�!�z ښ�UL�AP�e 4Wx2p�`�}a�9T�T���U)�`!T}v�h)G�$-C�@a�
�V9�pu3G���=��
��y�������kB�E��2e��O��5���"���ٲ�C۩#�/C����ș��{Ȣh)7�jۺkz�)(b%2ſ�+r��
J�$�HYm��z�Zm]m�nB�(b��5z�M��ցy���a�t��֨�G�A�<�ˀI��+;�=4��}����Z�u����E��z����P�a-�!�_�X�P6��j;t���ӿ������"e��2a�#<�i�����1Zf��WN���Fs+�n�zwD��U�qV*�l��m����G5�G/�MXt�.�X�d\������,	��T�:�!̵�9��us��ߠPX�[�{hk��QQ�hS���j$S��H����+���w�C� qH�8ъ9ָ�LM�HK!D<Y^&3�h0nB��C�%@@UH%җ�;��F:�8X4��ٶ��,K�����vS����im�H
��qB{̴[��4��Y�HX0w&E=һ���Nk&@
@�����87�5g3l������fD�4@��`��<����j�,���6c˅�ij ?>T��/O���@�u�����^�4D2���4�D7���xG�5�b�9ה.�aBg5F>N�dq���7r��L�@��6-�D�5�bF6�<�ᆹ	�|�q��!b�ǩٟ������j:xD
Q�<δܶ�aa��ޜ\[Y�w�ʶ��k�C�\}���!J�c|�f�$��|�>�eY�2�1JkYp��CG3���;N�D�B$B`Mˌ)����7G��8�IY�D�8-ʂ�OZ �+���C1ԝN���
�	g�.��d��4@h/����(��s�~�%�r�[�����{Z۳�1�",���zޟ���M�G������ܸA��Q��j{��+D9d������m��V�����,D7$F_	ŭS�����6��A	;�<t=�ۙ��mTY�;�ML�����UV��}!TQ���5͹<D&d�?x�Nr��	<��|����}�X!:A{��J���m�����q@8��!�	�ڤT�2�!,"�	�!� �;�=tp��M5���䆡�1
���$cϾh��
�3�G���C�A�u��y�G���袓� k�[�s��RƐu�sr-�A�Q(b�@��R�C4�z����a�iv�����X7�l�ѵ��������m�3�*Dζ�"q�M�`�h3������8S�*����O��Ց�?w9����D�s�C���.rX&:���B���X`!��C�'�����v��n�B4���#��ըP�>���8�Ȍ��D���d%�[�s��L�Jt��,xh��� !JP�e"��@����H��������h����	�/�@�nؠ��4];ھ#	��<�C�A��p��AQw즣�h���4�a~na���Ɣl��!����D�5 ����TQ%ע*��ݮ� R�*�Xd%�d/ j5�\��8�#S��z�j.O]�!2�c���6mͮ�D5�а�������+9�U��*�YK)E��-��n�e��֐��U�}|�H%wZ�@u��L������!�l�l֚��Bo��,ķ�=��f��1��K��˷,��R�����\���bp�sG~w2� Z���,
���/жGI�+;b����\
��n�;�b���̸�@� �9��8�1�M�i���k@�w��C\���ϟ^B���	�-��LK֬�@Mw��f������k?m{�xZ�ю��8��}�ySd�v�CI��|x;�&��t�<D��ۡ1�ұ<����AK}<�Y�ʴ���0ϺO#Ȅ,�D���"�w��?#�d!%7�����>>��AB� ��DK�?�:��15��j���t��_y2����Vg��$�&�����l��������+��]B��z��#����;ڞX�`|dA�������`���(^�m�}�Ott����l�y7��鰔~5O��b�HY��
��m�kg���(�Tm��W.~�D��X�PoN'K�ܓ�jL��6�G6-�����i?]l0��3�U�W��)Ѳg���[X��щ"��'��S��~��`�~�Ӏ
q�+�=Y�'�����}���\m]|$Q�W�M a践0�W;y0����t4[{1��=CՐ�]���XY�a|�ՉN���A[3}��@�M��4%ڦ;�a�=w��X��;����Xp�ܳ��z?�f��#B��F��?�a!��`h޲Ն�{"'")�yho[:ŵ��L]�j;�#Y�$d�}A�ь��~{|���Q$y�?���E{ur��0�Ȧզ�'�Re�%4V���F�G(����^����^�G�"I��S5]KPz��t}A�s��`���B@��܂��c�:����8!�6Q�lZz��z;FX>�XmX|��ȿ�[h<�I\cle�W����*Y�%�D�i�PU�䠜� 2AV.��Yhk�t����+>1�Dg�<[��M�"j:��o�ڱ�H�&˥�;;�A��'�0
@d2�\I�@�i{w���5#]p/@�T��{Wd/x��m�	�I��o^����]r�f"T�2�N،]�]���OG��|�}�K�FA=����)Z�>eQ$�Y�hk[T��d�o�I+!R>�j����н嫝�2J�&M��/!������С�[��jpO"c�d�f;��э�-��h�<�i	���C��Y�#LSy�i�I�2[��rȡG�9�M�G�R*,�� ���h����{��X�=��*s�O��k����Z܈{!�j��O$R{S�T� &^m;|���ŔHE�O�j��#E�����a!:�? $��XC|�9�ʶGJ����{��eR��fB�� $�K4	�*��PEW|���%U��}r��DI��6�HR$I�昇�?���W *
  �xd��oB\!T��k�!YL��Y�7�Y�r�#͢�,�̗�:,T�����($�A��R��P����iNo�jC�#ml��P�ٺnh2��>���O�TumW� $�u�`�.<T��t4��`)��.�"�KB�Y�iV�X���iow��g�i�
�&[�aV��6�G�0���Uӡ�5s������&,
��f�4�yȡ�@M����H"�D����6�n�׳ڽ�D��2rI��]��]m�{䐉��"���n@��ګ��!��۹A���z�A�2�V��zd�jS�#����&{o���Z�#��μG&�SvI��t��"��p!s����C������2��(�y�AG�fo�j�#G����+�HW��!�r�,t��cp��]�5s��l�ȣ3�e|�ݠc��;�ƫ�vO,ty���7�L6��z��|�]2�IF�<r���]wvX�V��xJ����"�5�j��#I�'	�mt���D�dZm�{�Q��Fz����Y;�&��j��#S�F29�@ǩ��h��L��Y���B�W[�9�G܎�����I�ġ�f�+������ιG��T2����-�51�V;枨d��o�\��Vt���)��v�=1i�|���j�v;��j��#����B���C�|�M�]�M-P��y�����>�G���^AQ�gP��|�]>�̏���K�~j�=HK���QKVxS��V�➈T��}E�����LS�xi�A9Vi.�6�=�HYp��5����։\1�@t�=/ѫ=oO4$/!D�m? $�飳j1��Pc�ʸ��aIi�3����-|���5W����]�B�"��r�jBp{#il��	�j�	}��%�����RW[�Y�,)�%�C(��y�p��퉦�l�_���o�j�#I��6����C2���:{���=$�S�I��j셖��f�'�q��j�U�w�j�ڲ�DU���V5d#ۙ!�2l�ݠ��Ͼ�b��D�(_B������*O5[$y���C�%4&��Ύ��~:��jS�#J����<�txI��]z�ն�'*T����(�� ay]&y��y}����:ثMhO4B��Q7��gjt��gO4e���p�Z���jW��y4i(/ 7�5�=BX^k25��Z;�=$��8�or�_H��ce[7!V�Ξ�T�%�D�Pw�;Lc��Y�&��W�ɴ-j��F�'!��9���ob���Dgyɵ#:х<�Xm*{��0��2�C�pv��M�v�=є�ݜ\���vݛX�${$�3�n�}!'K_�:�c�Z=}O�t"��rH"g��2��yB�y/L���=�(��<�A�У��]b�,2Q+�:��H��bO4B/�;X��n��;V���ģӜl� F��M�v�=��\���D�j$"��3z���,��5�Y��M�x��S��P�CܠSM�lh�C�`ģ���Z�Щ��D���.�o��t�꽝力;)I_Zy��nv"���F����ޠ�PF�4e�[˔=�^�ތՁ�"FXjk������q>�!�0I?jK07�XI?L�!�0��W¥��z{��j��xR,����`�Zs���1�x)܀x�~2�u@Blb���Ɵby�ﶴ�-B|bĢ$��H�Ut��6�(�<)��/�����Q����Lt`y0e�(!FH~�1j��s4.P?���>$��!Я�3���0��%�LS�.�LC�@B�Z$^�[��}��4��5T�Y4��W�7h��;W8!v1�9�c���;�CT!~1�ђ5Y/b4n�� �0&���w�t���0?EXn��0[	zh�1~"BXn���7�<��u�B��ƈ����cq��𶝿0+B�c`�I�/�B��>aD��Zf)���!Ę�O��!2�т��.�`��F�"�"N�b��n,4ܦl���X�R��Z��U-���&�B�[�F�q:5}�QBқ�q��T�Ct��!q��%KK��^zh1��&�OFD*�8��!����!�2P�IƟ�z���8Q�b,#!�o��х��	B2,eQ�e���q�7�)	�
�ڱ<4L��xE!�2����Y�h�v���M���^�X�a�5-EA~2��R��ܠa�^�r��X����E-�h����&c��<XZ4?�n�8��Oz���VZ%���<����}W��L��@Ӝ{�Ǝ~P.��A�2A�� 30��F>�T]&l1�!$�֍���LĚ��2^�ajm{�"$�%�豂-i<4^�tK�$�8��ɲ���î�7��<e�5p%Xg��ή�Q�d)�t9�]���s�{���5r�I�j�Q���h{�F��L�Y�������~KC���P�d7<�nK7+D��L�y*��+r�����:� C�T�YG��>��Ȇ ?]$Ns���C��:�O&ɬ��]����2���.��bq�>���H� 3��Qf�W�D��j��<`a��=�ssd&��JE�M��a����Af2I�,S���ptE�I��L�Y��t�A�����ͅ*�7o�}L��'I2�ɸL�bw�=t1G��A`��4E��e��.�ި��O������      N      x������ � �      P   �  x���Aj1E�]��e���~UI*�>�7�1d�̄q|��#�b�`���@/�~��B�������<�߾�*���'|��ǧ�	���|����f�����o��%N5J�"�g;@f�f���-l��v8����S��U�H ���y_h��y�(�w�M�S��y�(�vHh�� *��)X �b�(�;�G��'�Q��P�
�H�w��d�Ed4(��g�"`����G����^�彸/s�4)I� ֍�(��E5��e�(�*��@ º��{��˛4U$�넰��6q���H5Ka�_ӲEޚ�sr���uث��ԑg���>cXJ֜��.�ɟŗ���hDK��Z\���n����h�U�)�����r�ϧ��i��-_.ߗ���w���O��Z���^��/���V��~�gMD}2��U��{l��Z��7YX�;X��Zj�2���      R      x������ � �      T   ]  x���Mv�6���)��.|��C���e�VG�<��6=}�x�IZD�{��<
� ��+�p�����ϟZazR�	���v�eRZ[��@�?�t�����	��A`Dӵ��9�S�Yr�~���]������dT�A�(R�kn�J���h���8��i��e������ (ZUO��K᮵"��e�}S�>:��q\�VI�/���D�H�s{P���(`�y�e���r��!@�����k�+�j$]!�O�"����8Wnf�rA��	�Ǯ���_5O:����a��W͗�^E�)W��i��m%VV��t�;pI��0_���̛���A�A4y��~jk��$:TfFqn��-y�<��:���X`ӥ�b��2�&�	؊@+ҝ�8W]"��+���M��]y������֤��cۗ�F{i�O��֊@�Ǣ��Rj��eBmWH+�gWH��5gA*���E���eҋ~XT���&���+Ҁk�\���K�I�t.��;t��~�T��:��=�HOz,}_����-5����Q�R�rz�"�i�x�|��B%�E!�����V5�F�{�͚q~+}�&_���xYZ��PU��%il��UŊ�qΗ����*I��hx_4ps�N��K2Y�¸�XP~O�|$���e��q̵Vƿ��X��t:��qx��X2E��X	�@/�]��\��(6*0�!0�����v���,B�)�7{  �y��+�F{��V�!�J�õ�(������ťY��T�!��11Z�b�6�|��^�>��׼�W�%`� �d�q\�W�&t��Rahާ��k��(+��p*�H&�a�L��=�����+:�=����K���Cj�B���@@�<�k�{ߕ��O2��!�I�C%hu0�����(���ke%P��dY
��D�56r؆�6
e����NX�Y�d�;�ԈkμQ�������Ze+�����J����k������!p��WfC��V�]jE��x!I-���+���v�(==s��vT�s��"��87�P]aR�>)\L�Z�x�l�9��+�����	�A)��gH~����o���ˡ�I�ӡk�ܴ��:Ec��A@cֵ�9�Kڏ�6���9ވ+5>E>[x�	����	�����x��f�!�N\�ܳ�� Q_�/�N����4_�l��hEC�ցu�"��Е�+c��l	��s(����-v��'�"�|��=/��~�:���'���>�dnz�|�:��y��e��hP�_T�G��=��@�O�z�9�&�/��a�!@���4�LvcG�����}���o#� ,e��c������ף�@X��|��g�x<-�R�:���� t�Ε      �      x������ � �      V      x������ � �      X   Z   x�3�tL����420��50�54W04�22�24ֳ415���#�e�P��R�\�ZZ�]�����1).cNǂ��"�&�[������� ��*R      _   �   x�M��!���l�w����8�3k�X�������B+#����2gŵ1ݍ�q�N�:Y�-3xce��+l\c�T���Φ���
k�4�Y�n�#�z������۴�H� �y\�k�VDK��k�4y/�&��a��p0��6�������J      Z      x������ � �      \      x������ � �      ^   �
  x���ے�������b"�SH ��O(�A5��D��Y}����/��z�ԡ����
��ߨ\+s��,C�����aly��3�?˷�^��Y�ˌi�r)H1����0	0����0�7]�թPf\=W��PM�{|��CU6��~4;�vq�]
�UR�ߖ�?,iF�F����g�y�% ��Ds�$�����a��</[�p�,��#����%�Rr����$%��B]�H,Lu3H��у��-Y�3�VdY�$��c��9e?����ւFj����L}y��scg�5c��q���֗���18q �I05��،@�63?CyI@�Dh8��QQf�d:6�k���<��s2�n$��xXX�.@G�9f@��x�m-��f"^�]]��<�F�"`g
�y��8��+>PO��Ge^'O���H�*fc_@�C��r���V�q:5��G�c_���i��l��4<` +�������������E��3�9�м�nݑ#�R�o����H�
8no�Amw��a� ��L'#$�sg�JK�<�Hr�jS&83�Ћ>��wo�����׷�:��|��x�\Э.{���fl+��xb�[c�3�4멋�:z�p�ټ���)��9��%A��$Z�0�3��9X�������?�1���!�̐' ��e�Y�ID�ʌ�Yqv:��]7�-*L�1<h&��z��ov�A�� ��E?,n��TF��`��:�O���m�$���_�{� �H�,vJ�7���i��al��|���
}��)�$�O�W�8�w����gi�2�a-(a{&�I���&�
��.��V:[����j�2�_�mW���X��F����>=����L���P��z�ף�~�
�("���	�����	x��w�8�qR|�%6b5
G���=�{]�g-�8vVOҖ����^�$�ձ�̶�Y{,H��Myz��D��`3���jΔn���\6=#�,����5^���q�oKgtSf^酻��LOܫ�Ӧ=�xD���H�J��)�/���苝�ino�8�1������Sg�M,�����xT��<�k�n����Y�*}� �</��������<y!��la;��e\1=ί�?�dis9��/��`��W��5V�Qv6Oږ�mu��i8�Ct��z���Ҩ��>�/�Gj�c-}G�zխ7�����ĳ�H�kw{I�����4�u7�e�d�=C,'H�#�}�h�6Iv����;����YjnMg��M8s�e��g��5�`�v�t�n�ً��v:js1��.� ���`�$�P/*�,.۠4%p���j푬��]v��m�Bƚq��J?��UU	�����+,J����A$5��W��@*7I���Ce�����-�X�y69ۓm82s�c�o�F�bC��{�a:���F��V+����;�=GK��y���-�N`�-��6���EMNHJw�f���W@���D�]=O����Gwy���i�C	�9�֔�K�#�����7���L��F����R���4��\qev��e.7޼?�y��"�/�!Ģor	�m��� �<�I�$B�S����KDfƐ�jDrݝ��{�o5�o.;������ҍ�o��Ig�2ü+��?V�OZ�B��$�*Q5�:^T�,�mX��
�	��s��8n$#�or����,=�A��V�����dؒ�~�H<��M0��(���8�p��n�is[�<ҧ˝+�糤���&;� J�_�0��n��.��A&��U?��1��A�~f�gN$V@�_��F���q���q�е�����A�:�llcs��=|�U��~z\ϭR�G�'��cЈe�Bh$*�Y���k�6&(g�+�əY��Rċ;�����Յ�kl�e�Y��F-��`�Vs����>l	@N�٦�J�OS?o��xD�5q�Ĥ��{a�+BWrb����hF��Tk��@�w!^��ߵ����p�z%�Ĝ~�ă
�$B���{�#�{����Ͷ�#�p!&���	{8���a�L�ѹ��m��׃Z^�G��'f�]�<q�4B<�H"d�6��`��	�9ۼ��Wq��VX_�2a�7]�`c�-��%w��4��nnl��`���𓛆��� �^�5J�y#�X�+���[Tn�<EL�|��3:�T�/�+N7V^)�y�AK{�\�C��م��7œ��KfX(@�ϖ�ф��gF��%�*� ���R���>����&L�BU���f�֩y�%��K7?��յU��z�Vw�:D�{���@�-4�CK$.��������g�R�y��
�/�Y�ڸ~YD$;�6����_6dsyg�;ڄ˸�_��lp\��(\$Ei�l�^��JѮ�ESMO�B4�.N�����73I��riG6+<PG�&�E^�py��W��£������w������!�S_س)̆�鮘���H�O���``��
�#������A^��n�ؘl�Yu���:t']f�,,���x5��(�M5_��`diB�i>qD#�K��#�� *!m6Ý�i�e�/9�'���ٮ�Y�=���7�U���pV���Ř�� �� Vs�,M���"�cȂ�0�95�����i�������}�
h�gǘ���`��=�z���Q��8�,.U��쓒�>`��<F@M�y��������yx F/����m���W���������Ҧʽ?QBO���m㭴���ŷq�t�_%��?�����}      b      x������ � �      d      x������ � �      �   ?   x�K�+�,���M�+�LI-K��/ ��-u�u����M����,�MLM��Hq��qqq ��\      f      x������ � �      �   `   x�}�;
�0D��Sx����n>g�QH'޿,�:L�x<Jk��	h���W��$����?lBmVs�����Ɩ�Z�䟔y����t��z�e*�      h   �   x����m�0F��^�)Q?�� 5V #�S(�P���U����Ap%|�{�`J�������-��i�H2 z
#��E�8C܊
�8�Ϗ�|��@{f"ߊ*��=_��k\�{閕xd���Aא����Ċ��4��XJ��y�(R)c����i��5�gd4=�hd$R¾�lz��x�S_�Ӽ�6����]Z�������<q�v�T�u_z|6      j   x  x����q�0D�M��1H,��T���&�nrcb���]K��������y����qt;���<%-Φ'���ĸAԵr�������:*��MX����l�,lɡ��J����Z�-Q7��,��hEX8�D�y�n���hEX8k"WVqM�߈V��s6|es��bވV��s�t"j#Ҫ�-lӼe9oDZ�O3��˜�~	i�>�����y#Ҫ}���y�c�/�A�U���o�Y�Ȝ7"�������Z�F�UӃ5����9oDZ5�sm:��F�����/NY��.A�A����4�[��`3w�A����ly�}}(%}�/!T�{�>�)��y��}po��n�j��_�.U�A���&�<�!���'�� �      l      x��][v9���W���/� �w/bVP?���X�H%�˳��u���F��M$R|خs�5f�����Z�0�):�Ԍ��wJߩ��1��0S������[w����l�=lw���??���fߗ�n��>Y����?����?���%��N�;e�Z�������"�ӏ�_D�;�he�ߡ�̀q���w��������[7�>v����r�m�ؽl��9�����Q���eT	��R�
PT�$9��a�[����	�,q^������p$�b:��QW���*��N͌J��O��?�řu����~��
bv������|to���@�K����6-V��G��F!FϜq�gw�^V~��'�D�����V�i�)FG�%8��;m�?�=��PԨq�NG�Lnr)0Z�hC�ZA7�o�~v��֏�)K���!�,���� d��qJ{����o��ǵ�-�өN�����[֋��ˢ�K74���c�ѝ���_���f���^^��+�ϝG&�M-��-9qɅT�Wa�l��3qN8q;
��u�҄)�#�e���gx&rLf�c`�tSA�-V�8��I
�@dD�;��F�huo�p��&i��l�?���8��vgފ��r��h����#)1���n�^�R^�����w���� qiZ(2dcj�a�bO��h��0��_/_�W�����TBN�й�k���8g�0�O�;���A�WL��l�
�������bm�"���۔l2)20-�n9b��ct��؄:T�F����5�'v!����:�Y��m��𴚠I�wkZ��\i�]�aб�|�W������g��ը-ΰ~�ڒ��[AMju L�E��(^��	4�zh �	�-��F-��bS������n���۩�>�"N,�zC|c��l~=۷�|��H=�P��~�q����"����0����O�"נ.�u�QgT��ı9L^*�ݍA�e{�p^@�n��=V�7GQ�96K^,� 
L���\�ϲ�K{~�{��?���B��fD�
V	�I�^�rO�D~��橼��r��xx�楣�˨�-ea!����-.��J̝/�����������:K]P#�M�Vuu�b��êWk]/Q���W�Q�ɚ�i\rn�M�Ʋ.b�u�?�n̩%>�m#|�̼�峃8z�*�?� 6b���Q1[md�����#��$�i�WE�U(�]���p}]�,�ae3�݀{$���a�M�w���	a73�j*Y@�JC<�#V ��}��8i�<�8R���$�~f4D��E.u�z�R��A`+1��A��_9�=�Sw�O�i�}��Z���,��%�)ԅ'Ĵ��ι҄�?F�l�̢ˏ��|@����1'=gw�����z�|��>gH���i ���d��(�������b�����;UZ��T8�-<pF$(Y��F(b�3(��
%W\èa<o`�B�m�s̣8=Q���`[�%�����m�L~�mT�ȍ��ZW�hD�r/�(���7�J����.H�T(��M9"��p�іՀ�žm��O ��������,2�������8.2��UH5E,��[��h���4����s�E��u<�J�T�o����R�K2�f�<g2�W�o?X�'-q<y	D���}ġ��lޣg�zY֚��>\��A��[��R21�4!G�199� ��}��2?Iٟ�~N��p�8����Wr"��U�
(^�˴pYN/���*���q����:��M�ւn	䬰]R٢����hi<�ǿf�R�_�xr�
�q�\���p��XG�,��bD4��+ko�㵷#��dRj�cH�2!�-��&y��a]K������c����|�\h���-l�2_��"��d�`��%8[�e��ٷ4����TS�y����%���P,lq�}Jp$]�η��ct����ȅ$)9@7.�V�w�g��{��� ����{}_m7�W�T���M�M��Z57�PMV�.��QH��D������z����v��n�>�`��%��v�&?���"�j���dIv@r�5���E�I��*\��}xOO-l�G8lhQ�3u�Q'-<(e6W&�L1��?�v˂��$X7�$&���&k<ץX�:�(�}
	��b8N^�o_���yrc�'��l��'hJΑ���<h�~�4i����)�+t��k.�3����z9X���%Z�f$&r��1�>�,�[�#�cX���R�|@@bTb@f�b�5�CPf?�O�khM���[cs��(bx9)��e�6��2��+�'�� ʐj�IK>FǤIY.�&fh0Y�=Ӵ�
֟8sV�
)�w%�w��B��5�$�!��勩O��d��?�D>�:��Ԝ1�f5r�h��)�"���Z��9%w���h�c��}l������pA�
�o����o���ɛM7�"��������'S��f7 Є Lh(���\�`��p���>�[��"�a���[GV'�F��8n�Df��2�|�/�����v>\qaR��ݨ�K!�J��8��Q�T�K�v`�4A���a�<9��j�m�LQ5Y	�nl���u�2m1ͮ��-�T��GQ���ː�'1�2�^/�/�W����7S�em]qy����I:���G�g'С�g�+���uB�o�֨"3q���q&�'�14Ж8)�1\�}��'�m	�ڬ��%���r��~�$�S�	!��ͺǏ6I>}G0ڪ�#�%Ʊ#��DjI�Z[ܯ6��u�hθ"UI�W��"6*�*�x�J�|DE���st����-�km�Ns�#틔6d��U�"-q<��"�������iϙtn]���X�iC�����ʏ���� ��)2H�U[ �!��[%�ۀV-;pBr���=�Њ/��Լ\xC����\�Pب�W������rW�<�]�K���	��$#..Q���6�aH�L�4:Kot�*]��k5��g�&�U�R���[H	BK�� i�Z�h���Q���g�;���ǋ����5&Ђ(��ġ��Co�^�_��� ��5�Ay}%�.�6�'w��ɕJt,���{-^�	�k��|G�^����3e��]$�!Δ>��^Wf+L��Dp���8��I�C�)k;כ�	X!_g���:X,Xъ�9){�C��6�M���+,h-��NfT���5��3��A}�n��k�}�z"�L���j���j0:����ҡ�6^�˨�������dD��q��	x0�5ɇR@(��S�Cw=<��x�ý�j��,�,�|�D�$L2&�A.C�l�u6#��=�p���M���9h$xRQ��He:��vqi���%�&����Z�^�\>ȭ"�l�&Y�8�?�j��]��Ά{O��̵��<�Q�<�س����7�K4�"�~�V;|������`��I{b��|3޽	��j_k�a�ΐ�K3x��\&'amH�s�jߴ!��.�q��Ǻ���$BmT���%��7������.S����o�q�j�����.����[6I&z�@���* s�ֆq �ۨx�S[���D�-}��,��PG��V�P���0�'j�M�ak P�-ۋ�[�?'Z�S��j��L��f$�/'Um�od��<M1ѱ[\��w��o�c�>���x�������w���� y@Z�Ʃ�0�v�D*�ɐ�����k��N��i���pT?�T�_���8���H�Lg�F��p�k��Cɋ�f�;>�"���Hϡ1��`NcS�`����R���ְL�4�����f�:�8�g��E`ʸhO�� �-�0G<B�M9�wbK�Q��P0�X������z}�t9{G&�L9��n��8�!|-\q1��b����~��V�/e�6�i y�J.[%U$ra//�,\��4<�Z�6�q^�A��P��% �N��^�\�(�	qO%tE�����������'�2�̖�͔5�� ����09^�0���Xh�>+.%#<6ҳtAq_�W(&L)��l�t�!1���иU,��ġ�7�8�q`��=Oq�!f������m��U{Wy�	�����1m��� ,  �e�S���7��b�kȁp�7�pGX���<�X%4IZ�OPhe�xK��#�T2Ґ���*�yz^=mN+5W�oGcp�ZM�	��z��q;xʞݎ�&5�<��b��B����-C1�I�j֦�Ǘg�oj`�٨����@�w���ėņ"�>ir���F�Mm�c�I#��y�I.�b�]�F"��ﶶ�_�v'Dr��Di�}�}��˪�4È��C��x�{�CW<�3��8��8��l�_q���/]6���ũɾx~d�$N2VI )"V�r�bd� �b��v療��E�ǝ!�M���[��	"m���'XR� I	R�B��U�Z���89GĴ�G����#:�&9V�j���'� ���i��4���w���}{�B	����iP��*�:�|�l qc�W�|:�ё�bV1Rt��B����K�IP���MI~]>�^�ݿ&��:�j��<�C#�cy|T�Z����+J	�H&�{w��:4\r����F�E
2r�H<�ů_�6��gu��[uN	��n��<�n�	����S
ZڅC^y��hs7�Z�������)��0I��IW;��G +�!!��u��>G��֐W��ұ��lj-�	`�@f`1��w�
J�f́�1�����j��]���Q�N k*^oc�jDYϋ��Ús;TڱxS�86�=v�q�9U�h<?Ƙ����zM*����.����mz��j��.B���E"/�T <��v��l?�n-^�ܑT���:Y�*o	��ɡ8������m��|�ukt�.�U����\�P�u�+ K'旬�t-^���j��BԥL���E(�;�]ۢ"<�v�n�?����v�|�lw~>�S3���T��	�6�˝��_�_��ʮ2�R$`�p�&ћ��K�&�D��� ���f<�6���e�������r3����Ն���gh�^"�P�J�N��eAW[-���ԌA�����N�2Ș!ɞD���Ț�g0�&�_QЀ�����q�s+%U�(��6����+b���'��,8x����2������)e�N�:?7�<�+�zF���`V�y~0�ľiR4�^���N4�wF5��, M�4��Z��B;9�&���F�/
�b��vD���p��M}:ﲱ�Q)^��/��G�A{��b�|l���&D<�۪ҷ=2}�q�n��+@��n�c���T2X�`�J=Lq&��$ޯYn��Ø����F���c��R�O.���C��~�u��ݡ<w���iCu�� �&����F\H~��m$/e폳��yҜ߭���s�ԚWШj/I No��BJ
R P���^���~|���L�h�}��T��L��N>Y	�"o����"�~�V(�}�yUͶZ�2$kd��~XHp��<j�4~au�ᗃ'�E���]��(vh�b��j�;׼��ۅ�2�&����4Ƙ�Z2���7Bk`%�}eK1Q�u�X��q��g� %ffxsA��H����o������rSk�:Y.�)5rӦ��U~�Z� ԆP\,��:~1)�Q�4�����ʟ4[���0��[�h��G}IC�"�
��2���(!��)%~!�a��&NG~�`j�!��~��;��8��cjux��V��1��b��bz5|�E1Ԫ����������y�߁Q���X�ũ�lmK�����>nf=�,���!jQ��Ԗ�Z�S}�C(h,zY�*�2
�V`���L�9&�oyVb�Q&�)4�\=�)�T��q�3�d��vTF��B��
m{��
��`b5 ���<����(���eoQhe������뷈3�8wɩP�۩�zz�Ķq!b��f\yr���Ð6�
p�XIo��]A�� ,Q�����$�)H6��X.��!�h�o��F[9t �S�k�H=���Hek�Чq�6��ʊ\��LFL+@�p��5�bLш'�Q���(�a����cIy�x�nd�kY_���X�7�4:.�P�[%A:�HI�oe=�0'�u	��ٲ�:�%�t�_p�\�َ'4��H�H_��EG�d��{.ېZ=~	#Bu$_�X|�����1�      n   h   x�E�9
�0 �z�| a�b�U���F�R�?��tC����Z�h�i�*��`о���x`�T:GhY����G���Up�,��!���E�hVo�y�rI      p      x������ � �      r      x������ � �      t      x���͖⸒�יO�j�*9ֿ|wsf5�y��q�\�1�ՙ�3��w�]��DHH�!����9��QU�I��O�eҼ��*�e/<c�-co�=���1���¿���Wt�햳E�ן��Yu�{��Ϣ)��a�-��ſ/��+�r�6���������e�-3��)�?Y>�W��"ze��/�������{cb�^�vW�����X���fU��K�嶍�\������VH=.A�v9�#)�ey������W��Q[�-��j�6 �(���_��Ͳ�c�ﳷ��ݡ��ϖ�� ޾��3�g۶�O[�1�e���E�:���,�e�!�|~���q{cu����>���+g�����˶j`uS?�2��+"f/J(�F��^�3���uQ~�ͅ�<��2̲+"d�:����7&O?�Tu8����kyܴ�����^��+"��o�^�LL�3%i�r]�ߋ�^�����b�Չ�U�-�<n5�Z�=1kJ���j[4�]���,���U�m�^�3�m������FjEȯ���z-{�Ɲ��_]�Ԃi��Q5�
�A.N?��T��j��N������Y�g������w�"ᛍw:W�kХ�k:�0��$��:��Q�5���#�����M�J$��_����L	��ە͡��|���J�\z�;��e�,��:�@C��ɕ�ے�ؾWM9]I�����E �3�f=�F�2�8t����~?�����)�3y�9��R"�
�v��*i���h�����9F�:O�h�"v���/�&V�?+�p�+�WD�&�k�Qq ��\��GQ-6���{Yai�3��	�i��E�$�ē%e��� �饭V�%�x�zA��e��ѡZ��F���4��b�)����Vv_���P��!�тR� Br��6ב\������ ~E^���V�Q���q�~3��p?�EH��5�,���7�<D#���n��^�VH$�x�ٜ1�4�CA�kr^��}\���FL���.>���m�I��u}ؿ-�Ϯ�*��JG�r�A����	��Γ?X���{ِ��Yw\��Y_�|�![�`��C�X�ɜkԩk��o8�ծ���O8��e��ٟ/��zD�ə��x�!�U��Ï��">�d.m�XW ��ud#�
��i�g�z�FG��\�}���|�ͅ���A���ƚ\%�4n�y�?�eh�y���/>NvX��3M�A��҅�Y�&�&~�����>�m�	�g�G���R�@���n2O?�,ڐ(���W:8࿊M����_B�NV�)��`����'���ג2����azUqkɐ8�����c:P�76T[u�@]u����/��8f.��5ՋӹE������k-f����+2�]@�y�f��0��c�Y�u�r�����dv-�2�_�"dwΎ�5��h!�P]=v�s>~��iM�"`�h*D~���L�	'F�6�)�L�~S=	X.iE�"v�
N��Vhr�,*����Y.���e7=�69�5Q�"��S��0��o���
)���[��Л���ς��l`L7��P�
��lKY��Wr�0������!���_�^]�+���:#�����=GKqè*|!�+��>��XZ��%K��v�^����C{D35�Pg:���!�F�d��gÒ�c�K���6m�l�|�u�9)l���F%Ā<~�Ix7�o�oU,!�����H-�y�DH�~��,�t�G�)c�θIsO-�4Ү��h?�œ@��HD �gޝFС;���샋"j��сmg�DH�)������d���?@yi��;�|���k
"$�/L�6�%�����<~����5�{�?�H�9��{����?NI����H�5E�7�w�x=յ�VB�Q���Y%�sKSi�DF��cs�:{��	�KƔ�ɽ�!��6	
�܅%ELO��h6��S�@`�O��`:b����=l�9�����E�"�uve�(w��m����,��� �+&r�TD��g��D���Lĺv�6ֱ7��W�
�r�,�:M�몙^$�s����[�"M�������u�.��� S����+F޻"�{@�ֵD��EMf�t�.���ﰮ��`�T6��N��D��6mPJ��n�E�x�}�U����Shx�s�{3$V���M,������Z�[��V�E�ן�Cyם`Z��(�p�j4�d瀼>@*Fݷ>d��,�2�Iz�?�4ه�qr��v�$VHW�z�I����h�n��~��Am�\�BjJ��x���RЍA������1�on4��F@R�ǿ���� ݬ��%��vK�b8	�:(Uf"�HLR��-`7���)��gB���I����,��ԝ�Q5��%#�mq�M���jЏ��;�˱sE��oT����nL���a��Bw��X��Y],�/���i���b����s/Bt��m��d� ��*?GA8Dld�D@�N��&1l.�K���чuQ}U���og�V��.S�� ��TT�'���u�䩽Ib�'��v�)ɐtXH[��EUL�΍���"��=�<�	��Rj�T�����P����~�����rz�R̅�p��`��]�2i��=�Q���z뻶�]"��?xF��ϸ�]g����f��!q�M7����jg�}�,�{�S����"v�L)��f`�Zc{_�7`Q_!���6�Ŋ��:&������v������+֏�+�����c�$$�<5�!��m4f�@H��.��iw���&B�����{��@©�8��Ѓ�F& BK�3�*x���i��g�}����ݺtV�ڵ���@�L�h��bĐ���>&�h?X��Wx��k�]l�s���5�Yً6����=�`fã��A	�����x��݁��ˋ��Y%���)�A�nlٶK,�wvN]�ep���p�7��7�8>��6��j��:.\㩢��!�i2"���d�(�~���?� ��p�*D� �B~����}W�׻��,�CF����uZ�ew��FQA7 �>��Q������|���D[�3���b"dwM'J���]��	1��O)��9�8#K!��=�"��Ic�ʿ�/��cr���B� BL����8���p�z-���*�܍V����Sd��8Z5�g+�r�okS,��/����fc	��#��E���`]���^}����z 4����	F��9�8�^����fD;�IO�U��~r�hĶ>��/�:XFp�jDH�r��?w&6�z�L��r�jA+2q��A�4=��s-��T|DH�O��ia+�G	�]eW��U�@��8�Ʌ!o��9]���W��e��i� ��v�nW�-CGrz�Qc�Q��ƏYF���J;�����J_��c�F2�"��ގ�����v��g�}����DJB4̌�&Bf����i�3�9�8��y�4�z��0ʜ���by�E.Lle��RS�e���S�D�22�"t�ϦM�a<��Pyz(��T��<�ؑ�
"��~�29i������6t�<>F	4V)2�"u3{��C����L���y�p��]�w\��y&TN�����e66l8���Mّ�����]M �e,9�~���X7
�M4f�(��=�GY}|�l��$�9ùp�$�k?u�4��'�/f��f� �h�nn�]��@��"�B���y����F ��r�잓�Sn�2A���E@�ևIiR�w�d�w'�x�!P΍"H�A�����B��L:kw�7)l�S'y��Og�tj���{bR�����E�]��#{��"��6�y7=)����R�ƭ�������+�7��������N���O��/l�:s"]{�ӝ�?���Ɏj�!�wzYRB���;�rw����s���<�|d$�Pz��,n֫��9%�0�%�_�	�73�y�j&G,&lj؆*�	#��=���
�����\	-8.x�k9n++�i����I���>4yd�����l/Bx����@G��q�����ȧH�   �?@R[�RN��/�e����s��C<��ol�zJ�
N���d���􅶱��c�N�}6��JF=lE@����8	���v�:����#]�t{�j]����6jn����E� ���%���u��5�Pֵ�\>���0D��7M2
ʓ�]�#:���Zp�n�&ߡ#V��uċ^]�)z���͒&� {���cy_}Ȭ���A�����k"�v�d��;~|<Gr�r4$���5o�����x�=WE�B�|y	roF
�'�A�����{��|np_lQk1����"����O���ӓG�XC��q��c�'4Oj�,��b�ېn_@�W^����;6>�~�E3���g�`Yc:8�_rz!�ܷp��� �^��oސ�NMI��] �A��������X3N��aÆʁ�����^�$�dO^�q�/q�[|`��Ĥ}�m�����u������r'Br��ҡ���A���j��|����\E^B�R�J��/+Z;C��o}����j[v��?�"�i��.��Y��b`G�5���07e���B�!A1�w!�oc�A3��vG�e����A�Z���$�z�,n��{d��]Y�����E2=��2�Q� Bv�����ݤy�=�����lN&'��� PI�KA��=�R1vNB���XF�{�)��Iʻ�}=wCM4�!���:�3��q����"�������L��-uլ�-�w�ɕDv�ȒA���� ��	�C�����
HG�uAw/�$�6�U�	"��P��'��aN��c��5V:����ڜFo2/�?h?�$H��y	-�B����@k�
�^ɛ�#���g"\�kt��h����3�b ,�r#����l_�֓Y�đ8�@{��L�&�NE�|W'T�ﺩҐf�l$��"�'�#��$�·ET >�v�	>l.-��r!��}�7wj�|@ݷ��P�{���b[N�x��{�Ndt�Ҥ9w�yI�2�_9����~Ľ��yƅ���I���u�~{��8�uB���b�>e$Px6j��1� �M*r��0�q��,kz�%�[�Ɔ7��:�^q>��=�&pI{8��{��ϻn* KiCJ�g����;)���d?]�.��������l#K�A��n��di8D�=q71��2l�xN�d��PK]�9����d��<]A��TpN�������Y?����>�˶����U�~ ��V��su߫9x<�/~]�������ȹ4�6c^����z0=,{�h!>k�GN˺h�
��:fK紙K�}!�q��,u�}ē��a��X��ٴ�ѵ���{:���ɂY�I'��#+�5�/r\���3WL�9_/B��O��� j��~�}U?����5���R'yu��⧯���&��.��~6S�%l�q�� 7ӽ��Pqc��o��d.�"��A�X���|�g�� �[<����vf�>͋�����[��T?���϶���l>&��ܩs�7�(���OA�Kp7{�[�C��RD���l��'�3���ig!��i�p��'��ÕN1@��('|1����R��
A�Ԯ�����[��T���Ǎ{F��CN}��5@a�/�5�^k�֙~��ӗ���U��-�K:$�"�ū>��^,���A�n>N�V�.j��X�œ�؍�d]3���=�)�/\�"�|��!_!�]td�Q��
�k� ��a�mQM~���3��JrA�Kp%O���:�B���fX��]V�����dJ�MZ4;}�I�䣾���"�������)�q	��[@���ʏ3S5�4��z_!%��|X`�2�5gj�,��i�k-$��|�+��e|6}����䘤p�4���/ؼ]���=;�b�b��w�����oEEg/������d�e�!�@"Dv.Q��B$S!k|n�>6ˎ����!�:�ڔVi&/rkI�+A�Kpw|��:,c�*�._Ŧ�/$�
�nM�?�a��JQiw!-xD|�5i������a���WѐcEwj�#�� z�������EF��      v      x��][r븒��B ��{���I��5r�뙏�=����d�<��SV�ѷ���FV�@eUI�4/��?���쿲$��DE�٥�4�K�8�t��� ���q����N�|�Oin��8-�a���϶;��~�SMu��k�BV���R&�A'�4x:�=�*�(Ҵ���Z���v����5�n��ύ&�Ke�L^h�:��b2Q���
��t�m{���E�-E3*�߼�z�����Ott�+6��܈x���t�Y�M��ۿg7E˪Y�УiY(SP�<��}�������l�:�������#r!�����!l½���k� �@A@��Ti�������m>��=!�@=��ҩ�_�
���5��g���v�� a���ٸA�k/��ʤO���Y&�n�i��G�^�:g�z�ڎ�=FG��FoMtt�����������ޒt��j�p��ȫ�d�����D(@R�yQ<�xo��(Z"i\Y��ލ}�|��`���#�D���F����{렫Z" )K��j��~@f�C� 7Z�)үJ�5�@�=j�
������H@Jٗ%��P��OX�B��Y�dy�i�o�b'�裏�H	 �)2vit�r3�֝j�
� d��%�0��=��.��E���YQUH�P��#�$��8Czk~qVh<���.�"�}�T�_~QVk��m��a>���+�s!I�,�s�"'����i�%��Ҩ�_����/zc���b���#�����AI�g�Vi��x��4�������G���u �L��0�l�ms�S?���[���@�a:�m��kL��a$
�ǉ*U�m� ��y��s��~w�ݻ�GO�TJ� �s�'ܐw��\��ɗ=ȱ�ɸd��'*��C�J�*����F:y4n@��q��e�u�z��ݩ����M��_�<yZ �4�ITU=��y�h=J�0��ҒӅ�H��$l�D�Q�4�$@G��y�P�0��D�i$b��,5��c��ޏ����>�Ht@!)Lf� +��~ ��㇘�(lYUr'>7"p�`�c���j�u2PؽUe8���49��%I�D@g0�s]h�^}�.��nӀ��XAP�)����j�Z���`$z��*1&�w�
=ϭ��`$��~�� �~�I��$�u�������$�QvB��M߶�01 cYV�X�k�tQ�D 4�І;�V{�;�}c�~F$�
��(Ҋ�>��Y{T��ZC�N�D4S �h+���"_P*��G�l�-s��G�z��oG�a%� �IR~��V��st@�zPI�Te��n4@�{�D��׿G���H�@ǅ*�.=��ݙ�N%����d!Od��E�8����pF�V2](\/��w�o�x�Q�Lt���Pɔ�L���V�q�~��)Kd� -��� a���?��P�����r�U�����6G;���Ѯ���=5H�,�HC'�R��F֣�蹟<�H�T�HYi�mh�(�D�C�;������P:D��B+�	�:z��hG7'�����$� N(�7�B�~���ѩ��k��tL��
�B�8�tw�%I(Н�[�4��6#O�H"El�$c�� u�j��� k�Fq׸C�N�J�@����>�S�R+�G	Ⱦ���F@�Z�O%S��T��Y��1i5�=]�d�D�8�BnP=S�� 5 ���~t�1]MQ�#у2NU�X=��<����QL��A�VM��<�
��q�w�~Z��DJ:�Dg�ϏP�yĻ;!�D�8�M�JN�P��w�����v������F�\!�D#�X�9�	�BG�\��OY&ф2.�"cO�t�cg�(�yng�$��2.1�������6�3f	{-�Q&���$a�!@�UZ���F��\\G�%���͸.?@{Z��Y�����y^�Bh����uiW]s���Id�`��{��f9����o�pD �d�/?MB��U��w�ߟ�D�b�Z}��c��նq�
|&��JW�� :	Hh3�<t<� N��qiw�m뺨v�p^�,�����*����~r��kh���01&/�p��+��g��_�bH?��%Q
��Fhߣou�q1΃Æ�%JabЩ�{+�2r��/��TiRr��o�~nPy��Ǟ�H�h�Y��o�钚�+�Fh��e�`�)�� ��w��G;��>�ɴ��s�� an���Y��g���U
m��������� !��p�;@W�L�[du�G�JL�`�*g��I�a�F�F�e�,4\�p#:��5t��1�#Y%G�`�l ��Gy���9�7�,��|s� ������D�����P?V�W��i�����P����nƅ$ӥ�s�}��t1�!U�?�8?V��LW��YZ?C{O���,,�n$�gh����Nd�.�MϞv��%a�49���3t��&�]�w�z�a~[�����i����}��֝���#:�y�-���BL?韧Ɵ!����D���1L�y��������0�!ҏua���D��<�!6�Ҡ�ܵ����{� �e--�oD"Y�W�yA���C�5tc@#Q�)J�!�����[�?�,.,y��+@G�;o�������~n_\�4v�~!Ե);����";na\�P��?}��!t�n �$���T)s���^>z�n�������<N2S&�"�d�X��<�ߝ�>�&�|9rf�^���RtY�غ	{��fƅ�H����3�L��?�1�E�i���� �ѹ�����6��ş����@}����e\h��8QХ�@g~�]\8��0'e���?�{��[����w�;Q<����$��X�^�r0r�:�����F��85��?C]#�Q�nl��wt-O�?78.���ʔ��B��F����캟��"1����0�D˷J��=�U�LŊ]�&w���x�w�����p&�D�@N�omC���è�$�%�_��++P������N���`���J�*���=Yg#��C�����MA�Y!�+Gff*q�=����X���CN��� ܳ�������*�f��=	}C�s��ھ�sE��Y����i���!@�P7�I��H�Q��jw�|���f�����w`�z�7{�9�_���B4ULЌ�~�{��J�� ��gJ��6�/,��ˇt�� �\6qa����-7�����$%��z�n�4��<�BRb�����tZ.�6��yLYeb�j�F�x>e���4UZ�o"�P�g�͎�/$Ev3߰P�O'O�h���3ME��?���P�m{AI2�G�Jsr��G���f��-�"�	�o�A��OxO��I�� Ճ����n�~a)���`�Ȇ@�����{�,�D�X�z>��%�\�;պ��x���5Գ�2o���ۃ���SMus�K�E��*��P=�(<�M��$&-
�o��wW��r��*c�� ��s����V�O,y'�{.z���,G��iƨ�z��	�,�R��Xߠ��Ԁ^�����O�B/�`A/�`p��)��W�l��Ai&�y��W`��o�(� �AS�O�;,��N�I��y
�/Sv�tF={�7��9螐�nЙ��u��,On�P7�ܷ{KH���wϣ��9!�A�;�H2,&�Jn�tF&[����B�����Q��`_��C��)�&�|�,�Թ�-{_Xt��o|@���� m(IR�q�d���X��0�7;
y�٫��	s+�~:�͙�ey]�
�6ߠ��A�7���9L^�g�
��	��ف���,W�oPc�:�Ͷ�{�*+s�P�-��,a#m6�}�*�4�JP�W��>��7[�>3e�YX�7�q]����4Xtf�U�A���N��SwO��Jm��P��K�c��o��}�Qe^r�:@Q�7[���$<@��?�]��Y��iƦt�t�5�z�;�{"T���ݴB��L���/�!PK�k��6���iTR����B��/�i�q�q'7�%�����/4Uqsٰ"��W�%�V)w���N��o�A���`� �  �y����A�7���I�8��h��C�6�"�2��F�f�P���Q&Ȓ�Lu���h�Z׽;T��&�/,:����E��0�ll��Ri�B���D6yi4��V�D/�cSVi�לj�?`��p�V��j�����/$E�r��7��4X��-�n�y�3UN���gj}Ӹ�mB���1I���"@m<���O�!��<N3��b�Z:O]�C��9�t�b�9@�0���lM����k�;*@m���ϛ�i_XTQ�o|@m��D?�<�$�AU����X!D�,��uN:e� ����},�f?�=��M�� ���m��a���It�� u����h<�lF��љJ�Y����A�׺P%;��s3�e]�ʰ�b��f�]�gJYR�(����?��X��n�/<UY&�n���v�����{�R��;c��\��b�6�ʾ�TF�m^�.��Y@���xʯ�
!�տc���'�BcR��!@;0xnv�ݓT�.�y!@G��Q�fG��)>�V�BZgI2+�*a�9@�q��9��FU|� Dh��l��R�$��.@7���|�E�&U�f�B�.��??S�����S���@��7�$��3̬�_����_�<K�aDS�,�a�.�����#q��'� ��B�Х��}��$��+T\N�F.�=��$�0�(�	�K
Хo�n1��[UEj��X���O#��H�a��*cO?#��l�h�ʒ��L��T�����K�a *�Bq�4��y���%�0�)˂�� 
�:�j�#��r�i�V� ��iHLb�S�O��R���xƒKlb Bo��-M��'���%��y���;@C�_��%N1�T�2�c�}Miڵ���q��"�;@CO��SIr�O��i�GX!D��EABI~��J�+4���O��,�T��}��y� �W,'k�2�vh�-�ɬ�x�X����u�F��MV�a4�K5�����H�%1����Ue����D�4�$�1�E�^e�F��t}"���%O�"������g��v+t���-1��Ub��3�g:���x�@T�m �	;�-?��$20���������$&2"�I���B��ywOJ�"+b�$�7��B�;��?)��,�7lQ���e��I�*c?�A�E�??)����_���Q�Ɖ~����BYzWeQ��;@�ҝ-Hr���Ԕl�h��K�D�2)X ����aII~���=���~�a�x�D�2�`�f/@�0_.OJd,+c�P�}r��iZ�K�c�$�vS��y_ۑ^�$�A���&�����ܿ�^��%��J��M���5(DJ�&K�l��8O�m����O^U�Z��]x����d�)t��hZ��zYB����sB�w�h�R";�t���� M=��>���RF���tn�4,����J�(��_�B:��4�v�!���{u��͞��u�Adi]f�b;� Mo��dy]�*e�D?�����,�MJ_�=���;P�$2��ElC���/���d�m����ĭеo�n�v��d%Z�Je|���ÞA�Օ��G�<�����%2��8�Tξ� ]��bl�$�D�20�b-Sz��DF�\e-�)2�CЫm�P�\e A�a�z�-T"K��,��WLs�Md)��do��h[E���3ٌ��!�!Ed*3hY�:,��㢫"S}��h� ����PD�2����Z�W�4K�,e�!n����:wǁ$Ud*��Լ�/@o���z$��ѯ?��'�=��0�Q�������W��      x      x������ � �      z   �   x���KjC1�ᱵ
��5:zز�dZh!��d��7�J(���'�#�����V�߫0&Cf}�k���ׂ@9|}�K9����ƺ��h�i6X���qTD{�衾 ҇��[����g���<�p,�l_}��-�κ �]u���|�������@BҤILDcWݐͺ��ѱ��H�y      |      x������ � �      ~   R  x���Kr�6���Sh��Qh�1��	fCQ���THщs�4�&jm U�}�o�7�b��|f����?-�������6߬��I�hC�����q�'WC`D?�_[�<[b���\�c7M�{K)$�=V8����K=TZIk�F[A��%�.����KK�+o�P�@ū��R9�R� ��u馾�(1�hI\o�u�ǝ7�Y�5T⭛N���lT)��Q�z���K���M�b�3�F��} @-��l�7��xj�T4�<�������,&��*�K^ީ��ZF���TЉ��؆F��tT���������<�Ă
��
��G��C��-�1*q!;`�a��m�8��aM� �$�����%��־�@+r��5����B@��������W�/�&_���)�=�Nx�M�Z�@@�c��[�-sҦ�l]4y~&����"Fg��=h'��4�Q׋��X��@����m��	MR[�'w �Aܶum��V�Vs_z БRz�ӔO?2Y����F�TO�Q��=ZF� �i�wkw�5Bhh~X�������_!l�)^)n���e{�S�*>:S�1˂�hA]17��e��"�%����Ǳ�VF���:UP���<^%G�ў�ւ�8�3�dK˻8�-��e#K�o���ߖ����i����@`eu�wKk�Y�����������0�' �ڢ�&}g]�I��z� �J,�G�����q���؉�>KP.�B}�X�umD�ӿ����{�Z�A�� -��R#E�u�0A��'�I�:���<��?��5g��9�����ZQZ������n�=7�� �aK�@`#������K�����Il��(�$i�fG{A�h�lc�#�%�]X����$VI�J4��R�����-P62oV8#�Jk-㖘��� ��4��rzxO92V]�}�ܽ���Ҕ&?�L�n߁���B�G�)����W��<]�ZZ�`ׄ��b��˼�u1���7$Gϼ=r�k��T"������!�j_T�ed3��� ��Wx�dn��C��F��C�]���b      �      x������ � �      �      x������ � �      �   w   x�}̱� @�Z���IHL�� ���E��3��J�P��a�����H��H,&��r�� �V��^{o�;�����r���?X��£���v��a��ġ0K^5&���#���9/      �   �   x�M��!���l�w����8�3k�X�������B+#����2gŵ1ݍ�q�N�:Y�-3xce��+l\c�T���Φ���
k�4�Y�n�#�z������۴�H� �y\�k�VDK��k�4y/�&��a��p0��6�������J      �      x������ � �      �      x������ � �      �   �  x���ɒ�����S�舳j̄��Z�Yd�8�DA&x����/v�νQU�M��0��?���7@�*S��n���?����6��}H��v�~��Cd�!�$󅳿@�E�w��*j�u�#�m9����]߼�����?���`UO'���؏'B�P�
���8��ǯ��B�{$A��~�o?�\|x� �o�	�1�/1�}�#�����::i�d)����12��&7�!��0kLm�*Ŏ�������R���v��:��vپ+_�3޿�&�=�?~x�������Wȿ
"�CY�(�'0;vI�O�ñhH�y���	�"��� \�����U�X]���:ղ���r��-:�6�w��a7#!��X�8�H�Pb(#K����*���栽w�O�U\�t2�W�Q��{�Zd��� ����ڕ�לJf!XƏ$J��Ȏ�2OZ��2��8��8�o�d���`f.��a�ًǝ2]�`Uo®��;G���2Q ���5h����\�w�I�I�����$�C���XR-����@uKe<Y⡄���F�\����bZt��׋\�88��K��!|�P(�	I�%v��(���O�a���s9���yZ�QUhh2wٕ���y�f����n����8����l�g�8Q|$Q�5��I�N��?i�%�r��py�Ë_��˼w�G?/q(�͎p�C�NX���D;N>:���3\���$���/�Bb?{.V���2oݕj�!��f������l3�m���aE�]��	�&��9�ه�H�L�d��#;��,���
4պ��<%]N��B��.���-�i����eGq�Nn���ޜ�ceA���H�,<sJ�c�}�vH�I	ɵ4�r:7�3iK������N��q� �\Y]��<p�w�����5���?��$Q��vۻDi�g�����.~�Ҡ���-'-��O}eꙒ�u}s�St-z�tu�M�<x� �*���TO�	c�&3}H�L`���b~+O��O�/l�^`뎍���VD�m���E�'��g���-�nE
f�h�Y������tُ$�#2vHn-?���A.��`���b�Ps�t�<����\�l���Y�,�K�6�'g���=s�+� 
u~�.Q̄v�	�{Ҹq�Q���,���B�(�$���,$GN۬$�T)9Yu�#���X��xc-�Qs(�d��:cx�(����Α<I%�o��x����N9fy�p����4:���tN׀Q?8�v�Ҋ�-Vs*��<�{�Z�{A�ql�Q�$>$-��7Z���&�C�7�d���:�o��y6ؖ�ڙld��pF6m�5����T��7`j sug�]�P�y�P�gI��>a�;��cE�^���]�[��v��u�;C��f�kz=�ZVE�2Hb�\S�~H�cr��w�'-�yN{�,i ��PCg�T�����K��~bGY�Z��.��1�c\7�q�������P�u@�I����(U+�����'�Pz(g��(�]�jc�4n<�ͅ��-G�Z��X܂e����:ܜ��BX�m�>$
��?�������i^QO#�Z4�^dA!8�uߘ��s&�6Xr�j�wqQ���-����{���i��+�Ձ�#�}�Y�4�kz-���j!��j�$�"�cv;k���}Z�'�&Z�By3��e9^��f_+�RV�����u��"4�J��[��k-�Y�H"s%{�`�Ť	�T�q�7�v�S���j��ԶVž·��>�$> �[�P������O�zkj�t�"K/�k�Y�4o�9��'�W"�vE��m��8��-Q��`���Oqz+/����(��S�1���- ���+�YZ��H� �����yAi2�����p��mtb�$lq�[)Д7[�HV�6صOl����*c^,m=�bo��� ���#���LJ۹���9�M��z�>wV'��jz�A���0{<oƺ�x��Ey�����>y���uS�<C�eȃz��Kދ ~����吜��'��b��2t]"����j.���:��$����Z��x�Eb!�����V�^8������2������Z�|���-���C���<�m�rN�嬗��#C.�֤�E�J }���d��WHS<�!��h��������c�m>�a	��o���f�ؗ���'N�         n   x�}̱
�@�9y�����Kkn�(��.��V���P:9����[��k�4H�D��"�K�r��,I�d]�e��hY��_����n�iԪ�/ʡ�?ď���2�            x������ � �      6   >   x�K�+�,���M�+�LI-K��/ ��-u�t�M�ͬ�M����q�p��qqq ��            x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �             x������ � �      "      x������ � �      $      x������ � �      &      x������ � �      (      x������ � �      *      x������ � �      �      x������ � �      ,      x������ � �      .   �   x�}�;� @g|�^ �-7�ԵK�d���r�,�
�߳%?�������~}�5�c����kN�Z���#�9������:ւ�h^��u��b��:� 4���������� �F>&' ��]c���w '��p�      5   �   x�M��!���l�w����8�3k�X�������B+#����2gŵ1ݍ�q�N�:Y�-3xce��+l\c�T���Φ���
k�4�Y�n�#�z������۴�H� �y\�k�VDK��k�4y/�&��a��p0��6�������J      0      x������ � �      2      x������ � �      4   �   x�u�M�@������m�wuW���:�Y��5�$�__!a��9���nu��I�����I���Ú�-�F�5��b�� ,(}����'��]��]����s���qw�E�/���-9�_A�͸��PqO9H�`���b&r����� (){�7Ms�A���z
��B�?'�Q�̈�a/��A�     