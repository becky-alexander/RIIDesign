--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO lhbweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO lhbweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO lhbweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO lhbweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO lhbweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO lhbweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO lhbweb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO lhbweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO lhbweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO lhbweb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO lhbweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO lhbweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: city_metrics_city; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_city (
    id integer NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE public.city_metrics_city OWNER TO lhbweb;

--
-- Name: city_metrics_city_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_city_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_city_id_seq OWNED BY city_metrics_city.id;


--
-- Name: city_metrics_cost; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_cost (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    energy_associated_costs numeric(16,4) NOT NULL,
    water_associated_costs numeric(16,4) NOT NULL,
    travel_associated_costs numeric(16,4) NOT NULL,
    waste_associated_costs numeric(16,4) NOT NULL,
    wn_energy_associated_costs numeric(16,4) NOT NULL,
    energy_type_electricity numeric(16,4) NOT NULL,
    energy_type_natural_gas numeric(16,4) NOT NULL,
    energy_type_other numeric(16,4) NOT NULL,
    wn_energy_type_electricity numeric(16,4) NOT NULL,
    wn_energy_type_natural_gas numeric(16,4) NOT NULL,
    wn_energy_type_other numeric(16,4) NOT NULL,
    energy_use_residential numeric(16,4) NOT NULL,
    energy_use_com_ind numeric(16,4) NOT NULL,
    wn_energy_use_residential numeric(16,4) NOT NULL,
    wn_energy_use_com_ind numeric(16,4) NOT NULL,
    water_use_residential numeric(16,4) NOT NULL,
    water_use_com_ind numeric(16,4) NOT NULL,
    waste_method_recycled numeric(16,4) NOT NULL,
    waste_method_landfilled numeric(16,4) NOT NULL,
    waste_method_incinerated numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_cost OWNER TO lhbweb;

--
-- Name: city_metrics_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_cost_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_cost_id_seq OWNED BY city_metrics_cost.id;


--
-- Name: city_metrics_demographicdata; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_demographicdata (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    population numeric(16,4) NOT NULL,
    jobs numeric(16,4) NOT NULL,
    households numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_demographicdata OWNER TO lhbweb;

--
-- Name: city_metrics_demographicdata_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_demographicdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_demographicdata_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_demographicdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_demographicdata_id_seq OWNED BY city_metrics_demographicdata.id;


--
-- Name: city_metrics_emissions; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_emissions (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    energy_associated_emissions numeric(16,4) NOT NULL,
    water_associated_emissions numeric(16,4) NOT NULL,
    travel_associated_emissions numeric(16,4) NOT NULL,
    waste_associated_emissions numeric(16,4) NOT NULL,
    wn_energy_associated_emissions numeric(16,4) NOT NULL,
    wn_water_associated_emissions numeric(16,4) NOT NULL,
    wn_travel_associated_emissions numeric(16,4) NOT NULL,
    wn_waste_associated_emissions numeric(16,4) NOT NULL,
    energy_type_electricity numeric(16,4) NOT NULL,
    wn_energy_type_electricity numeric(16,4) NOT NULL,
    energy_type_natural_gas numeric(16,4) NOT NULL,
    wn_energy_type_natural_gas numeric(16,4) NOT NULL,
    energy_type_other numeric(16,4) NOT NULL,
    wn_energy_type_other numeric(16,4) NOT NULL,
    energy_use_residential numeric(16,4) NOT NULL,
    wn_energy_use_residential numeric(16,4) NOT NULL,
    energy_use_com_ind numeric(16,4) NOT NULL,
    wn_energy_use_com_ind numeric(16,4) NOT NULL,
    waste_method_recycled numeric(16,4) NOT NULL,
    waste_method_landfilled numeric(16,4) NOT NULL,
    waste_method_incinerated numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_emissions OWNER TO lhbweb;

--
-- Name: city_metrics_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_emissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_emissions_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_emissions_id_seq OWNED BY city_metrics_emissions.id;


--
-- Name: city_metrics_energy; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_energy (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    electricity numeric(16,4) NOT NULL,
    natural_gas numeric(16,4) NOT NULL,
    other numeric(16,4) NOT NULL,
    wn_electricity numeric(16,4) NOT NULL,
    wn_natural_gas numeric(16,4) NOT NULL,
    wn_other numeric(16,4) NOT NULL,
    total_res_energy numeric(16,4) NOT NULL,
    total_com_ind_energy numeric(16,4) NOT NULL,
    wn_total_res_energy numeric(16,4) NOT NULL,
    wn_total_com_ind_energy numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_energy OWNER TO lhbweb;

--
-- Name: city_metrics_energy_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_energy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_energy_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_energy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_energy_id_seq OWNED BY city_metrics_energy.id;


--
-- Name: city_metrics_specialtrendline; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_specialtrendline (
    id integer NOT NULL,
    type character varying(100) NOT NULL,
    chart character varying(100) NOT NULL,
    year character varying(4) NOT NULL,
    no_normalize numeric(16,4) NOT NULL,
    capita_normalize numeric(16,4) NOT NULL,
    household_normalize numeric(16,4) NOT NULL,
    employment_normalize numeric(16,4) NOT NULL,
    weather_normalize numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_specialtrendline OWNER TO lhbweb;

--
-- Name: city_metrics_specialtrendline_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_specialtrendline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_specialtrendline_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_specialtrendline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_specialtrendline_id_seq OWNED BY city_metrics_specialtrendline.id;


--
-- Name: city_metrics_travel; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_travel (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    total_vmt numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_travel OWNER TO lhbweb;

--
-- Name: city_metrics_travel_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_travel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_travel_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_travel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_travel_id_seq OWNED BY city_metrics_travel.id;


--
-- Name: city_metrics_waste; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_waste (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    recycled numeric(16,4) NOT NULL,
    landfilled numeric(16,4) NOT NULL,
    incinerated numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_waste OWNER TO lhbweb;

--
-- Name: city_metrics_waste_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_waste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_waste_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_waste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_waste_id_seq OWNED BY city_metrics_waste.id;


--
-- Name: city_metrics_water; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE city_metrics_water (
    id integer NOT NULL,
    city_id integer NOT NULL,
    year character varying(4) NOT NULL,
    total_res_water numeric(16,4) NOT NULL,
    total_com_ind_water numeric(16,4) NOT NULL
);


ALTER TABLE public.city_metrics_water OWNER TO lhbweb;

--
-- Name: city_metrics_water_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE city_metrics_water_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_metrics_water_id_seq OWNER TO lhbweb;

--
-- Name: city_metrics_water_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE city_metrics_water_id_seq OWNED BY city_metrics_water.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO lhbweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO lhbweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO lhbweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO lhbweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO lhbweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO lhbweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE public.django_redirect OWNER TO lhbweb;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_redirect_id_seq OWNER TO lhbweb;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO lhbweb;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO lhbweb;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO lhbweb;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO lhbweb;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO lhbweb;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    type smallint NOT NULL,
    CONSTRAINT reversion_version_type_check CHECK ((type >= 0))
);


ALTER TABLE public.reversion_version OWNER TO lhbweb;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO lhbweb;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: site_content_headerlink; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE site_content_headerlink (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    direct_url character varying(200),
    web_page_id integer,
    display_order integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.site_content_headerlink OWNER TO lhbweb;

--
-- Name: site_content_headerlink_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE site_content_headerlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_headerlink_id_seq OWNER TO lhbweb;

--
-- Name: site_content_headerlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE site_content_headerlink_id_seq OWNED BY site_content_headerlink.id;


--
-- Name: site_content_headersublink; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE site_content_headersublink (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    header_link_id integer NOT NULL,
    direct_url character varying(200),
    web_page_id integer,
    display_order integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.site_content_headersublink OWNER TO lhbweb;

--
-- Name: site_content_headersublink_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE site_content_headersublink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_headersublink_id_seq OWNER TO lhbweb;

--
-- Name: site_content_headersublink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE site_content_headersublink_id_seq OWNED BY site_content_headersublink.id;


--
-- Name: site_content_homepage_section; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE site_content_homepage_section (
    id integer NOT NULL,
    sect_type character varying(20) NOT NULL,
    billboard_image character varying(200),
    graph_image character varying(200),
    graph_copy text
);


ALTER TABLE public.site_content_homepage_section OWNER TO lhbweb;

--
-- Name: site_content_homepage_section_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE site_content_homepage_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_homepage_section_id_seq OWNER TO lhbweb;

--
-- Name: site_content_homepage_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE site_content_homepage_section_id_seq OWNED BY site_content_homepage_section.id;


--
-- Name: site_content_inpagelink; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE site_content_inpagelink (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    title_detail character varying(50),
    bubble character varying(200) NOT NULL,
    bubble_active character varying(200) NOT NULL,
    teaser character varying(150),
    web_page_id integer,
    display_order integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.site_content_inpagelink OWNER TO lhbweb;

--
-- Name: site_content_inpagelink_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE site_content_inpagelink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_inpagelink_id_seq OWNER TO lhbweb;

--
-- Name: site_content_inpagelink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE site_content_inpagelink_id_seq OWNED BY site_content_inpagelink.id;


--
-- Name: site_content_webpage; Type: TABLE; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE TABLE site_content_webpage (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    template_override character varying(40),
    chart_title character varying(100),
    content text
);


ALTER TABLE public.site_content_webpage OWNER TO lhbweb;

--
-- Name: site_content_webpage_id_seq; Type: SEQUENCE; Schema: public; Owner: lhbweb
--

CREATE SEQUENCE site_content_webpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_webpage_id_seq OWNER TO lhbweb;

--
-- Name: site_content_webpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lhbweb
--

ALTER SEQUENCE site_content_webpage_id_seq OWNED BY site_content_webpage.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_city ALTER COLUMN id SET DEFAULT nextval('city_metrics_city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_cost ALTER COLUMN id SET DEFAULT nextval('city_metrics_cost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_demographicdata ALTER COLUMN id SET DEFAULT nextval('city_metrics_demographicdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_emissions ALTER COLUMN id SET DEFAULT nextval('city_metrics_emissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_energy ALTER COLUMN id SET DEFAULT nextval('city_metrics_energy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_specialtrendline ALTER COLUMN id SET DEFAULT nextval('city_metrics_specialtrendline_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_travel ALTER COLUMN id SET DEFAULT nextval('city_metrics_travel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_waste ALTER COLUMN id SET DEFAULT nextval('city_metrics_waste_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_water ALTER COLUMN id SET DEFAULT nextval('city_metrics_water_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_headerlink ALTER COLUMN id SET DEFAULT nextval('site_content_headerlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_headersublink ALTER COLUMN id SET DEFAULT nextval('site_content_headersublink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_homepage_section ALTER COLUMN id SET DEFAULT nextval('site_content_homepage_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_inpagelink ALTER COLUMN id SET DEFAULT nextval('site_content_inpagelink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_webpage ALTER COLUMN id SET DEFAULT nextval('site_content_webpage_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add redirect	7	add_redirect
20	Can change redirect	7	change_redirect
21	Can delete redirect	7	delete_redirect
22	Can add log entry	8	add_logentry
23	Can change log entry	8	change_logentry
24	Can delete log entry	8	delete_logentry
25	Can add revision	9	add_revision
26	Can change revision	9	change_revision
27	Can delete revision	9	delete_revision
28	Can add version	10	add_version
29	Can change version	10	change_version
30	Can delete version	10	delete_version
31	Can add City	11	add_city
32	Can change City	11	change_city
33	Can delete City	11	delete_city
34	Can add Demographic Data	12	add_demographicdata
35	Can change Demographic Data	12	change_demographicdata
36	Can delete Demographic Data	12	delete_demographicdata
37	Can add Energy	13	add_energy
38	Can change Energy	13	change_energy
39	Can delete Energy	13	delete_energy
40	Can add Water	14	add_water
41	Can change Water	14	change_water
42	Can delete Water	14	delete_water
43	Can add Travel	15	add_travel
44	Can change Travel	15	change_travel
45	Can delete Travel	15	delete_travel
46	Can add Waste	16	add_waste
47	Can change Waste	16	change_waste
48	Can delete Waste	16	delete_waste
49	Can add Emission	17	add_emissions
50	Can change Emission	17	change_emissions
51	Can delete Emission	17	delete_emissions
52	Can add Cost	18	add_cost
53	Can change Cost	18	change_cost
54	Can delete Cost	18	delete_cost
55	Can add Special Trend Line	19	add_specialtrendline
56	Can change Special Trend Line	19	change_specialtrendline
57	Can delete Special Trend Line	19	delete_specialtrendline
58	Can add Home Page Section	20	add_homepage_section
59	Can change Home Page Section	20	change_homepage_section
60	Can delete Home Page Section	20	delete_homepage_section
61	Can add Web Page	21	add_webpage
62	Can change Web Page	21	change_webpage
63	Can delete Web Page	21	delete_webpage
64	Can add Header Link	22	add_headerlink
65	Can change Header Link	22	change_headerlink
66	Can delete Header Link	22	delete_headerlink
67	Can add Header Sub Link	23	add_headersublink
68	Can change Header Sub Link	23	change_headersublink
69	Can delete Header Sub Link	23	delete_headersublink
70	Can add In Page Link	24	add_inpagelink
71	Can change In Page Link	24	change_inpagelink
72	Can delete In Page Link	24	delete_inpagelink
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_permission_id_seq', 72, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$15000$MWOpxSRh13Zb$qiRYKWFNWzTWzVjSwHFwMcmn3TR4c+bPB/asVvQnFWo=	2015-10-14 21:34:54.922104+00	t	lhbweb				t	t	2015-10-06 12:54:02.852145+00
2	pbkdf2_sha256$15000$Ho3ccpKkgmQP$obpUSzsFui7UOVQORtBtmFgC8rtf2dM7vVlvmSNl/j0=	2015-11-03 21:37:51.761353+00	t	davidw			davidw@millcreeksoftware.biz	t	t	2015-10-14 20:43:31.549114+00
3	pbkdf2_sha256$15000$R1SSMMof1CIS$svS9g+QE4hiStncXXS+twkRy74mTKf3gfbLwHnsidSs=	2016-05-09 14:12:44.096651+00	t	lhb				t	t	2015-11-03 21:38:34+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: city_metrics_city; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_city (id, city, state, type, sort_order) FROM stdin;
2	Minneapolis	MN	C	1
3	Saint Paul	MN	C	2
4	Rochester	MN	C	3
5	Duluth	MN	C	4
6	Richfield	MN	I	5
7	Hopkins	MN	I	6
8	Saint Louis Park	MN	I	7
9	Saint Anthony	MN	I	8
10	Edina	MN	I	9
11	Falcon Heights	MN	I	10
12	Maplewood	MN	I	11
13	White Bear Lake	MN	O	12
14	Coon Rapids	MN	O	13
15	Oakdale	MN	O	14
16	Shoreview	MN	O	16
17	Eagan	MN	O	17
18	Eden Prairie	MN	O	18
19	Minnetonka	MN	O	19
20	Woodbury	MN	O	20
21	Lake Elmo	MN	O	22
22	Bloomington	MN	O	15
23	Rosemount	MN	O	21
\.


--
-- Name: city_metrics_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_city_id_seq', 23, true);


--
-- Data for Name: city_metrics_cost; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_cost (id, city_id, year, energy_associated_costs, water_associated_costs, travel_associated_costs, waste_associated_costs, wn_energy_associated_costs, energy_type_electricity, energy_type_natural_gas, energy_type_other, wn_energy_type_electricity, wn_energy_type_natural_gas, wn_energy_type_other, energy_use_residential, energy_use_com_ind, wn_energy_use_residential, wn_energy_use_com_ind, water_use_residential, water_use_com_ind, waste_method_recycled, waste_method_landfilled, waste_method_incinerated) FROM stdin;
779	2	2007	586804004.2000	3290063.9280	398920472.1000	81294449.4300	576175347.6000	330037940.1000	242248414.1000	14517650.0400	302098997.5000	259558700.1000	14517650.0400	212781788.7000	374022215.6000	206892770.7000	369282576.9000	1826062.8910	1464001.0360	30112100.0000	12027332.8400	39155016.6000
780	3	2007	398235185.1000	2036646.2320	320629462.4000	63582819.1300	380902792.3000	225799250.1000	172435935.0000	0.0000	204659231.0000	176243561.3000	0.0000	157501003.2000	240734182.0000	152684605.4000	228218186.9000	806427.0663	1230219.1660	29493240.9400	16990812.9800	17098765.2100
781	4	2007	141384554.8000	1353907.6790	105367523.6000	16994163.3300	95887930.4100	94080826.0500	47303728.7300	0.0000	85435560.9500	10452369.4600	0.0000	68367908.4300	73016646.3500	28577105.3900	67310825.0200	684652.7469	669254.9317	5961383.4080	3597578.7200	7435201.2060
782	5	2007	161131137.1000	1535317.3190	109165434.2000	16005283.2500	573480725.0000	100590212.6000	51705396.1800	8835528.3320	86373915.6700	478661702.6000	8445106.8210	62526190.0800	98604947.0400	53510983.5600	519969741.5000	424654.6820	1110662.6370	7750524.1440	8254759.1010	0.0000
783	6	2007	35496917.2500	263478.0476	52847378.8200	7448175.2930	34029682.6500	20576408.8900	14920508.3600	0.0000	18712161.8500	15317520.7900	0.0000	20299851.5800	15197065.6700	19598757.3400	14430925.3100	157073.2849	106404.7627	2939852.0980	1990896.9340	2517426.2620
784	7	2007	24955165.8800	156531.7941	19487094.2700	3942873.7180	23773974.0300	15445238.3300	9509927.5500	0.0000	14241997.3800	9531976.6510	0.0000	8853274.8460	16101891.0300	8468167.0400	15305806.9900	111786.9942	44744.7999	1556282.5950	1053929.9750	1332661.1490
785	8	2007	68942109.8300	444795.6804	68510321.4400	10172371.2200	66068730.6300	40165840.2400	28776269.5900	0.0000	36526767.5000	29541963.1300	0.0000	28784899.5200	40157210.3100	27776368.0700	38292362.5600	286891.9183	157903.7621	4015113.1920	2719074.3890	3438183.6420
786	9	2007	10001139.3500	73643.2120	5015781.9310	1899410.3260	9734497.0240	5451643.0150	4549496.3360	0.0000	5307908.5480	4426588.4760	0.0000	5110534.6400	4890604.7110	4974178.5530	4760318.4710	56454.4166	17188.7954	799964.2074	507656.6141	591789.5044
787	10	2007	84258875.9800	551596.1454	80640301.1400	10593970.3000	80669766.4500	49749404.4000	34509471.5800	0.0000	45242049.3900	35427717.0600	0.0000	40797342.9600	43461533.0200	39430971.7600	41238794.6900	412113.8666	139482.2789	4181521.5900	2831767.8020	3580680.9030
788	11	2007	10161977.6100	75259.8353	5527625.8390	1261847.1730	9442643.3870	2014306.9950	7788072.4980	359598.1200	1818767.0390	7264278.2280	359598.1200	2760574.6320	135056795.6000	1752741.5350	7689901.8520	18017.0139	57242.8214	585314.7629	337195.0098	339337.4002
789	12	2007	46027927.2900	349490.0735	55868440.1600	8103538.7810	44146539.4900	27212224.7200	18815702.5700	0.0000	24139520.2200	20007019.2700	0.0000	23569813.3000	22458113.9800	22927103.3400	21219436.1500	137332.5086	212157.5649	3758871.1080	2165454.6590	2179213.0150
790	13	2007	29809360.5200	215722.3088	37068572.0400	5339861.3480	28898687.4700	15610246.2800	14199114.2400	0.0000	14979529.2600	13919158.2000	0.0000	17205376.8900	12603983.6400	16704859.6800	12193827.7900	137173.0019	78549.3069	2476924.1040	1426935.5580	1436001.6850
791	14	2007	66078586.8600	629400.2623	89895477.1000	10158196.8200	63442856.9700	39996811.5300	26081775.3300	0.0000	37875321.5000	25567535.4700	0.0000	36664484.1300	29414102.7300	35319961.8500	28122895.1200	521849.4996	107550.7627	4450968.4580	1688820.1640	4018408.2020
792	15	2007	26933333.1400	242672.9185	37085331.9700	3687899.4300	25908249.5200	15743205.8400	11190127.3000	0.0000	14600954.3100	11307295.2100	0.0000	16633874.3300	10299458.8100	16114182.0300	9794067.4960	195476.9813	47195.9372	1782910.3250	570450.9827	1334538.1220
793	22	2007	163676456.2000	969838.8533	211359929.3000	19236076.3700	155141522.7000	109974860.9000	53701595.3200	0.0000	100011008.1000	55130514.5400	0.0000	55357516.4800	108318939.7000	53405305.6800	101736217.0000	613789.8246	356049.0287	7592627.3520	5141802.3820	6501646.6330
794	16	2007	31742725.9700	223841.6388	38299361.9900	5781863.7590	30443154.1800	19773693.5400	11969032.4300	0.0000	18710108.5100	11733045.6700	0.0000	18639331.8800	13103394.0900	17946711.1300	12496443.0600	161388.6431	62452.9956	2681949.3580	1545048.9160	1554865.4850
795	17	2007	108090892.4000	724474.1692	118196667.6000	11119935.4600	102138767.9000	75320236.8600	32770655.5500	0.0000	68496134.1200	33642633.7400	0.0000	43620093.4800	64470798.9400	42039512.6500	60099255.2000	514079.4026	210394.7666	5702403.2730	4447379.2940	970152.8932
796	18	2007	99504576.3300	734690.3261	90381483.7000	13968562.6600	94561986.6900	64487054.0500	35017522.2900	0.0000	59463275.0500	35098711.6400	0.0000	45154300.0400	54350276.2900	43371515.2400	51190471.4400	536323.9380	198366.3880	5513499.1610	3733796.1960	4721267.3020
797	19	2007	86206409.8800	565629.2935	109626757.0000	11585875.4800	82346214.0600	54073085.0500	32133324.8400	0.0000	49825575.5400	32520638.5100	0.0000	42566462.3100	43639947.5700	41093292.7000	41252921.3600	383320.4565	182308.8370	4573034.1970	3096904.0150	3915937.2650
798	20	2007	66783130.4300	611914.1346	84633202.6800	7676400.5900	64304909.2600	39655492.8400	27127637.5900	0.0000	37168772.1500	27136137.1100	0.0000	43553774.7800	23229355.6500	42153542.1200	22151367.1400	505427.3308	106486.8038	3711146.1780	1187399.5870	2777854.8250
799	23	2007	24392008.7300	186818.1724	31856934.1200	3466093.7920	23425903.9600	15114170.1700	9277838.5600	0.0000	13672982.1000	9752921.8570	0.0000	14801265.1600	9590743.5760	14423112.6600	9002791.2900	163646.1008	23172.0716	1777444.1820	1386252.0890	302397.5214
800	21	2007	9098166.9270	25412.2273	23110026.3700	1096532.9290	8817549.5840	4861042.0250	4237124.9020	0.0000	4312151.0080	4505398.5750	0.0000	7115305.1640	1982861.7630	6928431.9260	1889117.6580	23355.2528	2056.9745	530117.4606	169613.7052	396801.7629
801	2	2008	633160387.0000	3193854.0000	442805409.0000	72289688.0000	617290770.0000	333400387.0000	285242350.0000	14517650.0000	325547218.0000	277225901.0000	14517650.0000	232994676.0000	400165711.0000	221139297.0000	396151473.0000	1804164.0000	1389691.0000	29735890.0000	9531468.0000	33022330.0000
802	3	2008	433963297.0000	1978393.0000	365313722.0000	60242710.0000	410934643.0000	229656753.0000	204306544.0000	0.0000	221418232.0000	189516410.0000	0.0000	167592861.0000	266370437.0000	158066407.0000	252868235.0000	761655.0000	1216738.0000	28187488.0000	15007467.0000	17047755.0000
803	4	2008	158681515.3000	1361775.4520	132537151.7000	18108500.9800	152190676.9000	98188738.6300	60492776.6400	0.0000	95700083.9600	56490592.9400	0.0000	74510245.2100	84171270.0600	70924917.4100	81265759.4900	690148.8111	671626.6407	7568092.7610	3505085.5660	7035322.6540
804	5	2008	174376830.0000	1560728.0000	125333369.0000	16634017.0000	599127522.9000	108327449.0000	53831280.0000	12218101.0000	95410355.0000	492007148.0000	11710019.8400	67702048.0000	106674782.0000	54321992.0000	544805531.0000	449459.0000	1111269.0000	8415478.0000	8218538.0000	0.0000
805	6	2008	38740759.0000	248293.0000	57310053.0000	6915947.0000	36909091.0000	20742141.0000	17998618.0000	0.0000	20102249.0000	16806841.0000	0.0000	22151483.0000	16589276.0000	21056074.0000	15853017.0000	142794.0000	105499.0000	2927103.0000	1532018.0000	2456826.0000
806	7	2008	27218592.0000	149716.0000	22667631.0000	3590024.0000	26102158.0000	15519123.0000	11699469.0000	0.0000	15307773.0000	10794384.0000	0.0000	9425838.0000	17792754.0000	9013793.0000	17088364.0000	117036.0000	32680.0000	1519441.0000	795261.0000	1275323.0000
807	8	2008	74886200.0000	445769.0000	79192439.0000	9697646.0000	71371459.0000	40826763.0000	34059436.0000	0.0000	39567265.0000	31804194.0000	0.0000	31031340.0000	43854860.0000	29511239.0000	41860220.0000	270346.0000	175424.0000	4104429.0000	2148219.0000	3444999.0000
808	9	2008	10943438.0000	66550.0000	5786511.0000	1744830.0000	10665812.0000	5510095.0000	5433343.0000	0.0000	5808177.0000	4857635.0000	0.0000	5613299.0000	5330139.0000	5438171.0000	5227641.0000	50313.0000	16238.0000	767961.0000	404731.0000	572138.0000
809	10	2008	90501207.0000	517834.0000	92398021.0000	9892334.0000	86258778.0000	49486692.0000	41014515.0000	0.0000	47960036.0000	38298742.0000	0.0000	43818849.0000	46682358.0000	41648091.0000	44610687.0000	388834.0000	129000.0000	4186828.0000	2191346.0000	3514160.0000
810	11	2008	11352053.4300	70450.2245	6311625.5840	1201696.2540	9793588.5140	1985198.5550	9007256.7500	359598.1200	2044194.0540	7389796.3400	359598.1200	2974601.3410	8377452.0850	1987415.1570	7806173.3580	16926.5850	53523.6395	562272.1503	299362.6486	340061.4552
811	12	2008	50039357.0000	335987.0000	69288370.0000	7678852.0000	48456279.0000	27527867.0000	22511490.0000	0.0000	27548318.0000	20907961.0000	0.0000	24850440.0000	25188916.0000	23944510.0000	24511770.0000	130643.0000	205344.0000	3592925.0000	1912930.0000	2172996.0000
812	13	2008	31324241.0000	198705.0000	41776016.0000	5043354.0000	30563771.0000	16588020.0000	14736222.0000	0.0000	17316389.0000	13247382.0000	0.0000	17546732.0000	13777509.0000	16997677.0000	13566094.0000	123197.0000	75508.0000	2359779.0000	1256384.0000	1427191.0000
813	14	2008	71357944.7400	618933.7571	103046551.9000	10114279.1800	69228625.1000	39965664.5800	31392280.1700	0.0000	41007989.9000	28220635.2000	0.0000	40046269.1800	31311675.5600	38436534.9000	30792090.1900	507456.9667	111476.7904	4450968.4580	1373388.4250	4289922.2920
814	15	2008	30000692.7600	242297.4688	46914132.6700	3611794.3200	29100404.7700	17182589.6400	12818103.1300	0.0000	17195355.3000	11905049.4600	0.0000	17630129.6100	12370563.1500	16971996.5200	12128408.2500	135849.0902	106448.3787	1756722.3930	527602.4555	1327469.4720
815	22	2008	174812238.0000	932464.0000	244212608.0000	17505091.0000	167265652.0000	110704921.0000	64107317.0000	0.0000	107403195.0000	59862457.0000	0.0000	59912573.0000	114899665.0000	56995519.0000	110270134.0000	594353.0000	338112.0000	7408849.0000	3877721.0000	6218521.0000
816	16	2008	34037185.0000	204397.0000	43045260.0000	5445069.0000	33130641.0000	20070035.0000	13967151.0000	0.0000	20574628.0000	12556012.0000	0.0000	19842832.0000	14194353.0000	19023757.0000	14106884.0000	144204.0000	60193.0000	2547741.0000	1356458.0000	1540870.0000
817	17	2008	115682995.5000	665337.5427	138635152.0000	11929524.1600	110731337.5000	76580645.9200	39102349.6100	0.0000	74218146.3600	36513191.1300	0.0000	45365281.2000	70317714.3300	43145177.4700	67586160.0200	531814.4711	133523.0716	6122904.9640	4690058.8960	1116560.2990
818	18	2008	106455818.0000	801478.0000	109785428.0000	12858042.0000	102350742.0000	64799327.0000	41656491.0000	0.0000	63916846.0000	38433896.0000	0.0000	48205473.0000	58250345.0000	45947939.0000	56402802.0000	593094.0000	208384.0000	5442034.0000	2848308.0000	4567700.0000
819	19	2008	93003430.0000	536320.0000	126473747.0000	10628986.0000	89367807.0000	54959494.0000	38043936.0000	0.0000	53946898.0000	35420909.0000	0.0000	45787744.0000	47215685.0000	43727181.0000	45640627.0000	354768.0000	181551.0000	4498609.0000	2354529.0000	3775849.0000
820	20	2008	71987462.8600	595621.6521	109828272.8000	7750170.4790	69339390.3700	40316119.2800	31671343.5800	0.0000	40227317.2500	29112073.1200	0.0000	46344776.1800	25642686.6800	44364117.0600	24975273.3100	480612.1585	115009.4936	3769566.2660	1132126.7530	2848477.4600
821	23	2008	26190923.9700	200349.7931	32674887.1400	3796605.8930	25156886.8800	15277661.7800	10913262.2000	0.0000	14678524.3000	10478362.5800	0.0000	15969842.0400	10221081.9400	15358862.1200	9798024.7590	172259.3292	28090.4639	1948632.3810	1492624.9370	355348.5750
822	21	2008	9734674.0000	26249.0000	26176847.0000	1111946.0000	9256915.0000	4861405.0000	4873269.0000	0.0000	4558581.0000	4698335.0000	0.0000	7526542.0000	2208132.0000	7160739.0000	2096176.0000	24469.0000	1780.0000	541210.0000	161770.0000	408966.0000
823	2	2009	532929402.0000	3257632.0000	313137972.0000	66091398.0000	536968765.0000	320209737.0000	201323643.0000	11396021.0000	320152201.0000	205420543.0000	11396021.0000	199456439.0000	333472963.0000	196695842.0000	340272924.0000	1920735.0000	1336897.0000	27180620.0000	10135944.0000	28774834.0000
824	3	2009	353178990.0000	2041433.0000	261584480.0000	57324670.0000	350986531.0000	210705319.0000	142473671.0000	0.0000	214520318.0000	136466213.0000	0.0000	142382937.0000	210796053.0000	140582826.0000	210403705.0000	780617.0000	1260815.0000	27346695.0000	11761557.0000	18216417.0000
825	4	2009	142393023.4000	1327179.0690	95637171.4300	14891777.9500	144431934.7000	96261404.9400	46131618.4500	0.0000	100018643.6000	44413291.1500	0.0000	65851566.4100	76541456.9900	65967961.1800	78463973.5500	679197.2490	647981.8197	5390466.4380	2303158.7160	7198152.7990
826	5	2009	150919692.0000	1372695.0000	90900991.0000	13678870.0000	432326662.5000	104164935.0000	37820402.0000	8934355.0000	94028632.0000	329705517.0000	8592512.9190	56858460.0000	94061232.0000	47778256.0000	384548406.8000	489584.0000	883111.0000	6226067.0000	7452803.0000	0.0000
827	6	2009	33003873.0000	255704.0000	41565916.0000	6487657.0000	32602586.0000	19940875.0000	13062998.0000	0.0000	19805617.0000	12796968.0000	0.0000	18957058.0000	14046816.0000	18708151.0000	13894435.0000	147175.0000	108529.0000	2821618.0000	1491271.0000	2174768.0000
828	7	2009	23461996.0000	148171.0000	15351725.0000	3312903.0000	23442978.0000	15401646.0000	8060350.0000	0.0000	15648972.0000	7794006.0000	0.0000	8201188.0000	15260808.0000	8165773.0000	15277205.0000	104642.0000	43529.0000	1440851.0000	761513.0000	1110539.0000
829	8	2009	63636057.0000	485996.0000	56988272.0000	8870111.0000	62874940.0000	39378025.0000	24258032.0000	0.0000	39110926.0000	23764014.0000	0.0000	26836543.0000	36799514.0000	26488135.0000	36386805.0000	304990.0000	181006.0000	3857798.0000	2038908.0000	2973405.0000
830	9	2009	9252562.0000	68711.0000	3877775.0000	1656332.0000	9424731.0000	5237460.0000	4015103.0000	0.0000	5658132.0000	3766599.0000	0.0000	4824716.0000	4427846.0000	4879425.0000	4545306.0000	51401.0000	17310.0000	746799.0000	365243.0000	544290.0000
831	10	2009	77829674.0000	542888.0000	66540129.0000	9482874.0000	76893339.0000	47759355.0000	30070319.0000	0.0000	47435405.0000	29457933.0000	0.0000	38165888.0000	39663785.0000	37663377.0000	39229962.0000	422991.0000	119897.0000	4124301.0000	2179759.0000	3178813.0000
832	11	2009	8213700.8120	77331.4378	4503825.5690	1148882.0780	7409619.8630	1890552.0450	6005535.9370	317612.8300	2052310.5090	5039696.5240	317612.8300	2521983.6360	5691717.1760	1878703.2970	5530916.5660	18620.6150	58710.8228	548073.4298	235721.2423	365087.4060
833	12	2009	42919323.0000	364356.0000	49906211.0000	7527949.0000	43708072.0000	26689360.0000	16229963.0000	0.0000	28045236.0000	15662836.0000	0.0000	21664164.0000	21255159.0000	21917019.0000	21791054.0000	139168.0000	225188.0000	3591203.0000	1544543.0000	2392203.0000
834	13	2009	26659941.0000	207806.0000	29433140.0000	4818222.0000	27201694.0000	15919723.0000	10740218.0000	0.0000	17183193.0000	10018501.0000	0.0000	15226450.0000	11433491.0000	15409384.0000	11792310.0000	135751.0000	72055.0000	2298530.0000	988576.0000	1531116.0000
835	14	2009	61795117.5100	653548.4126	72110468.9500	9949910.0030	62620140.6300	39356188.9300	22438928.5800	0.0000	41689054.4400	20931086.1900	0.0000	34537363.9600	27257753.5400	34624799.2900	27995341.3400	538010.2429	115538.1697	4376603.9860	1321708.1940	4251597.8230
836	15	2009	25748468.2700	242674.8765	33824166.0800	3384859.4650	26246792.8100	16304776.3500	9443691.9250	0.0000	17133093.8700	9113698.9460	0.0000	15153319.4100	10595148.8700	15315457.1400	10931335.6800	140218.2851	102456.5914	1627518.3610	356947.4775	1400393.6260
837	22	2009	150310026.0000	953977.0000	176828798.0000	16229393.0000	148674238.0000	104938599.0000	45371428.0000	0.0000	104226806.0000	44447433.0000	0.0000	51780387.0000	98529639.0000	51104683.0000	97569556.0000	623773.0000	330205.0000	7058504.0000	3730533.0000	5440356.0000
838	16	2009	30052630.0000	229926.0000	30421691.0000	5160598.0000	30518038.0000	19794905.0000	10257725.0000	0.0000	20949608.0000	9568430.0000	0.0000	17108168.0000	12944462.0000	17102670.0000	13415368.0000	161486.0000	68441.0000	2461860.0000	1058823.0000	1639915.0000
839	17	2009	103388598.8000	773739.5042	100107837.7000	11755641.5400	102307722.0000	75440404.1300	27948194.6900	0.0000	74928695.9600	27379026.0000	0.0000	39814196.9700	63574401.8500	39306434.6300	63001287.3400	540122.2240	233617.2802	6422232.1070	4131188.4220	1202221.0140
840	18	2009	92626617.0000	738979.0000	77133152.0000	11982401.0000	92618639.0000	62171456.0000	30455160.0000	0.0000	63169830.0000	29448809.0000	0.0000	41902600.0000	50724017.0000	41616240.0000	51002399.0000	546845.0000	192135.0000	5211398.0000	2754308.0000	4016695.0000
841	19	2009	80773233.0000	556546.0000	91517889.0000	9858426.0000	80731449.0000	53131724.0000	27641509.0000	0.0000	53882498.0000	26848951.0000	0.0000	39422398.0000	41350835.0000	39189456.0000	41541994.0000	375080.0000	181466.0000	4287637.0000	2266085.0000	3304704.0000
842	20	2009	63899760.0000	608394.3954	81561985.7800	7345333.1970	63709386.6900	39823236.1100	24076523.8900	0.0000	40741490.3400	22967896.3500	0.0000	40857971.7300	23041788.2700	40509757.2000	23199629.4900	494507.2076	113887.1878	3531805.3140	774595.8681	3038932.0150
843	23	2009	23321346.5100	217484.2089	23043208.5000	3837124.9850	22962478.6100	15121614.6400	8199731.8750	0.0000	14722959.0100	8239519.6040	0.0000	14118329.8200	9203016.6900	13960263.1600	9002215.4490	187162.8409	30321.3681	2096262.2230	1348449.2750	392413.4870
844	21	2009	8372774.0000	27135.0000	18913480.0000	1030659.0000	8286240.0000	4783813.0000	3588960.0000	0.0000	4712189.0000	3574051.0000	0.0000	6594744.0000	1778030.0000	6528189.0000	1758051.0000	24533.0000	2602.0000	495565.0000	108687.0000	426407.0000
845	2	2010	533461952.0000	3143115.0000	371149981.0000	70376936.0000	525978325.0000	341249872.0000	181312029.0000	10900052.0000	317227198.0000	197851075.0000	10900052.0000	196645387.0000	336816565.0000	192750588.0000	333227737.0000	1826536.0000	1316580.0000	26534960.0000	12470435.0000	31371542.0000
846	3	2010	355593539.0000	2590742.0000	303902033.0000	57307714.0000	343904798.0000	230081362.0000	124295686.0000	1216490.0000	216631332.0000	126056975.0000	1216490.0000	140733966.0000	214859573.0000	137194342.0000	206710456.0000	763587.0000	1827155.0000	28017268.0000	11333849.0000	17956597.0000
847	4	2010	144962171.6000	1337551.5480	115976928.5000	16898613.8900	137437019.9000	102573360.9000	42388810.6600	0.0000	94982191.6100	42454828.2800	0.0000	66517083.7000	78445087.8800	63785050.7100	73651969.1800	666732.2698	670819.2778	6259163.1250	2013857.7990	8625592.9640
848	5	2010	162079994.0000	1477949.0000	107257663.0000	13787696.0000	443447807.1000	114324684.0000	35678225.0000	12077084.0000	98877242.0000	334132122.0000	10438443.6900	57470590.0000	104609404.0000	46896924.0000	396550883.0000	478124.0000	999825.0000	6594490.0000	7193206.0000	0.0000
849	6	2010	32890269.0000	236725.0000	55326136.0000	6652176.0000	31776692.0000	21334192.0000	11556077.0000	0.0000	19691969.0000	12084723.0000	0.0000	18880099.0000	14010170.0000	18388169.0000	13388523.0000	135724.0000	101001.0000	2931810.0000	1837058.0000	1883308.0000
850	7	2010	23392720.0000	151162.0000	17598546.0000	3321745.0000	22425364.0000	16367128.0000	7025592.0000	0.0000	15188343.0000	7237021.0000	0.0000	8291481.0000	15101238.0000	8001429.0000	14423935.0000	109772.0000	41389.0000	1463991.0000	917329.0000	940425.0000
851	8	2010	63825011.0000	431176.0000	66187655.0000	8544650.0000	61527672.0000	42511341.0000	21313670.0000	0.0000	39238983.0000	22288689.0000	0.0000	26707321.0000	37117689.0000	25972987.0000	35554685.0000	261002.0000	170174.0000	3765879.0000	2359682.0000	2419090.0000
852	9	2010	9229084.0000	61884.0000	4766863.0000	1590531.0000	9144683.0000	5711998.0000	3517086.0000	0.0000	5621868.0000	3522815.0000	0.0000	4750663.0000	4478421.0000	4710569.0000	4434113.0000	47301.0000	14582.0000	729833.0000	392302.0000	468396.0000
853	10	2010	78401924.0000	449582.0000	77132679.0000	9052798.0000	75683500.0000	51376261.0000	27025663.0000	0.0000	47421517.0000	28261983.0000	0.0000	37994674.0000	40407250.0000	37027569.0000	38655931.0000	311001.0000	138581.0000	3989834.0000	2500011.0000	2562952.0000
854	11	2010	7786720.2370	87982.9487	5397047.0100	1069689.8440	7146779.0100	2148164.6100	5506533.8270	132021.8000	2128248.7620	4886508.4480	132021.8000	2486446.2080	5300274.0280	1824191.0920	5322587.9180	17867.8165	70115.1322	522962.5341	211554.4718	335172.8384
855	12	2010	43055346.0000	396121.0000	58633008.0000	7642824.0000	42308889.0000	28390126.0000	14665221.0000	0.0000	27418980.0000	14889909.0000	0.0000	21837697.0000	21217649.0000	21530136.0000	20778753.0000	117868.0000	278253.0000	3736514.0000	1511535.0000	2394776.0000
856	13	2010	26459239.0000	213641.0000	34649906.0000	4672825.0000	26062370.0000	16863708.0000	9595531.0000	0.0000	16583911.0000	9478459.0000	0.0000	15170285.0000	11288953.0000	14946039.0000	11116331.0000	131841.0000	81800.0000	2284506.0000	924153.0000	1464166.0000
857	14	2010	20287874.4000	620158.9845	85647808.2400	9874595.0430	60838673.7700	42088990.3700	20287874.4000	0.0000	40798325.0100	20040348.7600	0.0000	34801200.6500	27575664.1200	34013505.2600	26825168.5200	510235.7445	109923.2401	4344009.9160	1579549.3420	3951035.7850
858	15	2010	26069152.8200	222716.3801	38390216.5200	3485038.0040	25595441.0300	17628735.5100	8440417.3100	0.0000	17025706.5100	8569734.5160	0.0000	15190630.5300	10878522.2900	14984209.1200	10611231.9100	171111.6225	51604.7576	1758149.1780	364947.2592	1361941.5670
859	22	2010	152759510.0000	912245.0000	178079023.0000	15652855.0000	145939238.0000	112517757.0000	40241753.0000	0.0000	103856578.0000	42082659.0000	0.0000	51762468.0000	100997043.0000	50374502.0000	95564735.0000	565912.0000	346333.0000	6898674.0000	4322676.0000	4431505.0000
860	16	2010	30316411.0000	208835.0000	35576027.0000	5034438.0000	29537978.0000	21173585.0000	9142826.0000	0.0000	20506700.0000	9031278.0000	0.0000	16939515.0000	13376896.0000	16543503.0000	12994475.0000	163555.0000	45280.0000	2461295.0000	995670.0000	1577473.0000
861	17	2010	105403649.8000	672952.7428	115472905.4000	11542670.5700	100309851.6000	80797162.4000	24606487.4200	0.0000	74577711.7100	25732139.8400	0.0000	40593084.7500	64810565.0800	39386407.7900	60923443.7700	458768.4874	214184.2554	5837418.1610	4411485.0480	1293767.3640
862	18	2010	92434147.0000	643817.0000	91553054.0000	11480422.0000	88538099.0000	65394223.0000	27039924.0000	0.0000	60684434.0000	27853665.0000	0.0000	41653192.0000	50780955.0000	40424284.0000	48113815.0000	476424.0000	167392.0000	5059760.0000	3170421.0000	3250241.0000
863	19	2010	80731782.0000	525911.0000	106309650.0000	9391373.0000	78301057.0000	56203101.0000	24528681.0000	0.0000	53084039.0000	25217018.0000	0.0000	39206035.0000	41525748.0000	38401380.0000	39899677.0000	352775.0000	173137.0000	4139055.0000	2593512.0000	2658807.0000
864	20	2010	65263585.7600	573933.8789	84822740.6200	7887224.7700	63646371.3800	43518194.0700	21745391.6900	0.0000	41638272.0800	22008099.2900	0.0000	41631812.3000	23631773.4600	40768120.9200	22878250.4500	466719.4373	107214.4416	3978986.0910	825936.7787	3082301.9000
865	23	2010	24145381.7800	189575.3048	27197948.2400	3932410.9290	23104186.7900	16789610.9900	7355770.7940	0.0000	15270608.8100	7833577.9830	0.0000	14537418.3400	9607963.4440	14106303.2000	8997883.5900	159866.9477	29708.3571	1988718.8870	1502925.3330	440766.7091
866	21	2010	8369288.0000	22168.0000	22709813.0000	1027130.0000	8116994.0000	5198253.0000	3171034.0000	0.0000	4771531.0000	3345463.0000	0.0000	6589694.0000	1779594.0000	6411358.0000	1705636.0000	19316.0000	2852.0000	518172.0000	107559.0000	401399.0000
867	2	2011	561520127.0000	3152065.0000	471003678.0000	70507971.0000	549574844.0000	351329214.0000	199980386.0000	10210527.0000	324581332.0000	214782984.0000	10210527.0000	210184992.0000	351335135.0000	203424648.0000	346150196.0000	1849019.0000	1303046.0000	28197939.0000	10863556.0000	31446475.0000
868	3	2011	376073190.0000	2700160.0000	386513358.0000	56528659.0000	360239971.0000	240928224.2000	135144955.0000	0.0000	228021355.0000	132218616.0000	0.0000	150004501.0000	226068678.3000	144179792.0000	216060190.0000	817732.0000	1882428.0000	28387625.0000	9380746.0000	18760287.0000
869	4	2011	170794937.9000	1385973.8990	147445988.6000	26961470.8400	162941564.6000	104480105.2000	66314832.6600	0.0000	96315678.6800	66625885.9400	0.0000	68829900.1200	101965037.8000	66008071.8600	96933492.7600	695484.8082	690489.0907	16144677.6800	1249332.4430	9567460.7160
870	5	2011	167699768.0000	1348325.0000	131341750.0000	13373854.0000	448105786.9000	117556080.0000	37697939.0000	12445749.0000	101236371.0000	334737920.0000	12131495.6700	62440295.0000	105259473.0000	49214025.0000	398891762.2000	483433.0000	864891.0000	6702173.0000	6671680.0000	0.0000
871	6	2011	34770580.0000	252259.0000	69908483.0000	6630320.0000	33203958.0000	22414718.0000	12355862.0000	0.0000	20548479.0000	12655479.0000	0.0000	19837103.0000	14933477.0000	19084634.0000	14119324.0000	137093.0000	115166.0000	2960878.0000	1540960.0000	2128482.0000
872	7	2011	24731567.0000	154160.0000	22474995.0000	3317596.0000	23538571.0000	17182249.0000	7549318.0000	0.0000	15906421.0000	7632149.0000	0.0000	8634548.0000	16097019.0000	8264747.0000	15273823.0000	108105.0000	46055.0000	1481527.0000	771046.0000	1065023.0000
873	8	2011	66849980.0000	435464.0000	84178430.0000	8528740.0000	63716338.0000	44226137.0000	22623842.0000	0.0000	40543890.0000	23172448.0000	0.0000	28005481.0000	38844499.0000	26908574.0000	36807765.0000	269115.0000	166349.0000	3808649.0000	1982174.0000	2737918.0000
874	9	2011	9829215.0000	64258.0000	6277900.0000	1589106.0000	9648069.0000	5997477.0000	3831737.0000	0.0000	5890484.0000	3757585.0000	0.0000	5150677.0000	4678537.0000	5055405.0000	4592664.0000	48775.0000	15483.0000	739067.0000	334159.0000	515880.0000
875	10	2011	81558997.0000	584419.0000	97729798.0000	9045469.0000	77831659.0000	53066144.0000	28492853.0000	0.0000	48647883.0000	29183776.0000	0.0000	40226582.0000	41332415.0000	38698982.0000	39132677.0000	400367.0000	184052.0000	4039402.0000	2102267.0000	2903799.0000
876	11	2011	7649139.7000	98944.9684	6806600.4140	1062995.4790	6699021.7900	2040422.3250	5583806.6550	24910.7200	1970809.2930	4703301.7780	24910.7200	2719312.3090	4929827.3910	1887831.9640	4811189.8260	16643.1927	82301.7756	533816.2592	176400.6284	352778.5914
877	12	2011	44878939.0000	427083.0000	73776137.0000	7575003.0000	42991749.0000	29433497.0000	15445441.0000	0.0000	27771112.0000	15220636.0000	0.0000	22810867.0000	22068071.0000	21912474.0000	21079275.0000	119281.0000	307802.0000	3804023.0000	1257047.0000	2513932.0000
878	13	2011	27465612.0000	206870.0000	43660916.0000	4593855.0000	26901385.0000	17376680.0000	10088931.0000	0.0000	17102105.0000	9799279.0000	0.0000	15947559.0000	11518053.0000	15610049.0000	11291336.0000	148068.0000	58802.0000	2306947.0000	762335.0000	1524572.0000
879	14	2011	64654247.0400	584310.8868	108518022.5000	10129649.5200	62747226.2800	43162219.9100	21492027.1300	0.0000	41872232.8500	20874993.4300	0.0000	36242265.7500	28411981.2900	35195858.8500	27551367.4300	474449.7076	109861.1792	4433658.8250	1535749.1230	4160241.5680
880	15	2011	27540123.8600	218982.8276	49658164.4700	3533577.7670	26360524.2600	18575243.0500	8964880.8120	0.0000	17526125.2500	8834399.0100	0.0000	15902680.7500	11637443.1200	15282467.5600	11078056.7000	170954.8503	48027.9774	1795837.1590	321013.8442	1416726.7640
881	22	2011	160069031.0000	936427.0000	226363343.0000	15681973.0000	151405206.0000	116691587.0000	43377444.0000	0.0000	106975901.0000	44429305.0000	0.0000	54804513.0000	105264518.0000	52706332.0000	98698873.0000	585862.0000	350565.0000	7003042.0000	3644664.0000	5034267.0000
882	16	2011	31921810.0000	205699.0000	45591583.0000	4958277.0000	30959834.0000	22237275.0000	9684535.0000	0.0000	21553341.0000	9406493.0000	0.0000	17633438.0000	14288372.0000	17106369.0000	13853465.0000	161823.0000	43876.0000	2489953.0000	822810.0000	1645514.0000
883	17	2011	112152874.9000	717702.0151	146728990.3000	11693600.4800	106016925.8000	82370629.2800	29782245.5900	0.0000	75512490.0900	30504435.7000	0.0000	41366881.2600	70785993.6200	39697881.6300	66319044.1600	491315.2734	226386.7417	6544645.3080	4203716.9230	945238.2492
884	18	2011	96076614.0000	653830.0000	116109199.0000	11461180.0000	91386532.0000	67401104.0000	28675510.0000	0.0000	62396393.0000	28990139.0000	0.0000	43488002.0000	52588612.0000	41827412.0000	49559120.0000	512777.0000	141054.0000	5118178.0000	2663705.0000	3679297.0000
885	19	2011	83736643.0000	543459.0000	134521276.0000	9379833.0000	79830288.0000	57731361.0000	26005282.0000	0.0000	53415387.0000	26414902.0000	0.0000	41037279.0000	42699364.0000	39540872.0000	40289417.0000	364037.0000	179422.0000	4188718.0000	2179977.0000	3011138.0000
886	20	2011	69054663.5600	602906.6187	108434879.3000	8102284.1520	66510015.7500	45692738.2100	23361925.3500	0.0000	43492818.6900	23017197.0600	0.0000	44189793.9500	24864869.6100	42667330.0200	23842685.7300	486452.7724	116453.8463	4117748.0490	736065.6969	3248470.4060
887	23	2011	27638920.1900	209267.2479	34486440.3000	4016454.9620	26480697.2300	17007481.2400	10631438.9500	0.0000	15465996.4400	11014700.7900	0.0000	15088594.0600	12550326.1300	14498348.8200	11982348.4100	179524.7391	29742.5088	2247919.5500	1443870.0660	324665.3469
888	21	2011	8976955.0000	25305.0000	28715767.0000	1034615.0000	8607810.0000	5517480.0000	3459474.0000	0.0000	5088187.0000	3519623.0000	0.0000	7074559.0000	1902395.0000	6797844.0000	1809966.0000	22843.0000	2461.0000	525813.0000	93991.0000	414811.0000
889	2	2012	492830584.0000	3330351.0000	461288231.0000	71104122.0000	489489517.0000	358988948.0000	126356062.0000	7485574.0000	326422567.0000	155581376.0000	7485574.0000	184053735.0000	308776848.0000	183722292.0000	305767225.0000	1945862.0000	1384489.0000	28436355.0000	10955409.0000	31712358.0000
890	3	2012	336821679.2000	2952640.0000	363135918.0000	54989819.0000	327093137.6000	239805366.6000	97016312.6200	0.0000	219925668.3000	107167469.3000	0.0000	132698777.0000	204122902.7000	131328150.0000	195764987.1000	929153.0000	2023487.0000	28406313.0000	7478217.0000	19105289.0000
891	4	2012	156180622.1000	1526613.5330	141903666.2000	21327793.2500	152259565.7000	106171076.7000	50009545.3700	0.0000	94290743.7400	57968821.9800	0.0000	61551022.4400	94629599.6100	60791912.6200	91467653.1000	788593.5238	738020.0097	10332200.7900	1057531.1390	9938061.3220
892	5	2012	161752703.0000	1509705.0000	123723900.0000	13982463.0000	390661175.0000	119792012.0000	30510336.0000	11450354.0000	100587437.0000	278927774.0000	11145963.2400	58759747.0000	102992955.0000	47393702.0000	343267473.5000	516274.0000	993431.0000	7371602.0000	6610861.0000	0.0000
893	6	2012	31556593.0000	275806.0000	72582635.0000	6777113.0000	30680495.0000	22587961.0000	8968632.0000	0.0000	20375691.0000	10304804.0000	0.0000	17754624.0000	13801969.0000	17512218.0000	13168277.0000	151970.0000	123835.0000	3041801.0000	1324160.0000	2411152.0000
894	7	2012	23110262.0000	171687.0000	21470141.0000	3379044.0000	22168556.0000	17732722.0000	5377540.0000	0.0000	15966034.0000	6202522.0000	0.0000	7915779.0000	15194482.0000	7716244.0000	14452312.0000	119977.0000	51710.0000	1516631.0000	660222.0000	1202192.0000
895	8	2012	61100229.0000	463915.0000	81024363.0000	8708023.0000	59129571.0000	44846125.0000	16254104.0000	0.0000	40453885.0000	18675685.0000	0.0000	25256257.0000	35843972.0000	24853992.0000	34275578.0000	295554.0000	168361.0000	3908459.0000	1701435.0000	3098128.0000
896	9	2012	8861411.0000	73541.0000	5898403.0000	1590281.0000	8857779.0000	6105757.0000	2755654.0000	0.0000	5889270.0000	2968509.0000	0.0000	4636984.0000	4224426.0000	4660246.0000	4197533.0000	55159.0000	18382.0000	749601.0000	279306.0000	561374.0000
897	10	2012	75542436.0000	662510.0000	95652760.0000	9197578.0000	73215906.0000	55001161.0000	20541275.0000	0.0000	49614335.0000	23601571.0000	0.0000	36366581.0000	39175854.0000	35835008.0000	37380898.0000	456296.0000	206215.0000	4128189.0000	1797088.0000	3272301.0000
898	11	2012	6266545.6410	114353.8594	6425367.6560	1031474.9450	6054538.9240	2043026.7450	4187278.8960	36240.0000	1842932.2440	4175366.6810	36240.0000	2345782.6400	3920763.0010	1687066.9860	4367471.9380	18254.5100	96099.3494	532833.1811	140273.1203	358368.6440
899	12	2012	41312007.0000	510976.0000	71769109.0000	7426201.0000	39902003.0000	29788008.0000	11523999.0000	0.0000	26865513.0000	13036490.0000	0.0000	20928835.0000	20383172.0000	20507889.0000	19394114.0000	170313.0000	340663.0000	3836183.0000	1009910.0000	2580109.0000
900	13	2012	26844139.0000	218514.0000	41120894.0000	4472583.0000	26439933.0000	18693082.0000	8151058.0000	0.0000	17309730.0000	9130203.0000	0.0000	15079093.0000	11765046.0000	14930985.0000	11508948.0000	144257.0000	74257.0000	2310420.0000	608239.0000	1553924.0000
901	14	2012	60735458.2200	647845.2488	103103966.2000	10422509.6400	58868739.0200	44810435.4300	15925022.7900	0.0000	41030722.8600	17838016.1500	0.0000	33259056.5700	27476401.6500	32778781.9800	26089957.0400	539204.5383	108640.7106	4618803.2700	1546145.6030	4257560.7680
902	15	2012	25826659.2000	262103.2263	44718557.1100	3589551.9260	24834599.7700	19104433.6800	6722225.5180	0.0000	17230101.3000	7604498.4710	0.0000	14501890.1400	11324769.0600	14237506.4200	10597093.3600	206147.3400	55955.8863	1843370.7100	307540.9452	1438640.2710
903	22	2012	148612358.0000	1065508.0000	215977272.0000	16129902.0000	141672944.0000	117769896.0000	30842463.0000	0.0000	106235485.0000	35437459.0000	0.0000	48957451.0000	99654908.0000	48233822.0000	93439122.0000	678879.0000	386629.0000	7239654.0000	3151574.0000	5738674.0000
904	16	2012	29933041.0000	244088.0000	44053732.0000	4834017.0000	28855120.0000	22757473.0000	7175568.0000	0.0000	20817587.0000	8037533.0000	0.0000	16040812.0000	13892229.0000	15823824.0000	13031296.0000	189924.0000	54164.0000	2497128.0000	657391.0000	1679498.0000
905	17	2012	104156569.7000	799225.0722	138467044.6000	12506441.0000	99278595.0200	82598662.7400	21557906.9600	0.0000	74508931.0300	24769663.9900	0.0000	38064470.2100	66092099.5000	37323979.1200	61954615.9100	528634.1002	270590.9720	7267229.8750	4275601.6660	963609.4606
906	18	2012	89909250.0000	743712.5211	113710551.0000	11679261.0000	86175438.0000	69265464.0000	20643786.0000	0.0000	62364635.0000	23810804.0000	0.0000	39036495.0000	50872755.0000	38562002.0000	47613436.0000	550347.2656	193365.2555	5242053.0000	2281977.0000	4155231.0000
907	19	2012	77734667.0000	636920.0000	129044477.0000	9558858.0000	75093418.0000	58992702.0000	18741965.0000	0.0000	54464508.0000	20628911.0000	0.0000	36816055.0000	40918611.0000	36250199.0000	38843219.0000	431441.0000	205479.0000	4290344.0000	1867677.0000	3400837.0000
908	20	2012	64747311.7000	736035.9779	103332233.4000	8324691.7440	63233513.5300	47261573.9100	17485737.7900	0.0000	43806128.6500	19427384.8800	0.0000	40745920.6200	24001391.0800	40300056.7300	22933456.8000	617760.2961	118275.6818	4275044.1410	713232.0748	3336415.5280
909	23	2012	25716934.3500	233361.8544	32112929.5200	4308689.5180	24965058.9000	17780789.6500	7936144.7040	0.0000	15600943.2600	9364115.6440	0.0000	13966678.6800	11750255.6700	13568103.9600	11396954.9500	200849.0514	32512.8030	2503688.8740	1473020.1890	331980.4557
910	21	2012	8175342.0000	37647.0000	26483770.0000	1036342.0000	7983106.0000	5595543.0000	2579800.0000	0.0000	5016317.0000	2966790.0000	0.0000	6399047.0000	1776295.0000	6286215.0000	1696892.0000	34643.0000	3005.0000	532201.0000	88790.0000	415351.0000
911	2	2013	580492291.2000	3331563.1240	444804198.9000	71637205.7500	553994330.8000	383387915.5000	188094392.8000	9009983.0000	357356346.7000	187628001.1000	9009983.0000	213925066.4000	366567224.8000	199263371.1000	354730959.7000	1953499.7590	1378063.3650	28649549.2900	11037543.9500	31950112.5000
912	3	2013	373160343.4000	2708230.3570	343587282.9000	57636958.2000	350190503.4000	253158333.1000	120002010.3000	0.0000	241657250.5000	108533253.0000	0.0000	152729677.2000	220430666.2000	142479398.2000	207711105.2000	807537.6359	1900692.7210	30111295.4600	8138393.6140	19387269.1200
913	4	2013	174729263.2000	1490237.0160	136556075.9000	22816078.8700	163008809.4000	111583041.0000	63146222.1800	0.0000	104798561.2000	58210248.2000	0.0000	71683012.5900	103046250.6000	66798468.8800	96210340.4800	752710.1891	737526.8272	11706472.1400	834420.2478	10275186.4800
914	5	2013	169702268.3000	1467704.7790	119140239.2000	14206148.7900	384604170.1000	124118344.9000	32357609.2900	13226314.0900	109230834.5000	261713061.7000	13660273.8600	62040415.3800	107661852.9000	46041309.6100	338562860.5000	516501.3030	951203.4764	7432966.1070	6773182.6850	0.0000
915	6	2013	35988671.1300	268881.3189	69722305.6400	6718978.0270	33459868.6300	24195401.3400	11793269.7900	0.0000	22375691.4900	11084177.1400	0.0000	20169109.4200	15819561.7100	18772537.0400	14687331.6000	145278.6144	123602.7045	3079609.1720	1142650.9860	2496717.8690
916	7	2013	25801912.9600	166853.5006	20060067.4600	3432661.2030	24006171.8300	18579311.2500	7222601.7100	0.0000	17277108.7800	6729063.0440	0.0000	8956522.1460	16845390.8100	8334257.7400	15671914.0900	117840.8372	49012.6634	1573342.6840	583769.3908	1275549.1280
917	8	2013	68770188.1500	435900.9833	77483680.9000	8821862.8570	63922816.4300	47237305.1400	21532883.0100	0.0000	43684638.7400	20238177.6900	0.0000	29073576.9100	39696611.2400	27057042.3300	36865774.1000	286312.0023	149588.9810	4043455.6650	1500274.3360	3278132.8560
918	9	2013	9994990.5490	77331.9906	5732593.0380	1610226.1030	9564154.2160	6461192.7600	3533797.7890	0.0000	6416552.9940	3147601.2210	0.0000	5198859.4840	4796131.0650	4949751.9310	4614402.2850	53550.0731	23781.9175	772745.5908	258209.3182	579271.1943
919	10	2013	85036546.9500	621510.2187	88717815.1800	9175140.0510	79054163.8800	57644779.8400	27391767.1100	0.0000	53309378.5700	25744785.3100	0.0000	41263954.1300	43772592.8200	38407791.5000	40646372.3700	428029.1035	193481.1152	4205378.4580	1560353.7900	3409407.8030
920	11	2013	7090382.4710	128363.1238	6090548.7820	1058309.5730	6002010.3520	2073596.0400	4992186.4310	24600.0000	1917643.1340	4059767.2180	24600.0000	2581986.9020	97937268.4400	1770856.4970	4231153.8550	16969.9942	111393.1296	552893.0262	149434.3237	355982.2230
921	12	2013	46221409.7200	497310.5523	67450834.9900	7570460.5820	43798973.6800	31598524.5500	14622885.1700	0.0000	30281919.3600	13517054.3200	0.0000	23450971.8300	22770437.8900	22168571.6900	21630401.9900	136029.8476	361280.7047	3955038.2680	1068956.2740	2546466.0400
922	13	2013	27397075.7200	203490.1485	39242215.6500	4562818.5280	25894432.0000	19579417.5800	7817658.1440	0.0000	18755434.0700	7138997.9340	0.0000	15428351.5900	11968724.1300	14564032.6400	11330399.3700	153027.9686	50462.1799	2383754.8190	644274.3395	1534789.3700
923	14	2013	66858787.3800	582807.9004	98626213.7700	10747178.9000	62540884.5500	45829108.7100	21029678.6700	0.0000	43336817.3300	19204067.2300	0.0000	37087903.6500	29770883.7300	34615070.5500	27925814.0100	506769.3308	76038.5696	5317728.5430	1727305.6750	3702144.6860
924	15	2013	28615395.0300	250240.1140	43999335.6400	3755521.2300	27132656.8500	20062425.9500	8552969.0780	0.0000	19226491.5400	7906165.3190	0.0000	16188164.4600	12427230.5700	15297733.1400	11834923.7100	196382.8903	53857.2237	1899174.0910	416340.4126	1440006.7260
925	22	2013	167756479.8000	996057.2971	203163753.8000	16020514.8800	155761965.1000	126497559.0000	41258920.7500	0.0000	116983815.0000	38778150.1100	0.0000	55626884.2200	112129595.6000	51773489.3000	103988475.8000	622815.7601	373241.5369	7342920.9560	2724500.2230	5953093.7000
926	16	2013	33113315.0200	263168.2534	41325302.1500	4981537.9900	30999642.4200	24194669.3900	8918645.6310	0.0000	22855235.0400	8144407.3860	0.0000	17936091.5400	15177223.4800	16724632.4400	14275009.9900	178056.8400	85111.4135	2602506.5680	703397.9279	1675633.4940
927	17	2013	111645698.9000	763521.6674	132126139.2000	12405863.3000	103690895.8000	82342687.7100	29303011.1600	0.0000	76149783.6200	27541112.2000	0.0000	42961597.5900	68684101.2800	39977691.6100	63713204.2100	508566.1398	254955.5277	7189682.3740	4131735.6730	1084445.2570
928	18	2013	101568265.0000	692530.5212	107655594.1000	11694314.0500	94498566.0200	73610052.5300	27958212.5200	0.0000	68450808.9700	26047757.0500	0.0000	44559186.2000	57009078.8400	41468127.7100	53030438.3100	527162.8839	165367.6372	5360028.9600	1988772.6130	4345512.4770
929	19	2013	88861363.3200	591689.9130	121537062.2000	9478082.2360	83788035.5300	63443933.2600	25417430.0600	0.0000	60888654.0100	22899381.5200	0.0000	42291539.6700	46569823.6600	39583210.0000	44204825.5400	399371.3043	192318.6087	4344230.4570	1611873.1110	3521978.6680
930	20	2013	72823715.0900	694380.5538	97027534.4200	8773736.7200	69507290.5100	50284302.8800	22539412.2100	0.0000	49027195.3100	20480095.2100	0.0000	46029510.2000	26794204.8900	43706909.8900	25800380.6200	580155.1909	114225.3629	4436895.0250	972664.2303	3364177.4650
931	23	2013	27922536.1700	227845.7494	30370770.3000	4229718.1030	25626691.6400	19063730.8200	8858805.3460	0.0000	16969135.6100	8657556.0300	0.0000	15129799.4300	12792736.7400	13943398.2600	11683293.3800	186106.2523	41739.4970	2451286.8590	1408694.9650	369736.2790
932	21	2013	9825234.1890	33354.5564	25813024.6000	1170747.9120	9166468.9270	6414191.1200	3411043.0690	0.0000	5960903.4370	3205565.4900	0.0000	7338967.9810	2486266.2080	6849913.9360	2316554.9910	24408.6906	8945.8658	592049.4031	129790.1514	448908.3579
\.


--
-- Name: city_metrics_cost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_cost_id_seq', 932, true);


--
-- Data for Name: city_metrics_demographicdata; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_demographicdata (id, city_id, year, population, jobs, households) FROM stdin;
611	2	2008	390131.0000	291460.0000	168669.0000
612	3	2008	288055.0000	183459.0000	115088.0000
613	4	2008	102437.0000	84203.0000	42058.0000
614	5	2008	85220.0000	61251.0000	36480.0000
615	6	2008	33676.0000	17177.0000	15014.0000
616	7	2008	17481.0000	10227.0000	8523.0000
617	8	2008	47221.0000	40212.0000	22347.0000
618	9	2008	8437.0000	2989.0000	4079.0000
619	10	2008	48169.0000	49202.0000	21285.0000
620	11	2008	5746.0000	5842.0000	2256.0000
621	12	2008	36717.0000	27862.0000	14890.0000
622	13	2008	24679.0000	12098.0000	10080.0000
623	14	2008	63005.0000	24735.0000	23746.0000
624	15	2008	27230.0000	8579.0000	10959.0000
625	22	2008	85238.0000	91165.0000	36729.0000
626	16	2008	26036.0000	11873.0000	10455.0000
627	17	2008	65847.0000	51349.0000	25561.0000
628	18	2008	62610.0000	50471.0000	24166.0000
629	19	2008	51756.0000	48779.0000	22256.0000
630	20	2008	58430.0000	19684.0000	21723.0000
631	23	2008	20956.0000	6788.0000	7231.0000
632	21	2008	8389.0000	1886.0000	2794.0000
633	2	2009	386691.0000	281710.0000	169798.0000
634	3	2009	287501.0000	176976.0000	115435.0000
635	4	2009	104578.0000	83446.0000	42930.0000
636	5	2009	85530.0000	58681.0000	36624.0000
637	6	2009	33859.0000	16066.0000	14997.0000
638	7	2009	17290.0000	10382.0000	8433.0000
639	8	2009	46293.0000	39809.0000	22390.0000
640	9	2009	8514.0000	3003.0000	4136.0000
641	10	2009	49491.0000	47006.0000	21357.0000
642	11	2009	5762.0000	5318.0000	2268.0000
643	12	2009	37755.0000	27005.0000	15094.0000
644	13	2009	24734.0000	11362.0000	10138.0000
645	14	2009	63162.0000	23697.0000	23734.0000
646	15	2009	27344.0000	8399.0000	11097.0000
647	22	2009	84701.0000	84660.0000	36812.0000
648	16	2009	25882.0000	11588.0000	10424.0000
649	17	2009	65933.0000	49333.0000	25562.0000
650	18	2009	62536.0000	49025.0000	24300.0000
651	19	2009	51451.0000	46281.0000	22215.0000
652	20	2009	59338.0000	18936.0000	22310.0000
653	23	2009	21521.0000	6572.0000	7503.0000
654	21	2009	8326.0000	1777.0000	2814.0000
655	2	2010	382578.0000	282500.0000	163540.0000
656	3	2010	285068.0000	176126.0000	111001.0000
657	4	2010	106769.0000	81824.0000	43025.0000
658	5	2010	86265.0000	58682.0000	35705.0000
659	6	2010	35228.0000	15599.0000	14818.0000
660	7	2010	17591.0000	11015.0000	8366.0000
661	8	2010	45250.0000	40720.0000	21743.0000
662	9	2010	8226.0000	2984.0000	3848.0000
663	10	2010	47941.0000	47676.0000	20672.0000
664	11	2010	5321.0000	5315.0000	2131.0000
665	12	2010	38018.0000	27643.0000	14882.0000
666	13	2010	23797.0000	11284.0000	9945.0000
667	14	2010	61476.0000	23366.0000	23532.0000
668	15	2010	27378.0000	8678.0000	10948.0000
669	22	2010	82893.0000	86607.0000	35905.0000
670	16	2010	25043.0000	11676.0000	10402.0000
671	17	2010	64206.0000	49958.0000	25249.0000
672	18	2010	60797.0000	48808.0000	23930.0000
673	19	2010	49734.0000	44337.0000	21901.0000
674	20	2010	61961.0000	19424.0000	22594.0000
675	23	2010	21874.0000	6734.0000	7587.0000
676	21	2010	8069.0000	1950.0000	2779.0000
677	2	2011	387873.0000	288761.0000	166110.0000
678	3	2011	286367.0000	175967.0000	111620.0000
679	4	2011	107630.0000	82288.0000	43386.0000
680	5	2011	86256.0000	58102.0000	35722.0000
681	6	2011	35376.0000	17601.0000	14891.0000
682	7	2011	17701.0000	11494.0000	8440.0000
683	8	2011	45505.0000	40579.0000	21890.0000
684	9	2011	8333.0000	3145.0000	3881.0000
685	10	2011	48262.0000	49018.0000	20848.0000
686	11	2011	5385.0000	5287.0000	2146.0000
687	12	2011	38374.0000	27619.0000	15033.0000
688	13	2011	23820.0000	11436.0000	9990.0000
689	14	2011	61766.0000	23645.0000	23601.0000
690	15	2011	27538.0000	9294.0000	11033.0000
691	22	2011	83671.0000	87803.0000	36256.0000
692	16	2011	25118.0000	12106.0000	10436.0000
693	17	2011	64456.0000	49787.0000	25373.0000
694	18	2011	61151.0000	49512.0000	24068.0000
695	19	2011	50046.0000	43509.0000	22133.0000
696	20	2011	63143.0000	20393.0000	23081.0000
697	23	2011	22139.0000	7015.0000	7666.0000
698	21	2011	8063.0000	2015.0000	2703.0000
699	2	2012	392008.0000	298367.0000	166513.0000
700	3	2012	289270.0000	174242.0000	111949.0000
701	4	2012	108814.0000	84816.0000	43801.0000
702	5	2012	86033.0000	57525.0000	35690.0000
703	6	2012	35979.0000	17321.0000	15012.0000
704	7	2012	17939.0000	12975.0000	8481.0000
705	8	2012	46230.0000	40870.0000	22049.0000
706	9	2012	8597.0000	3253.0000	3884.0000
707	10	2012	48829.0000	49883.0000	20905.0000
708	11	2012	5426.0000	4243.0000	2150.0000
709	12	2012	39065.0000	28697.0000	15168.0000
710	13	2012	24074.0000	12027.0000	10014.0000
711	14	2012	61850.0000	24563.0000	23680.0000
712	15	2012	27699.0000	9610.0000	11090.0000
713	22	2012	85632.0000	87040.0000	36873.0000
714	16	2012	25429.0000	11182.0000	10469.0000
715	17	2012	64972.0000	52682.0000	25522.0000
716	18	2012	62004.0000	51131.0000	24160.0000
717	19	2012	50747.0000	45105.0000	22233.0000
718	20	2012	64238.0000	20522.0000	23464.0000
719	23	2012	22384.0000	6925.0000	7739.0000
720	21	2012	7997.0000	1923.0000	2750.0000
721	2	2007	388020.0000	293416.0000	167367.0000
722	3	2007	287669.0000	181431.0000	114409.0000
723	4	2007	100845.0000	85487.0000	41403.0000
724	5	2007	85439.0000	60623.0000	36414.0000
725	6	2007	33107.0000	16867.0000	14974.0000
726	7	2007	17526.0000	11808.0000	8514.0000
727	8	2007	45216.0000	43137.0000	22032.0000
728	9	2007	8500.0000	2980.0000	4045.0000
729	10	2007	47090.0000	48383.0000	21250.0000
730	11	2007	5709.0000	5017.0000	2242.0000
731	12	2007	36663.0000	28931.0000	14818.0000
732	13	2007	24776.0000	12387.0000	10081.0000
733	14	2007	63081.0000	24613.0000	23746.0000
734	15	2007	27518.0000	8791.0000	11002.0000
735	22	2007	85504.0000	91125.0000	36791.0000
736	16	2007	26159.0000	12944.0000	10467.0000
737	17	2007	67106.0000	52193.0000	25536.0000
738	18	2007	62090.0000	51667.0000	23957.0000
739	19	2007	51499.0000	47546.0000	22092.0000
740	20	2007	57279.0000	20514.0000	21350.0000
741	23	2007	20917.0000	7469.0000	7104.0000
742	21	2007	8182.0000	1846.0000	2787.0000
743	2	2013	400938.0000	303349.0000	170195.0000
744	3	2013	296542.0000	175336.0000	114047.0000
745	4	2013	110393.0000	86634.0000	44314.0000
746	5	2013	86139.0000	58996.0000	35874.0000
747	6	2013	36041.0000	16731.0000	15133.0000
748	7	2013	18413.0000	14052.0000	8628.0000
749	8	2013	47321.0000	41789.0000	22651.0000
750	9	2013	8516.0000	3315.0000	3967.0000
751	10	2013	49216.0000	48705.0000	21313.0000
752	11	2013	5445.0000	4582.0000	2162.0000
753	12	2013	38950.0000	29185.0000	15289.0000
754	13	2013	24100.0000	11925.0000	10125.0000
755	14	2013	62684.0000	25221.0000	23910.0000
756	15	2013	28142.0000	9680.0000	11222.0000
757	22	2013	85935.0000	89633.0000	37156.0000
758	16	2013	25630.0000	11077.0000	10657.0000
759	17	2013	66301.0000	54343.0000	25890.0000
760	18	2013	62729.0000	51054.0000	24466.0000
761	19	2013	50841.0000	47152.0000	22416.0000
762	20	2013	65746.0000	21029.0000	23964.0000
763	23	2013	22605.0000	7157.0000	7821.0000
764	21	2013	8773.0000	2309.0000	2844.0000
\.


--
-- Name: city_metrics_demographicdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_demographicdata_id_seq', 764, true);


--
-- Data for Name: city_metrics_emissions; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_emissions (id, city_id, year, energy_associated_emissions, water_associated_emissions, travel_associated_emissions, waste_associated_emissions, wn_energy_associated_emissions, wn_water_associated_emissions, wn_travel_associated_emissions, wn_waste_associated_emissions, energy_type_electricity, wn_energy_type_electricity, energy_type_natural_gas, wn_energy_type_natural_gas, energy_type_other, wn_energy_type_other, energy_use_residential, wn_energy_use_residential, energy_use_com_ind, wn_energy_use_com_ind, waste_method_recycled, waste_method_landfilled, waste_method_incinerated) FROM stdin;
599	2	2007	4045940.5950	594510.9030	1139694.8470	123093.4920	3855073.0800	594510.9030	1139694.8470	123093.4920	2546922.0690	2316167.9110	1420818.8630	1458624.7300	78199.6620	80280.4390	1132299.1640	1095809.2920	2913641.4310	2759263.7880	0.0000	36573.7760	86519.7160
600	3	2007	2721344.0440	369922.6900	916532.7660	116620.4080	2580916.7770	369922.6900	916532.7660	116620.4080	1733021.6290	1570770.8220	979787.1610	1001422.2300	8535.2550	8723.7250	843221.8110	813684.4660	1878122.2330	1767232.3120	0.0000	78837.7580	37782.6500
601	4	2007	1262987.3510	34388.5320	299639.8930	44444.9310	1170709.2840	34388.5320	299639.8930	44444.9310	1016502.9130	923094.5370	246484.4380	247614.7470	0.0000	0.0000	451519.9980	427603.0320	811467.3530	743106.2530	0.0000	24222.8450	20222.0860
602	5	2007	1795363.8250	49682.0610	310548.5680	15681.5530	1619262.5030	49682.0610	310548.5680	15681.5530	1354427.7130	1163008.0300	282259.0090	362443.7800	158677.1030	93810.6930	488667.7770	457680.5150	1306696.0470	1161581.9880	0.0000	15681.5530	0.0000
603	6	2007	227520.4110	80318.8030	151210.5830	11616.7800	216301.0420	80318.8030	151210.5830	11616.7800	147371.3250	134019.3080	80149.0860	82281.7330	0.0000	0.0000	109977.1410	105631.4360	117543.2700	110669.6050	0.0000	6054.0950	5562.6850
604	7	2007	172447.9270	20988.5050	55740.4540	6149.6260	163350.8210	20988.5050	55740.4540	6149.6260	118382.8250	109160.3670	54065.1020	54190.4540	0.0000	0.0000	48360.1590	46096.3950	124087.7680	117254.4250	0.0000	3204.8830	2944.7430
605	8	2007	463004.0690	59611.7110	196096.6380	15865.6570	439915.5050	59611.7110	196096.6380	15865.6570	302094.5620	274724.4360	160909.5070	165191.0690	0.0000	0.0000	155620.5150	149416.8220	307383.5540	290498.6830	0.0000	8268.4020	7597.2560
606	9	2007	64481.8480	16130.0660	14282.7290	3162.3590	62765.4810	16130.0660	14282.7290	3162.3590	39448.3650	38408.2950	25033.4830	24357.1860	0.0000	0.0000	27574.4750	26839.4910	36907.3730	35925.9900	0.0000	1854.6990	1307.6600
607	10	2007	556953.3240	64337.2110	230692.2050	16523.2180	528597.2870	64337.2110	230692.2050	16523.2180	368363.1700	334989.0300	188590.1540	193608.2570	0.0000	0.0000	220157.2240	211712.6420	336796.1000	316884.6450	0.0000	8611.0900	7912.1280
608	11	2007	63377.6600	12238.1920	15745.3430	2314.4170	64812.2600	12238.1920	15745.3430	2314.4170	13145.7210	11869.5930	47799.6850	50379.1580	2432.2540	2563.5090	14807.9910	14386.6960	48569.6690	50425.5640	0.0000	1564.5920	749.8240
609	12	2007	304105.3170	50212.3400	159962.6240	14863.1030	288090.0720	50212.3400	159962.6240	14863.1030	200132.8350	177534.5700	103972.4810	110555.5020	0.0000	0.0000	128134.3320	123710.8210	175970.9850	164379.2510	0.0000	10047.7590	4815.3440
610	13	2007	191598.9100	39472.5670	106095.6730	9794.1050	185486.3690	39472.5670	106095.6730	9794.1050	112864.3460	108304.1700	78734.5640	77182.1990	0.0000	0.0000	93733.3040	90931.5270	97865.6060	94554.8420	0.0000	6621.0130	3173.0920
611	14	2007	536999.7530	48357.3110	256925.9500	15025.7560	512865.0400	48357.3110	256925.9500	15025.7560	397605.4330	376219.0800	139394.3200	136645.9600	0.0000	0.0000	247793.6870	237416.1540	289206.0660	275448.8860	0.0000	6146.3950	8879.3610
612	15	2007	171953.1240	29476.4030	115193.5610	4594.9250	164436.3280	29476.4030	115193.5610	4594.9250	112221.1550	104078.9260	59731.9700	60357.4020	0.0000	0.0000	90296.1900	87164.1010	81656.9350	77272.2270	0.0000	1646.0350	2948.8910
613	22	2007	1160732.9770	103313.6820	605247.4600	30002.1490	1090667.8150	103313.6820	605247.4600	30002.1490	861281.4460	783248.3260	299451.5300	307419.4880	0.0000	0.0000	300320.9530	288233.6140	860412.0230	802434.2000	0.0000	15635.6470	14366.5020
614	16	2007	206617.7370	27222.7580	109622.9390	10604.8040	197670.9500	27222.7580	109622.9390	10604.8040	143023.6100	135330.6730	63594.1270	62340.2770	0.0000	0.0000	100868.6870	96985.4610	105749.0500	100685.4890	0.0000	7169.0620	3435.7420
615	17	2007	960606.1860	93492.0280	338206.1100	11054.3300	894371.4910	93492.0280	338206.1100	11054.3300	783168.9470	712212.9120	177437.2390	182158.5790	0.0000	0.0000	314185.9980	297429.9680	646420.1880	596941.5230	0.0000	8910.6110	2143.7190
616	18	2007	677710.0040	69014.6670	258188.0700	21786.5060	640120.2840	69014.6670	258188.0700	21786.5060	488156.7180	450127.5120	189553.2860	189992.7720	0.0000	0.0000	244947.6010	234429.8380	432762.4030	405690.4460	0.0000	11354.0570	10432.4490
617	19	2007	575933.4240	59792.9920	313295.8390	18070.2730	546362.7130	59792.9920	313295.8390	18070.2730	402988.6670	371333.3950	172944.7570	175029.3180	0.0000	0.0000	230191.1260	221343.1790	345742.2980	325019.5340	0.0000	9417.3390	8652.9340
618	20	2007	422258.7900	62038.2720	257584.2120	9564.3840	404814.2760	62038.2720	257584.2120	9564.3840	278902.2290	261412.8000	143356.5610	143401.4770	0.0000	0.0000	236838.7140	228609.0550	185420.0760	176205.2220	0.0000	3426.2380	6138.1460
619	23	2007	171340.6050	12506.4800	90966.2980	3445.6450	161868.7480	12506.4800	90966.2980	3445.6450	122606.5980	110639.2550	48734.0070	51229.4930	0.0000	0.0000	93577.7360	89547.0710	77762.8690	72321.6770	0.0000	2777.4450	668.1990
620	21	2007	53949.4080	5149.2840	64437.5840	1366.2210	51756.1890	5149.2840	64437.5840	1366.2210	31827.6310	28233.7720	22121.7760	23522.4170	0.0000	0.0000	38604.3620	37313.2640	15345.0460	14442.9250	0.0000	489.4200	876.8010
621	2	2008	4107415.5130	521333.8820	1073635.2490	101275.8360	3925024.4040	521333.8820	1073635.2490	101275.8360	2461670.1910	2388251.9570	1567545.6600	1463750.7680	78199.6620	73021.6790	1185895.1570	1126627.0300	2921520.3560	2798397.3740	0.0000	28834.8410	72440.9950
622	3	2008	2745846.8640	321675.4660	886398.4550	109387.3740	2607883.9310	321675.4660	886398.4550	109387.3740	1665286.4770	1605547.3350	1072025.1320	994419.2240	8535.2550	7917.3720	855212.7310	807453.2090	1890634.1330	1800430.7210	0.0000	71989.7600	37397.6150
623	4	2008	1292763.7730	32033.4400	319985.5640	42734.5850	1247393.0090	32033.4400	319985.5640	42734.5850	983927.6130	958989.3550	308836.1600	288403.6540	0.0000	0.0000	460973.8180	441024.8810	831789.9550	806368.1280	0.0000	23600.0800	19134.5060
624	5	2008	1841706.7170	49293.7250	302635.7660	15619.9990	1666900.9560	49293.7250	302635.7660	15619.9990	1395089.6320	1228737.4800	279555.6740	346328.8510	167061.4110	91834.6240	493045.3280	456615.8320	1348661.3880	1210285.1230	0.0000	15619.9990	0.0000
625	6	2008	235323.0960	66266.5710	139166.9990	10090.8360	224794.7120	66266.5710	139166.9990	10090.8360	142895.5600	138487.2570	92427.5360	86307.4550	0.0000	0.0000	115404.2400	109836.9810	119918.8560	114957.7310	0.0000	4701.3040	5389.5320
626	7	2008	174796.6430	18421.0760	55044.2680	5238.0900	168437.3650	18421.0760	55044.2680	5238.0900	112377.0840	110846.6560	62419.5590	57590.7090	0.0000	0.0000	48946.4840	46898.0960	125850.1590	121539.2690	0.0000	2440.4180	2797.6720
627	8	2008	469424.9400	52224.9560	192427.9200	14056.1300	448595.2480	52224.9560	192427.9200	14056.1300	289925.4370	280981.2880	179499.5030	167613.9600	0.0000	0.0000	159917.1840	152242.3970	309507.7570	296352.8510	0.0000	6498.8460	7557.2840
628	9	2008	65905.2050	14097.9080	13987.1110	2751.8950	64941.6430	14097.9080	13987.1110	2751.8950	37609.7030	39644.2870	28295.5020	25297.3560	0.0000	0.0000	28867.3180	28096.7450	37037.8880	36844.8980	0.0000	1496.7960	1255.0990
629	10	2008	558504.6040	56705.4430	224377.4960	14338.3180	533736.3450	56705.4430	224377.4960	14338.3180	345342.6740	334688.9130	213161.9300	199047.4320	0.0000	0.0000	225466.3370	214521.5880	333038.2670	319214.7570	0.0000	6629.3160	7709.0030
630	11	2008	63871.0660	10727.4540	15259.8140	2182.0130	60147.4010	10727.4540	15259.8140	2182.0130	12220.7220	12583.8930	49218.0900	45323.7060	2432.2540	2239.8020	15166.3120	14786.7910	48704.7540	45360.6100	0.0000	1436.0210	745.9920
631	12	2008	307725.9470	44042.5150	168479.1850	13943.0880	299570.8090	44042.5150	168479.1850	13943.0880	191243.5950	191385.6780	116482.3510	108185.1300	0.0000	0.0000	128380.2400	123982.9340	179345.7070	175587.8740	0.0000	9176.1920	4766.8960
632	13	2008	189550.1750	32709.0450	101487.1010	9157.6100	186704.0160	32709.0450	101487.1010	9157.6100	112490.4920	117429.8760	77059.6840	69274.1400	0.0000	0.0000	91759.4760	89263.8490	97790.7000	97440.1670	0.0000	6026.7850	3130.8260
633	14	2008	529179.7550	42792.9600	249997.4810	14953.3910	522211.4610	42792.9600	249997.4810	14953.3910	368507.2170	377772.0940	160672.5380	144439.3670	0.0000	0.0000	250021.7710	243379.5790	279157.9840	278831.8820	0.0000	5542.6000	9410.7910
634	15	2008	182212.4400	25962.4690	113939.2880	4526.4990	177679.5720	25962.4690	113939.2880	4526.4990	117352.8020	117439.9880	64859.6380	60239.5840	0.0000	0.0000	91011.5960	87816.9310	91200.8440	89862.6410	0.0000	1614.4330	2912.0660
635	22	2008	1155975.7660	90517.7960	593674.7900	25372.5330	1109234.6550	90517.7960	593674.7900	25372.5330	818945.7080	794521.0110	337030.0580	314713.6440	0.0000	0.0000	309535.2220	294798.2830	846440.5440	814436.3720	0.0000	11730.9810	13641.5530
636	16	2008	207791.1570	22747.2180	104576.8870	9887.0340	204125.2780	22747.2180	104576.8870	9887.0340	137332.3490	140785.1100	70458.8080	63340.1680	0.0000	0.0000	101948.7010	98106.3980	105842.4550	106018.8800	0.0000	6506.8320	3380.2030
637	17	2008	942334.9920	81838.8630	336769.9790	11879.3500	906107.2960	81838.8630	336769.9790	11879.3500	739965.1670	717137.3710	202369.8250	188969.9260	0.0000	0.0000	298348.9930	285148.1000	643985.9990	620959.1960	0.0000	9429.9550	2449.3950
638	18	2008	678821.9940	61566.2910	266322.5130	18636.9260	655853.4850	61566.2910	266322.5130	18636.9260	463520.5660	457208.0300	215301.4280	198645.4560	0.0000	0.0000	249174.8400	237982.6900	429647.1540	417870.7950	0.0000	8616.7750	10020.1510
639	19	2008	582924.3100	52191.6160	306826.7000	15406.0490	562293.4210	52191.6160	306826.7000	15406.0490	387154.5020	380021.4140	195769.8080	182272.0070	0.0000	0.0000	236017.6060	225741.3060	346906.7040	336552.1160	0.0000	7122.9810	8283.0690
640	20	2008	427186.3480	54514.8720	287298.5490	9712.9390	413697.6470	54514.8720	287298.5490	9712.9390	267554.7300	266965.4030	159631.6170	146732.2440	0.0000	0.0000	239460.3440	229802.4950	187726.0040	183895.1510	0.0000	3464.2410	6248.6970
641	23	2008	171234.0780	10997.2600	79123.3310	3780.6380	164149.4080	10997.2600	79123.3310	3780.6380	115888.2150	111009.1090	55345.8630	53140.2990	0.0000	0.0000	94594.5500	90699.4850	76639.5270	73449.9230	0.0000	3001.1110	779.5270
642	21	2008	54246.7230	4516.0230	63486.1730	1393.2190	51511.4910	4516.0230	63486.1730	1393.2190	29852.5950	27993.0340	24394.1290	23518.4570	0.0000	0.0000	38827.4110	36909.5700	15419.3130	14601.9210	0.0000	496.0710	897.1470
643	2	2009	3797049.6870	416161.1860	1050994.2250	86833.8100	3750116.8020	416161.1860	1050994.2250	86833.8100	2237823.3270	2222644.2920	1490397.3210	1460045.1830	68829.0390	67427.3270	1122012.9140	1105791.1490	2675036.7730	2644325.6530	0.0000	23712.2690	63121.5410
644	3	2009	2455006.5590	277685.3690	878768.9380	96061.6240	2438370.5000	277685.3690	878768.9380	96061.6240	1441487.6860	1467587.0450	1004983.6180	962608.0920	8535.2550	8175.3620	803250.9530	790947.0570	1651755.6060	1647423.4430	0.0000	56101.4170	39960.2070
645	4	2009	1214493.9840	32273.6670	319785.3990	35216.3990	1238286.0140	32273.6670	319785.3990	35216.3990	904954.8650	940276.7200	309539.1190	298009.2930	0.0000	0.0000	446019.0000	448416.7540	768474.9850	789869.2590	0.0000	15507.3900	19709.0090
646	5	2009	1718930.6040	43674.2310	303974.1070	14331.8830	1593457.5960	43674.2310	303974.1070	14331.8830	1294202.9450	1168263.8930	261577.0300	333609.1270	163150.6280	91584.5760	476392.5040	450564.2990	1242538.1000	1142893.2960	0.0000	14331.8830	0.0000
647	6	2009	218656.8510	56858.9740	139751.3100	8259.3650	215976.5480	56858.9740	139751.3100	8259.3650	130514.5740	129629.3000	88142.2770	86347.2480	0.0000	0.0000	107513.8310	106048.5310	111143.0200	109928.0180	0.0000	3488.7140	4770.6510
648	7	2009	164805.8520	15819.6810	51593.7900	4217.6210	164583.5020	15819.6810	51593.7900	4217.6210	106379.2800	108087.5600	58426.5710	56495.9420	0.0000	0.0000	45678.9060	45390.1680	119126.9460	119193.3340	0.0000	1781.5020	2436.1190
649	8	2009	437574.4280	45076.2980	191715.1780	11292.4420	432271.5050	45076.2980	191715.1780	11292.4420	265666.9570	263864.9520	171907.4710	168406.5530	0.0000	0.0000	150012.9160	147977.6180	287561.5120	284293.8870	0.0000	4769.8700	6522.5720
650	9	2009	61792.9770	12020.8070	12969.5580	2383.8530	62796.8380	12020.8070	12969.5580	2383.8530	33951.8690	36678.8790	27841.1080	26117.9590	0.0000	0.0000	27103.4110	27244.4630	34689.5660	35552.3760	0.0000	1189.8790	1193.9740
651	10	2009	523554.5620	48956.8950	223713.2930	12072.5430	517182.2220	48956.8950	223713.2930	12072.5430	315848.8290	313706.4430	207705.7330	203475.7780	0.0000	0.0000	213925.1090	210983.6960	309629.4530	306198.5260	0.0000	5099.3810	6973.1620
652	11	2009	58965.3500	9173.8440	15073.8950	1925.2350	57833.5680	9173.8440	15073.8950	1925.2350	11004.4360	11945.9920	45887.5440	43903.8360	2073.3700	1983.7390	14012.7260	14274.4020	44952.6240	43559.1660	0.0000	1124.3660	800.8690
653	12	2009	287213.0000	37768.0450	167991.7260	12614.9360	292247.4830	37768.0450	167991.7260	12614.9360	175760.2900	184689.2890	111452.7100	107558.1940	0.0000	0.0000	121749.1550	122735.7760	165463.8460	169511.7070	0.0000	7367.3100	5247.6260
654	13	2009	176323.3290	28170.6180	98981.9460	8074.1200	179446.8820	28170.6180	98981.9460	8074.1200	102154.6460	110262.1570	74168.6840	69184.7250	0.0000	0.0000	86688.0210	87169.8170	89635.3080	92277.0650	0.0000	4715.4060	3358.7140
655	14	2009	510285.8940	37245.7910	242181.6790	13626.6800	521152.3550	37245.7910	242181.6790	13626.6800	359723.6840	380707.5660	150562.2100	140444.7890	0.0000	0.0000	241644.4350	243724.0670	268641.4590	277428.2880	0.0000	4300.2170	9326.4620
656	15	2009	167613.0960	22437.6570	113726.0270	4094.3330	170781.7800	22437.6570	113726.0270	4094.3330	105260.7890	110608.2630	62352.3070	60173.5170	0.0000	0.0000	85384.7010	85995.9620	82228.3950	84785.8170	0.0000	1022.3780	3071.9550
657	22	2009	1056363.2160	81549.1630	595163.8300	20661.4640	1044856.9130	81549.1630	595163.8300	20661.4640	736749.8780	731752.5440	319613.3370	313104.3690	0.0000	0.0000	290562.8920	286607.0930	765800.3230	758249.8210	0.0000	8727.2980	11934.1660
658	16	2009	196167.8440	19633.6010	102314.0740	8647.8550	199180.3870	19633.6010	102314.0740	8647.8550	129008.4560	136533.9490	67159.3880	62646.4370	0.0000	0.0000	95919.0270	95360.7480	100248.8170	103819.6380	0.0000	5050.4760	3597.3790
659	17	2009	914103.2840	72868.0780	336657.0140	11185.6170	905302.9730	72868.0780	336657.0140	11185.6170	722676.2150	717774.3410	191427.0690	187528.6320	0.0000	0.0000	294625.4470	291172.8120	619477.8380	614130.1610	0.0000	8548.3800	2637.2370
660	18	2009	629703.2740	54157.1720	259027.7410	15254.6640	629617.5660	54157.1720	259027.7410	15254.6640	422019.0000	428795.9470	207684.2750	200821.6180	0.0000	0.0000	235515.8580	233429.9130	394187.4160	396187.6530	0.0000	6443.4930	8811.1710
661	19	2009	542687.5770	44907.4140	307407.5670	12550.6540	542348.5350	44907.4140	307407.5670	12550.6540	355611.4460	360636.3910	187076.1310	181712.1450	0.0000	0.0000	221231.3420	219524.8260	321456.2360	322823.7090	0.0000	5301.3330	7249.3210
662	20	2009	408529.9810	46774.0140	290754.6010	8884.9310	407043.7120	46774.0140	290754.6010	8884.9310	250706.7370	256487.5960	157823.2440	150556.1150	0.0000	0.0000	229613.5990	226995.7000	178916.3820	180048.0110	0.0000	2218.6170	6666.3140
663	23	2009	165197.6930	9499.4930	77243.6690	3651.0650	162161.6270	9499.4930	77243.6690	3651.0650	110948.5370	107649.2370	54249.1560	54512.3900	0.0000	0.0000	92244.1990	90795.4060	72953.4930	71366.2210	0.0000	2790.2520	860.8130
664	21	2009	50840.8120	4072.1220	63503.5490	1246.6870	50330.1890	4072.1220	63503.5490	1246.6870	27678.0540	27263.6540	23162.7580	23066.5350	0.0000	0.0000	36972.4270	36616.2260	13868.3850	13713.9630	0.0000	311.3050	935.3830
665	2	2010	3562430.8320	494072.8270	1059169.0320	86657.8210	3466363.2980	494072.8270	1059169.0320	86657.8210	2110742.3030	1948265.5860	1389483.2820	1453046.8130	62205.2470	65050.8990	1062879.1720	1051639.7390	2499551.6600	2414723.5590	0.0000	21882.3010	64775.5200
666	3	2010	2329519.1150	253073.4710	869140.0710	81589.2050	2258245.6590	253073.4710	869140.0710	81589.2050	1435855.2210	1351918.4110	885128.6390	897671.0480	8535.2550	8656.2010	753302.5500	738112.5610	1576216.5650	1520133.0990	0.0000	44512.6750	37076.5300
667	4	2010	1163683.1110	28644.9470	330147.2410	38772.7860	1099763.5400	28644.9470	330147.2410	38772.7860	869876.6600	805499.5070	293806.4500	294264.0330	0.0000	0.0000	430352.5860	412256.3530	733330.5250	687507.1870	0.0000	13559.4990	25213.2870
668	5	2010	1847997.1110	41444.9500	305354.5400	13896.8490	1697218.8840	41444.9500	305354.5400	13896.8490	1375734.5210	1189846.5830	255296.2710	344701.1860	216966.3190	162671.1160	453855.1120	433258.4400	1394141.9990	1263960.4440	0.0000	13896.8490	0.0000
669	6	2010	202944.1110	63928.9740	158479.6130	7112.1770	197169.7460	63928.9740	158479.6130	7112.1770	122702.0960	113256.9670	80242.0150	83912.7790	0.0000	0.0000	100589.6030	98882.0540	102354.5070	98287.6920	0.0000	3223.5480	3888.6290
670	7	2010	155117.7090	17617.4080	50347.4650	3551.4450	149297.9720	17617.4080	50347.4650	3551.4450	102705.7990	95308.7750	52411.9110	53989.1970	0.0000	0.0000	43822.5680	42594.4050	111295.1420	106703.5670	0.0000	1609.6700	1941.7750
671	8	2010	416777.4800	49827.2880	189563.7280	9135.5170	403791.6460	49827.2880	189563.7280	9135.5170	261173.5140	241069.3940	155603.9670	162722.2510	0.0000	0.0000	142333.1950	139673.0690	274444.2850	264118.5770	0.0000	4140.6140	4994.9030
672	9	2010	58888.1050	13564.8130	13580.0570	1973.6250	58397.7560	13564.8130	13580.0570	1973.6250	33678.2940	33146.8820	25209.8110	25250.8740	0.0000	0.0000	25453.8950	25271.1470	33434.2100	33126.6090	0.0000	1006.4870	967.1380
673	10	2010	501794.8270	54132.7730	220778.2570	9678.8030	486799.5620	54132.7730	220778.2570	9678.8030	309238.5330	285434.5560	192556.2940	201365.0060	0.0000	0.0000	203566.9640	200186.5520	298227.8630	286613.0090	0.0000	4386.8550	5291.9480
674	11	2010	55491.6330	10179.3690	15381.6910	1522.9210	55669.1760	10179.3690	15381.6910	1522.9210	11585.9380	11478.5230	42850.7750	43128.8860	1054.9210	1061.7670	13053.3690	13034.2680	42438.2640	42634.9090	0.0000	830.8610	692.0600
675	12	2010	271399.7930	42008.3780	168037.5120	10881.1170	267163.0690	42008.3780	168037.5120	10881.1170	169496.6810	163698.6810	101903.1120	103464.3890	0.0000	0.0000	115870.9880	114611.7450	155528.8050	152551.3250	0.0000	5936.4180	4944.6990
676	13	2010	165123.5260	31386.7630	99204.0660	6652.7180	162677.7040	31386.7630	99204.0660	6652.7180	98201.6840	96572.3530	66921.8420	66105.3510	0.0000	0.0000	81598.2300	80416.2760	83525.2960	82261.4280	0.0000	3629.5280	3023.1900
677	14	2010	482849.8490	40672.0510	244902.9390	11207.8910	470343.5170	40672.0510	244902.9390	11207.8910	342840.4600	332042.3350	140009.3900	138301.1810	0.0000	0.0000	230297.2130	224760.3310	252552.6370	245583.1850	0.0000	3049.8470	8158.0430
678	15	2010	159671.5400	25078.3130	109874.2060	3739.0770	156994.4800	25078.3130	109874.2060	3739.0770	103444.1460	99905.6150	56227.3940	57088.8650	0.0000	0.0000	80884.1570	80044.8370	78787.3830	76949.6430	0.0000	926.9590	2812.1180
679	22	2010	1011182.7730	86216.9630	509907.9200	16735.2580	969190.9390	86216.9630	509907.9200	16735.2580	719099.8720	663746.3660	292082.9010	305444.5730	0.0000	0.0000	277189.9120	272153.4080	733992.8610	697037.5310	0.0000	7585.1480	9150.1100
680	16	2010	186009.8790	21643.6670	101865.1390	7167.5480	181315.2130	21643.6670	101865.1390	7167.5480	125689.1050	121730.3930	60320.7740	59584.8200	0.0000	0.0000	89835.3360	87852.1620	96174.5430	93463.0510	0.0000	3910.4040	3257.1440
681	17	2010	871711.8080	78148.4640	330588.7470	11761.8610	825837.2060	78148.4640	330588.7470	11761.8610	698749.1010	644962.1180	172962.7070	180875.0880	0.0000	0.0000	283393.2640	273612.3910	588318.5440	552224.8150	0.0000	9090.5080	2671.3530
682	18	2010	592861.8820	58789.6560	261779.6940	12274.2990	569544.3880	58789.6560	261779.6940	12274.2990	403064.1260	374034.8490	189797.7570	195509.5390	0.0000	0.0000	223678.4030	218686.9390	369183.4790	350857.4490	0.0000	5563.2470	6711.0520
683	19	2010	512446.5840	51258.3850	304010.5220	10040.7920	498277.2300	51258.3850	304010.5220	10040.7920	341674.4310	322712.7760	170772.1530	175564.4540	0.0000	0.0000	210296.9690	207234.0540	302149.6150	291043.1760	0.0000	4550.9240	5489.8680
684	20	2010	392343.4750	52389.3070	252741.1940	8462.1580	383334.8150	52389.3070	252741.1940	8462.1580	248709.9860	237966.0800	143633.4890	145368.7350	0.0000	0.0000	220916.9350	217127.4490	171426.5400	166207.3660	0.0000	2097.8640	6364.2940
685	23	2010	160904.4010	11024.9720	77623.2810	4007.0860	153770.2450	11024.9720	77623.2810	4007.0860	111044.5360	100671.6440	49859.8650	53098.6010	0.0000	0.0000	89876.4300	86984.1240	71027.9710	66786.1210	0.0000	3096.9970	910.0890
686	21	2010	47923.2810	4518.5690	64917.1220	1102.0020	46809.7800	4518.5690	64917.1220	1102.0020	27350.1910	25105.0260	20573.0900	21704.7540	0.0000	0.0000	34832.2920	34204.4470	13090.9890	12605.3330	0.0000	273.1990	828.8030
687	2	2011	3761285.7500	536495.7540	1053854.6990	88037.1330	3619170.7240	536495.7540	1053854.6990	88037.1330	2170269.5150	1989573.9130	1549035.8120	1586598.4040	41980.4230	42998.4070	1128088.3750	1100900.0110	2633197.3750	2518270.7140	0.0000	18864.9310	69172.2020
688	3	2011	2468947.3130	245972.0470	866528.1760	76678.6610	2367964.5330	245972.0470	866528.1760	76678.6610	1488868.3230	1409107.5200	971543.7360	950506.5750	8535.2550	8350.4380	806916.4910	777515.6180	1662030.8220	1590448.9150	0.0000	35412.0200	41266.6410
689	4	2011	1325410.4740	28582.5000	326015.9910	34312.1610	1262550.4480	28582.5000	326015.9910	34312.1610	833920.9290	768755.5450	491489.5450	493794.9030	0.0000	0.0000	427144.1640	409653.4900	898266.3100	852896.9580	0.0000	8411.8760	25900.2850
690	5	2011	1771214.4820	42720.7320	293011.6720	11880.2340	1594962.5740	42720.7320	293011.6720	11880.2340	1370213.3460	1179993.6360	268439.4290	349172.4640	132561.7070	65796.4740	471818.2040	442509.8810	1299396.2780	1152452.6930	0.0000	11880.2340	0.0000
691	6	2011	216207.4380	69214.0030	157020.7290	7357.9090	207422.0140	69214.0030	157020.7290	7357.9090	130484.9140	119620.8020	85722.5240	87801.2110	0.0000	0.0000	105837.5110	102612.9140	110369.9270	104809.1000	0.0000	2675.9280	4681.9810
692	7	2011	163835.3940	19074.6500	50419.0150	3681.6580	156501.6340	19074.6500	50419.0150	3681.6580	107144.6310	99188.8580	56690.7630	57312.7760	0.0000	0.0000	45267.4110	43592.2820	118567.9830	112909.3520	0.0000	1338.9480	2342.7110
693	8	2011	435090.3290	53984.2260	189049.6250	9464.6560	416661.3700	53984.2260	189049.6250	9464.6560	269555.0670	247112.0410	165535.2620	169549.3290	0.0000	0.0000	148067.0970	143412.2630	287023.2320	273249.1070	0.0000	3442.1110	6022.5450
694	9	2011	62367.7780	14800.2420	14026.2190	1940.1130	61213.7430	14800.2420	14026.2190	1940.1130	34988.7570	34364.5690	27379.0210	26849.1750	0.0000	0.0000	27422.3160	26912.0680	34945.4620	34301.6750	0.0000	805.3430	1134.7700
695	10	2011	518474.5870	58271.1950	219342.9270	10038.0880	497122.8180	58271.1950	219342.9270	10038.0880	315549.5270	289277.0240	202925.0610	207845.7940	0.0000	0.0000	213520.2370	207062.3730	304954.3500	290060.4450	0.0000	3650.6570	6387.4310
696	11	2011	54163.7560	11086.4270	15201.2120	1441.9070	52798.8570	11086.4270	15201.2120	1441.9070	10472.0540	10114.7790	43375.8140	42375.4750	315.8880	308.6030	14363.6470	13955.0460	39800.1090	38843.8110	0.0000	665.9070	776.0000
697	12	2011	282434.1260	45398.8050	165791.7610	10275.1610	271026.1670	45398.8050	165791.7610	10275.1610	174055.2510	164224.7220	108378.8760	106801.4460	0.0000	0.0000	121371.4720	116954.8230	161062.6540	154071.3440	0.0000	4745.3120	5529.8480
698	13	2011	170959.1910	33800.9200	98002.0400	6231.3640	167341.9150	33800.9200	98002.0400	6231.3640	100006.9400	98426.6940	70952.2520	68915.2210	0.0000	0.0000	86090.4280	84186.0390	84868.7630	83155.8760	0.0000	2877.7910	3353.5730
699	14	2011	475711.7330	43554.2810	243303.3260	12146.1070	461383.5720	43554.2810	243303.3260	12146.1070	327676.1560	317598.0800	148035.5770	143785.4920	0.0000	0.0000	227926.3870	221107.3080	247785.3450	240276.2640	0.0000	2994.9040	9151.2030
700	15	2011	168792.2150	27063.6910	111453.7880	4083.3760	161798.8080	27063.6910	111453.7880	4083.3760	108210.3460	102098.6950	60581.8690	59700.1140	0.0000	0.0000	84913.4730	81855.6830	83878.7410	79943.1260	0.0000	967.0290	3116.3460
701	22	2011	1054635.2900	93963.7520	508244.1580	17402.8610	1000730.7130	93963.7520	508244.1580	17402.8610	739275.6510	677723.9130	315359.6390	323006.8000	0.0000	0.0000	291365.2100	282422.6820	763270.0800	718308.0310	0.0000	6329.0820	11073.7790
702	16	2011	196010.2120	23336.2540	102366.5330	6725.6860	190114.3360	23336.2540	102366.5330	6725.6860	131184.1100	127149.3840	64826.1020	62964.9520	0.0000	0.0000	93855.3060	91064.1450	102154.9060	99050.1900	0.0000	3106.0810	3619.6050
703	17	2011	879931.3710	85119.0590	329398.5240	10726.9050	829760.9270	85119.0590	329398.5240	10726.9050	665137.0710	609758.0760	214794.3000	220002.8500	0.0000	0.0000	270963.9440	259436.8400	608967.4270	570324.0870	0.0000	8647.6830	2079.2220
704	18	2011	613102.4010	65310.9270	260311.2560	12718.8910	584724.9820	65310.9270	260311.2560	12718.8910	411904.1300	381319.1560	201198.2710	203405.8260	0.0000	0.0000	231702.8760	224245.0570	381399.5250	360479.9250	0.0000	4625.6130	8093.2780
705	19	2011	528317.8200	56116.5970	301625.1720	10409.1450	505199.6010	56116.5970	301625.1720	10409.1450	347360.6520	321392.1030	180957.1690	183807.4980	0.0000	0.0000	218187.9450	211641.7650	310129.8750	293557.8360	0.0000	3785.6040	6623.5420
706	20	2011	414840.1420	56511.5560	254362.4560	9362.9380	400083.8090	56511.5560	254362.4560	9362.9380	258609.4800	246158.4850	156230.6620	153925.3240	0.0000	0.0000	235310.6600	227764.7650	179529.4820	172319.0440	0.0000	2217.3410	7145.5970
707	23	2011	184841.3300	12044.8270	77172.8000	3684.4200	177469.9210	12044.8270	77172.8000	3684.4200	108280.9820	98149.5840	76560.3480	79320.3380	0.0000	0.0000	89505.7470	85930.1290	95335.5830	91539.7930	0.0000	2970.2600	714.1600
708	21	2011	51485.4290	4867.5280	64351.3370	1195.5940	49645.5000	4867.5280	64351.3370	1195.5940	28732.1020	26496.5680	22753.3280	23148.9320	0.0000	0.0000	37535.0720	36326.2230	13950.3570	13319.2770	0.0000	283.1420	912.4520
709	2	2012	3107148.7530	493952.4380	1086011.1960	83824.9360	3084163.5270	493952.4380	1086011.1960	83824.9360	1967807.2890	1775079.7980	1138231.3470	1307808.2240	1110.1160	1275.5050	951382.9470	979842.9120	2155765.8060	2104320.6150	0.0000	19475.7860	64349.1490
710	3	2012	2117312.0500	216567.5730	856304.7530	62300.8720	2091850.3370	216567.5730	856304.7530	62300.8720	1317121.4800	1207933.0240	797015.3930	874488.9850	8535.2550	9428.3280	684048.7030	692946.0980	1433263.3470	1398904.2390	0.0000	23533.3640	38767.5080
711	4	2012	1226395.5670	27702.4410	329517.3220	34572.6430	1206510.3940	27702.4410	329517.3220	34572.6430	793469.2120	704681.5800	432926.3550	501828.8140	0.0000	0.0000	379055.3020	378767.4210	847340.2650	827742.9730	0.0000	7120.4590	27452.1840
712	5	2012	1826210.7810	44711.3000	290285.4060	11777.6450	1662116.2210	44711.3000	290285.4060	11777.6450	1366996.2290	1147844.8810	245943.7330	346635.5670	213270.8200	167635.7730	454575.4840	436849.3460	1371635.2970	1225266.8750	0.0000	11777.6450	0.0000
713	6	2012	187118.8120	64421.8290	171510.9220	7246.5930	186352.1050	64421.8290	171510.9220	7246.5930	116004.5300	104643.0200	71114.2810	81709.0850	0.0000	0.0000	90092.1890	91555.7580	97026.6230	94796.3470	0.0000	2354.0030	4892.5900
714	7	2012	145383.1650	17666.7060	50666.8360	3613.1250	142763.4590	17666.7060	50666.8360	3613.1250	98495.0560	88682.1200	46888.1100	54081.3390	0.0000	0.0000	39164.0820	39311.8590	106219.0840	103451.6000	0.0000	1173.6970	2439.4280
715	8	2012	380332.3080	49803.1070	191432.7320	9311.2650	376991.3370	49803.1070	191432.7320	9311.2650	243006.6640	219206.5360	137325.6440	157784.8010	0.0000	0.0000	127123.3860	128911.7940	253208.9210	248079.5430	0.0000	3024.6960	6286.5680
716	9	2012	54161.1410	13640.2370	13860.2180	1762.0010	54775.4850	13640.2370	13860.2180	1762.0010	31670.3710	30547.4600	22490.7700	24228.0250	0.0000	0.0000	23677.5720	24128.1560	30483.5690	30647.3290	0.0000	622.8890	1139.1120
717	10	2012	459180.2720	53701.4600	225869.1950	9834.7340	455718.5850	53701.4600	225869.1950	9834.7340	291069.0370	262561.6700	168111.2360	193156.9160	0.0000	0.0000	183718.1670	186554.9670	275462.1060	269163.6180	0.0000	3194.7420	6639.9920
718	11	2012	47945.1190	10303.6310	15091.9130	1168.6120	52766.0630	10303.6310	15091.9130	1168.6120	9403.9560	8482.9310	38115.9010	43794.5150	425.2610	488.6180	11792.3970	12046.1070	36152.7230	40719.9560	0.0000	441.4290	727.1840
719	12	2012	247545.8670	42010.2070	169676.3980	8413.5360	244158.9260	42010.2070	169676.3980	8413.5360	156422.6780	141076.0790	91123.1880	103082.8470	0.0000	0.0000	105808.2800	106548.0410	141737.5860	137610.8850	0.0000	3178.1060	5235.4300
720	13	2012	161259.1580	31286.9140	97087.8000	5067.2250	162082.9050	31286.9140	97087.8000	5067.2250	95542.4890	88472.0200	65716.6690	73610.8840	0.0000	0.0000	76755.4590	77783.2190	84503.6990	84299.6860	0.0000	1914.0800	3153.1450
721	14	2012	451527.5690	40474.2870	243168.8090	11859.2430	438630.0030	40474.2870	243168.8090	11859.2430	326914.7450	299047.5340	124613.2970	139582.4690	0.0000	0.0000	211869.8580	209722.0710	239658.1830	228908.3650	0.0000	3220.0110	8639.2320
722	15	2012	149812.8520	24825.8160	105543.3710	3891.6900	146729.2720	24825.8160	105543.3710	3891.6900	99173.3150	89443.4400	50639.5370	57285.8320	0.0000	0.0000	73702.7760	74363.3830	76110.0760	72365.8890	0.0000	972.4720	2919.2180
723	22	2012	922343.6790	90973.7060	511788.5470	17247.2900	895893.4890	90973.7060	511788.5470	17247.2900	663621.9090	598626.6290	258721.7700	297266.8600	0.0000	0.0000	247851.4650	251563.7990	674492.2140	644329.6900	0.0000	5602.6560	11644.6340
724	16	2012	172779.5250	21456.9880	104058.0070	5476.7130	169016.0160	21456.9880	104058.0070	5476.7130	119389.5900	109212.6150	53389.9350	59803.4010	0.0000	0.0000	81141.1150	82061.3360	91638.4100	86954.6800	0.0000	2068.7590	3407.9540
725	17	2012	821489.1050	81707.0720	326962.6820	11984.5830	785211.9990	81707.0720	326962.6820	11984.5830	642568.0620	579634.8000	178921.0430	205577.1990	0.0000	0.0000	255033.9770	250587.0590	566455.1280	534624.9400	0.0000	10029.2740	1955.3090
726	18	2012	542350.4610	59015.3830	268236.0490	12488.3330	530111.9310	59015.3830	268236.0490	12488.3330	377179.2480	339601.3650	165171.2120	190510.5660	0.0000	0.0000	198729.9770	202404.0110	343620.4830	327707.9200	0.0000	4056.7440	8431.5890
727	19	2012	464447.8940	52444.8720	304375.4490	10221.0420	455124.7610	52444.8720	304375.4490	10221.0420	316074.4120	291812.9970	148373.4820	163311.7650	0.0000	0.0000	187064.8590	188242.4630	277383.0350	266882.2980	0.0000	3320.2310	6900.8110
728	20	2012	367705.3890	52655.9870	257735.5150	9025.3940	364745.4140	52655.9870	257735.5150	9025.3940	237792.2710	220406.5150	129913.1180	144338.8990	0.0000	0.0000	205770.8760	207985.5280	161934.5130	156759.8860	0.0000	2255.3040	6770.0900
729	23	2012	170104.7600	11605.6720	75582.2200	4128.9000	169542.8270	11605.6720	75582.2200	4128.9000	104180.6040	91756.7670	65924.1560	77786.0600	0.0000	0.0000	82125.0980	81443.4130	87979.6630	88099.4140	0.0000	3455.2620	673.6380
730	21	2012	44696.0060	4682.5500	62415.1330	1123.5730	44824.0020	4682.5500	62415.1330	1123.5730	25941.4030	23256.0620	18754.6040	21567.9400	0.0000	0.0000	32246.8830	32652.7710	12449.1240	12171.2310	0.0000	280.7630	842.8100
731	2	2013	3575778.4450	468062.1900	1097139.5180	86564.8420	3331210.1980	468062.1900	1097139.5180	86564.8420	1960466.8920	1813022.3070	1610548.5700	1513711.2920	4762.9830	4476.5990	1099873.6300	1026820.4650	2475904.8150	2304389.7330	0.0000	19463.3810	67101.4610
732	3	2013	2262625.3490	194768.0080	848605.1540	65884.7720	2110632.8120	194768.0080	848605.1540	65884.7720	1281380.5850	1223166.9610	978225.3530	879746.3230	8535.2550	7719.5290	797163.7780	737810.5650	1465461.5710	1372822.2470	0.0000	25167.7300	40717.0420
733	4	2013	1301108.6180	29526.8410	331665.8960	34533.0200	1213167.2540	29526.8410	331665.8960	34533.0200	792550.2700	744361.5730	508558.3480	468805.6800	0.0000	0.0000	432747.4520	402872.6300	868361.1660	810294.6240	0.0000	5618.2320	28914.7880
734	5	2013	1766456.5570	40601.8330	292899.8670	12050.9790	1580402.1350	40601.8330	292899.8670	12050.9790	1366421.9140	1202524.9460	251088.9170	308388.0380	148945.7260	69489.1500	461646.5260	419615.9140	1304810.0320	1160786.2200	0.0000	12050.9790	0.0000
735	6	2013	205023.1760	61274.6380	172599.4420	7258.5220	190949.9180	61274.6380	172599.4420	7258.5220	115757.1570	107051.1870	89266.0190	83898.7310	0.0000	0.0000	101599.0470	94772.8100	103424.1290	96177.1080	0.0000	2014.9280	5243.5940
736	7	2013	154181.3720	16690.0070	49584.9660	3708.3090	143478.6110	16690.0070	49584.9660	3708.3090	95174.9220	88504.2210	59006.4500	54974.3900	0.0000	0.0000	43925.2840	40883.7800	110256.0870	102594.8320	0.0000	1029.4070	2678.9020
737	8	2013	407387.1920	46809.3030	191782.6680	9530.2710	379328.4460	46809.3030	191782.6680	9530.2710	236295.8970	218524.3400	171091.2940	160804.1070	0.0000	0.0000	145431.4670	135645.4670	261955.7250	243682.9800	0.0000	2645.5530	6884.7180
738	9	2013	58584.8970	12952.7490	14112.5380	1787.0280	55364.0380	12952.7490	14112.5380	1787.0280	31077.9040	30863.1900	27506.9920	24500.8480	0.0000	0.0000	26181.5080	24556.7650	32403.3890	30807.2730	0.0000	570.4450	1216.5820
739	10	2013	495414.7290	50786.9760	219426.7400	9911.9170	461361.4820	50786.9760	219426.7400	9911.9170	282820.1230	261549.5290	212594.6060	199811.9540	0.0000	0.0000	207673.6620	193729.3230	287741.0670	267632.1600	0.0000	2751.4960	7160.4210
740	11	2013	54038.5330	9701.3880	14982.6850	1209.7530	50655.9130	9701.3880	14982.6850	1209.7530	8848.3090	8182.8370	44777.6000	42085.2620	412.6240	387.8140	13062.3380	12186.9170	40976.1950	38468.9960	0.0000	462.1210	747.6320
741	12	2013	270111.3800	39914.6260	167055.6980	8653.7890	254911.4750	39914.6260	167055.6980	8653.7890	153925.9960	147512.4130	116185.3840	107399.0620	0.0000	0.0000	119386.3060	112279.0180	150725.0740	142632.4560	0.0000	3305.7140	5348.0750
742	13	2013	155937.7220	29512.0490	97089.6750	5215.7550	146548.7740	29512.0490	97089.6750	5215.7550	92744.6340	88841.5540	63193.0880	57707.2210	0.0000	0.0000	76028.7790	71300.6770	79908.9430	75248.0980	0.0000	1992.3980	3223.3570
743	14	2013	469998.2770	37740.4760	243685.3730	11324.3270	439014.5410	37740.4760	243685.3730	11324.3270	312153.5240	294872.4800	157844.7520	144142.0610	0.0000	0.0000	228462.8910	212669.3830	241535.3860	226345.1580	0.0000	3549.1020	7775.2250
744	15	2013	161786.7500	23540.1710	108794.7840	4107.7580	152832.4800	23540.1710	108794.7840	4107.7580	96610.8250	92585.3740	65175.9250	60247.1060	0.0000	0.0000	82908.6400	77945.5250	78878.1100	74886.9550	0.0000	1083.4630	3024.2950
745	22	2013	985723.6250	87101.4110	500983.3290	17306.9850	916521.8770	87101.4110	500983.3290	17306.9850	658615.3540	609081.6080	327108.2720	307440.2680	0.0000	0.0000	279948.7830	261130.7600	705774.8420	655391.1160	0.0000	4804.3280	12502.6570
746	16	2013	184883.6620	20356.8250	102252.5980	5694.3930	172534.3410	20356.8250	102252.5980	5694.3930	117665.9800	111151.9070	67217.6810	61382.4340	0.0000	0.0000	91188.6560	84613.7750	93695.0060	87920.5670	0.0000	2175.2360	3519.1570
747	17	2013	831895.4880	78327.1800	326846.6040	12211.3890	772804.1850	78327.1800	326846.6040	12211.3890	601511.7640	556272.7170	230383.7240	216531.4670	0.0000	0.0000	277077.8390	257914.8980	554817.6490	514889.2870	0.0000	9933.8430	2277.5460
748	18	2013	584768.1660	55822.1870	266021.2170	12633.3840	544157.0070	55822.1870	266021.2170	12633.3840	371499.4270	345461.4610	213268.7390	198695.5460	0.0000	0.0000	226402.0550	210750.8160	358366.1110	333406.1910	0.0000	3506.9610	9126.4230
749	19	2013	508064.2790	49956.9810	300267.4590	10239.1860	476275.8960	49956.9810	300267.4590	10239.1860	315426.3240	302722.1570	192637.9550	173553.7390	0.0000	0.0000	213939.5670	198516.4560	294124.7120	277759.4400	0.0000	2842.3440	7396.8410
750	20	2013	404983.1940	50090.2780	253457.5550	9596.6390	383609.5760	50090.2780	253457.5550	9596.6390	235481.0280	229594.0020	169502.1660	154015.5730	0.0000	0.0000	234331.3350	220288.5820	170651.8590	163320.9940	0.0000	2531.2110	7065.4280
751	23	2013	173066.9980	10899.3770	74907.5300	4163.4130	159787.7930	10899.3770	74907.5300	4163.4130	103864.0720	92156.9790	69202.9260	67630.8130	0.0000	0.0000	85887.0400	79365.5960	87179.9580	80422.1970	0.0000	3386.8950	776.5180
752	21	2013	53660.1630	4590.8000	63749.0720	1280.5540	50131.5190	4590.8000	63749.0720	1280.5540	28398.5040	26391.5960	25261.6590	23739.9240	0.0000	0.0000	37356.6890	34923.4260	16303.4730	15208.0940	0.0000	337.7590	942.7950
\.


--
-- Name: city_metrics_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_emissions_id_seq', 752, true);


--
-- Data for Name: city_metrics_energy; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_energy (id, city_id, year, electricity, natural_gas, other, wn_electricity, wn_natural_gas, wn_other, total_res_energy, total_com_ind_energy, wn_total_res_energy, wn_total_com_ind_energy) FROM stdin;
342	2	2008	14574280.0000	28503939.7000	900176.8000	14139608.0300	26616553.9500	840571.6760	15183092.2400	28795303.7900	14295682.6000	27301051.0600
343	3	2008	9975412.0000	19493492.6000	109625.0064	9617562.0410	18082322.1500	101689.0468	10860647.2200	18717882.2900	10160456.1500	17641117.0900
344	4	2008	4392210.3330	5615815.5500	0.0000	4280887.0300	5244274.9010	0.0000	4836176.4850	5171849.3980	4563306.5810	4961855.3500
345	5	2008	4974782.0000	5083384.9910	2093773.0450	4381583.2360	4987166.2030	2054141.9120	4591402.4830	7560537.7500	4407869.8570	7015021.4950
346	6	2008	839639.0000	1680684.0000	0.0000	813735.9036	1569397.6640	0.0000	1378639.5120	1141683.0960	1299612.7750	1083520.7920
347	7	2008	671772.0000	1135024.9000	0.0000	662622.9793	1047218.0380	0.0000	558446.7040	1248349.8160	525714.9848	1184126.0320
348	8	2008	1736585.0000	3263983.4000	0.0000	1683011.8190	3047859.0390	0.0000	1908634.5120	3091934.0560	1799904.9440	2930965.9140
349	9	2008	225581.0000	514519.8000	0.0000	237784.2918	460002.1068	0.0000	351520.3280	388580.4400	328128.0641	369658.3345
350	10	2008	2069596.0000	3876094.3000	0.0000	2005749.6810	3619439.0720	0.0000	2733244.5400	3212446.1280	2576386.4830	3048802.2710
351	11	2008	74310.0000	894972.0000	29570.2000	76518.2674	824157.2873	27230.4562	185091.5520	813760.5960	175495.3380	752410.6729
352	12	2008	1143484.0000	2118092.0000	0.0000	1144333.5740	1967216.9730	0.0000	1531444.7480	1730131.2840	1450888.4240	1660662.1230
353	13	2008	670793.0000	1377257.2000	0.0000	700247.1517	1238109.2680	0.0000	1083290.9520	964759.3135	1014243.7200	924112.6992
355	15	2008	701511.0000	1179394.8000	0.0000	702031.7937	1095384.6520	0.0000	1098344.2000	782561.2120	1039839.5300	757576.9161
356	22	2008	4892405.0000	6128487.8000	0.0000	4746491.5390	5722690.5440	0.0000	3703499.9880	7317393.1960	3492939.5030	6976242.5800
357	16	2008	823967.0000	1281209.0000	0.0000	844683.1835	1151765.0710	0.0000	1233375.9240	871800.3680	1147909.3760	848538.8788
358	17	2008	3428744.0000	3679852.8000	0.0000	3322968.0390	3436191.6850	0.0000	2825365.6660	4283231.3330	2665525.1720	4093634.5520
359	18	2008	2769971.0000	3914998.5000	0.0000	2732247.4460	3612129.6080	0.0000	2986971.7760	3697997.5080	2804482.8230	3539894.2320
360	19	2008	2317318.0000	3559839.4000	0.0000	2274622.6220	3314398.0660	0.0000	2849917.6640	3027239.5400	2689619.3690	2899401.3200
361	20	2008	1601204.0000	2902709.7000	0.0000	1597676.9510	2668150.0520	0.0000	2853183.7720	1650729.7600	2680873.7950	1584953.2090
362	23	2008	623722.0000	1006398.2000	0.0000	597462.3635	966292.6677	0.0000	979303.9424	650816.4660	939665.2359	624089.7954
363	21	2008	179222.0000	443578.0000	0.0000	168058.1207	427654.9707	0.0000	464598.2480	158201.8760	444763.7483	150949.3431
364	2	2009	14066901.4800	27101089.6000	771840.2684	13971486.4500	26549172.3200	756121.6392	14692480.3100	27247351.0400	14436237.4300	26840542.9800
365	3	2009	9145982.0080	18274423.0000	109625.0064	9311577.7830	17503874.8300	105002.6252	10402814.7000	17127215.3200	10102978.0100	16817477.2200
366	4	2009	4156230.7800	5628598.0100	0.0000	4318455.2030	5418941.9450	0.0000	4723028.0990	5061800.6900	4634416.8540	5102980.2930
367	5	2009	4615506.7490	4756464.8960	2049654.0580	4166371.2030	4761684.0590	2051903.0980	4333320.6940	7088305.0090	4244100.3820	6735857.9780
368	6	2009	811261.0040	1602761.7000	0.0000	805758.2646	1570121.2460	0.0000	1318856.5360	1095166.1680	1296526.8000	1079352.7100
369	7	2009	673191.0120	1062417.2000	0.0000	684001.3786	1027311.0080	0.0000	536998.7840	1198609.4280	527033.4059	1184278.9800
370	8	2009	1685156.0920	3125931.4000	0.0000	1673725.7700	3062271.3930	0.0000	1844251.8160	2966835.6760	1813235.4500	2922761.7120
371	9	2009	215682.7560	506257.2000	0.0000	233006.3710	474923.7960	0.0000	342355.1280	379584.8280	332832.8130	375097.3540
372	10	2009	2004451.0520	3776879.9000	0.0000	1990854.9690	3699963.2410	0.0000	2663245.9440	3118085.0080	2618080.6730	3072737.5370
373	11	2009	71048.0760	834410.0000	24228.7593	77127.0558	798338.6629	23181.3560	176421.8640	753264.9713	174473.5793	724173.4954
374	12	2009	1112796.5040	2026634.0000	0.0000	1169328.9470	1955816.8880	0.0000	1491331.7600	1648098.7440	1472566.1790	1652579.6560
375	13	2009	645067.3793	1325587.5000	0.0000	696263.2031	1236511.1870	0.0000	1051966.4250	918688.4548	1021103.2300	911671.1600
377	15	2009	666291.9480	1133802.0000	0.0000	700141.0042	1094183.3100	0.0000	1056612.9560	743480.9920	1042529.8580	751794.4570
378	22	2009	4661276.5040	5811785.6000	0.0000	4629659.3180	5693427.8170	0.0000	3578362.9680	6894699.1360	3517997.6010	6805089.5350
379	16	2009	819449.8040	1221213.0000	0.0000	867251.0426	1139150.4040	0.0000	1192332.8720	848329.9320	1149990.6030	856410.8436
380	17	2009	3323680.9430	3480871.9000	0.0000	3301136.5950	3409983.4830	0.0000	2702389.1480	4102163.6950	2657615.9840	4053504.0940
381	18	2009	2670886.3040	3776489.7000	0.0000	2713776.4490	3651700.5180	0.0000	2911619.1200	3535756.8840	2851673.3750	3513803.5920
382	19	2009	2253800.0120	3401755.3000	0.0000	2285647.1860	3304217.6350	0.0000	2745308.8240	2910246.4880	2696225.9940	2893638.8280
383	20	2009	1588797.8000	2869826.6000	0.0000	1625432.7010	2737682.5740	0.0000	2814615.9960	1644008.4040	2735638.8430	1627476.4310
384	23	2009	614919.1700	986455.9000	0.0000	596633.1919	991242.5004	0.0000	949826.3084	651548.7616	945116.2706	642759.4216
385	21	2009	176035.3160	421187.0000	0.0000	173399.6898	419437.2942	0.0000	451259.7720	145962.5440	448092.1169	144744.8670
386	2	2010	14338008.7600	25266088.7000	695187.1300	13234324.7200	26421915.3500	726989.2749	13777684.3400	26521600.2500	14000487.6000	26382741.7500
387	3	2010	9578558.7800	16095003.8000	109625.0064	9018618.1550	16323072.4700	111178.4096	9630767.5640	16152420.0200	9592311.3120	15860557.7300
388	4	2010	4234843.5770	5342518.2770	0.0000	3921434.5760	5350838.8770	0.0000	4518548.6740	5058813.1800	4434224.6650	4838048.7870
389	5	2010	4907367.3010	4642256.8110	1916170.9600	4244288.5050	4987378.9890	2058626.0460	4081538.9890	7384256.0820	4191147.2400	7099146.3000
390	6	2010	828518.9000	1459104.9000	0.0000	764742.7439	1525853.3530	0.0000	1243448.1440	1044175.6560	1257479.7220	1033116.3750
391	7	2010	683423.6000	953047.8000	0.0000	634202.4179	981728.8623	0.0000	510348.9360	1126122.4640	508651.2840	1107279.9960
392	8	2010	1741914.7120	2829471.7000	0.0000	1607828.9060	2958909.1780	0.0000	1733080.1040	2838306.3080	1750529.5080	2816208.5750
393	9	2010	224970.2200	458410.2000	0.0000	221420.3940	459156.8978	0.0000	315502.2720	367878.1480	314504.2040	366073.0878
394	10	2010	2063499.1240	3501405.5000	0.0000	1904659.0030	3661581.3720	0.0000	2517717.0280	3047187.5960	2547380.6350	3018859.7400
395	11	2010	78578.3600	779190.0000	11982.3000	77849.8522	784247.1182	12060.0678	162965.0120	706785.6480	163307.3952	710849.6431
396	12	2010	1128525.8240	1852986.0000	0.0000	1089922.1590	1881375.9440	0.0000	1402710.9680	1578800.8560	1403904.0130	1567394.0900
397	13	2010	652114.8050	1196067.5720	0.0000	641295.1275	1181474.7480	0.0000	981566.4194	866615.9576	968352.8458	854417.0292
399	15	2010	688524.5400	1022427.8000	0.0000	664972.0701	1038092.6070	0.0000	987942.1520	723010.1880	989196.6860	713867.9910
400	22	2010	4783985.6720	5311177.6000	0.0000	4415733.0980	5554143.6050	0.0000	3382675.0320	6712488.2400	3418694.8720	6551181.8310
401	16	2010	839519.1880	1096861.0000	0.0000	813077.6388	1083478.5620	0.0000	1107710.0960	828670.0920	1088210.2830	808345.9176
402	17	2010	3401636.4660	3145119.6000	0.0000	3139791.7470	3288996.7590	0.0000	2585411.5420	3961344.5250	2605213.9000	3823574.6060
403	18	2010	2682678.1760	3451244.8000	0.0000	2489467.7120	3555106.7120	0.0000	2748265.6040	3385657.3720	2752502.3320	3292072.0920
404	19	2010	2277107.3840	3105287.0000	0.0000	2150736.4300	3192429.2480	0.0000	2593808.9880	2788585.3960	2606384.4680	2736781.2100
405	20	2010	1657228.8720	2611802.9000	0.0000	1585639.0220	2643356.2750	0.0000	2674149.8680	1594881.9040	2663256.5000	1565738.7960
406	23	2010	651728.8803	906641.9000	0.0000	590849.5847	965534.4389	0.0000	920296.5794	638074.2009	934399.5055	621984.5181
407	21	2010	183098.1560	374097.0000	0.0000	168067.7104	394674.9438	0.0000	420672.9520	136522.2040	426717.6532	136025.0009
408	2	2011	14231554.3600	28167360.3000	424321.7000	13046641.9500	28850391.0300	434611.0831	14651375.2200	28171861.1400	14645018.1000	27686625.9700
409	3	2011	9677619.3760	17666358.8000	109625.0064	9159175.4810	17283823.2400	107251.2596	10339262.4400	17114340.7500	10036797.1000	16513452.8900
410	4	2011	4187876.0970	8937148.5110	0.0000	3860621.3840	8979068.6860	0.0000	4669572.0990	8455452.5090	4593576.7720	8246113.2990
411	5	2011	4888179.6900	4881249.3860	1964287.9240	4209578.7080	5051274.6530	2032708.6400	4329395.8380	7404321.1620	4317013.0380	6976548.9640
412	6	2011	842729.8800	1558761.4000	0.0000	772564.5933	1596559.8280	0.0000	1294978.1320	1106513.1480	1288758.7390	1080365.6820
413	7	2011	694632.0200	1030853.6000	0.0000	643053.7504	1042164.1640	0.0000	525996.9880	1199488.6320	517599.9583	1167617.9560
414	8	2011	1751741.2720	3010060.4000	0.0000	1605892.1320	3083051.3980	0.0000	1801671.4280	2960130.2440	1791192.3710	2897751.1590
415	9	2011	227785.1200	497854.7000	0.0000	223721.5047	488220.0763	0.0000	341774.9600	383864.8600	335295.1752	376646.4059
416	10	2011	2051563.9480	3689949.1000	0.0000	1880751.7150	3779426.7290	0.0000	2624704.0400	3116809.0080	2612008.1300	3048170.3140
417	11	2011	69492.2040	788737.2000	3309.7000	67121.3404	770547.2325	3233.3712	180966.7120	680572.3920	176273.6142	664628.3299
418	12	2011	1129249.1680	1970740.0000	0.0000	1065469.9000	1942056.3270	0.0000	1469609.9440	1630379.2240	1430945.5020	1576580.7260
419	13	2011	647089.9622	1268101.4910	0.0000	636865.0644	1231694.4380	0.0000	1037599.7400	877591.7132	1011480.7780	857078.7252
421	15	2011	701800.6320	1101608.7000	0.0000	662163.3830	1085575.0360	0.0000	1036659.8560	766749.4760	1009714.6540	738023.7650
422	22	2011	4792270.0080	5734437.2000	0.0000	4393267.8990	5873491.6510	0.0000	3562851.6480	6963855.5600	3544720.7120	6722038.8380
423	16	2011	853661.9280	1178785.0000	0.0000	827406.5245	1144942.2140	0.0000	1158624.9240	873822.0040	1124726.0750	847622.6629
424	17	2011	3366602.7970	3905777.0000	0.0000	3086301.0590	4000488.2430	0.0000	2637832.5510	4634547.2470	2618833.8430	4467955.4590
425	18	2011	2671019.3720	3658549.5000	0.0000	2472689.1000	3698691.2420	0.0000	2844635.1520	3484933.7200	2810646.1240	3360734.2180
426	19	2011	2255983.6920	3290489.3000	0.0000	2087327.2190	3342319.1340	0.0000	2683961.7000	2862511.2920	2660883.0760	2768763.2770
427	20	2011	1678966.7240	2840867.4000	0.0000	1598131.3050	2798947.5940	0.0000	2855432.2160	1664401.9080	2786750.5690	1610328.3300
428	23	2011	637462.0834	1392158.2000	0.0000	577817.4238	1442345.3030	0.0000	956029.5289	1073590.7550	953842.9972	1066319.7290
429	21	2011	187451.8680	413742.0000	0.0000	172866.9650	420935.5942	0.0000	455022.4200	146171.4480	450742.4579	143060.1014
430	2	2012	14226490.9500	20697373.3000	10870.0000	12833145.2100	23780925.6300	12489.4429	12297814.7200	22636919.5400	13305216.6400	23321343.6400
432	4	2012	4153573.7530	7872247.0670	0.0000	3688797.0870	9125155.7170	0.0000	3996817.6880	8029003.1320	4315622.6570	8498330.1470
433	5	2012	4877376.4420	4472192.1090	1891698.2610	4095455.0330	5008378.3600	2118500.3690	4127819.7020	7113447.1100	4365016.4940	6857317.2680
434	6	2012	827856.9720	1293128.0000	0.0000	746776.4729	1485781.8120	0.0000	1105099.7720	1015885.2000	1183926.8000	1048631.4840
435	7	2012	701548.1440	852604.1000	0.0000	631653.8054	983404.3533	0.0000	457070.0280	1097082.2160	485170.6503	1129887.5080
436	8	2012	1734889.4040	2497102.3000	0.0000	1564973.9430	2869127.5570	0.0000	1549859.4160	2682132.2880	1656983.1810	2777118.3190
437	9	2012	226498.7960	408967.7000	0.0000	218468.0121	440557.5996	0.0000	296471.5080	338994.9880	309418.6956	349606.9161
438	10	2012	2078764.4120	3056901.4000	0.0000	1875169.7550	3512327.0860	0.0000	2250035.1040	2885630.7080	2408438.3780	2979058.4630
439	11	2012	68400.3640	693092.0000	4504.0000	61701.2169	796350.7768	5175.0185	148562.8560	617433.5080	159627.3818	703599.6304
440	12	2012	1114881.2360	1656966.0000	0.0000	1005500.4490	1874438.0680	0.0000	1292122.6000	1479724.6360	1367567.3260	1512371.1900
441	13	2012	679127.8920	1174528.0000	0.0000	628870.1239	1315618.1760	0.0000	917543.8040	936112.0880	969530.5152	974957.7848
443	15	2012	706498.9560	920819.3000	0.0000	637184.4770	1041674.2100	0.0000	906536.2520	720782.0040	961094.9409	717763.7465
444	22	2012	4725950.9640	4704545.4000	0.0000	4263090.2580	5405441.6790	0.0000	3025952.0200	6404544.3440	3238498.9840	6430032.9530
445	16	2012	853365.0840	970832.0000	0.0000	780622.7677	1087453.1940	0.0000	1004139.9240	820057.1600	1061048.6570	807027.3042
446	17	2012	3284504.3590	3253464.8000	0.0000	2962819.2590	3738175.0490	0.0000	2291347.7890	4246621.3700	2440267.3480	4260726.9600
447	18	2012	2686895.4080	3003440.6000	0.0000	2419203.4770	3464206.3780	0.0000	2445885.0640	3244450.9440	2629037.5340	3254372.3200
448	19	2012	2254987.3880	2697994.0000	0.0000	2081897.8140	2969628.7700	0.0000	2307750.8240	2645230.5640	2413122.6160	2638403.9680
449	20	2012	1695903.8920	2362314.4000	0.0000	1571910.9190	2624629.9480	0.0000	2506317.4200	1551900.8720	2636910.7720	1559630.0940
450	23	2012	646493.3369	1198751.8000	0.0000	569397.1487	1414446.2960	0.0000	836524.4373	1008720.7000	902456.7412	1081386.7040
451	21	2012	185899.4080	341030.0000	0.0000	166655.9146	392187.1424	0.0000	394281.2600	132648.1480	421546.1274	137296.9296
452	2	2007	14830513.9000	25835888.7000	900176.8000	13486851.7600	26523343.1000	924129.1598	13626934.7900	27939644.6100	13594227.1700	27340096.8500
453	3	2007	10074646.8100	17816255.6000	109625.0064	9131427.4400	18209663.4200	112045.6797	10218017.6500	17782509.7700	10159794.7300	17293341.8000
454	4	2007	4413849.4010	4482024.1850	0.0000	4008252.4290	4502577.5010	0.0000	4481930.5290	4413943.0570	4389640.6870	4121189.2430
455	5	2007	4829284.0470	5132541.8960	1997507.7850	4146766.9880	5310849.2000	1193166.8090	4511226.0290	7448107.6980	4496930.8330	7027587.6500
456	6	2007	856275.5200	1457415.1000	0.0000	778695.9428	1496194.7380	0.0000	1234042.1160	1079648.5040	1224399.4870	1050491.1940
457	7	2007	686801.4800	983109.1000	0.0000	633297.1154	985388.4730	0.0000	513876.8920	1156033.6880	501186.4410	1117499.1470
458	8	2007	1755743.5480	2925946.6000	0.0000	1596671.1010	3003801.6680	0.0000	1743034.9640	2938655.1840	1728687.9490	2871784.8200
459	9	2007	229586.6560	455203.9000	0.0000	223533.5238	442906.2449	0.0000	312830.6120	371959.9440	304437.7454	362002.0233
460	10	2007	2141647.5720	3429286.0000	0.0000	1947611.7630	3520534.1770	0.0000	2500306.8520	3070626.7200	2482924.7790	2985221.1610
461	11	2007	78162.0960	869180.0000	29570.2000	70574.4677	916084.6298	31165.9331	170542.3240	806369.9720	172465.1920	845359.8386
462	12	2007	1161209.3720	1890615.0000	0.0000	1030089.8730	2010319.3380	0.0000	1451057.7680	1600766.6040	1469864.9920	1570544.2190
463	13	2007	653230.9498	1407191.6750	0.0000	626837.7801	1379446.8600	0.0000	1118151.7620	942270.8632	1090586.0680	915698.5726
464	14	2007	1754225.5560	2534718.7000	0.0000	1659869.4840	2484743.0620	0.0000	2268674.9630	2020269.2930	2200303.8480	1944308.6990
465	15	2007	651265.5000	1086154.3000	0.0000	604012.7981	1097527.0420	0.0000	1034893.0760	702526.7240	1021983.3470	679556.4936
466	22	2007	4993502.9440	5445167.3000	0.0000	4541085.6580	5590055.0670	0.0000	3346108.7840	7092561.4600	3317924.5440	6813216.1800
467	16	2007	832534.8240	1156383.0000	0.0000	787754.5418	1133583.2400	0.0000	1149675.5200	839242.3040	1115881.5540	805456.2279
468	17	2007	3488626.0610	3226483.6000	0.0000	3172552.4050	3312335.5080	0.0000	2676901.1670	4038208.4940	2647295.6910	3837592.2220
469	18	2007	2830731.6800	3446799.4000	0.0000	2610207.2570	3454790.9250	0.0000	2746504.7680	3531026.3120	2688278.1500	3376720.0330
470	19	2007	2340191.8520	3144793.2000	0.0000	2156366.8100	3182698.4410	0.0000	2603410.6600	2881574.3920	2566816.0940	2772249.1570
471	20	2007	1619389.7920	2606767.3000	0.0000	1517840.9320	2607584.0420	0.0000	2678465.3880	1547691.7040	2630917.8910	1494507.0830
472	23	2007	639820.6284	886169.5300	0.0000	577369.2369	931546.9462	0.0000	903942.4199	622047.7385	908506.9919	600409.1911
473	21	2007	185309.1320	402258.0000	0.0000	164384.7052	427726.9757	0.0000	440330.7120	147236.4200	446397.4536	145714.2274
474	2	2013	14125379.7400	29285896.1000	47184.0000	13063025.2800	27525026.2100	44346.9728	15023076.4200	28435383.4300	14068992.4400	26563406.0200
475	3	2013	9222341.4150	17687557.0000	109625.0064	8803366.8180	15997132.8200	99147.9936	10838300.0000	16181223.4200	9925179.5310	14974468.1000
476	4	2013	4148763.3690	9247524.2390	0.0000	3896509.9690	8524669.6090	0.0000	4922102.3330	8474185.2740	4558041.6020	7863137.9760
477	5	2013	4876000.9050	4565751.1190	1914205.9710	4291143.6540	4312859.4620	922484.8690	4234823.4630	7121134.5320	3941522.9580	6470660.4800
478	6	2013	832729.3080	1623195.6000	0.0000	770100.6414	1525597.8950	0.0000	1326708.4360	1129216.4720	1241746.4140	1053952.1220
479	7	2013	683430.4240	1072961.6000	0.0000	635529.5749	999643.4167	0.0000	549463.6840	1206928.3400	511628.2571	1123544.7350
480	8	2013	1700574.9200	3111090.2000	0.0000	1572676.5280	2924030.0180	0.0000	1891108.9880	2920556.1320	1769823.7840	2726882.7620
481	9	2013	224106.9840	500181.7000	0.0000	222558.6502	445518.5678	0.0000	344439.3560	379849.3280	315804.8386	352272.3794
482	10	2013	2035984.7560	3865778.2000	0.0000	1882860.5540	3633340.9750	0.0000	2721126.7040	3180636.2520	2546923.7870	2969277.7420
483	11	2013	64862.1200	814227.0000	4178.0000	59983.9104	765270.0618	3926.7898	173219.1680	710047.9520	162136.9123	667043.8497
484	12	2013	1105723.4280	2112692.0000	0.0000	1059651.6190	1952923.2560	0.0000	1550423.5080	1667991.9200	1447039.0600	1565535.8150
485	13	2013	664446.2917	1129425.0300	0.0000	636483.6221	1031378.2980	0.0000	910635.1739	883236.1477	844993.6675	822868.2531
486	14	2013	1624407.1280	2870217.7000	0.0000	1534478.7770	2621050.6840	0.0000	2460205.7010	2034419.1270	2266807.2910	1888722.1700
487	15	2013	693966.6800	1185146.1000	0.0000	665051.4017	1095521.4390	0.0000	1085365.0200	793747.7600	1012709.6100	747863.2308
488	22	2013	4727626.2560	5948072.0000	0.0000	4372066.6210	5590432.9220	0.0000	3648929.3200	7026768.9360	3415167.5820	6547331.9610
489	16	2013	847687.5160	1222273.0000	0.0000	800758.9236	1116166.0260	0.0000	1192887.9240	877072.5920	1099089.1890	817835.7606
490	17	2013	3096303.7650	4189252.0000	0.0000	2863434.1230	3937365.3010	0.0000	2785469.6590	4500086.1060	2606449.5980	4194349.8250
491	18	2013	2667713.1440	3878036.5000	0.0000	2480736.2110	3613040.4450	0.0000	2989830.5400	3555919.1040	2784223.0020	3309553.6540
492	19	2013	2267908.6320	3502890.4000	0.0000	2176565.9370	3155866.8000	0.0000	2816590.2240	2954208.8080	2579381.7320	2753051.0050
493	20	2013	1692795.5600	3082193.8000	0.0000	1650475.6710	2800588.6700	0.0000	3043542.2160	1731447.1440	2818628.8730	1632435.4680
494	23	2013	656907.0919	1258372.3000	0.0000	582863.4692	1229785.3120	0.0000	924159.6335	991119.7584	877441.6456	935207.1355
495	21	2013	204921.3080	459353.0000	0.0000	190439.6215	431682.0675	0.0000	487487.4720	176786.8360	456795.8411	165325.8479
496	14	2008	1681425.8100	2921638.0000	0.0000	1723699.6180	2626457.0000	0.0000	2518351.5760	2084711.8350	2346584.1550	2003572.3000
497	14	2009	1626212.1200	2737793.0000	0.0000	1721074.4940	2553820.0000	0.0000	2378142.4030	1985863.1180	2298365.4780	1976529.2400
498	14	2010	1660902.0670	2545903.0000	0.0000	1608590.1910	2514841.0000	0.0000	2279675.7640	1927129.3040	2239088.7970	1884342.6750
499	14	2011	1647892.1970	2691850.0000	0.0000	1597209.2820	2614567.0000	0.0000	2355470.3460	1984271.4510	2286499.4290	1925276.7500
500	3	2012	9404138.7590	14395303.4000	109625.0000	8624542.1870	15901534.4330	121095.0000	8778780.0000	15130286.8620	9243966.0000	15403206.2910
501	14	2012	1669757.9170	2265944.0000	0.0000	1527424.8630	2538140.0000	0.0000	2068950.1410	1866751.2760	2181936.5570	1883628.2690
\.


--
-- Name: city_metrics_energy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_energy_id_seq', 501, true);


--
-- Data for Name: city_metrics_specialtrendline; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_specialtrendline (id, type, chart, year, no_normalize, capita_normalize, household_normalize, employment_normalize, weather_normalize) FROM stdin;
1	State	travel	2008	57296566902.0000	30.1000	74.8000	58.0000	0.0000
2	State	travel	2009	56970416910.0000	29.6000	74.3000	60.2000	56970416910.0000
3	State	travel	2010	56762472030.0000	29.3000	74.5000	60.2000	56762472030.0000
4	State	travel	2011	56762472030.0000	29.1000	74.2000	59.3000	56762472030.0000
5	US	travel	2008	0.0000	26.8000	71.1000	59.9000	0.0000
6	US	travel	2009	0.0000	26.4000	71.3000	62.5000	0.0000
7	US	travel	2010	0.0000	26.3000	69.6000	63.1000	0.0000
8	US	travel	2011	0.0000	26.1000	70.7000	62.5000	0.0000
\.


--
-- Name: city_metrics_specialtrendline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_specialtrendline_id_seq', 8, true);


--
-- Data for Name: city_metrics_travel; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_travel (id, city_id, year, total_vmt) FROM stdin;
310	2	2008	2436024630.0000
311	3	2008	2009716248.0000
312	4	2008	729132390.0000
313	5	2008	689501910.0000
314	6	2008	315282282.0000
315	7	2008	124702422.0000
316	8	2008	435664806.0000
317	9	2008	31833582.0000
318	10	2008	508313244.0000
319	11	2008	34722420.0000
320	12	2008	381179118.0000
321	13	2008	229824210.0000
322	14	2008	566894472.0000
323	15	2008	258090756.0000
324	22	2008	1343497428.0000
325	16	2008	236806758.0000
326	17	2008	762679584.0000
327	18	2008	603967344.0000
328	19	2008	695775516.0000
329	20	2008	604203048.0000
330	23	2008	179755776.0000
331	21	2008	144007824.0000
332	2	2009	2385221345.0000
333	3	2009	1992530255.0000
334	4	2009	728483425.0000
335	5	2009	692407190.0000
336	6	2009	316614140.0000
337	7	2009	116936510.0000
338	8	2009	434088660.0000
339	9	2009	29537625.0000
340	10	2009	506846665.0000
341	11	2009	34306350.0000
342	12	2009	380143485.0000
343	13	2009	224196870.0000
344	14	2009	549276820.0000
345	15	2009	257644010.0000
346	22	2009	1346932855.0000
347	16	2009	231726820.0000
348	17	2009	762537195.0000
349	18	2009	587535390.0000
350	19	2009	697106200.0000
351	20	2009	621270515.0000
352	23	2009	175523755.0000
353	21	2009	144066960.0000
354	2	2010	2400983870.0000
355	3	2010	1965954240.0000
356	4	2010	750259325.0000
357	5	2010	693854050.0000
358	6	2010	357906955.0000
359	7	2010	113845690.0000
360	8	2010	428170550.0000
361	9	2010	30837025.0000
362	10	2010	498974345.0000
363	11	2010	34913710.0000
364	12	2010	379299240.0000
365	13	2010	224151610.0000
366	14	2010	554059050.0000
367	15	2010	248347825.0000
368	22	2010	1152000225.0000
369	16	2010	230142720.0000
370	17	2010	746998780.0000
371	18	2010	592260315.0000
372	19	2010	687721320.0000
373	20	2010	548721655.0000
374	23	2010	175944600.0000
375	21	2010	146910675.0000
376	2	2011	2393886810.0000
377	3	2011	1964462850.0000
378	4	2011	749397560.0000
379	5	2011	667547405.0000
380	6	2011	355311440.0000
381	7	2011	114229670.0000
382	8	2011	427838765.0000
383	9	2011	31907570.0000
384	10	2011	496713900.0000
385	11	2011	34594700.0000
386	12	2011	374968880.0000
387	13	2011	221907590.0000
388	14	2011	551545295.0000
389	15	2011	252388740.0000
390	22	2011	1150496790.0000
391	16	2011	231720250.0000
392	17	2011	745753400.0000
393	18	2011	590127620.0000
394	19	2011	683707415.0000
395	20	2011	552961860.0000
396	23	2011	175278110.0000
397	21	2011	145948535.0000
398	2	2012	2476254984.0000
399	3	2012	1949360652.0000
400	4	2012	761757264.0000
401	5	2012	664165926.0000
402	6	2012	389632986.0000
403	7	2012	115254498.0000
404	8	2012	434949276.0000
405	9	2012	31663392.0000
406	10	2012	513476406.0000
407	11	2012	34492206.0000
408	12	2012	385265874.0000
409	13	2012	220742286.0000
410	14	2012	553475448.0000
411	15	2012	240055008.0000
412	22	2012	1163173986.0000
413	16	2012	236486142.0000
414	17	2012	743309034.0000
415	18	2012	610412970.0000
416	19	2012	692727468.0000
417	20	2012	554700816.0000
418	23	2012	172386366.0000
419	21	2012	142168308.0000
420	2	2007	2524701350.0000
421	3	2007	2029210565.0000
422	4	2007	666853540.0000
423	5	2007	690889885.0000
424	6	2007	334462275.0000
425	7	2007	123330580.0000
426	8	2007	433590435.0000
427	9	2007	31744050.0000
428	10	2007	510359060.0000
429	11	2007	33030310.0000
430	12	2007	353582070.0000
431	13	2007	234600830.0000
432	14	2007	568933530.0000
433	15	2007	254837525.0000
434	22	2007	1337661855.0000
435	16	2007	242390295.0000
436	17	2007	748047060.0000
437	18	2007	572009385.0000
438	19	2007	693809520.0000
439	20	2007	535629470.0000
440	23	2007	201617240.0000
441	21	2007	146259515.0000
464	2	2013	2511348190.0000
465	3	2013	1939881195.0000
466	4	2013	770990595.0000
467	5	2013	672661420.0000
468	6	2013	393649580.0000
469	7	2013	113258405.0000
470	8	2013	437470020.0000
471	9	2013	32366010.0000
472	10	2013	500897530.0000
473	11	2013	34387015.0000
474	12	2013	380824940.0000
475	13	2013	221560110.0000
476	14	2013	556839985.0000
477	15	2013	248418635.0000
478	22	2013	1143286945.0000
479	16	2013	233321140.0000
480	17	2013	745979335.0000
481	18	2013	607819535.0000
482	19	2013	686193795.0000
483	20	2013	547813900.0000
484	23	2013	171472255.0000
485	21	2013	145739390.0000
\.


--
-- Name: city_metrics_travel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_travel_id_seq', 485, true);


--
-- Data for Name: city_metrics_waste; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_waste (id, city_id, year, recycled, landfilled, incinerated) FROM stdin;
191	2	2008	174917.0000	65734.2620	188699.0259
192	3	2008	165808.7511	103499.7753	97415.7451
193	4	2008	44518.1927	24173.0039	40201.8437
194	5	2008	49502.8134	56679.5742	0.0000
195	6	2008	17218.2535	10565.6397	14039.0044
196	7	2008	8937.8872	5484.5572	7287.5590
197	8	2008	24143.6972	14815.3009	19685.7058
198	9	2008	4517.4165	2791.2480	3269.3625
199	10	2008	24628.4016	15112.7302	20080.9124
200	11	2008	3307.4832	2064.5700	1943.2083
201	12	2008	21134.8524	13192.6238	12417.1214
202	13	2008	13881.0531	8664.7168	8155.3785
203	14	2008	26182.1674	9471.6443	24513.8417
204	15	2008	10333.6611	3638.6376	7585.5398
205	22	2008	43581.4672	26742.9030	35534.4061
206	16	2008	14986.7096	9354.8807	8804.9725
207	17	2008	36017.0880	32345.2338	6380.3446
208	18	2008	32011.9625	19643.5059	26101.1423
209	19	2008	26462.4043	16238.1295	21576.2773
210	20	2008	22173.9192	7807.7707	16277.0141
211	23	2008	11462.5434	10293.9651	2030.5633
212	21	2008	3183.5873	1115.6552	2336.9480
213	2	2009	159886.0000	69903.0627	164427.6213
214	3	2009	160862.9144	81114.1879	104093.8110
215	4	2009	31708.6261	15883.8532	41132.3017
216	5	2009	36623.9214	51398.6418	0.0000
217	6	2009	16597.7552	10284.6253	12427.2447
218	7	2009	8475.5955	5251.8140	6345.9364
219	8	2009	22692.9289	14061.4359	16990.8869
220	9	2009	4392.9369	2518.9166	3110.2277
221	10	2009	24260.5955	15032.8241	18164.6466
222	11	2009	3223.9614	1625.6637	2086.2137
223	12	2009	21124.7242	10652.0192	13669.7328
224	13	2009	13520.7629	6817.7660	8749.2368
225	14	2009	25744.7293	9115.2289	24294.8447
226	15	2009	9573.6374	2461.7067	8002.2493
227	22	2009	41520.6138	25727.8138	31087.7479
228	16	2009	14481.5286	7302.2265	9370.9449
229	17	2009	37777.8359	28490.9546	6869.8344
230	18	2009	30655.2827	18995.2251	22952.5436
231	19	2009	25221.3917	15628.1714	18884.0240
232	20	2009	20775.3254	5342.0405	17365.3258
233	23	2009	12330.9542	9299.6502	2242.3628
234	21	2009	2915.0858	749.5674	2436.6123
235	2	2010	156088.0000	86002.9983	179265.9517
236	3	2010	164807.4595	78164.4754	102609.1236
237	4	2010	36818.6066	13888.6745	49289.1026
238	5	2010	38791.1171	49608.3161	0.0000
239	6	2010	17245.9390	12669.3635	10761.7616
240	7	2010	8611.7098	6326.4100	5373.8545
241	8	2010	22152.2294	16273.6658	13823.3709
242	9	2010	4293.1353	2705.5316	2676.5497
243	10	2010	23469.6140	17241.4544	14645.4415
244	11	2010	3076.2502	1458.9964	1915.2734
245	12	2010	21979.4926	10424.3795	13684.4320
246	13	2010	13438.2678	6373.4685	8366.6654
247	14	2010	25552.9995	10893.4437	22577.3473
248	15	2010	10342.0540	2516.8776	7782.5232
249	22	2010	40580.4366	29811.5575	25322.8881
250	16	2010	14478.2059	6866.6878	9014.1310
251	17	2010	34337.7539	30424.0348	7392.9564
252	18	2010	29763.2949	21864.9736	18572.8062
253	19	2010	24347.3807	17886.2871	15193.1830
254	20	2010	23405.8005	5696.1157	17613.1537
255	23	2010	11698.3464	10365.0023	2518.6669
256	21	2010	3048.0690	741.7885	2293.7095
257	2	2011	165870.2317	74921.0788	179694.1429
258	3	2011	166986.0295	64694.8020	107201.6415
259	4	2011	94968.6922	8616.0858	54671.2041
260	5	2011	39424.5495	46011.5874	0.0000
261	6	2011	17416.9298	10627.3086	12162.7546
262	7	2011	8714.8653	5317.5596	6085.8469
263	8	2011	22403.8159	13670.1627	15645.2439
264	9	2011	4347.4558	2304.5477	2947.8831
265	10	2011	23761.1902	14498.3934	16593.1384
266	11	2011	3140.0956	1216.5561	2015.8777
267	12	2011	22376.6073	8669.2892	14365.3277
268	13	2011	13570.2775	5257.4842	8711.8427
269	14	2011	26080.3460	10591.3733	23772.8090
270	15	2011	10563.7480	2213.8886	8095.5815
271	22	2011	41194.3672	25135.6156	28767.2388
272	16	2011	14646.7822	5674.5506	9402.9369
273	17	2011	38497.9136	28991.1512	5401.3614
274	18	2011	30106.9277	18370.3796	21024.5536
275	19	2011	24639.5203	15034.3251	17206.5021
276	20	2011	24222.0473	5076.3152	18562.6880
277	23	2011	13223.0562	9957.7246	1855.2306
278	21	2011	3093.0169	648.2164	2370.3491
279	2	2012	167272.6783	75554.5428	181213.4719
280	3	2012	167095.9588	51573.9104	109173.0795
281	4	2012	60777.6517	7293.3182	56788.9218
282	5	2012	43362.3648	45592.1448	0.0000
283	6	2012	17892.9473	9132.1402	13778.0103
284	7	2012	8921.3592	4553.2522	6869.6664
285	8	2012	22990.9379	11734.0349	17703.5886
286	9	2012	4409.4150	1926.2494	3207.8505
287	10	2012	24283.4632	12393.7095	18698.8650
288	11	2012	3134.3128	967.4008	2047.8208
289	12	2012	22565.7816	6964.8937	14743.4796
290	13	2012	13590.7069	4194.7508	8879.5644
291	14	2012	27169.4310	10663.0731	24328.9187
292	15	2012	10843.3571	2120.9720	8220.8015
293	22	2012	42586.1993	21734.9962	32792.4227
294	16	2012	14688.9865	4533.7331	9597.1315
295	17	2012	42748.4110	29486.9080	5506.3398
296	18	2012	30835.6070	15737.7698	23744.1771
297	19	2012	25237.3161	12880.5336	19433.3552
298	20	2012	25147.3185	4918.8419	19065.2316
299	23	2012	14727.5816	10158.7599	1897.0312
300	21	2012	3130.5941	612.3475	2373.4341
301	2	2007	177130.0000	82947.1230	223742.9520
302	3	2007	173489.6526	117178.0205	97707.2298
303	4	2007	35066.9612	24810.8877	42486.8640
304	5	2007	45591.0000	56929.3731	0.0000
305	6	2007	17293.2476	13730.3237	14385.2929
306	7	2007	9154.6035	7268.4826	7615.2066
307	8	2007	23618.3129	18752.2372	19646.7637
308	9	2007	4705.6718	3501.0801	3381.6543
309	10	2007	24597.1858	19529.4331	20461.0337
310	11	2007	3443.0280	2325.4828	1939.0709
311	12	2007	22111.0065	14934.1701	12452.6458
312	13	2007	14570.1418	9840.9349	8205.7239
313	14	2007	27676.7540	11647.0356	22962.3326
314	15	2007	10487.7078	3934.1447	7625.9321
315	22	2007	44662.5138	35460.7061	37152.2665
316	16	2007	15776.1727	10655.5098	8884.9456
317	17	2007	33543.5487	30671.5813	5543.7308
318	18	2007	32432.3480	25750.3186	26978.6703
319	19	2007	26900.2012	21357.9587	22376.7844
320	20	2007	21830.2716	8188.9627	15873.4561
321	23	2007	10455.5540	9560.3592	1727.9858
322	21	2007	3118.3380	1169.7497	2267.4386
345	2	2013	168526.7605	76120.9928	182572.0714
346	3	2013	177125.2674	56126.8525	110784.3950
347	4	2013	68861.6008	5754.6224	58715.3513
348	5	2013	43723.3300	46711.6047	0.0000
349	6	2013	18115.3481	7880.3516	14266.9592
350	7	2013	9254.9570	4025.9958	7288.8522
351	8	2013	23785.0333	10346.7196	18732.1878
352	9	2013	4545.5623	1780.7539	3310.1211
353	10	2013	24737.5203	10761.0606	19482.3303
354	11	2013	3252.3119	1030.5815	2034.1841
355	12	2013	23264.9310	7372.1122	14551.2345
356	13	2013	14022.0872	4443.2713	8770.2250
357	14	2013	31280.7561	11912.4529	21155.1125
358	15	2013	11171.6123	2871.3132	8228.6099
359	22	2013	43193.6527	18789.6567	34017.6783
360	16	2013	15308.8622	4851.0202	9575.0485
361	17	2013	42292.2493	28494.7288	6196.8300
362	18	2013	31529.5821	13715.6732	24831.4999
363	19	2013	25554.2968	11116.3663	20125.5924
364	20	2013	26099.3825	6708.0292	19223.8712
365	23	2013	14419.3345	9715.1377	2112.7787
366	21	2013	3482.6435	895.1045	2565.1906
\.


--
-- Name: city_metrics_waste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_waste_id_seq', 366, true);


--
-- Data for Name: city_metrics_water; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY city_metrics_water (id, city_id, year, total_res_water, total_com_ind_water) FROM stdin;
301	2	2008	8079000000.0000	6223000000.0000
302	3	2008	3518567065.0000	5620884031.0000
303	4	2008	2302164272.0000	2240378932.0000
304	5	2008	1499283000.0000	3706917232.0000
305	6	2008	659655000.0000	487368000.0000
306	7	2008	540663663.0000	150971236.0000
307	8	2008	1210600500.0000	785544000.0000
308	9	2008	232425677.0000	75012577.0000
309	10	2008	1741187529.0000	577659065.0000
310	11	2008	78194618.0000	247259595.0000
311	12	2008	585014774.0000	919526400.0000
312	13	2008	569125000.0000	348819000.0000
313	14	2008	2272379700.0000	499190300.0000
314	15	2008	627573000.0000	491752490.0000
315	22	2008	2745691000.0000	1561953000.0000
316	16	2008	666168465.0000	278071676.0000
317	17	2008	2381452000.0000	597913000.0000
318	18	2008	2655860000.0000	933140000.0000
319	19	2008	1638900000.0000	838700000.0000
320	20	2008	2220252000.0000	531301703.0000
321	23	2008	771373000.0000	125788400.0000
322	21	2008	109571442.0000	7971296.0000
323	2	2009	8065157859.0000	5613625300.0000
324	3	2009	3495585413.0000	5645898888.0000
325	4	2009	2254190004.0000	2150589012.0000
326	5	2009	1624882644.0000	2930958420.0000
327	6	2009	659046000.0000	485992000.0000
328	7	2009	468585446.0000	194921132.0000
329	8	2009	1280652750.0000	760044250.0000
330	9	2009	230170631.0000	77514777.0000
331	10	2009	1776138000.0000	503445150.0000
332	11	2009	78187886.0000	246526504.0000
333	12	2009	584364717.0000	945564592.0000
334	13	2009	607891584.0000	322658547.0000
335	14	2009	2259102800.0000	485144300.0000
336	15	2009	627894000.0000	458798073.0000
337	22	2009	2793238196.0000	1478649171.0000
338	16	2009	723129626.0000	306474943.3000
339	17	2009	2267971000.0000	980958000.0000
340	18	2009	2296198984.0000	806772616.0000
341	19	2009	1679600000.0000	812600000.0000
342	20	2009	2214391000.0000	509984000.0000
343	23	2009	785896000.0000	127319300.0000
344	21	2009	103013898.0000	10924542.0000
345	2	2010	7633035557.0000	5501945721.0000
346	3	2010	3206300260.0000	7672216020.0000
347	4	2010	2091352500.0000	2104172300.0000
348	5	2010	1499741490.0000	3136171666.0000
349	6	2010	569903000.0000	424104068.0000
350	7	2010	460932957.0000	173794252.0000
351	8	2010	1090718250.0000	711150750.0000
352	9	2010	198618344.0000	61231519.0000
353	10	2010	1299661682.0000	579127172.0000
354	11	2010	74669049.3500	293008955.8000
355	12	2010	492566025.9000	1162812343.0000
356	13	2010	553600000.0000	343478000.0000
357	14	2010	2132259300.0000	459365800.0000
358	15	2010	718497000.0000	216688165.0000
359	22	2010	2376264181.0000	1454249851.0000
360	16	2010	686766534.0000	190129342.1000
361	17	2010	1917179234.0000	895069339.0000
362	18	2010	1990962120.0000	699527232.0000
363	19	2010	1481300000.0000	727000000.0000
364	20	2010	1959753000.0000	450193000.0000
365	23	2010	668079000.0000	124150300.0000
366	21	2010	80722471.0000	11916792.0000
367	2	2011	7512024092.0000	5293892399.0000
368	3	2011	3417276343.0000	7866606296.0000
369	4	2011	2118344723.0000	2103128500.0000
370	5	2011	1472467172.0000	2634331653.0000
371	6	2011	572908000.0000	481276000.0000
372	7	2011	451766854.0000	192463150.0000
373	8	2011	1093334250.0000	675827250.0000
374	9	2011	203827957.0000	64704694.0000
375	10	2011	1626574500.0000	747749750.0000
376	11	2011	67616415.5800	334368000.0000
377	12	2011	484604509.1000	1250508717.0000
378	13	2011	618773000.0000	245730000.0000
379	14	2011	1901105100.0000	440210300.0000
380	15	2011	714415000.0000	200707423.0000
381	22	2011	2448300000.0000	1465000000.0000
382	16	2011	676252729.0000	183356091.4000
383	17	2011	1996070000.0000	919743000.0000
384	18	2011	2054680000.0000	565198000.0000
385	19	2011	1521300000.0000	749800000.0000
386	20	2011	2032871000.0000	486657000.0000
387	23	2011	719350000.0000	119177300.0000
388	21	2011	92805398.0000	9999764.0000
389	2	2012	7820850900.0000	5564569933.0000
390	3	2012	3734472810.0000	8132843968.0000
391	4	2012	2344880549.0000	2194500352.0000
392	5	2012	1535140596.0000	2953963852.0000
393	6	2012	610802000.0000	497722000.0000
394	7	2012	482215345.0000	207832724.0000
395	8	2012	1187897250.0000	676679250.0000
396	9	2012	221697967.0000	73881214.0000
397	10	2012	1833954000.0000	828822250.0000
398	11	2012	73368935.0600	386244654.5000
399	12	2012	679332903.8000	1358810930.0000
400	13	2012	579801000.0000	298457000.0000
401	14	2012	2167182941.0000	436651174.0000
402	15	2012	828552000.0000	224899150.0000
403	22	2012	2728566519.0000	1553946561.0000
404	16	2012	763347303.0000	217697645.9000
405	17	2012	2124698000.0000	1087565287.0000
406	18	2012	2211968040.0000	777177960.0000
407	19	2012	1720900000.0000	819600000.0000
408	20	2012	2482916000.0000	475376266.0000
409	23	2012	807257000.0000	130676185.0000
410	21	2012	139237000.0000	12076203.6000
411	2	2007	8435741201.0000	6763148147.0000
412	3	2007	3725397444.0000	5683161600.0000
413	4	2007	2405960761.0000	2351850791.0000
414	5	2007	1492293000.0000	3704893495.0000
415	6	2007	725621000.0000	491551000.0000
416	7	2007	516414937.0000	206704574.0000
417	8	2007	1325335500.0000	729457500.0000
418	9	2007	260798711.0000	79405934.0000
419	10	2007	1903815000.0000	644357000.0000
420	11	2007	83231999.9900	264440851.9000
421	12	2007	634425849.3000	980090181.8000
422	13	2007	633688987.0000	362869005.0000
423	14	2007	2410753400.0000	496845100.0000
424	15	2007	903032000.0000	218027930.0000
425	22	2007	2835484000.0000	1644816000.0000
426	16	2007	745556373.0000	288509947.3000
427	17	2007	2374858400.0000	971946700.0000
428	18	2007	2477620000.0000	916380000.0000
429	19	2007	1770800000.0000	842200000.0000
430	20	2007	2334889000.0000	491930000.0000
431	23	2007	755985000.0000	107046477.0000
432	21	2007	107892707.0000	9502468.0000
433	2	2013	7557270878.0000	5331148921.0000
434	3	2013	3124024270.0000	7352982607.0000
435	4	2013	2135677329.0000	2092597320.0000
436	5	2013	1485513788.0000	2735764404.0000
437	6	2013	562022000.0000	478167000.0000
438	7	2013	455876753.0000	189609429.0000
439	8	2013	1107621000.0000	578697000.0000
440	9	2013	207162763.0000	92002260.0000
441	10	2013	1655865000.0000	748497250.0000
442	11	2013	65649787.0100	430933277.9000
443	12	2013	506464831.1000	1345116343.0000
444	13	2013	592001000.0000	195217000.0000
445	14	2013	1960477900.0000	294161320.0000
446	15	2013	759723000.0000	208351000.0000
447	22	2013	2409412842.0000	1443914894.0000
448	16	2013	688827201.0000	329260345.9000
449	17	2013	1967429000.0000	986315957.0000
450	18	2013	2039372000.0000	639738000.0000
451	19	2013	1545000000.0000	744000000.0000
452	20	2013	2244377000.0000	441890000.0000
453	23	2013	719967000.0000	161472600.0000
454	21	2013	94426982.0000	34607801.0000
\.


--
-- Name: city_metrics_water_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('city_metrics_water_id_seq', 454, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-10-14 21:34:35.613185+00	1	lhbweb	2	Changed password.	3	2
2	2015-11-03 21:38:34.326423+00	3	lhb	1		3	2
3	2015-11-03 21:38:43.739324+00	3	lhb	2	Changed is_staff and is_superuser.	3	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 3, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	redirect	redirects	redirect
8	log entry	admin	logentry
9	revision	reversion	revision
10	version	reversion	version
11	City	city_metrics	city
12	Demographic Data	city_metrics	demographicdata
13	Energy	city_metrics	energy
14	Water	city_metrics	water
15	Travel	city_metrics	travel
16	Waste	city_metrics	waste
17	Emission	city_metrics	emissions
18	Cost	city_metrics	cost
19	Special Trend Line	city_metrics	specialtrendline
20	Home Page Section	site_content	homepage_section
21	Web Page	site_content	webpage
22	Header Link	site_content	headerlink
23	Header Sub Link	site_content	headersublink
24	In Page Link	site_content	inpagelink
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('django_content_type_id_seq', 24, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-10-06 12:53:26.485184+00
2	auth	0001_initial	2015-10-06 12:53:26.643273+00
3	admin	0001_initial	2015-10-06 12:53:26.750605+00
4	sites	0001_initial	2015-10-06 12:53:26.806624+00
5	redirects	0001_initial	2015-10-06 12:53:26.871786+00
6	sessions	0001_initial	2015-10-06 12:53:26.929545+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('django_migrations_id_seq', 6, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
3hblsedxbta8c12l35ejjwt8ts57mvgp	MTM4ZDllMjQyMTc3MzcwNDQ0Mjk1MTA5MWNmNTkxMGZkZDM3NjE3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFiNDJhODUwZTQ3MzNjYzNhNTgxMzE5MjkwMjk0OTdjYjI2MWFmYTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-20 15:54:13.841118+00
5oxgm0p7nkb18j4n2b56mwz83ndd5r5b	YzM5MjMzZjIwZjM3M2IyZDk2ODczY2JmYTcxMzkzYWQ2NTBmM2YzMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ0ZjZhODQ4MDI1Y2MwYzhmMTI1ZDRkZGQ0ZDBiNGIzZDgzOWQyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-10-28 21:51:47.292792+00
b88ltvvm0kk6rpoiehckohujh9htlyp9	ZjVkZGJlODQzNjYyOGQxZmZmMjcyZTAyYjZlNTI5YzY1YjdkNjM1YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZDUzZjdiOTRjYjBhNmY5ZTIwNWFjZDg2MDhjMjIxNzEwMTdiZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-11-17 21:40:10.128653+00
3iij29bffvsywxrrqi6879rr5tj9ts5m	ZjVkZGJlODQzNjYyOGQxZmZmMjcyZTAyYjZlNTI5YzY1YjdkNjM1YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZDUzZjdiOTRjYjBhNmY5ZTIwNWFjZDg2MDhjMjIxNzEwMTdiZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-11-17 21:40:59.925953+00
acupxzlok75osxfu5ut0d5egrg7d74st	ZjVkZGJlODQzNjYyOGQxZmZmMjcyZTAyYjZlNTI5YzY1YjdkNjM1YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3ZDUzZjdiOTRjYjBhNmY5ZTIwNWFjZDg2MDhjMjIxNzEwMTdiZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2016-05-23 14:12:44.13448+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY reversion_revision (id, manager_slug, date_created, user_id, comment) FROM stdin;
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 1, false);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY reversion_version (id, revision_id, object_id, object_id_int, content_type_id, format, serialized_data, object_repr, type) FROM stdin;
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('reversion_version_id_seq', 1, false);


--
-- Data for Name: site_content_headerlink; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY site_content_headerlink (id, title, direct_url, web_page_id, display_order, is_active) FROM stdin;
1	ABOUT		1	1	t
2	EXPLORE THE DATA	\N	6	2	t
4	SO WHAT?		12	3	t
\.


--
-- Name: site_content_headerlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('site_content_headerlink_id_seq', 4, true);


--
-- Data for Name: site_content_headersublink; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY site_content_headersublink (id, title, header_link_id, direct_url, web_page_id, display_order, is_active) FROM stdin;
1	ENERGY	2	\N	6	1	t
2	WATER	2	\N	7	2	t
3	TRAVEL	2	\N	9	3	t
4	WASTE	2	\N	8	4	t
5	GHG EMISSIONS	2	\N	10	5	t
6	OVERVIEW	1	/about-regional-indicators-initiative#overview	\N	1	t
10	BACKGROUND	1	/about-regional-indicators-initiative#background	\N	2	t
11	SCOPE	1	/about-regional-indicators-initiative#scope	\N	3	t
12	PURPOSE	1	/about-regional-indicators-initiative#purpose	\N	4	t
13	SPONSORS	1	/about-regional-indicators-initiative#sponsors	\N	5	t
14	COST	2	\N	15	6	t
15	MAKING SENSE OF THE NUMBERS	4	\N	12	1	t
16	NEXT STEPS	4	/making-sense-numbers-so-what#nextSteps	\N	2	t
17	CALL TO ACTION	4	/making-sense-numbers-so-what#calltoaction	\N	3	t
18	CONTRIBUTORS	1	/about-regional-indicators-initiative#contributors	\N	6	t
\.


--
-- Name: site_content_headersublink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('site_content_headersublink_id_seq', 18, true);


--
-- Data for Name: site_content_homepage_section; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY site_content_homepage_section (id, sect_type, billboard_image, graph_image, graph_copy) FROM stdin;
1	ENERGY	/customer_media/home_billboards/energy_2012.jpg	/customer_media/home_page_graphs/energy_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Total energy use</h1>\r\n<div class="p_small p_caption subHeading">(kBtu/capita/day)</div>\r\n<p>Total annual energy data accounts for residential and commercial/industrial energy including, but not limited to, building operations and utility and district energy provided power. Sources of this energy include natural gas, fuel oil, coal, and biomass. Total energy is then converted into kBtu (thousands of British Thermal Units) and normalized by population to get kBtu/capita/day.<span style="font-size: 16px; line-height: 1.4em;">&nbsp;</span></p>\r\n<p><a style="font-size: 16px; line-height: 1.4em;" title="Explore the Data - Energy" href="../../../../energy-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/energy-button-flat.png" alt="Explore the Data Button" width="186" height="39" /></a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>
2	HOME	/customer_media/home_billboards/home_2012.jpg	/customer_media/home_page_graphs/home_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Trends for 23 Minnesota cities from 2007-2013</h1>\r\n<div class="p_small p_caption subHeading">(click each icon for more information)</div>\r\n<p>The above chart compares aggregated trends from 2007-2013 for the cities participating in the Regional Indicators Initiative. It includes energy consumption, water use, vehicle miles traveled, municipal solid waste managed, and the associated greenhouse gas emissions. In order to normalize it for the various city populations, it shows per-capita data on an average daily basis.</p>\r\n<p><a title="Explore the Data" href="../../../../energy-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/emissions-button.png" alt="Explore the Data Button" width="186" height="39" /></a></p>\r\n<p>&nbsp;</p>
3	WATER	/customer_media/home_billboards/water_2012.jpg	/customer_media/home_page_graphs/water_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Total potable water use</h1>\r\n<div class="subHeading">(gallons/capita/day)</div>\r\n<p>Total annual water consumption is collected from municipal water data for both residential and commercial/industrial uses. These two uses are then normalized by population to get gallons of water used/capita/day for each of the four years in the study period.</p>\r\n<p><a title="Explore the Data - Water" href="../../../../water-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/water-button.png" alt="Explore the Data Button" width="186" height="39" /></a></p>
4	TRAVEL	/customer_media/home_billboards/travel_2012.jpg	/customer_media/home_page_graphs/travel_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Total vehicle miles traveled</h1>\r\n<div class="subHeading">(VMT/capita/day)</div>\r\n<p>The Minnesota Department of Transportation compiles annual data by roadway type regarding vehicle miles traveled (VMT) on all roads in the State, and aggregates the data by cities and counties. The data are normalized for each city by population to yield VMT/capita/day.</p>\r\n<p><a title="Explore the Data - Travel" href="../../../../travel-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/travel-button.png" alt="Explore the Data Button" width="186" height="39" /></a></p>
5	WASTE	/customer_media/home_billboards/waste_2012.jpg	/customer_media/home_page_graphs/waste_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Total waste production</h1>\r\n<div class="subHeading">(pounds/capita/day)</div>\r\n<p>Total municipal solid waste data is collected and categorized by waste management method (landfilled, composted, incinerated, or recycled) from private and public waste facilities county-wide. These data are not currently aggregated by municipality; consequently, city-specific estimates are made from county data on a per capita basis.</p>\r\n<p><a title="Explore the Data - Waste" href="../../../../waste-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/waste-button.png" alt="Explore the Data Button" width="186" height="39" /></a></p>
6	CARBON	/customer_media/home_billboards/carbon.jpg	/customer_media/home_page_graphs/carbon_graph-2013.png	<h1>&nbsp;</h1>\r\n<p>&nbsp;</p>\r\n<h1>Total greenhouse gas (GHG) emissions</h1>\r\n<div class="subHeading">(tonnes CO2e/capita/year)</div>\r\n<p>The sources for greenhouse gas (GHG) emissions represented here include those attributed to each of the four indicators (Energy, Water, Travel and Waste). Primary greenhouse gases&mdash;carbon dioxide (CO2), nitrous oxide (N2O), and methane (CH4), are aggregated geographically (not consumption-based) and reported as carbon dioxide equivalents (CO2e). CO2e combines greenhouse gases of differing impact on the Earth&rsquo;s climate into one weighted unit. The chart shows CO2e/capita/year for all Initiative cities.<span style="font-size: 16px; line-height: 1.4em;">&nbsp;</span></p>\r\n<p><a title="Explore the Data - Greenhouse Gas Emissions" href="../../../../emissions-chart" target="_self"><img style="margin-top: 20px; margin-bottom: 20px;" src="../../../../customer_media/explore_the_data_buttons/emissions-button.png" alt="Explore the Data Button" width="186" height="39" /></a></p>\r\n<p>&nbsp;</p>
\.


--
-- Name: site_content_homepage_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('site_content_homepage_section_id_seq', 6, true);


--
-- Data for Name: site_content_inpagelink; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY site_content_inpagelink (id, title, title_detail, bubble, bubble_active, teaser, web_page_id, display_order, is_active) FROM stdin;
1	Energy	british thermal units	/customer_media/media/bubbles/energy.png	/customer_media/media/bubbles/energy.png	Electricity, natural gas, and district energy consumed by residential and commercial / industrial customers.	\N	1	t
2	Water	Gallons	/customer_media/media/bubbles/water.png	/customer_media/media/bubbles/water.png	Potable water consumed by households and commercial / industrial customers.	\N	2	t
3	Travel	vehicle miles	/customer_media/media/bubbles/travel.png	/customer_media/media/bubbles/travel.png	On-road distance traveled by all vehicles within a city’s boundaries.	4	3	t
4	Waste	pounds	/customer_media/media/bubbles/waste.png	/customer_media/media/bubbles/waste.png	Municipal solid waste managed via recycling, composting, combustion, and landfilling.	5	4	t
5	GHG Emissions	Carbon Dioxide Equivalents	/customer_media/media/bubbles/carbon.png	/customer_media/media/bubbles/carbon.png	Greenhouse gas emitted for each indicators. Provides a common metric to compare environmental impact.	\N	5	t
\.


--
-- Name: site_content_inpagelink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('site_content_inpagelink_id_seq', 5, true);


--
-- Data for Name: site_content_webpage; Type: TABLE DATA; Schema: public; Owner: lhbweb
--

COPY site_content_webpage (id, is_active, title, slug, template_override, chart_title, content) FROM stdin;
1	t	About The Regional Indicators Initiative	about-regional-indicators-initiative	\N	\N	<h1>About the Regional Indicators Initiative</h1>\r\n<h2 id="overview">Overview</h2>\r\n<p>The Regional Indicators Initiative measures annual performance metrics for&nbsp;22 Minnesota cities committed to increasing their overall efficiency and level of sustainability. The project collects the following data that reflect the activities of the people who live, work, learn, travel, visit, and play within each city&rsquo;s geographical boundaries:</p>\r\n<p>&nbsp;</p>\r\n<div class="left_col">\r\n<p>Actual data is collected for four primary indicators, which comprise over 90% of each city's total greenhouse gas emissions.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="spacer_cell">\r\n<p style="text-align: center;"><strong>ENERGY</strong></p>\r\n<a title="Explore the Data | Energy" href="http://regionalindicatorsmn.uli.org/energy-chart" target="_self">\r\n<p><img style="margin-right: auto; margin-left: auto; display: block;" alt="" src="../../../../customer_media/lightbulb.jpg" height="45" width="45" /></p>\r\n</a></td>\r\n<td><span style="font-size: small;">Electricity, natural gas, fuel oil, coal and biomass, and</span><br /><span style="font-size: small;">district energy consumed for both residential and commercial/industrial use.</span><br /><span style="font-size: small;">SOURCE:&nbsp;&nbsp;&nbsp; Utility data</span><br /><span style="font-size: small;">UNIT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thousand British thermal units (kBtu)</span></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center;"><strong>WATER</strong></p>\r\n<a title="Explore the Data | Water" href="http://regionalindicatorsmn.uli.org/water-chart" target="_self">\r\n<p style="text-align: center;"><img alt="" src="../../../../customer_media/water.jpg" height="45" width="45" /></p>\r\n</a></td>\r\n<td><span style="font-size: small;">Potable water consumption for both residential and commercial/industrial use.</span><br /><span style="font-size: small;">SOURCE:&nbsp;&nbsp;&nbsp; Municipal water data</span><br /><span style="font-size: small;">UNIT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gallons</span></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center;"><strong>TRAVEL</strong></p>\r\n<a title="Explore the Data | Travel" href="http://regionalindicatorsmn.uli.org/travel-chart" target="_self">\r\n<p style="text-align: center;"><img alt="" src="../../../../customer_media/travel.jpg" height="45" width="45" /></p>\r\n</a></td>\r\n<td><span style="font-size: small;">On-road distance traveled by all vehicles within the municipality boundaries.</span><br /><span style="font-size: small;">SOURCE:&nbsp;&nbsp;&nbsp; Minnesota Department of Transportation</span><br /><span style="font-size: small;">UNIT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vehicle miles traveled (VMT)</span></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center;"><strong>WASTE</strong></p>\r\n<a title="Explore the Data | Waste" href="http://regionalindicatorsmn.uli.org/waste-chart" target="_self">\r\n<p><img style="margin-right: auto; margin-left: auto; display: block;" alt="" src="../../../../customer_media/waste.jpg" height="45" width="45" /></p>\r\n</a></td>\r\n<td style="text-align: left;"><span style="font-size: small;">Total municipal solid waste that is landfilled, composted, incinerated or recycled.</span><br /><span style="font-size: small;">SOURCE:&nbsp;&nbsp;&nbsp; MPCA SCORE reports and county Waste&nbsp;</span><span style="font-size: small;">Certification reports (data not currently&nbsp;</span><span style="font-size: small;">available at a city level).</span><br /><span style="font-size: small;">UNIT:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pounds (lbs)</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div class="right_col">\r\n<p>The Greenhouse Gas (GHG) emissions and costs associated with each of these indicators are also calculated, providing a common metric to compare the economic and environmental impacts of the indicators.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="spacer_cell">\r\n<p style="text-align: center;"><strong>GHG EMISSIONS<br /></strong></p>\r\n<a title="Explore the Data | Greenhouse Gas Emissions" href="http://regionalindicatorsmn.uli.org/emissions-chart" target="_self">\r\n<p><img style="margin-right: auto; margin-left: auto; display: block;" alt="" src="../../../../customer_media/emissions.jpg" height="45" width="45" /></p>\r\n</a></td>\r\n<td><span style="font-size: small;">The greenhouse gases (GHG) associated with each of the four indicators (Energy, Water, Travel and Waste) are represented for each city. The carbon baseline assessments prepared for each participating city have been prepared consistent with the &lsquo;U.S. ICLEI Community Protocol for Accounting and Reporting of Greenhouse Gas Emissions&rsquo;, October 2012 and are geographically calculated rather than consumption-based. &nbsp;<br />UNIT:&nbsp;&nbsp;&nbsp; Carbon dioxide equivalents (CO2e)</span></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center;">&nbsp;<strong>COST</strong></p>\r\n<a title="Explore the Data | Cost" href="http://regionalindicatorsmn.uli.org/cost-chart" target="_self">\r\n<p><strong><img style="margin-right: auto; margin-left: auto; display: block;" alt="" src="../../../../customer_media/cost.jpg" height="45" width="45" /></strong></p>\r\n</a></td>\r\n<td><span style="font-size: small;">The retail costs to the consumer.&nbsp; In the case of electricity, natural gas, and other stationary fuels, the estimates include the average retail costs for all of the consumption costs and related fees.&nbsp; For vehicle miles traveled, the assessments include the average statewide costs for the fuel only, not the full costs of driving.&nbsp; For waste management, the costs are statewide averages of the total retail service costs and fees for the various waste management methods.</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div style="clear: both;">&nbsp;</div>\r\n<p>The indicators are expressed not only as annual totals, but are also broken down into residential and commercial/industrial uses and also presented in terms of per capita, per job and per household normalizations. This enables energy, water, waste, and travel to be compared across cities and across time. Caution should be taken when making direct comparisons between cities, however, as many factors are not included in this simplified normalization. The Initiative supports planning for sustainability by defining a baseline, tracking a business-as-usual trajectory, establishing targets, and measuring outcomes of sustainable strategies at a city-wide scale.</p>\r\n<p>For more information regarding the process of data collection and assumptions made, see <a href="../../../../customer_media/pdf_documents/data_collection_process.pdf" target="_blank">here</a>.&nbsp;</p>\r\n<hr />\r\n<h2 id="background">Background</h2>\r\n<p>The Initiative was conceived as a way to track the progress of cities involved in the GreenStep Cities Program. To achieve GreenStep recognition a city must meet minimum requirements and choose from 28 best practices designed to improve the city&rsquo;s sustainability. While the program tracks which practices cities have adopted, it does not currently have a method of tracking how effective these strategies have been at&nbsp; &ldquo;moving the needle&rdquo; towards sustainability.</p>\r\n<p>The desire to measure the impacts of sustainable practices led to a collaborative project, managed by LHB for the Urban Land Institute of Minnesota (ULI MN).&nbsp; This team developed a pilot to determine what citywide data can be collected annually to effectively measure progress towards sustainability. Three cities &ndash; St. Louis Park, Falcon Heights, and Edina &ndash; funded the study and volunteered to release their resource consumption data for the period of 2008-2010. The pilot study proved that the four indicators of city-wide sustainability described above (energy, water, vehicle miles traveled and waste) can be measured, gathered, and analyzed annually in a reasonable period of time and at a relatively low cost. The Regional Indicators Initiative was developed to continue this study at a larger scale, opening up the possibility to compare data across a range of Minnesota cities.</p>\r\n<hr />\r\n<h2 id="scope">Scope</h2>\r\n<div class="left_col">\r\n<p>The Initiative&rsquo;s participant cities currently comprise a data sample size that represents over a quarter of Minnesota&rsquo;s population (29%) and includes municipalities of varying&nbsp; types from the state&rsquo;s four largest cities to inner and outer-ring suburbs of various sizes:</p>\r\n<br /> <strong>Central/Stand-Alone Cities:</strong>\r\n<p>Minneapolis, St. Paul, Rochester, Duluth</p>\r\n<br /> <strong>Inner-ring Suburbs:</strong>\r\n<p>Richfield, Hopkins, St. Louis Park, St. Anthony, Edina, Falcon Heights, Maplewood</p>\r\n<br /> <strong>Outer-ring Suburbs:</strong>&nbsp;\r\n<p>White Bear Lake, Coon Rapids, Oakdale, Bloomington, Shoreview, Eagan, Eden Prairie, Minnetonka, Woodbury, Rosemount, Lake Elmo</p>\r\n<br />\r\n<p>Annual data has been collected for all indicators from 2008 through 2012. The list of participant cities continues to grow along with the awareness that maintaining a continuous database of consumption patterns is an essential task for measuring actual (rather than predicted) progress in sustainability.</p>\r\n</div>\r\n<div class="right_col" style="text-align: center;"><span><span><a class="fancybox" href="../../../../customer_media/rii-cities-map-web_large.jpg" target="_self"><img style="vertical-align: middle;" alt="" src="../../../../customer_media/rii-cities-map-web_big.jpg" width="400" /></a></span></span>&nbsp;<strong><span style="font-size: x-small;">CLICK TO ENLARGE</span></strong></div>\r\n<hr />\r\n<h2 id="purpose" style="clear: both;">Purpose</h2>\r\n<p class="left_col" style="clear: both;">Recording these performance metrics is essential to promoting efficiency and sustainable change. By collecting annually comparable indicators for twenty Minnesota cities, the effectiveness of best practices within the State&rsquo;s GreenStep Cities Program can be analyzed, promoted and improved. Additionally, the Initiative will indicate progress toward meeting the State&rsquo;s energy efficiency and GHG reduction goals, as defined by the Minnesota Next Generation Energy Act of 2007.&nbsp; Along with providing state-wide benefits and serving as a model for other regions, the Initiative is valuable to each participating city.&nbsp; Inventorying the resources consumed at the community level will:<br /><br />&bull; Highlight opportunities to save resources and money.<br />&bull; Provide a baseline for estimating the effectiveness of sustainability measures.<br />&bull; Enable comparison with peer cities and different time-frames.<br />&bull; Inform subsequent analyses, plans, and policy decisions by the cities and others.<br />&bull; Improve each city&rsquo;s competitiveness for federal and state funding opportunities that are targeted to cities that have taken steps to measure and improve their energy efficiency and reduce their carbon footprints.<br />&bull; Assist in promoting public understanding of the city&rsquo;s effect on climate change.</p>\r\n<div class="right_col"><a class="fancybox" href="../../../../customer_media/bus_as_usual_chart.jpg" target="_blank"><img alt="" src="../../../../customer_media/bus_as_usual_chart.jpg" width="400" /></a>\r\n<p style="text-align: center;"><strong><span style="font-size: x-small;">CLICK TO ENLARGE </span></strong></p>\r\n<p>The graph above is a linear regression from 2005 and 2008-2011 data to show that if the RII cities continue to follow current trends, their GHG emissions from energy, VMT, and waste will increase. It also shows the rate of change necessary to meet the statewide target established by the Next Generation Energy Act (NGEA) of a 40% reduction of GHG emissions by 2030, using 2005 as a baseline. This target is based on total GHG emissions; therefore, since the population is expected to continue growing, each person must reduce their emissions at the even steeper rate of 49%.</p>\r\n</div>\r\n<hr />\r\n<div class="left_col">\r\n<h2 id="sponsors">Sponsors</h2>\r\n<p><strong>Participating Cities:</strong></p>\r\n<table style="width: 100%;">\r\n<tbody>\r\n<tr>\r\n<td><span>Bloomington</span></td>\r\n<td><span>Minnetonka</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Coon Rapids</span></td>\r\n<td><span>Oakdale</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Duluth</span></td>\r\n<td><span>Richfield</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Eagan</span></td>\r\n<td><span>Rochester</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Eden Prairie</span></td>\r\n<td><span>Rosemount</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Edina</span></td>\r\n<td><span>St. Paul</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Falcon Heights</span></td>\r\n<td><span>Shoreview</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Hopkins</span></td>\r\n<td><span>Saint Anthony</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Lake Elmo</span></td>\r\n<td><span>St. Louis Park</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Maplewood</span></td>\r\n<td><span>White Bear Lake</span></td>\r\n</tr>\r\n<tr>\r\n<td><span>Minneapolis</span></td>\r\n<td><span>Woodbury</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br /><strong>Primary Funders:</strong><br />Minnesota Pollution Control Agency<br />Minnesota Department of Commerce<br />Urban Land Institute MN<br />Great Plains Institute<br /><br /><strong>Team Members:</strong><br />LHB Inc.<br />ORANGE Environmental, LLC</p>\r\n</div>\r\n<div class="right_col">\r\n<h2 id="contributors" style="text-align: left;">Contributors</h2>\r\n<p style="text-align: left;"><strong>Public and Private Utilities:</strong><br />Anoka Municipal Utility<br />CenterPoint Energy<br />Connexus<br />Dakota Electric Association<br />Duluth Comfort Systems<br />Duluth Steam Cooperative<br />Great River Energy<br />Hennepin Energy Recovery Center<br />Minnesota Energy Resources<br />Minnesota Power<br />Minnesota Valley Electric Cooperative<br />NRG Energy<br />Olmsted County Waste to Energy Facility<br />Rochester Public Utility<br />St. Paul District Energy<br />University of Minnesota (Southeast Steam)<br />Western Lake Superior Sanitation District<br />Xcel Energy<br /><br /><strong>State and Local Government:</strong><br />Duluth Port Authority<br />Hennepin County<br />Metropolitan Airports Commission<br />Metropolitan Council of the Twin Cities<br />Minnesota Department of Administration<br />Minnesota Department of Employment and Economic Development<br />Minnesota Department of Natural Resources<br />Minnesota Department of Transportation<br />Minnesota Pollution Control Agency<br />Rochester International Airport<br />U.S. Energy Information Administration<br />University of Minnesota<br /><br /><strong>Other Organizations:</strong><br />Degree Days.net<br />ICLEI Local Governments for Sustainability</p>\r\n</div>
2	t	Explore the Data	explore-data	\N	\N	\N
4	t	Travel	travel	home	\N	\N
5	t	Waste	waste	home	\N	\N
6	t	Energy Chart	energy-chart	energy	Energy	<p>The interactive graphic below represents energy data (from electricity and stationary combustion of natural gas, fuel oil, diesel, coal and biomass) in British Thermal Units (BTU), tonnes carbon dioxide equivalents (tonnes CO2e), or dollars ($). To begin, choose a data set (right) and the units (above). Check the boxes below to see energy data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by weather (Heating Degree Days and Cooling Degree Days), population (per capita), households or jobs. Hover over the graphic to get specific values.&nbsp;</p>
7	t	Water Chart	water-chart	water	Water	<p>The interactive graphic below represents potable water used in gallons or dollars. The graphs show water sold by each municipality, and do not include water used by&nbsp;other permit holders within the city, such as residences with private wells or commercial, industrial, or agricultural&nbsp;uses with separate use permits. In order to represent consumption, these values do not include water lost to distribution leakage.&nbsp;To begin, choose a data set (right) and the units (above).&nbsp;Check the boxes below to see water data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by population (per capita), households or jobs. Hover over the graphic to get specific values.</p>
8	t	Waste Chart	waste-chart	waste	Waste	<p>The interactive graphic below represents municipal solid waste (MSW) data in pounds (lbs), tonnes carbon dioxide equivalents (tonnes CO2e), or dollars. To begin, choose a data set (right) and the units (above). &nbsp;Check the boxes below to see waste data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by &nbsp;population (per capita), households or jobs. Hover over the graphic to get specific values.&nbsp;</p>
9	t	Travel Chart	travel-chart	travel	Travel	<p>The interactive graphic below shows vehicle travel within city boundaries in terms of&nbsp;vehicle miles traveled (VMT), tonnes carbon dioxide equivalents (tonnes CO2e), or dollars. Select the units above and check the boxes below to see travel data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by population (per capita), households or jobs. Hover over the graphic to get specific values.&nbsp;</p>
10	t	Emissions Chart	emissions-chart	emissions	GHG Emissions	<p>The interactive graphic below represents greenhouse gas (GHG) emissions in carbon dioxide equivalents (CO2e). To begin, choose a data set (right). You may view greenhouse gas emissions by associated sector (Energy, Water, Travel, and Waste) or as a total. Check the boxes below to see GHG emissions data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by population (per capita), households or jobs. Other GHG emissions refer to airport and wastewater emissions combined. Hover over the graphic to get specific values.</p>
11	t	Home	home	home	\N	\N
12	t	Making Sense of the Numbers | So What?	making-sense-numbers-so-what	\N	\N	<h1>SO WHAT?</h1>\r\n<h2>Making Sense of the Numbers</h2>\r\n<p>The Initiative&rsquo;s participant cities currently comprise a data sample size that represents over a quarter of Minnesota&rsquo;s population (29%) and includes municipalities of varying types from the state&rsquo;s four largest cities to inner and outer-ring suburbs of various sizes. Through the process of compiling four years of data for 22 Minnesota cities, certain trends have emerged. Key findings from each indicator category are visualized and explained below.</p>\r\n<div class="accordion">\r\n<h3>ENERGY</h3>\r\n<div class="accordion_sect">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td style="width: 405px;">\r\n<p>A major discovery of this project was a &lsquo;check-mark&rsquo; trend in energy use over time.&nbsp; Total energy use decreased in every city from 2008 to 2010 and increased from 2010-2011. This trend was broken in 2012, with the majority of cities showing a decrease in annual energy use, but several large increases causing the total energy use to peak in 2012.</p>\r\n<p>Another finding that is consistent across all five years is that the majority of energy consumption is commercial &amp; industrial energy, not residential.&nbsp; Overall, average residential energy across all cities is 40% while commercial/industrial is 60%.&nbsp; This varies slightly by geographic location of the cities: residential consumption is a smaller percentage in central/stand-alone cities than it is in inner-ring and outer-ring suburbs.</p>\r\n</td>\r\n<td style="width: 20px;">&nbsp;</td>\r\n<td style="width: 405px;">\r\n<p><strong>FIVE-YEAR TREND</strong><br /><span style="font-size: small;">TOTAL ENERGY USE | 2008-2012 (MMBTU/YEAR)</span></p>\r\n<a class="fancybox" title="The 'Check Mark' Trend" href="../../../../customer_media/check-mark-trend-2012_large.jpg" target="_self">\r\n<p><img alt="" src="../../../../customer_media/check-mark-trend-2012_large.jpg" height="249" width="405" /></p>\r\n</a>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>ENERGY USE BY SECTOR</strong><br /> <span style="font-size: small;">RESIDENTIAL VS. COMMERCIAL/INDUSTRIAL BREAKDOWN SHOWN FOR 2011</span></p>\r\n<p>&nbsp;<a class="fancybox" title="Commercial/industrial energy use is greater than residential" href="../../../../customer_media/all-energy-2008-2012.jpg" target="_self"><img alt="" src="../../../../customer_media/all-energy-2008-2012.jpg" width="840" /></a></p>\r\n</div>\r\n<h3>WATER</h3>\r\n<div class="accordion_sect">\r\n<p>Potable water use shows a similar five-year trend as energy, with total use dropping from 2008-2010 and rising from 2010-2012. However, this trend is not as consistent as the energy trend when looking at individual cities. Stronger trends are seen when comparing residential and commercial water use.&nbsp; Unlike energy, residential water use is greater than commercial/industrial water use, especially in suburban cities. Additionally, residential water use per person increases with distance from central cities, suggesting that lot size plays a key role in household water use.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>WATER USE BY SECTOR</strong><br /><span style="font-size: small;">RESIDENTIAL VS. COMMERCIAL/INDUSTRIAL BREAKDOWN SHOWN FOR 2011</span></p>\r\n<a class="fancybox" title="Residential water use is greater than commercial/industrial" href="../../../../customer_media/all-water-2008-2012.jpg">\r\n<p><img alt="" src="../../../../customer_media/all-water-2008-2012.jpg" width="840" /></p>\r\n</a></div>\r\n<h3>TRAVEL</h3>\r\n<div class="accordion_sect">&nbsp;\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><a class="fancybox" title="Vehicle travel per person increases at greater distances from central cities" href="../../../../customer_media/vmt-2012_large.jpg"><img alt="" src="../../../../customer_media/vmt-2012.jpg" width="570" /></a></td>\r\n<td style="width: 30px;">&nbsp;</td>\r\n<td>\r\n<p><strong>VEHICLE&nbsp;TRAVEL BY CITY TYPE</strong><br /> VMT/CAPITA/DAY | 2012</p>\r\n<p>Travel data reveals that the total vehicle miles traveled (VMT) has decreased only minimally over five years.&nbsp; A stronger finding is that the average miles traveled per person is lowest in central/stand-alone cities and highest in outer-ring suburbs. Additionally, the average VMT per person in Regional Indicators&rsquo; cities is lower than both the Minnesota and national averages.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<h3>WASTE</h3>\r\n<div class="accordion_sect">\r\n<p>Because waste data is collected at a county-wide scale, this metric is not as city-specific as the other indicators. In order to estimate city waste numbers, county data was pro-rated by city population. This provides a general ballpark of city-wide waste data but is not specific enough to reflect the waste trends of an individual city. However, conclusions can be made at a county-wide scale, where over the seven counties involved in RII in 2011, 47% of the waste was recycled, 29% incinerated and 24% landfilled.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ALMOST HALF OF MUNICIPAL SOLID WASTE (MSW) IS RECYCLED</strong><br />BREAKDOWN OF MSW BY COUNTY - 2011 (POUNDS/CAPITA/YEAR)</p>\r\n<p>&nbsp;</p>\r\n<p><img alt="" src="../../../../customer_media/waste_chart.jpg" height="137" width="742" /></p>\r\n</div>\r\n<h3>GHG EMISSIONS</h3>\r\n<div class="accordian_sect">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td style="width: 405px;">Greenhouse gas (GHG) emissions are calculated in this project using the method prescribed in the U.S. ICLEI Community Protocol for Accounting and Reporting of Greenhouse Gas Emissions, October 2012 (ICLEI Protocol). In order to be fully compliant, the ICLEI Protocol requires the inclusion of emissions associated with energy, vehicle miles traveled, airport operations (when they constitute 5% or more of a community&rsquo;s total), municipal solid waste management and wastewater treatment. GHG emissions reported here do not, however, include those associated with the provision of food and products consumed within a city but produced outside of a city. A consumption-based emissions estimate would likely be roughly 40% higher than shown here. Such accounting highlights the importance and efficacy of more sustainable consumption and sustainable materials management for cutting global carbon emissions. All emissions can be converted into carbon dioxide equivalents (CO2e) to generate a common metric to compare all four indicators.<br /><br /></td>\r\n<td style="width: 50px;">&nbsp;</td>\r\n<td style="width: 405px;">\r\n<p>THE LARGEST CONTRIBUTOR TO<br />GREENHOUSE GAS EMISSIONS IS ENERGY<br />BREAKDOWN OF GREENHOUSE GAS EMISSIONS - 2011 (all 20 cities)</p>\r\n<p><img alt="" src="../../../../customer_media/emissions_chart.jpg" height="260" width="410" /></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>When looking at the breakdown of GHG emissions in 2011 for each category, energy dominates with 68% of emissions. Vehicle miles traveled is the second largest contributor at 25% of emissions. Airport share equaled 5% of total emissions, solid waste - 1.5% and wastewater treatment was only 0.5% of the total (energy used to pump and clean water is included within the energy sector in this case).</p>\r\n<p>This analysis reveals the magnitude at which energy contributes to overall greenhous gas emissions for the 22 cities studied; explaining why the trend lines for GHG and energy over the four year study period closely align. In addition, it reveals that the four &lsquo;primary&rsquo; indicators which data was collected for in this study (energy, water, travel and waste) cover the majority -91.5%- of all GHG emissions.</p>\r\n</div>\r\n</div>\r\n<p>&nbsp;&nbsp;</p>\r\n<h2 id="nextSteps">Next Steps</h2>\r\n<p>An original and continuous goal of the Regional Indicators Initiative is to correlate metrics with the strategies outlined by the GreenStep Cities program. The &lsquo;best practices&rsquo; outlined in the GreenStep Cities program provide cities with an expansive list of sustainable strategies but lack a way of measuring progress towards sustainable goals. &nbsp;<br /><br />Currently,&nbsp;20 of the 22 RII cities have joined the GreenStep Cities program, providing an opportunity to compare the best practices each city has adopted with the data collected through the Regional Indicators Initiative. By comparing the strategies adopted with data collected through the RII, the hope is that the impact of each strategy can be measured. In addition, strategies that cities have adopted that are not a part of the GreenStep Cities program can be identified for continued improvement and refinement. In the future, this collaboration can guide cities to focus on selecting the best practices with the greatest impact. <br /><br />Out of the 28 best practice categories, 19 are directly measurable within the Regional Indicators Initiative&rsquo;s four current indicators. Categories that are not currently directly covered include: Land Use, Urban Forests, Efficient Storm-water Management, Surface Water Quality, Local Air Quality and Local Food. A possible addition could be to expand the RII indicators to cover the remaining nine best practice categories that are not currently correlated. <br /><br />The Regional Indicators Initiative&rsquo;s purpose, findings, and implications have been presented at several conferences and events throughout the United States. The findings of this Initiative have also been shared at public presentations in each participating city.</p>\r\n<hr />\r\n<h2 id="calltoaction">Call To Action</h2>\r\n<p>There are many opportunities to contribute to the Regional Indicators Initiative&rsquo;s mission and goals whether you are a city leader, business owner/organization leader or individual:</p>\r\n<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td style="width: 270px;">\r\n<p><strong>CITY LEADERS</strong></p>\r\n<p>The Regional Indicators Initiative currently includes&nbsp;22 Minnesota cities and 29% of the State&rsquo;s population.&nbsp; The addition of each city enriches the data sample and provides a more complete picture of current sustainability in Minnesota. &nbsp;</p>\r\n<p>If your city is interested in becoming a participating city, please contact Rick Carter at LHB at 612-752-6923 or <a href="mailto:regionalindicatorsMN@lhbcorp.com">regionalindicatorsMN@lhbcorp.com</a>.</p>\r\n<p>For more information about the GreenStep Cities Program:</p>\r\n<p><a href="http://greenstep.pca.state.mn.us/" target="_blank">http://greenstep.pca.state.mn.us/</a></p>\r\n</td>\r\n<td style="width: 30px;">&nbsp;</td>\r\n<td style="width: 270px;">\r\n<p><strong>BUSINESS OWNERS &amp; ORGANIZATIONS</strong></p>\r\n<p>Sustainability in business refers to practices that are designed to keep your company and the environment healthy and prosperous on social, financial and environmental levels.</p>\r\n<p>The Sustainable Business Resource Center (SBRC) is a dynamic tool for Minnesota business professionals of all business sectors to learn the latest tips for greening their business while also increasing the bottom line.</p>\r\n<p>Resources are organized by sector and offer a comprehensive list of strategies and additional resources.</p>\r\n<p>For more information about SBRC:</p>\r\n<p><a href="http://www.sbrcmn.com/" target="_blank">http://www.sbrcmn.com/</a></p>\r\n</td>\r\n<td style="width: 30px;">&nbsp;</td>\r\n<td style="width: 270px;">\r\n<p><strong>INDIVIDUALS</strong></p>\r\n<p>There are many opportunities for us as individuals to decrease our personal resource consumption related to the indicators outlined by the RII as well as others. &nbsp;</p>\r\n<p>The ThreeACTIONS Project is a resource that provides step-by-step instruction and explanation of 45 actions designed for individuals who are interesting in developing sustainable lifestyle habits.&nbsp; Actions are organized into categories of Waste, Transport, Water, Food and Energy.&nbsp;</p>\r\n<p>For more information about the ThreeACTIONS Project:</p>\r\n<p><a href="http://www.threeactionsproject.org/Actions/" target="_blank">http://www.threeactionsproject.org/Actions/</a></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>
15	t	Cost Chart	cost-chart	cost	Cost	<p>The interactive graphic below represents estimated retail costs to the consumer associated with consumption within each sector (Energy, Water, Travel and Waste). In the case of electricity, natural gas, and other stationary fuels, the estimates include the average retail costs for all of the consumption costs and related fees. For vehicle miles traveled, the assessments include the average statewide costs for the fuel only, not the full costs of driving. For waste management, the costs are statewide averages of the total retail service costs and fees for the various waste management methods. To begin, choose a data set (right). &nbsp;You may view costs by associated sector (Energy, Water, Travel, and Waste) or as a total. Check the boxes below to see cost data for individual or multiple cities over a single year or across multiple years. Add average &lsquo;trendlines&rsquo; to compare this data to different geographic sets of cities and normalize the data by population (per capita), households or jobs. Hover over the graphic to get specific values.</p>
16	t	Background | About	background-about	\N	\N	<h1>Background</h1>\r\n<h2>Sub Title</h2>\r\n<p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>
17	t	Scope | About	scope-about	\N	\N	<h1>Scope</h1>\r\n<h2>Sub Title</h2>\r\n<p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>
18	t	Purpose | About	purpose-about	\N	\N	<h1>Purpose</h1>\r\n<h2>Sub Title</h2>\r\n<p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>
19	t	Participation Cities  | About	participation-cities-about	\N	\N	<h1>Participant Cities and Contributors</h1>\r\n<h2>Sub Title</h2>\r\n<p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>
\.


--
-- Name: site_content_webpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lhbweb
--

SELECT pg_catalog.setval('site_content_webpage_id_seq', 19, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: city_metrics_city_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_city
    ADD CONSTRAINT city_metrics_city_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_cost
    ADD CONSTRAINT city_metrics_cost_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_demographicdata_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_demographicdata
    ADD CONSTRAINT city_metrics_demographicdata_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_emissions
    ADD CONSTRAINT city_metrics_emissions_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_energy_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_energy
    ADD CONSTRAINT city_metrics_energy_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_specialtrendline_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_specialtrendline
    ADD CONSTRAINT city_metrics_specialtrendline_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_travel_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_travel
    ADD CONSTRAINT city_metrics_travel_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_waste_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_waste
    ADD CONSTRAINT city_metrics_waste_pkey PRIMARY KEY (id);


--
-- Name: city_metrics_water_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY city_metrics_water
    ADD CONSTRAINT city_metrics_water_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_old_path_key; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_old_path_key UNIQUE (site_id, old_path);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: site_content_headerlink_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY site_content_headerlink
    ADD CONSTRAINT site_content_headerlink_pkey PRIMARY KEY (id);


--
-- Name: site_content_headersublink_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY site_content_headersublink
    ADD CONSTRAINT site_content_headersublink_pkey PRIMARY KEY (id);


--
-- Name: site_content_homepage_section_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY site_content_homepage_section
    ADD CONSTRAINT site_content_homepage_section_pkey PRIMARY KEY (id);


--
-- Name: site_content_inpagelink_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY site_content_inpagelink
    ADD CONSTRAINT site_content_inpagelink_pkey PRIMARY KEY (id);


--
-- Name: site_content_webpage_pkey; Type: CONSTRAINT; Schema: public; Owner: lhbweb; Tablespace: 
--

ALTER TABLE ONLY site_content_webpage
    ADD CONSTRAINT site_content_webpage_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: city_metrics_cost_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_cost_city_id ON city_metrics_cost USING btree (city_id);


--
-- Name: city_metrics_demographicdata_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_demographicdata_city_id ON city_metrics_demographicdata USING btree (city_id);


--
-- Name: city_metrics_emissions_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_emissions_city_id ON city_metrics_emissions USING btree (city_id);


--
-- Name: city_metrics_energy_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_energy_city_id ON city_metrics_energy USING btree (city_id);


--
-- Name: city_metrics_travel_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_travel_city_id ON city_metrics_travel USING btree (city_id);


--
-- Name: city_metrics_waste_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_waste_city_id ON city_metrics_waste USING btree (city_id);


--
-- Name: city_metrics_water_city_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX city_metrics_water_city_id ON city_metrics_water USING btree (city_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_redirect_91a0b591 ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_redirect_9365d6e7 ON django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_9db3e423470cdaf_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_redirect_old_path_9db3e423470cdaf_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: reversion_version_type; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX reversion_version_type ON reversion_version USING btree (type);


--
-- Name: site_content_headerlink_web_page_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_headerlink_web_page_id ON site_content_headerlink USING btree (web_page_id);


--
-- Name: site_content_headersublink_header_link_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_headersublink_header_link_id ON site_content_headersublink USING btree (header_link_id);


--
-- Name: site_content_headersublink_web_page_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_headersublink_web_page_id ON site_content_headersublink USING btree (web_page_id);


--
-- Name: site_content_inpagelink_web_page_id; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_inpagelink_web_page_id ON site_content_inpagelink USING btree (web_page_id);


--
-- Name: site_content_webpage_slug; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_webpage_slug ON site_content_webpage USING btree (slug);


--
-- Name: site_content_webpage_slug_like; Type: INDEX; Schema: public; Owner: lhbweb; Tablespace: 
--

CREATE INDEX site_content_webpage_slug_like ON site_content_webpage USING btree (slug varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_cost_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_cost
    ADD CONSTRAINT city_metrics_cost_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_demographicdata_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_demographicdata
    ADD CONSTRAINT city_metrics_demographicdata_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_emissions_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_emissions
    ADD CONSTRAINT city_metrics_emissions_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_energy_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_energy
    ADD CONSTRAINT city_metrics_energy_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_travel_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_travel
    ADD CONSTRAINT city_metrics_travel_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_waste_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_waste
    ADD CONSTRAINT city_metrics_waste_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: city_metrics_water_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY city_metrics_water
    ADD CONSTRAINT city_metrics_water_city_id_fkey FOREIGN KEY (city_id) REFERENCES city_metrics_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect_site_id_121a4403f653e524_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_121a4403f653e524_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_content_headerlink_web_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_headerlink
    ADD CONSTRAINT site_content_headerlink_web_page_id_fkey FOREIGN KEY (web_page_id) REFERENCES site_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_content_headersublink_header_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_headersublink
    ADD CONSTRAINT site_content_headersublink_header_link_id_fkey FOREIGN KEY (header_link_id) REFERENCES site_content_headerlink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_content_headersublink_web_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_headersublink
    ADD CONSTRAINT site_content_headersublink_web_page_id_fkey FOREIGN KEY (web_page_id) REFERENCES site_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_content_inpagelink_web_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lhbweb
--

ALTER TABLE ONLY site_content_inpagelink
    ADD CONSTRAINT site_content_inpagelink_web_page_id_fkey FOREIGN KEY (web_page_id) REFERENCES site_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

