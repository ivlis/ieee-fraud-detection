#!/usr/bin/env python

import gc

import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

from model.helper import load_data


def save_data_as_parquet():
    d = load_data()
    train = pd.merge(d['train_transaction'], d['train_identity'], on='TransactionID', how='left')
    test = pd.merge(d['test_transaction'], d['test_identity'], on='TransactionID', how='left')
    sample_submission = d['sample_submission']

    train_table = pa.Table.from_pandas(train)
    test_table = pa.Table.from_pandas(test)
    sub = pa.Table.from_pandas(sample_submission)

    pq.write_table(train_table, 'data/train.parquet')
    pq.write_table(test_table, 'data/test.parquet')
    pq.write_table(sub, 'data/sub.parquet')



if __name__ == "__main__":
    save_data_as_parquet()
