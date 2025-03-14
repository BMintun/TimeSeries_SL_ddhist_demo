
SELECT PARSE_DATE('%F', trns_date) as TrnDate,tracct, ddhrnbal
 FROM `sdb-dig-databroker-demoa8b4.timeseries_ddhist_brad.ddhist_running_balance` 
 WHERE PARSE_DATE('%F', trns_date) < '2024-01-01'
 
