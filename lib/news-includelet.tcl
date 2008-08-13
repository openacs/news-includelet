db_multirow -extend { publish_date view_url } news_items select_news_items {} {
    set publish_date [lc_time_fmt $publish_date_ansi "%x"]
    set view_url [export_vars -base "${url}item" { item_id }]
}
