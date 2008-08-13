set user_id [ad_conn user_id]
set url [site_node::get_url_from_object_id -object_id $package_id]
ad_return_template 
