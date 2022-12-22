from django.apps import apps
from loguru import logger

from services.helpers.generate_random_text import generate_random_text


def create_row_id(table_name: str):
    """Create a row id for a given table"""

    # get  model using table name
    model = next(
        (model for model in apps.get_models() if model._meta.db_table == table_name),
        None,
    )
    if model is not None:
        # split table name by _ and take the first letter of each word
        # and join them together
        table_prefix = "".join([word[0] for word in table_name.split("_")])
        if model._meta.table_prefix:
            table_prefix = model._meta.table_prefix
        random_text = generate_random_text()

        row_id = f"{table_prefix}_{random_text}"[:35]
        # check if row id already exists
        # if it does, generate a new one
        # if it doesn't, return the row id

        if model.objects.filter(id=row_id).exists():
            return create_row_id(table_name)
        else:
            return row_id
    else:
        raise Exception("Table not found")
