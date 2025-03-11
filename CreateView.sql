select FORMAT_DATE('%Y-%m-%d', PARSE_DATE('%Y%j', CAST((treffd) as DATE))) AS trns_date, tracct, trancd, amt from `silverlake_ovation_bank_3_demo.ddhist_raw` 
order by tracct, trns_date, trancd



