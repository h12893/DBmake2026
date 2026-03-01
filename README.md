# このフォルダについて

このフォルダには政府統計データに関連したドキュメントやメタデータを格納している。

# フォルダ構成

## docs

ドキュメント形式で保存されるメタデータの格納先。

### metadata

- dataset_metadata.md：使用したデータそのものの説明。

- column_metadata.md：各カラムの意味・型・制約などの説明。

- Transformation Metadata.md：Raw → Landing → Curated の変換ルールの説明。

- region_type_definition.md：コード値と名称の対応表。

## sql

SQLテーブル形式で保存されるデータの作成用のクエリの格納先。
SQLは格納ファイルを.sqlに、ファイル名は **動詞＋対象＋用途** 形式で、全て小文字とする。

### population

#### PL_population_yyyyのクエリ

- create_population_curated.sql：population_curatedを作成（パイプラインの*CreateCuratedTableIfNotExists*の処理に対応）

- create_population_landing.sql：population_landingを作成（パイプラインの*CreateLandingTableIfNotExists*の処理に対応）

- truncate_population_landing.sql：population_landingの中身を削除（パイプラインの*TruncateLanding*の処理に対応）

- set_default_year.sql：population_landingのyearのDEFAULT制約を付け替え（パイプラインの*SetDefaultYear*の処理に対応）

- clean_prefecturecode_landing.sql：カラムの型変換（パイプラインの*UpdatePrefectureCodeAndCleanPrefecture*の処理に対応）

- merge_population_curated.sql：population_landingのpopulation_curatedへのマージ処理（パイプラインの*sp_population_merge*の処理に対応）

### jobs

### metadata_codes

#### PL_metadata_codesのクエリ

- create_codes_metadata.sql：metadata_codesを作成（パイプラインの*CreateMetadataCodes*の処理に対応）

- truncate_codes_metadata.sql：metadata_codesの中身を削除（パイプラインの*TruncateMetadataCodes*の処理に対応）

- insert_elseinfo_codes.sql：region_typeが「全国」「外国」「不詳」のコードをmetadata_codesに挿入（パイプラインの*InsertElseInfo*の処理に対応）

- insert_prefecture_codes.sql：region_typeが「都道府県」のコードをmetadata_codesに挿入（パイプラインの*InsertPrefecturerInfo*の処理に対応）

- insert_city_codes.sql：region_typeが「政令市、23区」のコードをmetadata_codesに挿入（パイプラインの*InsertCityInfo*の処理に対応）

## pipelines

adf_export.json
