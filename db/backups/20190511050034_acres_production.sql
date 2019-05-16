PGDMP     #                     w            acres_production    9.5.14    9.5.14 }   �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �
           1262    301437    acres_production    DATABASE     �   CREATE DATABASE acres_production WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
     DROP DATABASE acres_production;
             acres_admin    false                        2615    301814    acres    SCHEMA        CREATE SCHEMA acres;
    DROP SCHEMA acres;
             acres_admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                        3079    12401    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    301817    accounts    TABLE     %  CREATE TABLE acres.accounts (
    id bigint NOT NULL,
    company character varying NOT NULL,
    subdomain character varying NOT NULL,
    status boolean,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.accounts;
       acres         acres_admin    false    8            �            1259    301815    accounts_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.accounts_id_seq;
       acres       acres_admin    false    8    225            �
           0    0    accounts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.accounts_id_seq OWNED BY acres.accounts.id;
            acres       acres_admin    false    224            �            1259    301829    app_configs    TABLE       CREATE TABLE acres.app_configs (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    icon character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.app_configs;
       acres         acres_admin    false    8            �            1259    301827    app_configs_id_seq    SEQUENCE     z   CREATE SEQUENCE acres.app_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE acres.app_configs_id_seq;
       acres       acres_admin    false    8    227            �
           0    0    app_configs_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE acres.app_configs_id_seq OWNED BY acres.app_configs.id;
            acres       acres_admin    false    226            	           1259    302182    ar_internal_metadata    TABLE     �   CREATE TABLE acres.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE acres.ar_internal_metadata;
       acres         acres_admin    false    8            �            1259    301841    bank_commission_editions    TABLE     �  CREATE TABLE acres.bank_commission_editions (
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
       acres         acres_admin    false    8            �            1259    301839    bank_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.bank_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE acres.bank_commission_editions_id_seq;
       acres       acres_admin    false    8    229            �
           0    0    bank_commission_editions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE acres.bank_commission_editions_id_seq OWNED BY acres.bank_commission_editions.id;
            acres       acres_admin    false    228            �            1259    301855    banks    TABLE     W  CREATE TABLE acres.banks (
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
    number_of_remaining_days integer DEFAULT 0
);
    DROP TABLE acres.banks;
       acres         acres_admin    false    8            �            1259    301853    banks_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.banks_id_seq;
       acres       acres_admin    false    231    8            �
           0    0    banks_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.banks_id_seq OWNED BY acres.banks.id;
            acres       acres_admin    false    230            �            1259    301872    commission_settings    TABLE     �  CREATE TABLE acres.commission_settings (
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
       acres         acres_admin    false    8            �            1259    301870    commission_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.commission_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.commission_settings_id_seq;
       acres       acres_admin    false    8    233            �
           0    0    commission_settings_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.commission_settings_id_seq OWNED BY acres.commission_settings.id;
            acres       acres_admin    false    232            �            1259    301888    commissions    TABLE       CREATE TABLE acres.commissions (
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
       acres         acres_admin    false    8            �            1259    301886    commissions_id_seq    SEQUENCE     z   CREATE SEQUENCE acres.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE acres.commissions_id_seq;
       acres       acres_admin    false    8    235            �
           0    0    commissions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE acres.commissions_id_seq OWNED BY acres.commissions.id;
            acres       acres_admin    false    234            �            1259    301910 	   companies    TABLE       CREATE TABLE acres.companies (
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
       acres         acres_admin    false    8            �            1259    301908    companies_id_seq    SEQUENCE     x   CREATE SEQUENCE acres.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE acres.companies_id_seq;
       acres       acres_admin    false    8    237            �
           0    0    companies_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acres.companies_id_seq OWNED BY acres.companies.id;
            acres       acres_admin    false    236            �            1259    301922    config_options    TABLE     x  CREATE TABLE acres.config_options (
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
       acres         acres_admin    false    8            �            1259    301920    config_options_id_seq    SEQUENCE     }   CREATE SEQUENCE acres.config_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE acres.config_options_id_seq;
       acres       acres_admin    false    239    8            �
           0    0    config_options_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE acres.config_options_id_seq OWNED BY acres.config_options.id;
            acres       acres_admin    false    238            �            1259    301934    credit_details    TABLE     ,  CREATE TABLE acres.credit_details (
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
       acres         acres_admin    false    8            �            1259    301932    credit_details_id_seq    SEQUENCE     }   CREATE SEQUENCE acres.credit_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE acres.credit_details_id_seq;
       acres       acres_admin    false    241    8            �
           0    0    credit_details_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE acres.credit_details_id_seq OWNED BY acres.credit_details.id;
            acres       acres_admin    false    240            �            1259    301950    credits    TABLE     2  CREATE TABLE acres.credits (
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
       acres         acres_admin    false    8            �            1259    301948    credits_id_seq    SEQUENCE     v   CREATE SEQUENCE acres.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE acres.credits_id_seq;
       acres       acres_admin    false    8    243            �
           0    0    credits_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE acres.credits_id_seq OWNED BY acres.credits.id;
            acres       acres_admin    false    242            �            1259    301962 	   customers    TABLE     6  CREATE TABLE acres.customers (
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
       acres         acres_admin    false    8            �            1259    301960    customers_id_seq    SEQUENCE     x   CREATE SEQUENCE acres.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE acres.customers_id_seq;
       acres       acres_admin    false    245    8            �
           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acres.customers_id_seq OWNED BY acres.customers.id;
            acres       acres_admin    false    244            �            1259    301974    friendly_id_slugs    TABLE     �   CREATE TABLE acres.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 $   DROP TABLE acres.friendly_id_slugs;
       acres         acres_admin    false    8            �            1259    301972    friendly_id_slugs_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE acres.friendly_id_slugs_id_seq;
       acres       acres_admin    false    8    247            �
           0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE acres.friendly_id_slugs_id_seq OWNED BY acres.friendly_id_slugs.id;
            acres       acres_admin    false    246            �            1259    301989    logs    TABLE     I  CREATE TABLE acres.logs (
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
       acres         acres_admin    false    8            �            1259    301987    logs_id_seq    SEQUENCE     s   CREATE SEQUENCE acres.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE acres.logs_id_seq;
       acres       acres_admin    false    249    8            �
           0    0    logs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE acres.logs_id_seq OWNED BY acres.logs.id;
            acres       acres_admin    false    248            �            1259    302001    mail_configurations    TABLE     �  CREATE TABLE acres.mail_configurations (
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
       acres         acres_admin    false    8            �            1259    301999    mail_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.mail_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.mail_configurations_id_seq;
       acres       acres_admin    false    251    8            �
           0    0    mail_configurations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.mail_configurations_id_seq OWNED BY acres.mail_configurations.id;
            acres       acres_admin    false    250            �            1259    302013    notaries    TABLE     9  CREATE TABLE acres.notaries (
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
       acres         acres_admin    false    8            �            1259    302011    notaries_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.notaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.notaries_id_seq;
       acres       acres_admin    false    253    8            �
           0    0    notaries_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.notaries_id_seq OWNED BY acres.notaries.id;
            acres       acres_admin    false    252            �            1259    302025    profiles    TABLE     �  CREATE TABLE acres.profiles (
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
       acres         acres_admin    false    8            �            1259    302023    profiles_id_seq    SEQUENCE     w   CREATE SEQUENCE acres.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE acres.profiles_id_seq;
       acres       acres_admin    false    255    8            �
           0    0    profiles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE acres.profiles_id_seq OWNED BY acres.profiles.id;
            acres       acres_admin    false    254                       1259    302037    roles    TABLE     �   CREATE TABLE acres.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.roles;
       acres         acres_admin    false    8                        1259    302035    roles_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.roles_id_seq;
       acres       acres_admin    false    8    257            �
           0    0    roles_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.roles_id_seq OWNED BY acres.roles.id;
            acres       acres_admin    false    256                       1259    302174    schema_migrations    TABLE     Q   CREATE TABLE acres.schema_migrations (
    version character varying NOT NULL
);
 $   DROP TABLE acres.schema_migrations;
       acres         acres_admin    false    8                       1259    302048    super_admin_configs    TABLE       CREATE TABLE acres.super_admin_configs (
    id bigint NOT NULL,
    login character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE acres.super_admin_configs;
       acres         acres_admin    false    8                       1259    302046    super_admin_configs_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.super_admin_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE acres.super_admin_configs_id_seq;
       acres       acres_admin    false    259    8            �
           0    0    super_admin_configs_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE acres.super_admin_configs_id_seq OWNED BY acres.super_admin_configs.id;
            acres       acres_admin    false    258                       1259    302059    user_commission_editions    TABLE     �  CREATE TABLE acres.user_commission_editions (
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
       acres         acres_admin    false    8                       1259    302057    user_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE acres.user_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE acres.user_commission_editions_id_seq;
       acres       acres_admin    false    8    261                        0    0    user_commission_editions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE acres.user_commission_editions_id_seq OWNED BY acres.user_commission_editions.id;
            acres       acres_admin    false    260                       1259    302073    users    TABLE     /  CREATE TABLE acres.users (
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
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE acres.users;
       acres         acres_admin    false    8                       1259    302071    users_id_seq    SEQUENCE     t   CREATE SEQUENCE acres.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE acres.users_id_seq;
       acres       acres_admin    false    8    263                       0    0    users_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acres.users_id_seq OWNED BY acres.users.id;
            acres       acres_admin    false    262            �            1259    301440    accounts    TABLE     &  CREATE TABLE public.accounts (
    id bigint NOT NULL,
    company character varying NOT NULL,
    subdomain character varying NOT NULL,
    status boolean,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.accounts;
       public         acres_admin    false    6            �            1259    301438    accounts_id_seq    SEQUENCE     x   CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public       acres_admin    false    6    183                       0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
            public       acres_admin    false    182            �            1259    301452    app_configs    TABLE       CREATE TABLE public.app_configs (
    id bigint NOT NULL,
    name character varying,
    url character varying,
    icon character varying,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.app_configs;
       public         acres_admin    false    6            �            1259    301450    app_configs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.app_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.app_configs_id_seq;
       public       acres_admin    false    185    6                       0    0    app_configs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.app_configs_id_seq OWNED BY public.app_configs.id;
            public       acres_admin    false    184            �            1259    301805    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         acres_admin    false    6            �            1259    301464    bank_commission_editions    TABLE     �  CREATE TABLE public.bank_commission_editions (
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
       public         acres_admin    false    6            �            1259    301462    bank_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bank_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.bank_commission_editions_id_seq;
       public       acres_admin    false    187    6                       0    0    bank_commission_editions_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.bank_commission_editions_id_seq OWNED BY public.bank_commission_editions.id;
            public       acres_admin    false    186            �            1259    301478    banks    TABLE     X  CREATE TABLE public.banks (
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
    number_of_remaining_days integer DEFAULT 0
);
    DROP TABLE public.banks;
       public         acres_admin    false    6            �            1259    301476    banks_id_seq    SEQUENCE     u   CREATE SEQUENCE public.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banks_id_seq;
       public       acres_admin    false    6    189                       0    0    banks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;
            public       acres_admin    false    188            �            1259    301495    commission_settings    TABLE     �  CREATE TABLE public.commission_settings (
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
       public         acres_admin    false    6            �            1259    301493    commission_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commission_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.commission_settings_id_seq;
       public       acres_admin    false    6    191                       0    0    commission_settings_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.commission_settings_id_seq OWNED BY public.commission_settings.id;
            public       acres_admin    false    190            �            1259    301511    commissions    TABLE       CREATE TABLE public.commissions (
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
       public         acres_admin    false    6            �            1259    301509    commissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.commissions_id_seq;
       public       acres_admin    false    193    6                       0    0    commissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.commissions_id_seq OWNED BY public.commissions.id;
            public       acres_admin    false    192            �            1259    301533 	   companies    TABLE       CREATE TABLE public.companies (
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
       public         acres_admin    false    6            �            1259    301531    companies_id_seq    SEQUENCE     y   CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public       acres_admin    false    195    6                       0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
            public       acres_admin    false    194            �            1259    301545    config_options    TABLE     y  CREATE TABLE public.config_options (
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
       public         acres_admin    false    6            �            1259    301543    config_options_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.config_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.config_options_id_seq;
       public       acres_admin    false    197    6            	           0    0    config_options_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.config_options_id_seq OWNED BY public.config_options.id;
            public       acres_admin    false    196            �            1259    301557    credit_details    TABLE     -  CREATE TABLE public.credit_details (
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
       public         acres_admin    false    6            �            1259    301555    credit_details_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.credit_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.credit_details_id_seq;
       public       acres_admin    false    199    6            
           0    0    credit_details_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.credit_details_id_seq OWNED BY public.credit_details.id;
            public       acres_admin    false    198            �            1259    301573    credits    TABLE     3  CREATE TABLE public.credits (
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
       public         acres_admin    false    6            �            1259    301571    credits_id_seq    SEQUENCE     w   CREATE SEQUENCE public.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.credits_id_seq;
       public       acres_admin    false    201    6                       0    0    credits_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.credits_id_seq OWNED BY public.credits.id;
            public       acres_admin    false    200            �            1259    301585 	   customers    TABLE     7  CREATE TABLE public.customers (
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
       public         acres_admin    false    6            �            1259    301583    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public       acres_admin    false    6    203                       0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
            public       acres_admin    false    202            �            1259    301597    friendly_id_slugs    TABLE     �   CREATE TABLE public.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);
 %   DROP TABLE public.friendly_id_slugs;
       public         acres_admin    false    6            �            1259    301595    friendly_id_slugs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.friendly_id_slugs_id_seq;
       public       acres_admin    false    6    205                       0    0    friendly_id_slugs_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;
            public       acres_admin    false    204            �            1259    301612    logs    TABLE     J  CREATE TABLE public.logs (
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
       public         acres_admin    false    6            �            1259    301610    logs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.logs_id_seq;
       public       acres_admin    false    6    207                       0    0    logs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;
            public       acres_admin    false    206            �            1259    301624    mail_configurations    TABLE     �  CREATE TABLE public.mail_configurations (
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
       public         acres_admin    false    6            �            1259    301622    mail_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mail_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.mail_configurations_id_seq;
       public       acres_admin    false    6    209                       0    0    mail_configurations_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.mail_configurations_id_seq OWNED BY public.mail_configurations.id;
            public       acres_admin    false    208            �            1259    301636    notaries    TABLE     :  CREATE TABLE public.notaries (
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
       public         acres_admin    false    6            �            1259    301634    notaries_id_seq    SEQUENCE     x   CREATE SEQUENCE public.notaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.notaries_id_seq;
       public       acres_admin    false    211    6                       0    0    notaries_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.notaries_id_seq OWNED BY public.notaries.id;
            public       acres_admin    false    210            �            1259    301648    profiles    TABLE     �  CREATE TABLE public.profiles (
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
       public         acres_admin    false    6            �            1259    301646    profiles_id_seq    SEQUENCE     x   CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public       acres_admin    false    213    6                       0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
            public       acres_admin    false    212            �            1259    301660    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         acres_admin    false    6            �            1259    301658    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       acres_admin    false    215    6                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       acres_admin    false    214            �            1259    301797    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         acres_admin    false    6            �            1259    301671    super_admin_configs    TABLE       CREATE TABLE public.super_admin_configs (
    id bigint NOT NULL,
    login character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.super_admin_configs;
       public         acres_admin    false    6            �            1259    301669    super_admin_configs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.super_admin_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.super_admin_configs_id_seq;
       public       acres_admin    false    217    6                       0    0    super_admin_configs_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.super_admin_configs_id_seq OWNED BY public.super_admin_configs.id;
            public       acres_admin    false    216            �            1259    301682    user_commission_editions    TABLE     �  CREATE TABLE public.user_commission_editions (
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
       public         acres_admin    false    6            �            1259    301680    user_commission_editions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_commission_editions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.user_commission_editions_id_seq;
       public       acres_admin    false    6    219                       0    0    user_commission_editions_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.user_commission_editions_id_seq OWNED BY public.user_commission_editions.id;
            public       acres_admin    false    218            �            1259    301696    users    TABLE     0  CREATE TABLE public.users (
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
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.users;
       public         acres_admin    false    6            �            1259    301694    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       acres_admin    false    221    6                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       acres_admin    false    220            E	           2604    301820    id    DEFAULT     h   ALTER TABLE ONLY acres.accounts ALTER COLUMN id SET DEFAULT nextval('acres.accounts_id_seq'::regclass);
 9   ALTER TABLE acres.accounts ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    224    225    225            F	           2604    301832    id    DEFAULT     n   ALTER TABLE ONLY acres.app_configs ALTER COLUMN id SET DEFAULT nextval('acres.app_configs_id_seq'::regclass);
 <   ALTER TABLE acres.app_configs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    226    227    227            G	           2604    301844    id    DEFAULT     �   ALTER TABLE ONLY acres.bank_commission_editions ALTER COLUMN id SET DEFAULT nextval('acres.bank_commission_editions_id_seq'::regclass);
 I   ALTER TABLE acres.bank_commission_editions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    229    228    229            I	           2604    301858    id    DEFAULT     b   ALTER TABLE ONLY acres.banks ALTER COLUMN id SET DEFAULT nextval('acres.banks_id_seq'::regclass);
 6   ALTER TABLE acres.banks ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    230    231    231            O	           2604    301875    id    DEFAULT     ~   ALTER TABLE ONLY acres.commission_settings ALTER COLUMN id SET DEFAULT nextval('acres.commission_settings_id_seq'::regclass);
 D   ALTER TABLE acres.commission_settings ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    233    232    233            T	           2604    301891    id    DEFAULT     n   ALTER TABLE ONLY acres.commissions ALTER COLUMN id SET DEFAULT nextval('acres.commissions_id_seq'::regclass);
 <   ALTER TABLE acres.commissions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    234    235    235            _	           2604    301913    id    DEFAULT     j   ALTER TABLE ONLY acres.companies ALTER COLUMN id SET DEFAULT nextval('acres.companies_id_seq'::regclass);
 :   ALTER TABLE acres.companies ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    237    236    237            `	           2604    301925    id    DEFAULT     t   ALTER TABLE ONLY acres.config_options ALTER COLUMN id SET DEFAULT nextval('acres.config_options_id_seq'::regclass);
 ?   ALTER TABLE acres.config_options ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    238    239    239            b	           2604    301937    id    DEFAULT     t   ALTER TABLE ONLY acres.credit_details ALTER COLUMN id SET DEFAULT nextval('acres.credit_details_id_seq'::regclass);
 ?   ALTER TABLE acres.credit_details ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    241    240    241            g	           2604    301953    id    DEFAULT     f   ALTER TABLE ONLY acres.credits ALTER COLUMN id SET DEFAULT nextval('acres.credits_id_seq'::regclass);
 8   ALTER TABLE acres.credits ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    242    243    243            h	           2604    301965    id    DEFAULT     j   ALTER TABLE ONLY acres.customers ALTER COLUMN id SET DEFAULT nextval('acres.customers_id_seq'::regclass);
 :   ALTER TABLE acres.customers ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    244    245    245            i	           2604    301977    id    DEFAULT     z   ALTER TABLE ONLY acres.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('acres.friendly_id_slugs_id_seq'::regclass);
 B   ALTER TABLE acres.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    246    247    247            j	           2604    301992    id    DEFAULT     `   ALTER TABLE ONLY acres.logs ALTER COLUMN id SET DEFAULT nextval('acres.logs_id_seq'::regclass);
 5   ALTER TABLE acres.logs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    248    249    249            k	           2604    302004    id    DEFAULT     ~   ALTER TABLE ONLY acres.mail_configurations ALTER COLUMN id SET DEFAULT nextval('acres.mail_configurations_id_seq'::regclass);
 D   ALTER TABLE acres.mail_configurations ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    251    250    251            l	           2604    302016    id    DEFAULT     h   ALTER TABLE ONLY acres.notaries ALTER COLUMN id SET DEFAULT nextval('acres.notaries_id_seq'::regclass);
 9   ALTER TABLE acres.notaries ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    252    253    253            m	           2604    302028    id    DEFAULT     h   ALTER TABLE ONLY acres.profiles ALTER COLUMN id SET DEFAULT nextval('acres.profiles_id_seq'::regclass);
 9   ALTER TABLE acres.profiles ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    254    255    255            n	           2604    302040    id    DEFAULT     b   ALTER TABLE ONLY acres.roles ALTER COLUMN id SET DEFAULT nextval('acres.roles_id_seq'::regclass);
 6   ALTER TABLE acres.roles ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    256    257    257            o	           2604    302051    id    DEFAULT     ~   ALTER TABLE ONLY acres.super_admin_configs ALTER COLUMN id SET DEFAULT nextval('acres.super_admin_configs_id_seq'::regclass);
 D   ALTER TABLE acres.super_admin_configs ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    258    259    259            p	           2604    302062    id    DEFAULT     �   ALTER TABLE ONLY acres.user_commission_editions ALTER COLUMN id SET DEFAULT nextval('acres.user_commission_editions_id_seq'::regclass);
 I   ALTER TABLE acres.user_commission_editions ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    260    261    261            r	           2604    302076    id    DEFAULT     b   ALTER TABLE ONLY acres.users ALTER COLUMN id SET DEFAULT nextval('acres.users_id_seq'::regclass);
 6   ALTER TABLE acres.users ALTER COLUMN id DROP DEFAULT;
       acres       acres_admin    false    262    263    263            	           2604    301443    id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    183    182    183            	           2604    301455    id    DEFAULT     p   ALTER TABLE ONLY public.app_configs ALTER COLUMN id SET DEFAULT nextval('public.app_configs_id_seq'::regclass);
 =   ALTER TABLE public.app_configs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    185    184    185            	           2604    301467    id    DEFAULT     �   ALTER TABLE ONLY public.bank_commission_editions ALTER COLUMN id SET DEFAULT nextval('public.bank_commission_editions_id_seq'::regclass);
 J   ALTER TABLE public.bank_commission_editions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    186    187    187            	           2604    301481    id    DEFAULT     d   ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);
 7   ALTER TABLE public.banks ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    188    189    189            	           2604    301498    id    DEFAULT     �   ALTER TABLE ONLY public.commission_settings ALTER COLUMN id SET DEFAULT nextval('public.commission_settings_id_seq'::regclass);
 E   ALTER TABLE public.commission_settings ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    191    190    191            !	           2604    301514    id    DEFAULT     p   ALTER TABLE ONLY public.commissions ALTER COLUMN id SET DEFAULT nextval('public.commissions_id_seq'::regclass);
 =   ALTER TABLE public.commissions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    192    193    193            ,	           2604    301536    id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    195    194    195            -	           2604    301548    id    DEFAULT     v   ALTER TABLE ONLY public.config_options ALTER COLUMN id SET DEFAULT nextval('public.config_options_id_seq'::regclass);
 @   ALTER TABLE public.config_options ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    197    196    197            /	           2604    301560    id    DEFAULT     v   ALTER TABLE ONLY public.credit_details ALTER COLUMN id SET DEFAULT nextval('public.credit_details_id_seq'::regclass);
 @   ALTER TABLE public.credit_details ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    199    198    199            4	           2604    301576    id    DEFAULT     h   ALTER TABLE ONLY public.credits ALTER COLUMN id SET DEFAULT nextval('public.credits_id_seq'::regclass);
 9   ALTER TABLE public.credits ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    200    201    201            5	           2604    301588    id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    202    203    203            6	           2604    301600    id    DEFAULT     |   ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);
 C   ALTER TABLE public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    204    205    205            7	           2604    301615    id    DEFAULT     b   ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);
 6   ALTER TABLE public.logs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    206    207    207            8	           2604    301627    id    DEFAULT     �   ALTER TABLE ONLY public.mail_configurations ALTER COLUMN id SET DEFAULT nextval('public.mail_configurations_id_seq'::regclass);
 E   ALTER TABLE public.mail_configurations ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    208    209    209            9	           2604    301639    id    DEFAULT     j   ALTER TABLE ONLY public.notaries ALTER COLUMN id SET DEFAULT nextval('public.notaries_id_seq'::regclass);
 :   ALTER TABLE public.notaries ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    210    211    211            :	           2604    301651    id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    212    213    213            ;	           2604    301663    id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    214    215    215            <	           2604    301674    id    DEFAULT     �   ALTER TABLE ONLY public.super_admin_configs ALTER COLUMN id SET DEFAULT nextval('public.super_admin_configs_id_seq'::regclass);
 E   ALTER TABLE public.super_admin_configs ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    216    217    217            =	           2604    301685    id    DEFAULT     �   ALTER TABLE ONLY public.user_commission_editions ALTER COLUMN id SET DEFAULT nextval('public.user_commission_editions_id_seq'::regclass);
 J   ALTER TABLE public.user_commission_editions ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    219    218    219            ?	           2604    301699    id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       acres_admin    false    221    220    221            �
          0    301817    accounts 
   TABLE DATA               b   COPY acres.accounts (id, company, subdomain, status, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    225   5�                 0    0    accounts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.accounts_id_seq', 1, false);
            acres       acres_admin    false    224            �
          0    301829    app_configs 
   TABLE DATA               Z   COPY acres.app_configs (id, name, url, icon, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    227   R�                 0    0    app_configs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('acres.app_configs_id_seq', 1, false);
            acres       acres_admin    false    226            �
          0    302182    ar_internal_metadata 
   TABLE DATA               Q   COPY acres.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    265   o�      �
          0    301841    bank_commission_editions 
   TABLE DATA               �   COPY acres.bank_commission_editions (id, date_effet, completed, old_value, new_value, bank_id, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    229   ��                 0    0    bank_commission_editions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('acres.bank_commission_editions_id_seq', 3, true);
            acres       acres_admin    false    228            �
          0    301855    banks 
   TABLE DATA               �   COPY acres.banks (id, name, description, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, phone, address, slug, user_id, created_at, updated_at, number_of_remaining_days) FROM stdin;
    acres       acres_admin    false    231   4�                 0    0    banks_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('acres.banks_id_seq', 8, true);
            acres       acres_admin    false    230            �
          0    301872    commission_settings 
   TABLE DATA               �   COPY acres.commission_settings (id, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    233   F�                 0    0    commission_settings_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.commission_settings_id_seq', 27, true);
            acres       acres_admin    false    232            �
          0    301888    commissions 
   TABLE DATA               �  COPY acres.commissions (id, credit_id, production_date, acte_date, customer_id, notary_name, bank_name, contributor_name, producer_name, company_name, contributor_commission_percentage, contributor_commission, producer_commission_percentage, producer_commission, bank_commission_percentage, bank_commission, company_commission_percentage, company_commission, amount_credit, total_amount, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    235   ��                 0    0    commissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('acres.commissions_id_seq', 346, true);
            acres       acres_admin    false    234            �
          0    301910 	   companies 
   TABLE DATA               �   COPY acres.companies (id, name, address, city, country, phone, slug, brand_file_name, brand_content_type, brand_file_size, brand_updated_at, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    237   �                 0    0    companies_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.companies_id_seq', 1, true);
            acres       acres_admin    false    236            �
          0    301922    config_options 
   TABLE DATA               �   COPY acres.config_options (id, app_name, admin_name, admin_email, admin_password, admin_role, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    239   <                 0    0    config_options_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('acres.config_options_id_seq', 1, false);
            acres       acres_admin    false    238            �
          0    301934    credit_details 
   TABLE DATA               �   COPY acres.credit_details (id, installment_payment, installment_date, commission, cumulative_amount, paid_by_bank, paid_to_contributor_or_producer, "creditUid", credit_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    241   Y                 0    0    credit_details_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('acres.credit_details_id_seq', 1, false);
            acres       acres_admin    false    240            �
          0    301950    credits 
   TABLE DATA               i  COPY acres.credits (id, credit_id, production_date, acte_date, customer_id, bank_id, amount, bank_name, customer_name, producer_id, producer_name, contributor_id, contributor_name, notary_name, hypoplus, total_commission_bank, total_commission_producer, total_commission_contributor, total_commission_company, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    243   v                 0    0    credits_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.credits_id_seq', 346, true);
            acres       acres_admin    false    242            �
          0    301962 	   customers 
   TABLE DATA               �   COPY acres.customers (id, gender, address, city, country, phone, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at, full_name) FROM stdin;
    acres       acres_admin    false    245   b*                  0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('acres.customers_id_seq', 245, true);
            acres       acres_admin    false    244            �
          0    301974    friendly_id_slugs 
   TABLE DATA               e   COPY acres.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    acres       acres_admin    false    247   @      !           0    0    friendly_id_slugs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('acres.friendly_id_slugs_id_seq', 1, false);
            acres       acres_admin    false    246            �
          0    301989    logs 
   TABLE DATA               m   COPY acres.logs (id, file_name, no_record, error, status, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    249   9@      "           0    0    logs_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('acres.logs_id_seq', 2, true);
            acres       acres_admin    false    248            �
          0    302001    mail_configurations 
   TABLE DATA               �   COPY acres.mail_configurations (id, host, user_name, password, domain, address, port, authentication, enable_starttls_auto, ssl, slug, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    251   �@      #           0    0    mail_configurations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.mail_configurations_id_seq', 1, false);
            acres       acres_admin    false    250            �
          0    302013    notaries 
   TABLE DATA               h   COPY acres.notaries (id, full_name, address, phone, email, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    253   �@      $           0    0    notaries_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.notaries_id_seq', 88, true);
            acres       acres_admin    false    252            �
          0    302025    profiles 
   TABLE DATA               �   COPY acres.profiles (id, first_name, last_name, phone, address, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    255   ;G      %           0    0    profiles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acres.profiles_id_seq', 1, false);
            acres       acres_admin    false    254            �
          0    302037    roles 
   TABLE DATA               @   COPY acres.roles (id, name, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    257   XG      &           0    0    roles_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('acres.roles_id_seq', 3, true);
            acres       acres_admin    false    256            �
          0    302174    schema_migrations 
   TABLE DATA               3   COPY acres.schema_migrations (version) FROM stdin;
    acres       acres_admin    false    264   �G      �
          0    302048    super_admin_configs 
   TABLE DATA               `   COPY acres.super_admin_configs (id, login, email, password, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    259   bH      '           0    0    super_admin_configs_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('acres.super_admin_configs_id_seq', 1, false);
            acres       acres_admin    false    258            �
          0    302059    user_commission_editions 
   TABLE DATA               �   COPY acres.user_commission_editions (id, date_effet, completed, old_value, new_value, commission_setting_id, user_id, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    261   H      (           0    0    user_commission_editions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('acres.user_commission_editions_id_seq', 1, false);
            acres       acres_admin    false    260            �
          0    302073    users 
   TABLE DATA               z  COPY acres.users (id, full_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, status, receives_notifications, created_by, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
    acres       acres_admin    false    263   �H      )           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('acres.users_id_seq', 31, true);
            acres       acres_admin    false    262            �
          0    301440    accounts 
   TABLE DATA               c   COPY public.accounts (id, company, subdomain, status, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    183   R      *           0    0    accounts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.accounts_id_seq', 1, true);
            public       acres_admin    false    182            �
          0    301452    app_configs 
   TABLE DATA               [   COPY public.app_configs (id, name, url, icon, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    185   ]R      +           0    0    app_configs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.app_configs_id_seq', 1, false);
            public       acres_admin    false    184            �
          0    301805    ar_internal_metadata 
   TABLE DATA               R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       acres_admin    false    223   zR      �
          0    301464    bank_commission_editions 
   TABLE DATA               �   COPY public.bank_commission_editions (id, date_effet, completed, old_value, new_value, bank_id, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    187   �R      ,           0    0    bank_commission_editions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.bank_commission_editions_id_seq', 1, false);
            public       acres_admin    false    186            �
          0    301478    banks 
   TABLE DATA               �   COPY public.banks (id, name, description, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, phone, address, slug, user_id, created_at, updated_at, number_of_remaining_days) FROM stdin;
    public       acres_admin    false    189   �R      -           0    0    banks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banks_id_seq', 1, false);
            public       acres_admin    false    188            �
          0    301495    commission_settings 
   TABLE DATA               �   COPY public.commission_settings (id, commission_percentage, hypoplus_commission_percentage, first_installment, number_of_dates, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    191   S      .           0    0    commission_settings_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.commission_settings_id_seq', 1, false);
            public       acres_admin    false    190            �
          0    301511    commissions 
   TABLE DATA               �  COPY public.commissions (id, credit_id, production_date, acte_date, customer_id, notary_name, bank_name, contributor_name, producer_name, company_name, contributor_commission_percentage, contributor_commission, producer_commission_percentage, producer_commission, bank_commission_percentage, bank_commission, company_commission_percentage, company_commission, amount_credit, total_amount, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    193   "S      /           0    0    commissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.commissions_id_seq', 1, false);
            public       acres_admin    false    192            �
          0    301533 	   companies 
   TABLE DATA               �   COPY public.companies (id, name, address, city, country, phone, slug, brand_file_name, brand_content_type, brand_file_size, brand_updated_at, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    195   ?S      0           0    0    companies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companies_id_seq', 1, false);
            public       acres_admin    false    194            �
          0    301545    config_options 
   TABLE DATA               �   COPY public.config_options (id, app_name, admin_name, admin_email, admin_password, admin_role, created_at, updated_at) FROM stdin;
    public       acres_admin    false    197   \S      1           0    0    config_options_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.config_options_id_seq', 1, false);
            public       acres_admin    false    196            �
          0    301557    credit_details 
   TABLE DATA               �   COPY public.credit_details (id, installment_payment, installment_date, commission, cumulative_amount, paid_by_bank, paid_to_contributor_or_producer, "creditUid", credit_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    199   yS      2           0    0    credit_details_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.credit_details_id_seq', 1, false);
            public       acres_admin    false    198            �
          0    301573    credits 
   TABLE DATA               j  COPY public.credits (id, credit_id, production_date, acte_date, customer_id, bank_id, amount, bank_name, customer_name, producer_id, producer_name, contributor_id, contributor_name, notary_name, hypoplus, total_commission_bank, total_commission_producer, total_commission_contributor, total_commission_company, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    201   �S      3           0    0    credits_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.credits_id_seq', 1, false);
            public       acres_admin    false    200            �
          0    301585 	   customers 
   TABLE DATA               �   COPY public.customers (id, gender, address, city, country, phone, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at, full_name) FROM stdin;
    public       acres_admin    false    203   �S      4           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
            public       acres_admin    false    202            �
          0    301597    friendly_id_slugs 
   TABLE DATA               f   COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
    public       acres_admin    false    205   �S      5           0    0    friendly_id_slugs_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);
            public       acres_admin    false    204            �
          0    301612    logs 
   TABLE DATA               n   COPY public.logs (id, file_name, no_record, error, status, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    207   �S      6           0    0    logs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.logs_id_seq', 1, false);
            public       acres_admin    false    206            �
          0    301624    mail_configurations 
   TABLE DATA               �   COPY public.mail_configurations (id, host, user_name, password, domain, address, port, authentication, enable_starttls_auto, ssl, slug, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    209   
T      7           0    0    mail_configurations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.mail_configurations_id_seq', 1, false);
            public       acres_admin    false    208            �
          0    301636    notaries 
   TABLE DATA               i   COPY public.notaries (id, full_name, address, phone, email, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    211   'T      8           0    0    notaries_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.notaries_id_seq', 1, false);
            public       acres_admin    false    210            �
          0    301648    profiles 
   TABLE DATA               �   COPY public.profiles (id, first_name, last_name, phone, address, slug, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    213   DT      9           0    0    profiles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);
            public       acres_admin    false    212            �
          0    301660    roles 
   TABLE DATA               A   COPY public.roles (id, name, created_at, updated_at) FROM stdin;
    public       acres_admin    false    215   aT      :           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
            public       acres_admin    false    214            �
          0    301797    schema_migrations 
   TABLE DATA               4   COPY public.schema_migrations (version) FROM stdin;
    public       acres_admin    false    222   �T      �
          0    301671    super_admin_configs 
   TABLE DATA               a   COPY public.super_admin_configs (id, login, email, password, created_at, updated_at) FROM stdin;
    public       acres_admin    false    217   yU      ;           0    0    super_admin_configs_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.super_admin_configs_id_seq', 1, false);
            public       acres_admin    false    216            �
          0    301682    user_commission_editions 
   TABLE DATA               �   COPY public.user_commission_editions (id, date_effet, completed, old_value, new_value, commission_setting_id, user_id, created_at, updated_at) FROM stdin;
    public       acres_admin    false    219   �U      <           0    0    user_commission_editions_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.user_commission_editions_id_seq', 1, false);
            public       acres_admin    false    218            �
          0    301696    users 
   TABLE DATA               {  COPY public.users (id, full_name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, status, receives_notifications, created_by, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
    public       acres_admin    false    221   �U      =           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
            public       acres_admin    false    220            �	           2606    301825    accounts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.accounts DROP CONSTRAINT accounts_pkey;
       acres         acres_admin    false    225    225            �	           2606    301837    app_configs_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY acres.app_configs
    ADD CONSTRAINT app_configs_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY acres.app_configs DROP CONSTRAINT app_configs_pkey;
       acres         acres_admin    false    227    227            �	           2606    302189    ar_internal_metadata_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY acres.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 W   ALTER TABLE ONLY acres.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       acres         acres_admin    false    265    265            �	           2606    301850    bank_commission_editions_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT bank_commission_editions_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT bank_commission_editions_pkey;
       acres         acres_admin    false    229    229            �	           2606    301868 
   banks_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.banks DROP CONSTRAINT banks_pkey;
       acres         acres_admin    false    231    231            �	           2606    301884    commission_settings_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.commission_settings
    ADD CONSTRAINT commission_settings_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.commission_settings DROP CONSTRAINT commission_settings_pkey;
       acres         acres_admin    false    233    233            �	           2606    301906    commissions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY acres.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY acres.commissions DROP CONSTRAINT commissions_pkey;
       acres         acres_admin    false    235    235            �	           2606    301918    companies_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY acres.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY acres.companies DROP CONSTRAINT companies_pkey;
       acres         acres_admin    false    237    237            �	           2606    301931    config_options_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY acres.config_options
    ADD CONSTRAINT config_options_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY acres.config_options DROP CONSTRAINT config_options_pkey;
       acres         acres_admin    false    239    239            �	           2606    301946    credit_details_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY acres.credit_details
    ADD CONSTRAINT credit_details_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY acres.credit_details DROP CONSTRAINT credit_details_pkey;
       acres         acres_admin    false    241    241            �	           2606    301958    credits_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY acres.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY acres.credits DROP CONSTRAINT credits_pkey;
       acres         acres_admin    false    243    243            �	           2606    301970    customers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY acres.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY acres.customers DROP CONSTRAINT customers_pkey;
       acres         acres_admin    false    245    245            �	           2606    301982    friendly_id_slugs_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY acres.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY acres.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       acres         acres_admin    false    247    247            �	           2606    301997 	   logs_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY acres.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY acres.logs DROP CONSTRAINT logs_pkey;
       acres         acres_admin    false    249    249            �	           2606    302009    mail_configurations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.mail_configurations
    ADD CONSTRAINT mail_configurations_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.mail_configurations DROP CONSTRAINT mail_configurations_pkey;
       acres         acres_admin    false    251    251            �	           2606    302021    notaries_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.notaries
    ADD CONSTRAINT notaries_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.notaries DROP CONSTRAINT notaries_pkey;
       acres         acres_admin    false    253    253            �	           2606    302033    profiles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acres.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY acres.profiles DROP CONSTRAINT profiles_pkey;
       acres         acres_admin    false    255    255            �	           2606    302045 
   roles_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.roles DROP CONSTRAINT roles_pkey;
       acres         acres_admin    false    257    257            �	           2606    302181    schema_migrations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY acres.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 Q   ALTER TABLE ONLY acres.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       acres         acres_admin    false    264    264            �	           2606    302056    super_admin_configs_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY acres.super_admin_configs
    ADD CONSTRAINT super_admin_configs_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY acres.super_admin_configs DROP CONSTRAINT super_admin_configs_pkey;
       acres         acres_admin    false    259    259            �	           2606    302068    user_commission_editions_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT user_commission_editions_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT user_commission_editions_pkey;
       acres         acres_admin    false    261    261            �	           2606    302086 
   users_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY acres.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY acres.users DROP CONSTRAINT users_pkey;
       acres         acres_admin    false    263    263            y	           2606    301448    accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         acres_admin    false    183    183            |	           2606    301460    app_configs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.app_configs
    ADD CONSTRAINT app_configs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.app_configs DROP CONSTRAINT app_configs_pkey;
       public         acres_admin    false    185    185            �	           2606    301812    ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         acres_admin    false    223    223            	           2606    301473    bank_commission_editions_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT bank_commission_editions_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT bank_commission_editions_pkey;
       public         acres_admin    false    187    187            �	           2606    301491 
   banks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_pkey;
       public         acres_admin    false    189    189            �	           2606    301507    commission_settings_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.commission_settings
    ADD CONSTRAINT commission_settings_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.commission_settings DROP CONSTRAINT commission_settings_pkey;
       public         acres_admin    false    191    191            �	           2606    301529    commissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.commissions DROP CONSTRAINT commissions_pkey;
       public         acres_admin    false    193    193            �	           2606    301541    companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public         acres_admin    false    195    195            �	           2606    301554    config_options_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.config_options
    ADD CONSTRAINT config_options_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.config_options DROP CONSTRAINT config_options_pkey;
       public         acres_admin    false    197    197            �	           2606    301569    credit_details_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.credit_details
    ADD CONSTRAINT credit_details_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.credit_details DROP CONSTRAINT credit_details_pkey;
       public         acres_admin    false    199    199            �	           2606    301581    credits_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.credits DROP CONSTRAINT credits_pkey;
       public         acres_admin    false    201    201            �	           2606    301593    customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public         acres_admin    false    203    203            �	           2606    301605    friendly_id_slugs_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.friendly_id_slugs DROP CONSTRAINT friendly_id_slugs_pkey;
       public         acres_admin    false    205    205            �	           2606    301620 	   logs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public         acres_admin    false    207    207            �	           2606    301632    mail_configurations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mail_configurations
    ADD CONSTRAINT mail_configurations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.mail_configurations DROP CONSTRAINT mail_configurations_pkey;
       public         acres_admin    false    209    209            �	           2606    301644    notaries_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.notaries
    ADD CONSTRAINT notaries_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.notaries DROP CONSTRAINT notaries_pkey;
       public         acres_admin    false    211    211            �	           2606    301656    profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public         acres_admin    false    213    213            �	           2606    301668 
   roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         acres_admin    false    215    215            �	           2606    301804    schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         acres_admin    false    222    222            �	           2606    301679    super_admin_configs_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.super_admin_configs
    ADD CONSTRAINT super_admin_configs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.super_admin_configs DROP CONSTRAINT super_admin_configs_pkey;
       public         acres_admin    false    217    217            �	           2606    301691    user_commission_editions_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT user_commission_editions_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT user_commission_editions_pkey;
       public         acres_admin    false    219    219            �	           2606    301709 
   users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         acres_admin    false    221    221            �	           1259    301826    index_accounts_on_user_id    INDEX     P   CREATE INDEX index_accounts_on_user_id ON acres.accounts USING btree (user_id);
 ,   DROP INDEX acres.index_accounts_on_user_id;
       acres         acres_admin    false    225            �	           1259    301838    index_app_configs_on_user_id    INDEX     ]   CREATE UNIQUE INDEX index_app_configs_on_user_id ON acres.app_configs USING btree (user_id);
 /   DROP INDEX acres.index_app_configs_on_user_id;
       acres         acres_admin    false    227            �	           1259    301851 )   index_bank_commission_editions_on_bank_id    INDEX     p   CREATE INDEX index_bank_commission_editions_on_bank_id ON acres.bank_commission_editions USING btree (bank_id);
 <   DROP INDEX acres.index_bank_commission_editions_on_bank_id;
       acres         acres_admin    false    229            �	           1259    301852 )   index_bank_commission_editions_on_user_id    INDEX     p   CREATE INDEX index_bank_commission_editions_on_user_id ON acres.bank_commission_editions USING btree (user_id);
 <   DROP INDEX acres.index_bank_commission_editions_on_user_id;
       acres         acres_admin    false    229            �	           1259    301869    index_banks_on_user_id    INDEX     J   CREATE INDEX index_banks_on_user_id ON acres.banks USING btree (user_id);
 )   DROP INDEX acres.index_banks_on_user_id;
       acres         acres_admin    false    231            �	           1259    301885 $   index_commission_settings_on_user_id    INDEX     m   CREATE UNIQUE INDEX index_commission_settings_on_user_id ON acres.commission_settings USING btree (user_id);
 7   DROP INDEX acres.index_commission_settings_on_user_id;
       acres         acres_admin    false    233            �	           1259    301907    index_commissions_on_user_id    INDEX     V   CREATE INDEX index_commissions_on_user_id ON acres.commissions USING btree (user_id);
 /   DROP INDEX acres.index_commissions_on_user_id;
       acres         acres_admin    false    235            �	           1259    301919    index_companies_on_user_id    INDEX     Y   CREATE UNIQUE INDEX index_companies_on_user_id ON acres.companies USING btree (user_id);
 -   DROP INDEX acres.index_companies_on_user_id;
       acres         acres_admin    false    237            �	           1259    301947 !   index_credit_details_on_credit_id    INDEX     `   CREATE INDEX index_credit_details_on_credit_id ON acres.credit_details USING btree (credit_id);
 4   DROP INDEX acres.index_credit_details_on_credit_id;
       acres         acres_admin    false    241            �	           1259    301959    index_credits_on_user_id    INDEX     N   CREATE INDEX index_credits_on_user_id ON acres.credits USING btree (user_id);
 +   DROP INDEX acres.index_credits_on_user_id;
       acres         acres_admin    false    243            �	           1259    301971    index_customers_on_user_id    INDEX     R   CREATE INDEX index_customers_on_user_id ON acres.customers USING btree (user_id);
 -   DROP INDEX acres.index_customers_on_user_id;
       acres         acres_admin    false    245            �	           1259    301984 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX        CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON acres.friendly_id_slugs USING btree (slug, sluggable_type);
 E   DROP INDEX acres.index_friendly_id_slugs_on_slug_and_sluggable_type;
       acres         acres_admin    false    247    247            �	           1259    301983 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON acres.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 O   DROP INDEX acres.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       acres         acres_admin    false    247    247    247            �	           1259    301985 '   index_friendly_id_slugs_on_sluggable_id    INDEX     l   CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON acres.friendly_id_slugs USING btree (sluggable_id);
 :   DROP INDEX acres.index_friendly_id_slugs_on_sluggable_id;
       acres         acres_admin    false    247            �	           1259    301986 )   index_friendly_id_slugs_on_sluggable_type    INDEX     p   CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON acres.friendly_id_slugs USING btree (sluggable_type);
 <   DROP INDEX acres.index_friendly_id_slugs_on_sluggable_type;
       acres         acres_admin    false    247            �	           1259    301998    index_logs_on_user_id    INDEX     H   CREATE INDEX index_logs_on_user_id ON acres.logs USING btree (user_id);
 (   DROP INDEX acres.index_logs_on_user_id;
       acres         acres_admin    false    249            �	           1259    302010 $   index_mail_configurations_on_user_id    INDEX     m   CREATE UNIQUE INDEX index_mail_configurations_on_user_id ON acres.mail_configurations USING btree (user_id);
 7   DROP INDEX acres.index_mail_configurations_on_user_id;
       acres         acres_admin    false    251            �	           1259    302022    index_notaries_on_user_id    INDEX     P   CREATE INDEX index_notaries_on_user_id ON acres.notaries USING btree (user_id);
 ,   DROP INDEX acres.index_notaries_on_user_id;
       acres         acres_admin    false    253            �	           1259    302034    index_profiles_on_user_id    INDEX     W   CREATE UNIQUE INDEX index_profiles_on_user_id ON acres.profiles USING btree (user_id);
 ,   DROP INDEX acres.index_profiles_on_user_id;
       acres         acres_admin    false    255            �	           1259    302069 7   index_user_commission_editions_on_commission_setting_id    INDEX     �   CREATE INDEX index_user_commission_editions_on_commission_setting_id ON acres.user_commission_editions USING btree (commission_setting_id);
 J   DROP INDEX acres.index_user_commission_editions_on_commission_setting_id;
       acres         acres_admin    false    261            �	           1259    302070 )   index_user_commission_editions_on_user_id    INDEX     p   CREATE INDEX index_user_commission_editions_on_user_id ON acres.user_commission_editions USING btree (user_id);
 <   DROP INDEX acres.index_user_commission_editions_on_user_id;
       acres         acres_admin    false    261            �	           1259    302087    index_users_on_email    INDEX     M   CREATE UNIQUE INDEX index_users_on_email ON acres.users USING btree (email);
 '   DROP INDEX acres.index_users_on_email;
       acres         acres_admin    false    263            �	           1259    302088 #   index_users_on_reset_password_token    INDEX     k   CREATE UNIQUE INDEX index_users_on_reset_password_token ON acres.users USING btree (reset_password_token);
 6   DROP INDEX acres.index_users_on_reset_password_token;
       acres         acres_admin    false    263            z	           1259    301449    index_accounts_on_user_id    INDEX     Q   CREATE INDEX index_accounts_on_user_id ON public.accounts USING btree (user_id);
 -   DROP INDEX public.index_accounts_on_user_id;
       public         acres_admin    false    183            }	           1259    301461    index_app_configs_on_user_id    INDEX     ^   CREATE UNIQUE INDEX index_app_configs_on_user_id ON public.app_configs USING btree (user_id);
 0   DROP INDEX public.index_app_configs_on_user_id;
       public         acres_admin    false    185            �	           1259    301474 )   index_bank_commission_editions_on_bank_id    INDEX     q   CREATE INDEX index_bank_commission_editions_on_bank_id ON public.bank_commission_editions USING btree (bank_id);
 =   DROP INDEX public.index_bank_commission_editions_on_bank_id;
       public         acres_admin    false    187            �	           1259    301475 )   index_bank_commission_editions_on_user_id    INDEX     q   CREATE INDEX index_bank_commission_editions_on_user_id ON public.bank_commission_editions USING btree (user_id);
 =   DROP INDEX public.index_bank_commission_editions_on_user_id;
       public         acres_admin    false    187            �	           1259    301492    index_banks_on_user_id    INDEX     K   CREATE INDEX index_banks_on_user_id ON public.banks USING btree (user_id);
 *   DROP INDEX public.index_banks_on_user_id;
       public         acres_admin    false    189            �	           1259    301508 $   index_commission_settings_on_user_id    INDEX     n   CREATE UNIQUE INDEX index_commission_settings_on_user_id ON public.commission_settings USING btree (user_id);
 8   DROP INDEX public.index_commission_settings_on_user_id;
       public         acres_admin    false    191            �	           1259    301530    index_commissions_on_user_id    INDEX     W   CREATE INDEX index_commissions_on_user_id ON public.commissions USING btree (user_id);
 0   DROP INDEX public.index_commissions_on_user_id;
       public         acres_admin    false    193            �	           1259    301542    index_companies_on_user_id    INDEX     Z   CREATE UNIQUE INDEX index_companies_on_user_id ON public.companies USING btree (user_id);
 .   DROP INDEX public.index_companies_on_user_id;
       public         acres_admin    false    195            �	           1259    301570 !   index_credit_details_on_credit_id    INDEX     a   CREATE INDEX index_credit_details_on_credit_id ON public.credit_details USING btree (credit_id);
 5   DROP INDEX public.index_credit_details_on_credit_id;
       public         acres_admin    false    199            �	           1259    301582    index_credits_on_user_id    INDEX     O   CREATE INDEX index_credits_on_user_id ON public.credits USING btree (user_id);
 ,   DROP INDEX public.index_credits_on_user_id;
       public         acres_admin    false    201            �	           1259    301594    index_customers_on_user_id    INDEX     S   CREATE INDEX index_customers_on_user_id ON public.customers USING btree (user_id);
 .   DROP INDEX public.index_customers_on_user_id;
       public         acres_admin    false    203            �	           1259    301607 2   index_friendly_id_slugs_on_slug_and_sluggable_type    INDEX     �   CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);
 F   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type;
       public         acres_admin    false    205    205            �	           1259    301606 <   index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope    INDEX     �   CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);
 P   DROP INDEX public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
       public         acres_admin    false    205    205    205            �	           1259    301608 '   index_friendly_id_slugs_on_sluggable_id    INDEX     m   CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);
 ;   DROP INDEX public.index_friendly_id_slugs_on_sluggable_id;
       public         acres_admin    false    205            �	           1259    301609 )   index_friendly_id_slugs_on_sluggable_type    INDEX     q   CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);
 =   DROP INDEX public.index_friendly_id_slugs_on_sluggable_type;
       public         acres_admin    false    205            �	           1259    301621    index_logs_on_user_id    INDEX     I   CREATE INDEX index_logs_on_user_id ON public.logs USING btree (user_id);
 )   DROP INDEX public.index_logs_on_user_id;
       public         acres_admin    false    207            �	           1259    301633 $   index_mail_configurations_on_user_id    INDEX     n   CREATE UNIQUE INDEX index_mail_configurations_on_user_id ON public.mail_configurations USING btree (user_id);
 8   DROP INDEX public.index_mail_configurations_on_user_id;
       public         acres_admin    false    209            �	           1259    301645    index_notaries_on_user_id    INDEX     Q   CREATE INDEX index_notaries_on_user_id ON public.notaries USING btree (user_id);
 -   DROP INDEX public.index_notaries_on_user_id;
       public         acres_admin    false    211            �	           1259    301657    index_profiles_on_user_id    INDEX     X   CREATE UNIQUE INDEX index_profiles_on_user_id ON public.profiles USING btree (user_id);
 -   DROP INDEX public.index_profiles_on_user_id;
       public         acres_admin    false    213            �	           1259    301692 7   index_user_commission_editions_on_commission_setting_id    INDEX     �   CREATE INDEX index_user_commission_editions_on_commission_setting_id ON public.user_commission_editions USING btree (commission_setting_id);
 K   DROP INDEX public.index_user_commission_editions_on_commission_setting_id;
       public         acres_admin    false    219            �	           1259    301693 )   index_user_commission_editions_on_user_id    INDEX     q   CREATE INDEX index_user_commission_editions_on_user_id ON public.user_commission_editions USING btree (user_id);
 =   DROP INDEX public.index_user_commission_editions_on_user_id;
       public         acres_admin    false    219            �	           1259    301710    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public         acres_admin    false    221            �	           1259    301711 #   index_users_on_reset_password_token    INDEX     l   CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public         acres_admin    false    221            
           2606    302119    fk_rails_1cc89d251d    FK CONSTRAINT     |   ALTER TABLE ONLY acres.commissions
    ADD CONSTRAINT fk_rails_1cc89d251d FOREIGN KEY (user_id) REFERENCES acres.users(id);
 H   ALTER TABLE ONLY acres.commissions DROP CONSTRAINT fk_rails_1cc89d251d;
       acres       acres_admin    false    263    2553    235            
           2606    302129    fk_rails_2c2a63743f    FK CONSTRAINT     �   ALTER TABLE ONLY acres.credit_details
    ADD CONSTRAINT fk_rails_2c2a63743f FOREIGN KEY (credit_id) REFERENCES acres.credits(id);
 K   ALTER TABLE ONLY acres.credit_details DROP CONSTRAINT fk_rails_2c2a63743f;
       acres       acres_admin    false    241    243    2519            
           2606    302149    fk_rails_2f5753a5dd    FK CONSTRAINT     �   ALTER TABLE ONLY acres.mail_configurations
    ADD CONSTRAINT fk_rails_2f5753a5dd FOREIGN KEY (user_id) REFERENCES acres.users(id);
 P   ALTER TABLE ONLY acres.mail_configurations DROP CONSTRAINT fk_rails_2f5753a5dd;
       acres       acres_admin    false    251    2553    263            
           2606    302169    fk_rails_36e1c960d7    FK CONSTRAINT     �   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT fk_rails_36e1c960d7 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 U   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT fk_rails_36e1c960d7;
       acres       acres_admin    false    2553    261    263            
           2606    302109    fk_rails_465b63d453    FK CONSTRAINT     v   ALTER TABLE ONLY acres.banks
    ADD CONSTRAINT fk_rails_465b63d453 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 B   ALTER TABLE ONLY acres.banks DROP CONSTRAINT fk_rails_465b63d453;
       acres       acres_admin    false    263    231    2553            
           2606    302164    fk_rails_5eff3e81e7    FK CONSTRAINT     �   ALTER TABLE ONLY acres.user_commission_editions
    ADD CONSTRAINT fk_rails_5eff3e81e7 FOREIGN KEY (commission_setting_id) REFERENCES acres.commission_settings(id);
 U   ALTER TABLE ONLY acres.user_commission_editions DROP CONSTRAINT fk_rails_5eff3e81e7;
       acres       acres_admin    false    261    2505    233            
           2606    302094    fk_rails_7835cd6bc7    FK CONSTRAINT     |   ALTER TABLE ONLY acres.app_configs
    ADD CONSTRAINT fk_rails_7835cd6bc7 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 H   ALTER TABLE ONLY acres.app_configs DROP CONSTRAINT fk_rails_7835cd6bc7;
       acres       acres_admin    false    2553    227    263            
           2606    302154    fk_rails_8c64c61308    FK CONSTRAINT     y   ALTER TABLE ONLY acres.notaries
    ADD CONSTRAINT fk_rails_8c64c61308 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.notaries DROP CONSTRAINT fk_rails_8c64c61308;
       acres       acres_admin    false    2553    263    253            
           2606    302144    fk_rails_8fc980bf44    FK CONSTRAINT     u   ALTER TABLE ONLY acres.logs
    ADD CONSTRAINT fk_rails_8fc980bf44 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 A   ALTER TABLE ONLY acres.logs DROP CONSTRAINT fk_rails_8fc980bf44;
       acres       acres_admin    false    263    249    2553            
           2606    302134    fk_rails_9001739776    FK CONSTRAINT     x   ALTER TABLE ONLY acres.credits
    ADD CONSTRAINT fk_rails_9001739776 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 D   ALTER TABLE ONLY acres.credits DROP CONSTRAINT fk_rails_9001739776;
       acres       acres_admin    false    243    263    2553            
           2606    302139    fk_rails_9917eeaf5d    FK CONSTRAINT     z   ALTER TABLE ONLY acres.customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES acres.users(id);
 F   ALTER TABLE ONLY acres.customers DROP CONSTRAINT fk_rails_9917eeaf5d;
       acres       acres_admin    false    245    2553    263            
           2606    302089    fk_rails_b1e30bebc8    FK CONSTRAINT     y   ALTER TABLE ONLY acres.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.accounts DROP CONSTRAINT fk_rails_b1e30bebc8;
       acres       acres_admin    false    2553    263    225            
           2606    302114    fk_rails_c901e64655    FK CONSTRAINT     �   ALTER TABLE ONLY acres.commission_settings
    ADD CONSTRAINT fk_rails_c901e64655 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 P   ALTER TABLE ONLY acres.commission_settings DROP CONSTRAINT fk_rails_c901e64655;
       acres       acres_admin    false    233    2553    263            
           2606    302104    fk_rails_ce41058218    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT fk_rails_ce41058218 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 U   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT fk_rails_ce41058218;
       acres       acres_admin    false    229    2553    263            
           2606    302159    fk_rails_e424190865    FK CONSTRAINT     y   ALTER TABLE ONLY acres.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 E   ALTER TABLE ONLY acres.profiles DROP CONSTRAINT fk_rails_e424190865;
       acres       acres_admin    false    263    255    2553            
           2606    302124    fk_rails_e57cb42012    FK CONSTRAINT     z   ALTER TABLE ONLY acres.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES acres.users(id);
 F   ALTER TABLE ONLY acres.companies DROP CONSTRAINT fk_rails_e57cb42012;
       acres       acres_admin    false    2553    237    263            
           2606    302099    fk_rails_f1ee247f8f    FK CONSTRAINT     �   ALTER TABLE ONLY acres.bank_commission_editions
    ADD CONSTRAINT fk_rails_f1ee247f8f FOREIGN KEY (bank_id) REFERENCES acres.banks(id);
 U   ALTER TABLE ONLY acres.bank_commission_editions DROP CONSTRAINT fk_rails_f1ee247f8f;
       acres       acres_admin    false    229    231    2502            
           2606    301742    fk_rails_1cc89d251d    FK CONSTRAINT     ~   ALTER TABLE ONLY public.commissions
    ADD CONSTRAINT fk_rails_1cc89d251d FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.commissions DROP CONSTRAINT fk_rails_1cc89d251d;
       public       acres_admin    false    193    2486    221            
           2606    301752    fk_rails_2c2a63743f    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_details
    ADD CONSTRAINT fk_rails_2c2a63743f FOREIGN KEY (credit_id) REFERENCES public.credits(id);
 L   ALTER TABLE ONLY public.credit_details DROP CONSTRAINT fk_rails_2c2a63743f;
       public       acres_admin    false    2452    199    201            

           2606    301772    fk_rails_2f5753a5dd    FK CONSTRAINT     �   ALTER TABLE ONLY public.mail_configurations
    ADD CONSTRAINT fk_rails_2f5753a5dd FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.mail_configurations DROP CONSTRAINT fk_rails_2f5753a5dd;
       public       acres_admin    false    209    221    2486            
           2606    301792    fk_rails_36e1c960d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT fk_rails_36e1c960d7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT fk_rails_36e1c960d7;
       public       acres_admin    false    221    2486    219            
           2606    301732    fk_rails_465b63d453    FK CONSTRAINT     x   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT fk_rails_465b63d453 FOREIGN KEY (user_id) REFERENCES public.users(id);
 C   ALTER TABLE ONLY public.banks DROP CONSTRAINT fk_rails_465b63d453;
       public       acres_admin    false    221    189    2486            
           2606    301787    fk_rails_5eff3e81e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_commission_editions
    ADD CONSTRAINT fk_rails_5eff3e81e7 FOREIGN KEY (commission_setting_id) REFERENCES public.commission_settings(id);
 V   ALTER TABLE ONLY public.user_commission_editions DROP CONSTRAINT fk_rails_5eff3e81e7;
       public       acres_admin    false    219    2438    191            �	           2606    301717    fk_rails_7835cd6bc7    FK CONSTRAINT     ~   ALTER TABLE ONLY public.app_configs
    ADD CONSTRAINT fk_rails_7835cd6bc7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.app_configs DROP CONSTRAINT fk_rails_7835cd6bc7;
       public       acres_admin    false    221    185    2486            
           2606    301777    fk_rails_8c64c61308    FK CONSTRAINT     {   ALTER TABLE ONLY public.notaries
    ADD CONSTRAINT fk_rails_8c64c61308 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.notaries DROP CONSTRAINT fk_rails_8c64c61308;
       public       acres_admin    false    2486    221    211            	
           2606    301767    fk_rails_8fc980bf44    FK CONSTRAINT     w   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT fk_rails_8fc980bf44 FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.logs DROP CONSTRAINT fk_rails_8fc980bf44;
       public       acres_admin    false    221    2486    207            
           2606    301757    fk_rails_9001739776    FK CONSTRAINT     z   ALTER TABLE ONLY public.credits
    ADD CONSTRAINT fk_rails_9001739776 FOREIGN KEY (user_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.credits DROP CONSTRAINT fk_rails_9001739776;
       public       acres_admin    false    221    201    2486            
           2606    301762    fk_rails_9917eeaf5d    FK CONSTRAINT     |   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT fk_rails_9917eeaf5d;
       public       acres_admin    false    221    203    2486            �	           2606    301712    fk_rails_b1e30bebc8    FK CONSTRAINT     {   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_rails_b1e30bebc8 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.accounts DROP CONSTRAINT fk_rails_b1e30bebc8;
       public       acres_admin    false    2486    221    183            
           2606    301737    fk_rails_c901e64655    FK CONSTRAINT     �   ALTER TABLE ONLY public.commission_settings
    ADD CONSTRAINT fk_rails_c901e64655 FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.commission_settings DROP CONSTRAINT fk_rails_c901e64655;
       public       acres_admin    false    2486    191    221            
           2606    301727    fk_rails_ce41058218    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT fk_rails_ce41058218 FOREIGN KEY (user_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT fk_rails_ce41058218;
       public       acres_admin    false    2486    187    221            
           2606    301782    fk_rails_e424190865    FK CONSTRAINT     {   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.profiles DROP CONSTRAINT fk_rails_e424190865;
       public       acres_admin    false    221    2486    213            
           2606    301747    fk_rails_e57cb42012    FK CONSTRAINT     |   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.companies DROP CONSTRAINT fk_rails_e57cb42012;
       public       acres_admin    false    221    2486    195             
           2606    301722    fk_rails_f1ee247f8f    FK CONSTRAINT     �   ALTER TABLE ONLY public.bank_commission_editions
    ADD CONSTRAINT fk_rails_f1ee247f8f FOREIGN KEY (bank_id) REFERENCES public.banks(id);
 V   ALTER TABLE ONLY public.bank_commission_editions DROP CONSTRAINT fk_rails_f1ee247f8f;
       public       acres_admin    false    2435    189    187            �
      x������ � �      �
      x������ � �      �
   A   x�K�+�,���M�+�,(�O)M.����420��50�54V0��22�20ӳ05246�#����� ���      �
   d   x�����0k{
�e;v3dؿ�4���/�9��m���-䅇8((K$�$y�X�W�.������Pd3+��)V�!�k��ndV#,�6B��4      �
     x���Aj�0EףS�3#�%egL��.�qLHR��P=G/V�.i��އ�����N���}ۜO�^~��v����iJf�a�fƤ�%3�PXF�K��F�Y�Go�B%�����jSv��N�s&�B�@~����Ǳ^��1J����rP��C9+�m�����e�/��t��k�^�J�"T�2Oŗ��$x3S��m�x/�7�ˉ�@1+Jü���9uY��f|���w�6���0�ڄ��.ak�����      �
   �  x����mAE�Mi �����HL,��Ѡ��<�Κ���?�z_?}q~�~Q>E��+aNy�@�����[� Ц�aA3�Y��F0����Aw��[�8l��F���[-G1�
W�n���T�G茪� ��\��͵�x#Ȯ�iGN�C�Fm*Wr8zrj5�F�fm*W�:Wc�b7��x��]U��F��y\�?�r�U��s���D�a\��F��}\觴N6��q>��jL�&yq6�(��*HJY�v�N@)ֿ�:}�;�(�f�9S�Hg����a�x���t�a�x!G����@:O����z���t�q�+�Ț����t�a�;>4�86xA ��R560y\=��@:��d��y��� ������<)Η����g�c      �
      x��]�R[Ƕ}��
��'t�~ɛ ����I�
Uva�O������cg��z���qd�`������r��a��`�1y�u�R	5�Z�����������ݷ��?��^>�=�_�>�vw�|�Z~|�~�Hhx�|$�_���33�$�5p�o��1~�����������[�韴�p��f�O�?"������������������r���ax�\g��o�p8iğƳ���x�8�x�������?��?��Gk#��Ó �?��*�q�(LHb2��(���ɰNK�a�@Jk`��0���|:��f���2[NV]Ia��B�*q�FJx�M��ß����I��K^:��?��<Y�Ğ�G�e�����LkU�G����ش�i�rܖ��ͺ9�7ڄ���2����͔��q����HؤW�+o���H��N��4��p+pLV�1�#�ڗ�H�*�-����l7�ʖE(��@�ʊ�n5l3�q �g>���ﳒz��L�g�jO�1�-��<І�N�� �!�7ʍD.�=]z�T䰄�e�g��R5`aTΚ|��!F����rƘ�A1�(T],�.���~OE�r:9^�?�����������b<�M.& +d��^J	��Ɔ� `DV��!�m6)V�wx����b<��m��6���R�Q9�\��̈�V��En9V����8I�����sd�Ԣ��d.�W��l��tINJ�rLIN@@Q$Sve�|n1W�������b�������q�#@ʄyS����@pe��b�8�8I�v��0��5c��6���AY�\6D�t�VÜM�ϧ���o��B�P'�=�4���@�(���JR\�b����I�$��E@��gyF��V>�O�&f�Pv`I^�x������o�K��{�w@�2_^2�ҙ�$X/�a���//'�
�#��p�	�*.w,�A�{	�;�ni�M
a�R!�7k�	�i�����Gbt��c�u���3%̑���J�20]Ʃ|�d
�D�u9��,f�+�{�������A�׾̷3p{�gFjBc�qea�poR�0Uo6���Ϝ��M�����T�*<>y���jO灑�d�p�&B&��xζ�
�h���_���X�����������O��ۧ�������,�����w*����wq��7ɫ�JpZ}Z�t�)�
ζ3Z�<Y����l���Sˇ��O?���߆����~5)b��,{@��.9W��������B�:\WB���};_��C����_���'G�T� ̺�E����p{u��|��I�p\{^ނJ�����)��4���t�?���y�3s�c�V���Z\�� ,��P�}Yo�kf0K.���㛫i�h%������v��j�뜬� ,2d6�퓊1ybFb@Xj�	�u�Q�x�2�+�ǶM�\L�f�پ�_<����������dwX�[.�'���ɬ�䏟����@������R��"T�{Qu��֙��E�Ti����Gm���/��*{#t�R���;4'2��G�HVҠ���4"�]�N<_��P���\�$���O �ˬ����C�L>AI5v��b��Xv�����1h���W��Cx�֪�v�a�D�&����.��ɝ�� гf���� 5#;��KQK�x?��Mfg��>z�9<�b��>�}q��&�&�#άr��pB�π��%N<����S�wZ^J�	a�� �gÜ�̧���lY��,EJ�6��S;ȸ0Y�����Kצ�_k�9x�����X��UЪ���Y��m��j�	�g���V����Z�Z)��� �1�W�BQ���+�JNHc�<��I�p���"�`~$��=O@�����%֖)>�˿��iH��bB���kP�v�k\���W-/�)�Bz]1�"�I76#��D�sa�Mȑ@
�)�:��a|&-�#pج�30�?!G6& #'a���"%�Fֵ�9x�Ǜ�1P<���IV<B�)X�,�n�4L7��n����*U��/�U�IռU*S�����P˂\�ܫI���V�崣*D���Z� ���9D� `���6�RK��\�9�N�*Ǧ0`�3�َ�A�D�	��*ŭUe*j0H��dW��F�n�|�z'r')�ue'E8��EΩ��cPq�R� ��w�,����6.�X��S����WHHU�%�LE��^s<�<鉾��T��ku9E�A@)8�>����/�����R�# ���#� ;)�,'bֶ�z�_��gF�!qXB/9ZzY�v0���;��Y.P���[6I����_y
��+�.�L�S��qp���L��n��o���0���l0�#�����\z��D6ߏ�Zo����VF����1�R�+5��;��3�ӎ�f���V-zTI�޼̴[����Cdr>ɋ�i�g�>�*���9�i�#N�zt*�rMʢ��уڭ'��S����9��@�TD8\�V���c�-;C�3+�}�������t�Ul���ʖ!�3�,z����5-_��m�������0�}ٕ�д�f.��0��7��ϓmg��n�(�J�D�憽d��᪳��V��5Ba0d����mRm�z~u2��R�3��P��`���L�g��f�Vc������ßw��/����>-	Af�����r ��&'��q�?��̖����b|~t>9���� �Z)�D����ֲ23^	�q־�==RUQ��ϗ\��E���M�yvh/��w���h��*U�j dL(�2�Y�P
�~�JR�s�b_��xr~:ٷs������7e�!��5e���[-u�x��wʅ���c��U	�¶�e�T2�;$��ܭ��);�A��j�u������_��{��P�2���e�P��E����p^lu���T�|�3��-NO�����f�R��$����5`��p(}d݉�o��s;��*�漲�ID(��S�B%$=7�����
�Y�j0P����V���d��Ş��Aa�\	v�`�\�xc�w�jZJ�SP�)0d��y�JHI�Ux�?��[GA@ֿY�zL�T&6@�g&��7�;b�E��kq��$r,vC�GA�6���}uG,�6�dK$#��4F�Q���X+/�>��sy�֝Y|4h�R�d��U�@
�Ma,���	X��\�L�N`�W0��H(����Du�z�1�%>�/E�tv-A�G$(F�MQJ�g�!х����Pq��tG��hk$�6u�O��K��)B�*TB��V������roseDI�%(��UX6Q��ٔ�;�Dz��A�Uf*@��g4�32>e�:#C�c"�d���"Ă��%�m��1�K8��eg�^m��,Ƌ�d�T�^I�0��D�t�D� *��d.WWSlr�;\����*���6�r[T�Gv�뭎����d�����Hce9��$X<t ��sw'*���AYg���5��\l���p��35"�¶Z�g]G���/ϷOO��������ݿ���e�;U��6*�H�2	*s���d������T��>ѠJ1��mx�|z|��
I�]�)%A@0Ȓq٤o�|��v��>��A�B`��+�����{v
�i����*����"���:Ԉp���w� )���bv�Ͳ2�FsY�3Ԉpv�0�]7�����)��,1Ҕ���p�St�I	jD8+lmr8V)Ɩ�����|ϛf�ɋ:Qo/T�D�;��%r��R�5A�O�����Ď�9"�OVJn�ȕA&�N����|�Q�
p��UP�Nf��H�����x�T�$eY[p'��:B@5(F�s���D0l��a|5??@�^���T��F�;�
4��iZS+m#	acYH"<�@�P}�cFɵ��`������.^��FQI�D�E���Y݉�6�?@�>��p	p��ϯrY�ȫ�����S�:|�W��R=�ԡ}�X�3+O �  R��Rt;W̦�޺_�uM&��4��xFhņY��ri��s2āA|6�R�Ҷ5"��-����l��^JΒ^���WTB����+g�yK����;�m-� G�jr���o.Ɩ+W��j�H�p`�JU�U����ECaR���	�=�9��*E�������/�Ωv�r6��J(Ag����3@�S�)1��
�#�`)���-��o�I�
�\�W�`���90%��>�*]Q2F������h�t\{�ʗY�O�5��bI���Je�EL�At�O�Ꝑ ſ�L'�>�SPNǫd�i"A�ԿS�H	l�e�[4��p887-�MӲm�QO����Ӽ��;Hmݗ�xwatV�;X���CGJ֋b����m8��s�;߰��уgz/J�F&�R�"[�T\�O��R )��t�Y���
�����,f0��t2���3��3���*^:���ku!q��۽���?�PI�kۤ���H�����0�"�?¸��8�Ł=�x�x���ъpW{�}��Նo���A/�����Þ!���]����$7(}/���>F:�#u�,�b,������ϳ�#�{/���I#-D��Ε�0�R�M�2�cw� ��8�T���ǖr_�&G`�T��X_���p���*7��<}��Law�nPI0��Ĵ~8؀�ņ�jd8x������$]m��B��$-�Z��o'8����sׇ��&�I?HJ[��%A@*�*_Q��DE��|9��3K�f3i��|-T��k�\���F^$/ix:��d�=.�%Xaj,��pL��Y����ܖ�A�1�֚����mRq��ii��&-���(�SL�Y-Ƴ�}KPT��R-+��'���(��.�r��|)6��*54M��(Kx��f���$U��<>�LN~���#�B��ј���	jd8U��8�[6V;����)ǊE�~������o+�9�A5�\ZR-�`��� �h���� G�i�
���ډ��Ѹ��=��H�߃L����7�A@Ҽ=IOy`�r��&&B�1x�6��j/>�Z��4:U��6A@ѽ1E*�4�u�lb"��p6��~�eo�O'�����d�eL�f�"@18�]�q��EX�S��� &���~�P����,�y��m$ ��c�q,1���-��(��e�xob�N �Xq�[oO�LΘU̕>�)A��1
f�F��u�=�Ӌۇߟ�=�;�����u�~A�(�'F�_:������0[i_��C��Px�J���P��i� �<'��˛���;4�>�h%G�"�Mw'΂f^������x�-K.��y�!z8~��M ^ۂnJp�-������t�C�0��w��>��mދ�;�<�$�a���L����4�� .n�_o�=>���=>��\=�߇̪2˔��C#D���^j�T�!A�#���8Z��Kv��ܘ:@�����^?�����2j�����nM      �
   b   x�3�tL.J-��v�qtr�Sp�r�tr�u����u�����62267017446�L���C #N#CK]C]CcK+##+s=CKs3<R\1z\\\ w��      �
      x������ � �      �
      x������ � �      �
      x�ŝ�z�6�������\Q�8 玒h���ɤ_oh��9��%e����}���^ � �l�d>O�z}U~��1���e>��>➏<�?R���u"� ���,Lgë~���^t_��]����(?�w��uwM��xO��,z��˿%T!���?1�g�{�����bH!s�>2�Ǉ�G!��y�=g�"�^�6��6K��{w����J�&�x֟�nnݛl��C�}9\��ɛx�p��J�c�"Vc��� ����Ӟ�:k���Mf�	�Yl�P��K`�+��MlQ/E�<��ަ��"������)�L���h�hN0�D@I����!'%A���<����>[{�����_�|N���8�O'��1|��"���O�5��vS�T��,�N���� ���F�S��0���d	_\/S�M�����cࡠZ���;���R��.[�6��|���lp�|�Lj�V�R��j�z�ڦ`���2CsO���1�7�h����_�Yr~A�B2S��6���e��O��7�ڬwͧ���p ��Rԑb�K?RͫV�a�i����Do��7��di�����l����ys����;ܠ�!� � �<$G7���"�M޾T���_8��t�6��!e��)�K?�(�EJ�ק���P*��I��XZfm,p庱oi�XC����ϊ]�~>(��%��x:i���B��D@Lq`c�6�z�	�������n��ՇM��L����@���D0
�����&��Y疉�œh6�;�'��l޼�W	{q��r����ӎ�i��#��fݷ�/۝7K7��-�A�=&��v�/���ӗ洂����hٕ�@�	&�G�KGr�~���7��(��]&��:�4ג�h�&���q\����^�Hx�� ���H��P�JiH/�`L�5z:j-��o��*O����ʏ"DT��@)�A�j	���%��ʲ�FLr�Y^��AZ<n�-�*I?x��x���|�u���1d��Ns�zC�%-��ދ�6�T ���|��u�ow�i���O�ow�ϛU�Q�H0W��E0*�k5Gu�bՑf��د����zp_�Y�4�|y�4i{�v%mZ���
����kE
�!l���:�������@��/�t1ꮲmw�>l�F�d2m���@ԙi�C�b!�qϯ�X=턚Is�o������-E��RP�X�� �7+��*{�1�CZ|�9-�q��|�x��C2qF�PN8DgQMxZ�Z򬃟�fw����V�����"�JQCR9Rg�� ��`��7�
�P�S�n�R�*��X}�A��	�6E�[�%{uA���K �+���~k���F�:��T��������l��b���nVڱ��~�D�VC�a#V��W����Ւ
�{���(T�\G���O�{Of���(!E�Ixk� S��000�����Y[�7ޯs>M��c�Zሢ%���uf�` ����!2��U�ʹ�7�2�k�ĵ
�Q9O�JȐB�tA��J7m�;J(�E���5g�l��d9B��f�Y���e�of��u2j�(��^��!]#C�RAY���PՁ��g2�2���L�Q2o�,���d�(�*ACLN�{-�`a�oZ�*��5:ʧ�������M��?ťf�!`B��E��a8k��n�x4�������׆�#k^�� ؏��5�^�J��*�1 RkQ`!ni�,;g+o�~���V�Â�T �!U����MP�*����yxnR�Pe�ɰ�US�Il�̧���λSs�ɵ�G�Ă3f�ud(�iA��Ki�Tmb��F�h��^�A8yR� �S�:���Pf���sa�A
)l����ZM�0��Q4�{�]4�̨����n�"@�j^q5���z�#'b�$�`�_�ׇ�d�̢��~fپQ:^�1NO7QG�J����
%�CA��x9I�7�.�Ϛ��k��xr���]i�+H����utU�n�ԇi!�UO৳�/=�p�,�t"�� �H���Z�:	��e��[��a�c슯�e����"ҥ���8��&�.��I4�K]�O��6Ȑ);�#-d�f50ԡ*wKTj���~�e����[G3�Vm	/�rZ�BM-�������!�Ԏ�����)��g���� �cvR�0D@�����kRq���T�*�OWY�>���Tn���W)���qq�����j��0�~�����G)z��M��w�*#abl��"�e��߾�~���^C���1b	s�@�fV|6���z�h�l>��x��yJ�z����֓!x���|��fIy-�a�}�,�c��Ys���}�� ��m�t:�����E�܎���bO��|n[���ۃ�"�rr,4aƉ�k�3]Dwӷ-R���[�;P�#�9+aZ����М}�.1z	ZQ��W"{ ���C�͑��.�._sV&]��*�gl����lγ���8��f�﷐$�v�Z�5PO��3���"�8 s����w掽_C#P~2~���\��D�7q2��e�J�E�~\�͕���-,z�H/�:��j$�x��UV7�ga�^��mVxjq����z	`�/��u�+��aK�Ch���95/E�[n&��7T��k��P�k�#o��;�Al�K" #���Dy2*È" SNPp����,m�)�����:�?l֍��	�k�h�)b��N���94]��gO��\[�������=s��ߋ���1宨M�:2m�Ёi��z�u1밣r��N��j�{��v�9x�#�������Ak�*��TW����P뮛��?�� kY�r���$�
V������`�iK�Y��t��t�;�ƛ}�����mJQ鑨���F�X%�HU"ߚu���<�V΄������i��+B(��9d�� �����)}�d�$���; ��%->܈�Pwxi@
1�ӡk JG�}� [+U�M�t��?��c�$8kWv�E I����Z�vr���l-�S��Kd� ��\i�H7i],0I����?�A��ӓ�R.dݴ���v��Q�gʺ��v�e��f�浊4��(E��X��7GQ}���	�+C3D�3y�"��
�Nid�X]8��Y)�~���F�Ql֏.��/��F����#���:R� T�@��%2h��7\>'��o*E�*��1�� }�p<�������a��	��?�7DL�s���~��5�E�ݥ�1~ת�s��I���b�K" G����u�s�ㅅ��5J?l�;������[d��|�D� 8w�.��
��*�nl�+��z���:�c�Q
����CY�m�����]>Dz�a7�5�"~H�ImX��,em3����!]{���c^��}?Z���7����O�(*@X�r�Z�� �}7p��چt�q����Ϧ7��UB��./6��>��*�[�	�*�����Ȱ4G�E�+�O�+o$;�]��8_7�;I���;K�Z��'�_��P��ߵ8�k�B�Ū�=d(x�nbO���@��x4l�&��3~I����ql(o���������g2��r|���P���f�B����$q�Z�O��[p�,^�˫w���,uۄRԑ�T
f*EX+E�έ}�E4�O�&��(�[��OQ�t�� �-��E0 �l ��.�y���}��b�W�ژ���Ֆ�E-�n��.�L�͕'�+�-��6�S�nk%g�(W^��H�����ʙ����b�(m
f��*)���U��" Uϸ��誓��R�cH���C�45ʴ��F.��" V���.[-��"kgNΰ�Y��?fm�F[l�#���`�!|���St���q����u��3y
9i|Ҟt����J�f1^��Zf�:"oW��b����͇�V�5pw�$0����7p�E�E�.�����|�p������]����ꚅ�F�9�Z���:n�3��Ӏ: �  ������m�\髲��u� 9>�&����Mʭ���wIG��̲-E�����\�B��S0��,.>��;���2iZۡ=��/vʴ�T5�bs"���3y8������ޢH��W(�^Ȗ=�@�09=�h� 4�"`�Cc�L��7n"XjӅw�|sة��R�Q����KP�-=aN�>���q��
��:��ˊ�i��O�l�z���QgH�E@����e5���������_�tމ�j�	�ԭ������1rg��	�_T�b��r�d{��e�N���+ #7})��r��`�;�m٩~��Pl�Go��;ۯ_F����JQ�����ê&g��?���O��l���^A`�:4�U�J7ʐ�G`�T����(��ٝ���yُ~�U��9�!2O/�1D �r��^n� ����.+ �d��)�q��n�]A�80B�.� ��v�%0bg��E�V�*d�U;���зL՝<�b�I}���m��]L�oF�کE �2;&�tݴ �]���t����ǧ��%�����p�RZ�*����2�f��8�݃���sX�k���'�����:��hy3Z���!�'d�`D-�U��5{��n�Zl֏پ�F�}�ʶ;g�I{P���>/P�����9֖����iԽK&��7�7o5��m���)h�d���Ս-���\���1$y�q|��iSx����Q�[Y�Gpu�����7��T���&���49��/��f�2[ƣQsW�c��,E N��#3)��8�ǟ�ȕd��C�֕��#�,�$H!���R�8c�Vۥ �	9�"KQG^nB�2����:��P?��=��l�Ə�|0��-Nֈ!�����·�E �|� ��畕��KLL7��d)қ$�x�io���� D����"�J�2gZT3]�G}�#u/۴��\��l�'[����������*��/�f4J�0��͟�u4�����,;��Z����>:��,���q��7-ztE`bCCʣy�p�⯎P��.=�x�8��w闦�&wp"�-�#5���a�Q����:϶�K������$��t��My�akJG����do�}a��íC��	��q}�!T��j�{Ґ"�j��ٟ��yU��I�}cp���u�ݥE��8JwqZ���0֚k}�ܷ�� -���n!aɜ�|�ZA����E@[�?����������Q�1�y���"��#-��hA}�C�0��֥߾��w���s�Ԁ�W�$�A�yA�ʟ�%���W[)�a罼�ػS�19��h?�̇���JQG���PԽ�&��(1��^�jϽx������Ts֮�	P<�QG��Q0s�6U_���`o�w�b���m���Y����̙ǠD0 � |k� �q��� ��A4ZΧ��g�r7�[������u��pEԭ�&������ZF��B�>�s���M8�6_������(�k�R&����v�ȵ�Ft���ѝ��"��E֬�����n���ڪ���_��G�qU����՛Z�]պhu��U�F����E-Nֈ��Ĕ�(q窥0���BO�J��
�%y�f���������x�q��YZ��ʣn���Zg�FT+i�i:�y�L�y<��Ѩ����o��<����:�=j l6 �C�� .�֢Q7��^��7�2վ�;y.�"����E���c�0�p]#0��о�m:�N��=����y�K� ^����i6�Ql����"/r�6�n���߀d4tnKk@J/���v+���fŇ4_���A�����/�R(�g�$J���&��7r}m����x�M��d>O�Q�X,m�%�+Ƌ���˫���]�d׊��U9�"$������7 4�N�S�Se����8��m��t���n����W�]�cQ��;��"�V�P��ئ�V����D핚�R:���"`���ƵU�>�qo�h@+�H|Cǫ�3�Y�^ݨ����G^w�\_��v���H�Tȓ�D0��� �c��uB�3�u��wE jhOե����y�)}��6��WJ�9�X��]1
s���أ0�S�:�w�ë>����L`�Q-\�#RS)pPMh��1�VĴ|�#g�0����L�\��;�GD��#D�f_-�q��Q�������#^zS6�yY��a�Z��qw8���!y/8�k����C���,�h��t1�Mt����Lǉ��r��h4��a�u���D���Buڔ����^�f�` ʇRfĬ�3�K	�_?Zx�h�2S��E�A�%�pǆJԥ�&5�������x4����O��6�Ӕ���--B.��Ά���C�w{
����X��<{���y�U
�ٶ���u�0 fݶ��r��}'�|����Ѳ��9rǃ7M��s�K�:D]#6x�����e���C��.���<�AґﵽH˾#,X���B,E��(3�y�.f��Un�	�=����,���T�[*�����r�̴}��'�.��n��<z�h����Upg��R��2�C�m���L���>\�k��,�vo�� �dx8k��>f�U��w�"�g�������D\��Cԥ3���s�?�w�����D~Ӝ,�	����V��;���LD�$���#��z�W���xl^@��nVY��f����qS�Ď:��3��-U-���" �'��w%��߸j�~9��q�v��|�Yw������S�o��$zH0����"@UN�sR�ps;܆R�g�qt}��������Y^ѓo�p�-�u���d7*>��+�W��:����#=�#�w)�A��"8Y�d���ލ�^w �A���}̺����M��"Jv��3#�p��"�r�����JCkg~�=����?/�0�@z�3�D �$'�uܞ����j������E� ��j�$@�ܟ�m��3/�"�b�M�Qt����!��-�Z�����t���p      �
      x��\�r��ֽ><�^�)hh��-�� {�:7X&6r���Η�ȋ}���T���詌'5�jm��޻Y���'���aä�0�i�������Q�R�ģYda��(bE��B���א��xsǒ ��y�,ST��ϳ�͙f)��������'���eSӽݳdl�Y.�
�(3	%�܂���^nk�Q���6-�Ŝ ��5[&��\�X�E=��)���m�B�`�	�5O)�cZ҅���ٟ^��Y1q������7�i&��g��(�a��l���=����B`K7�²�9B���@1�8<�H3M�@��R���k�}��S���*Ra�c{�yb�GK7!��M����"�N�a�C��z����+�z��4SE+,�����V����5SE,��2}!�by�0�g▩��&�]���Pfa:[���Њ,�f�HPRˠ��=B��?k��6� �.1eKm�|�ia��T��%��NPP�����w(k����Z�H��[�b�l9�PP�5{� px�-(i������iX%�mݶ�i�Tf��J���,!t$*�t�:D��#׻�=��PIz['5����Y��):�-հJ�ۺc�����}�<U�KY=�T���R߁�jȗ�	��&��l�,c��Ւ�5�oBQ��U��?V�{��,_d'(߾�_���Z�{Ġ6������3G�&`9���%>t���u�۵�f�e>��)�>G�������D70�*�!�,W<b��k�J����A�#@���A����Sռ�oP�-��'PA,ג�;A9��Y�f��$�����D������P5\�J�j�CnBe����lY���UWvO5d���D��M�kn�ઠ���TT��LL*�0B�u�,j Zֻ��Y*Z�� ��TmFhYCPu�����B(vd�?B_��l�n��3/r6>�M���"�(Ŏ+[r#��
�k��8��:�%+�#�y
���8�g�4aF(��$��1�@�����*" |����ٟ�y��ds��B�V�$ؖ����#f��,�V�W�_ד!H�����O-�����n4[%�]�� ��X'H����P���i�����&��LF�޽��Uw�Fh�� ������ܕQ�W'&���RN�b�׈J�	����	�oRhc�Jֻ0	TV/��~"R�l�q�" ������e��[�.���!�,�Gȯˮ�q�E*f��A���+zV"�4F����^#j��aj��v�X��4	�<��*�hD-�=����aJ�Z�~�����!Y��~�F�r;A��y�_�~�iD-�)u*ϘU�f����_O���E�$��c��������8*��F��B	�9�b+5��|�w\sT��=4=[v�F�S�X�|k��jW�jA�=�@m�UOm����p��#��g�$=n�����'�}ەG:As,�Q�Y�fk��B�9*���Vz�)rG�Es��V�� �َ�;��p�"��`zrTt��&���Fc��0
�"E���Q���%�fFh!6L�L��Xr���{�h��P;�#m�Fh�n�t�Z�X�c�UQ
�5��t��M.�z�*2@u��ԓ-��¥��84⍔� P�ņ#�r��ݳ|6��ϥ��=�O�"���Ri==Q��a\wUd��cR=����\[6Ц�"�( ��4&��F(�!�P�"�s�W**@�ҍ�wd�?Bs��j@�-�;Gh����@��,e�݀�R�3g�)����:4ߕ���:h�B��iۦ��:C���졆�F��Ȱ�9���nW�a�����5OA�,G�g*K��:LV<��ي'Y���h���=�<e z�m,{y��j�R�~�k�� �c��#)g��7�m��o�k�dA��2��r��p���Ј��5Or�S��sM���:A�y}���?�.g��)h���%=���m̍C{
:!�ܘ��t�"� (I#���&1,��E<�p��y��8E�pkTE,L�$�!�58Ca,��"���U�S�6��a�P�
�ĊE<�jNU��\Ǔ�N�!����B�*�`��I�?gh��2��1OЊs��b��"@�bY4"�e3+^�jW5US�m˺��W�c��B���_0x?�U��v/��;As(~�FU��Q�,+}#��w���A�{�����[�"&��E>x,'h�B�ͳ��Q�7���	��X�8C>�bo�^�<���PS�t�F�3$�XG�(B�f�x{�$�SS�H��G��0�!��`譈!�P�P\�]W5{�?���k!��,`�Ğ'�.��{a2(i�	�Y�T4�66<C��#$FIS�<F�ᡱ���P�!U��G(�veSA]�:�<���a?Q�!�N\�9���k��(�s'�� ��������C(� >ǲ?
u����|�P��{�Ñ� Wu�7�.�Ӌ8*&C �дI����̔@E�Ņ�|����+��uu�O_7ME,ݰ\S��#��YVճ�mU׊b��oby�X��ĠȲ�{��u�K7w!{3_X� ��4 ��m�&�(�'��J��������\-�<J��f���mf�!�q�Pt����xl]�M(���4�Y)�tL2��3�E��
��U����>x�'��e���м�a8�5S�n(�5m�� u��E�Կ��$��󐸺��x%)�gh^���G(A�j���\צ�7�g(k���*�@R��V;KA��CM!�͓34/!��"�@���J��+�]��4����`�����&�����4o����z�Q�"%���^����Ϡ'��k�B��胊!Q0Rӑ��gHxĚ��+<V�!U��@��ؑ�ΐ��ZC%W1&
j�F�ɷ/}���;>�T�#�k�R��bw��Ѕ����-Qpy�����	��g�
OCŗH�nx�'{�z�ʮ�A�Uw����mSQ񾉘��3�������׶{uP�'
Jj�E���jYp<�|��ܿ�x*Aul�g��rѿ�(+�����]Q�QUe�b�r财���}��p�!�*FE���z7��[���r����Tԁ�6���L�Fh]uUݕ3:�v/V��NP���*�})��|DL�y�4SŻd�tL�����y�|H.1T<����Tv:���Q���^�?�&������"\DR�m1݀�ɫ^�^l��;���ǘ�4�%�Yf�P��.P�8:a�x%����`Q4���&��Jw��Pܿ�]��z�KM<��D��'���k��Q�� �da��0���..�w�>�e�Leӭ���r�t	��,�_��F�/� s�����&���%4���B�C���Ɓ�6�uݐ_B�P�!��N��ⶅ���2��x$&�~S{	��(�q��O��G!�K�m�#1<����X�~��]���'>�G����!M�N������ *5Y+>j���ͫ�����C���C��<��ز�+����"+Pģ4� �d�8�y6������SյP��A��3�	��n`_�&_B!�����C4��ÌA0� Fh��b5B1�N�,�|�{8�9�A�1,�=���D[�}��m�&f�9r`�L��:A�B����W-�%$���!G	K��LwB\�A��}�KHl��j���凖�q�n�<rǻ޿����GݠOeܿ�n��l�X�g�.�e�� }�;!�$����_BAՕՓ�Q=T��vȁ���y튽�Ζ4g���Iq��X�Z��|��@j2�`�#��<Ak�BA�O͜�<R��'-D#�N�NNwA<.&X��#���	[�쌹8�cNwD	=ûދ��|qt�!���0kN�Dt���'�/����0�s��zp����jb@)�x�/��m�KFqM*:�u0�z���0���2�9�� P�ޝKH|{?�0�y$��}=1_B���;�C%�%�"Xǎi\o7\BY��g��-�tw�@g�w��w	-�ݶ.�"��"�< �  6�l=�PP��v�A�D����lL%����0<��.�t?�ǳ��"�$�A����aLw?d�2%�/��l�߿�_�}Km��H'��
=B�HA-��a�K��=������I<5��T��/e����EM\I�7�.���J�Q|v��2�!X��HT~mhl@�����P�%����VU�X�3_�t�#�X:���.f���c�-���=�]�
�TT��m��k��%�`�dh���d�lM�;t�q��P��B��;�Ma��ǁ�!�6l#��2�q��EE	��K��3B�*M��M<�:���}�쾄V³����2I�'�T� �\*9�u	,�t2�A$I����nO���x�T���)H����Kh�����ǝP��n�#������<ϡ���t�#�غ�mÕE!?��1|ˆC  6Gf(����8֬���Ɓ���v#$^���ĿC�́`* �KG�w��܋�*�/����&�i�`*:`�ز<��1�� o �� u�-�����J��:���S^��x��w�_q����^XW�tW��3�mRȒE�#Zm>/��<��8���YH�s���,�U�\V;俔߇�����#�C$��.���/�Q���Ɓ���!-7#�(c��n�t�����8A�r��k�'UW}wl��q�s�VH7�FHT	3�7GE��JW�;�T�׶; �� ۲�Q��Z��J���q�!����WqF�(�����x���HG=S�i3B�����~;�&��͌����3��P�M�w�>�;�x/!�� �����}G"�L�8�W�ȏx̓b��=���3Bp�UWW�p(������#��Y�~����,�̡nO�4D���t���ޖ��:[��tS㑏���)X��9H!��8��8����8͆*%a��'A�tW�@g�,(-�#��4��nf<����jN��n:�"�H�#Z*}y9B~��߈嬢��������#$�M]�Ѹ͆�J˶�3B�xe����87�؉����n��'��G�u�5%Z�]'>E����l���V�K�/��8��a�� ��,8:��|}L�����ޛ�"
�f���%Գ�����mS��9��o0BA/�h=�(vP��{:S���$���sġ�Kg�2M��;��.v�� #���Tda�NE͛�d�\�r��GG(f>�69�t���q%G�/��`�\�_��7��8�z&Tky���8hQ~��쪟JM<���E������+�\�M�%6��D#$���?�D�^����āR��'�S��؝��'�o���F�s���ן,�@�i����t������%�졗�j�*��� M�,�c�6�#t_u_��0Z��^�q`�n]R�-Ò��!�k������k�����M      �
      x������ � �      �
   l   x�}�M
�@�ur�������9�'p[� ���_E׳~�@�g��a��

9�v�J��K;M#)�X� Ԧ��R������u��.<{ɝݛ�d���)1��j*      �
      x������ � �      �
   Y  x���Ko�8�ϜO���Z���6c��Õ�t���m4@�$�߾#9�0Cr��S�p�?d���y�~��S��Q���u�x�Y&$�FFp�yN�Xǘ��(��S�����ӔrA I��usW���A�H�Ϫ��S��R�
&"4Y�ٲ�}�R����M�ܭ���,,tD`�U�׋D(��riMh�&���ŪN�:w�wjB�(���nצۥ�Td�R�Mcd����c��۔�����'����
�Yk��!�����/>�גcF�&1�������B��㄀)��6]��-�I���	�t�N�iC�'9!`�,�v��]��~�9�����XeY��K��gB�n���9�[x��RE4t-'�b���]RJQ%�� ��,����SR�rNC�?!��������K\Lg3h0�&\�C6\{�&"Vg�IE�rG����b�b�QC���1�f�q=�q˂Q�J �UU,օ/�>q���,����u�ݦ��ɤ��C�E�̫yQ�D�5�ƺ�b�C���k?���f̮o���X1��[�G��s��֩Ӱ�`����@0R�~��?���B?a$� W�h�_��8�YJ:�	���P�M�<��:���~�|}S��U�L[����"�ܗ�T��̡:�	��d�ts̸I-%�
m��@�1|[�X��JP4<�N�ų,��]��[�S��,P&�+Wm��*���4�v��H�zMSR�t(^O��M��~�2Ε��vB��e7d5�0Ubh���;!���6�n{�2��}�+)Q
�+�+p��Z�PLL$� �_��Dp"�(�J|B 5�D1o��N�I9��i�ܗe�kRZ�q^�H@Z�����6G��S<,tD���m�k�OJʡ�6���(J�&
8�I���`)�v�)5af�Ș�Z�>pB�|�>)�8Lp����	��}<<?��B�S�t*��&J�EW��7%&�cBE�@)��,�S�!2ʩ��������m�2��Ԇ��	�2h���$>PYt�,��N��/���'�\�w<�lN�#���ϔ�N�*�	�F���>��}�g����/���n��l�������]�7�1<�Z�`�\�=���:�7̱P6;!��v�ϻm��=�Y��O �LU�ꨥ���b�hI���*�2���]��LWXu}�Ji1&�� �x�|�Em�q����"0�͛e����9���ׇ3z4<����*�|*;C��mzU
ka����y�t%�j��aV���0�V��SRFQg.�1���N`�`��,G؟\���R�������hn�l�<Fք cx��z�9�_f���;��5�r���Տ/�Ch,s�bJ1u����>ϻ]~K��x�zc�G�U*��E2up4�R�r�+c�+|H	6�X0�&�q�H\+�Y��eF��[(�ٍ��.{û�r.� '��M�V�'4�#1��ڄ�r<�]��Ve����wٱ�!���|�a�[�З��g�$W��)�J:c��3h�懗���k�8�+C/�[���ۼ[���'����kH~�������5Ԇ*݄�Z�+�ụ�x�Qfu0�&_2 �t�VP      �
      x������ � �      �
   [   x�3�tL����420��50�54V0��22�2��376555�#�e�P��R�\�ZZ�]�����)).cNǂ��"�&X��������� �l*P      �
   �   x�M��!���d����:�8�3k,��0�FZ���<x�2*����5��U<�'�j�p�e�Y��Ρ
6�S�T���`g�\��V��5n˹���#�G��%��܆�G�r��rگy[	-	�W��!�9ޯ1���>�      �
      x������ � �      �
      x������ � �      �
   d	  x���ٲ�����)�舾��dH��q`p �oRE�A�'�~�z�C�8{��T�������	C�a����~9D���Ƙ��(�3���G��'~� K�?��0���yzq4xy��:�Kv�NK�_��u���[Ka�LǇ��X�`h(}����h�+�|e/�¯$��n^�ïO�<D���O΄D�%Yb)[}m��s}��t��v9��"�s����߯
C��_���s�?^�(OF��qVW��)��c�+</�|&/��p�x��=���!�V�cQ��>�ø��6����AA����U��T��U^��{؊C|���=v`���w�h[Y<�w�v�֛�.�܎������38��i$�B"yBr\�p�i��U�	�܆�#�������hb��'౼�1�{gJ�%ZWH,n2O�KzN�A��3����H�FyT��,��}X�ְl��W����f`iޞ��"����!�0���zM�<,��F���rh]�31�gx	~ʛ)����FI�m�8�y����6˹UeK�3�q��;��ҿ�>��nM�U���mj�q�]OF[�1@bi~r�)��}�I��oH���q(�j�D0�D8��v�/��`�����,�J�"g�9��d BMMű�� ��*�a�)_q��EIh��S��K�W)���s�\��Ԙ+�ˍo.����chcwS1<�g�D^B,���4��8%rQTH�v��N�j1�kʞ���`���S��Ӭ]ϖ�檉���񥓀�����x�n˟W�����갧����gy���I�,c�~,}�m`+l�9�s�R��JK�%[��	#����N*:�ϰ�'}���
���{S�_�{�(���\���o����P��s��� Dt]�c>7�~A���QR/;�-;��g�(I,��گ�T�E����Qoq��4�VP�G' .����Ǖ
<��������.�n����6�58R�34H������BB��c|��+.:����{_G��$��t�u�/Z%����^���qzʧ���&��_�=q�	 �M�o�n^%�����ۿO��О>X��r�.����4!�w�f�x��n����<S-��wk��*���H"`X�GmH�	1�����{.~"�gL=�],�!�����n�,�U��d��� �����A~Z�ɬN�鉨;�h^���y�Ȧ�6��W�?�=o�s-B'�vm�Q9��=�itZ{w{1g'�oK >�U��G��B�-8�	EB�����۽���Y��t:�aڛ��Hin�*��?�*c���|b���:3o�U�Au����{��Ҁx�to	%�{t�(Ϫ. �=� �#���DG������t�f�18'�9��g���	�@�q�Z�����I$C�q����5�V~�Y$�mEZ\nν�T���˰*w�xT��ZI�]*�S3�E���e�O 1��b�b�*��R�C1m�z�t(��mϠr�j���zkV7I�%���e�m���J��[Y�ο���>���4�N���M?.�O´��b����e[g���hu�=n����+Y^����s�Ei���{�E�6���ۛD2,��V�1虲%뚩Yp~bH@)%^Bs+>�+�����I_�����f�Uu:{����X��Uw�ƒ����x^%��>�e�CL�-�z�������_�� ��*���N���J8y�>=��`>����}�i 9(5���D2��g�7�gO�i��{���y8��j�I3g]�t�Ҵ�#�)�y {�(9��>⑟�g��Z���N?�̻B2����]����TlϠ��
�q����&�ݪ���������.�Œ2��g	^n; �DV��D2�Ȯ)_M��(�>�g+�:��	c5���o�u�y�3�jvF�@v�<7�\���N��y�/�p��6�D2"1���Y�u�����jkų�f��g9�� wR�3���rZ���ꅩ�:6d+�ٛA��Ӛ�r@�x�5}^%��^1zv]��;�}6ؾ�vM�d�³M�x<+��kz��c3�̲�k�,(j���k��UV�ȫ��Rͤy �c��W�di�eg�{��)γ�K|��])����N}S)�M���È�U�1�S�aXy��\��C7��A_&�	,'}�p>H$	��%~Tdi/i>�,=�.;�ŷB�p\R,��-'ktC�=��u��n8Q�2}��3'��_9�(�b�D� ��y��A"!�x{����>~#i���C5��?A��~��bb�]���8�V��!cѹmɷ��p�up�`h���}�Br_!��J@�E�&�b�M<p��	\�G���qH���34K�H��o��      �
   =   x�3�ttr�LL.J-���4�420��50�54V0��22�20ѳ0���4�#����� ���      �
      x������ � �      �
   A   x�K�+�,���M�+�,(�O)M.����420��50�54V0��2��21�346706�#����� �=�      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
   i   x�}�=@0���S�@��3���j
2�? �~��0渥y=��88b�ZQ�8t�����@�����5/���wOi�@h��x���ޚ�T#�m�8�      �
   �   x�M��!���d����:�8�3k,��0�FZ���<x�2*����5��U<�'�j�p�e�Y��Ρ
6�S�T���`g�\��V��5n˹���#�G��%��܆�G�r��rگy[	-	�W��!�9ޯ1���>�      �
      x������ � �      �
      x������ � �      �
   �   x�3��M�KLO-��C �Xj^bRN*gH,"搞�������˩b��bh�bT����b�W�en�������h��j��T�cTn^��Sb��jQ����ː����R��P��X��������B������������"�0���YX[�0���ܒ+F��� ��@\     