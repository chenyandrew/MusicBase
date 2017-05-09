drop schema musicbrainz;

create schema musicbrainz;

set search_path to musicbrainz;

CREATE TABLE area_type ( -- replicate
    id                  INTEGER not null, -- PK
    name                VARCHAR(500) NOT NULL
);

CREATE TABLE area ( -- replicate (verbose)
    id                  INTEGER not null, -- PK
    name                VARCHAR(500) NOT NULL,
    type                INTEGER -- references area_type.id
);

CREATE TABLE area_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                varchar(500) NOT NULL
);

CREATE TABLE area_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    area                INTEGER NOT NULL, -- references area.id
    name                VARCHAR(500) NOT NULL,
    type                INTEGER, -- references area_alias_type.id
    sort_name           VARCHAR(500) NOT NULL
);

CREATE TABLE artist ( -- replicate (verbose)
    id                  integer not null,
    name                VARCHAR(500) NOT NULL,
    sort_name           VARCHAR(500) NOT NULL,
    type                INTEGER, -- references artist_type.id
    area                INTEGER, -- references area.id
    gender              INTEGER -- references gender.id
);

CREATE TABLE artist_alias_type ( -- replicate
    id                  integer not null,
    name                varchar(500) NOT NULL
);

CREATE TABLE artist_alias ( -- replicate (verbose)
    id                  integer not null,
    artist              INTEGER NOT NULL, -- references artist.id
    name                VARCHAR NOT NULL,
    type                INTEGER, -- references artist_alias_type.id
    sort_name           VARCHAR NOT NULL
);

CREATE TABLE artist_credit ( -- replicate
    id                  integer not null,
    name                VARCHAR NOT NULL,
    artist_count        SMALLINT NOT NULL
);

CREATE TABLE artist_credit_name ( -- replicate (verbose)
    artist_credit       INTEGER NOT NULL, -- PK, references artist_credit.id CASCADE
    position            SMALLINT NOT NULL, -- PK
    artist              INTEGER NOT NULL, -- references artist.id CASCADE
    name                VARCHAR NOT NULL
);

CREATE TABLE artist_type ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL
);

CREATE TABLE gender ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL
);

CREATE TABLE language ( -- replicate
    id                  integer not null,
    name                VARCHAR(100) NOT NULL,
    frequency           INTEGER NOT NULL DEFAULT 0
);



CREATE TABLE release ( -- replicate (verbose)
    id                  integer not null,
    name                VARCHAR NOT NULL,
    artist_credit       INTEGER NOT NULL, -- references artist_credit.id
    release_group       INTEGER NOT NULL, -- references release_group.id
    status              INTEGER, -- references release_status.id
    packaging           INTEGER, -- references release_packaging.id
    language            INTEGER -- references language.id
);

CREATE TABLE release_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                TEXT NOT NULL
);

CREATE TABLE release_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    release             INTEGER NOT NULL, -- references release.id
    name                VARCHAR NOT NULL,
    type                INTEGER, -- references release_alias_type.id
    sort_name           VARCHAR NOT NULL
);

CREATE TABLE release_packaging ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL
);

CREATE TABLE release_status ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL
);


CREATE TABLE release_group ( -- replicate (verbose)
    id                  integer not null,
    name                VARCHAR NOT NULL,
    artist_credit       INTEGER NOT NULL, -- references artist_credit.id
    type                INTEGER -- references release_group_primary_type.id
);

CREATE TABLE release_group_alias_type ( -- replicate
    id                  integer not null, -- PK,
    name                TEXT NOT NULL
);

CREATE TABLE release_group_alias ( -- replicate (verbose)
    id                  integer not null, --PK
    release_group       INTEGER NOT NULL, -- references release_group.id
    name                VARCHAR NOT NULL,
    type                INTEGER, -- references release_group_alias_type.id
    sort_name           VARCHAR NOT NULL

);

CREATE TABLE release_group_primary_type ( -- replicate
    id                  integer not null,
    name                VARCHAR(255) NOT NULL
);

CREATE TABLE release_group_secondary_type ( -- replicate
    id                  integer not null, -- PK
    name                TEXT NOT NULL
);

CREATE TABLE release_group_secondary_type_join ( -- replicate (verbose)
    release_group INTEGER NOT NULL, -- PK, references release_group.id,
    secondary_type INTEGER NOT NULL
);
