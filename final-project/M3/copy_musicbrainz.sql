set search_path to musicbrainz;

copy area_type from
's3://cs327e-final-project-datasets/music-brainz-csv/area_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy area from
's3://cs327e-final-project-datasets/music-brainz-csv/area.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' delimiter ',' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy area_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/area_alias_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy area_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/area_alias.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist from
's3://cs327e-final-project-datasets/music-brainz-csv/artist.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_alias_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_alias.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_credit from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_credit.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' delimiter ',' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_credit_name from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_credit_name.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_type from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy gender from
's3://cs327e-final-project-datasets/music-brainz-csv/gender.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy language from
's3://cs327e-final-project-datasets/music-brainz-csv/language.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release from
's3://cs327e-final-project-datasets/music-brainz-csv/release.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_alias_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/release_alias.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_packaging from
's3://cs327e-final-project-datasets/music-brainz-csv/release_packaging.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_status from
's3://cs327e-final-project-datasets/music-brainz-csv/release_status.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_alias_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_alias.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_primary_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_primary_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_secondary_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_secondary_type.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' delimiter ',' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_secondary_type_join from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_secondary_type_join.csv'
iam_role 'arn:aws:iam::609062125426:role/redshifts3role'
region 'us-east-1'
csv quote '"' delimiter ',' ignoreheader 1 trimblanks compupdate ON
maxerror 50;
