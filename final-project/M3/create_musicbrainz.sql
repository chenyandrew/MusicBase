drop schema musicbrainz cascade;

create schema musicbrainz;

set search_path to musicbrainz;

CREATE TABLE area_type ( -- replicate
    id                  integer not null, -- PK
    name                VARCHAR(255) NOT NULL,
    parent              INTEGER, -- references area_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE area ( -- replicate (verbose)
    id                  integer unique, -- PK
    gid                 varchar(max),
    name                varchar(max),
    type                INTEGER, -- references area_type.id
    edits_pending       INTEGER,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    ended               BOOLEAN DEFAULT FALSE,
    comment             varchar(max)
);

CREATE TABLE area_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                TEXT NOT NULL,
    parent              INTEGER, -- references area_alias_type.id
    child_order         INTEGER NOT NULL,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE area_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    area                INTEGER NOT NULL, -- references area.id
    name                VARCHAR NOT NULL,
    locale              TEXT,
    edits_pending       INTEGER NOT NULL,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    type                INTEGER, -- references area_alias_type.id
    sort_name           VARCHAR NOT NULL,
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    primary_for_locale  BOOLEAN NOT NULL DEFAULT false,
    ended               BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE artist ( -- replicate (verbose)
    id                  integer not null,
    gid                 varchar(500) NOT NULL,
    name                VARCHAR(500) NOT NULL,
    sort_name           VARCHAR(500) NOT NULL,
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    type                INTEGER, -- references artist_type.id
    area                INTEGER, -- references area.id
    gender              INTEGER, -- references gender.id
    comment             VARCHAR(500) NOT NULL DEFAULT '',
    edits_pending       INTEGER,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    ended               BOOLEAN NOT NULL DEFAULT FALSE,
    begin_area          integer,
    end_area            integer
);

CREATE TABLE artist_alias_type ( -- replicate
    id                  integer not null,
    name                TEXT NOT NULL,
    parent              INTEGER, -- references artist_alias_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE artist_alias ( -- replicate (verbose)
    id                  integer not null,
    artist              INTEGER NOT NULL, -- references artist.id
    name                VARCHAR NOT NULL,
    locale              TEXT,
    edits_pending       INTEGER NOT NULL,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    type                INTEGER, -- references artist_alias_type.id
    sort_name           VARCHAR NOT NULL,
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    primary_for_locale  BOOLEAN NOT NULL DEFAULT false,
    ended               BOOLEAN NOT NULL DEFAULT FALSE
);


CREATE TABLE artist_credit ( -- replicate
    id                  integer not null,
    name                varchar(max),
    artist_count        SMALLINT NOT NULL,
    ref_count           INTEGER DEFAULT 0,
    created             TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE artist_credit_name ( -- replicate (verbose)
    artist_credit       INTEGER NOT NULL, -- PK, references artist_credit.id CASCADE
    position            SMALLINT NOT NULL, -- PK
    artist              INTEGER NOT NULL, -- references artist.id CASCADE
    name                VARCHAR(max),
    join_phrase         TEXT DEFAULT ''
);

CREATE TABLE artist_type ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL,
    parent              INTEGER, -- references artist_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE gender ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL,
    parent              INTEGER, -- references gender.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE language ( -- replicate
    id                  integer not null,
    iso_code_2t         CHAR(3), -- ISO 639-2 (T)
    iso_code_2b         CHAR(3), -- ISO 639-2 (B)
    iso_code_1          CHAR(2), -- ISO 639
    name                VARCHAR(100) NOT NULL,
    frequency           INTEGER NOT NULL DEFAULT 0,
    iso_code_3          CHAR(3)  -- ISO 639-3
);


CREATE TABLE release ( -- replicate (verbose)
    id                  integer not null,
    gid                 varchar(500) NOT NULL,
    name                VARCHAR NOT NULL,
    artist_credit       INTEGER NOT NULL, -- references artist_credit.id
    release_group       INTEGER NOT NULL, -- references release_group.id
    status              INTEGER, -- references release_status.id
    packaging           INTEGER, -- references release_packaging.id
    language            INTEGER, -- references language.id
    script              INTEGER, -- references script.id
    barcode             VARCHAR(255),
    comment             VARCHAR(255) NOT NULL DEFAULT '',
    edits_pending       INTEGER NOT NULL,
    quality             SMALLINT NOT NULL DEFAULT -1,
    last_updated        varchar(max)
);

CREATE TABLE release_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                TEXT NOT NULL,
    parent              INTEGER, -- references release_alias_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE release_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    release             INTEGER NOT NULL, -- references release.id
    name                VARCHAR NOT NULL,
    locale              TEXT,
    edits_pending       INTEGER NOT NULL,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    type                INTEGER, -- references release_alias_type.id
    sort_name           VARCHAR NOT NULL,
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    primary_for_locale  BOOLEAN NOT NULL DEFAULT false,
    ended               BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE release_label ( -- replicate (verbose)
    id                  integer not null,
    release             INTEGER NOT NULL, -- references release.id
    label               INTEGER, -- references label.id
    catalog_number      VARCHAR(255),
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE release_packaging ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL,
    parent              INTEGER, -- references release_packaging.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE release_status ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL,
    parent              INTEGER, -- references release_status.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500)
);


CREATE TABLE release_group ( -- replicate (verbose)
    id                  integer not null,
    gid                 varchar(max),
    name                varchar(max),
    artist_credit       INTEGER NOT NULL, -- references artist_credit.id
    type                INTEGER, -- references release_group_primary_type.id
    comment             VARCHAR(max) DEFAULT '',
    edits_pending       INTEGER DEFAULT 0,
    last_updated        varchar(max)
);

CREATE TABLE release_group_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                TEXT NOT NULL,
    parent              INTEGER, -- references release_group_alias_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE release_group_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    release_group       INTEGER NOT NULL, -- references release_group.id
    name                VARCHAR(500) NOT NULL,
    locale              TEXT,
    edits_pending       INTEGER NOT NULL,
    last_updated        TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    type                INTEGER, -- references release_group_alias_type.id
    sort_name           VARCHAR(MAX),
    begin_date_year     SMALLINT,
    begin_date_month    SMALLINT,
    begin_date_day      SMALLINT,
    end_date_year       SMALLINT,
    end_date_month      SMALLINT,
    end_date_day        SMALLINT,
    primary_for_locale  BOOLEAN NOT NULL DEFAULT false,
    ended               BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE release_group_primary_type ( -- replicate
    id                  integer not null,
    name                VARCHAR(500) NOT NULL,
    parent              INTEGER, -- references release_group_primary_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         text,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE release_group_secondary_type ( -- replicate
    id                  integer NOT NULL, -- PK
    name                varchar(500) NOT NULL,
    parent              INTEGER, -- references release_group_secondary_type.id
    child_order         INTEGER NOT NULL DEFAULT 0,
    description         TEXT,
    gid                 varchar(500) NOT NULL
);

CREATE TABLE release_group_secondary_type_join ( -- replicate (verbose)
    release_group INTEGER NOT NULL, -- PK, references release_group.id,
    secondary_type INTEGER NOT NULL, -- PK, references release_group_secondary_type.id
    created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
