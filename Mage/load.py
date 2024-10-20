from mage_ai.settings.repo import get_repo_path
from mage_ai.io.bigquery import BigQuery
from mage_ai.io.config import ConfigFileLoader
from pandas import DataFrame
from os import path

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data_to_big_query(data, **kwargs) -> None:
    """
    Template for exporting data to a BigQuery warehouse.
    Specify your configuration settings in 'io_config.yaml'.

    Docs: https://docs.mage.ai/design/data-loading#bigquery
    """
    table_id = 'uber-data-analysis-438121.uber_data_analysis.fact_table'
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

    # BigQuery.with_config(ConfigFileLoader(config_path, config_profile)).export(
    #     DataFrame(data['fact_table']),
    #     table_id,
    #     if_exists='replace',  # Specify resolution policy if table name already exists
    # )

    if 'fact_table' in data:
        BigQuery.with_config(ConfigFileLoader(config_path, config_profile)).export(
            DataFrame(data['fact_table']),
            table_id,
            if_exists='replace',  # Specify resolution policy if table name already exists
        )
    else:
        raise KeyError("fact_table key not found in data, check your transformation output")