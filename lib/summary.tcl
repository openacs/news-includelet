# live view of a news item in its active revision
set item_exist_p [db_0or1row one_item "
select item_id,
       live_revision,
       publish_title,
       publish_body,
       publish_format,
       publish_date,
       creation_user,
       item_creator
from   news_items_live_or_submitted
where  item_id = :item_id"]

set creator_url [acs_community_member_url -user_id $creation_user]

if { $item_exist_p } {

#currently not using comments in the summary but someone might want to change the template so they are available.    
    if { [ad_parameter SolicitCommentsP "news" 0] &&
         [ad_permission_p $item_id general_comments_create] } {
	set comment_link [general_comments_create_link $item_id "[ad_conn package_url]item?item_id=$item_id"]
	set comments [general_comments_get_comments -print_content_p 1 -print_attachments_p 1 \
		$item_id "[ad_conn package_url]item?item_id=$item_id"]
    } else {
	set comment_link ""
        set comments ""
    }


} else {
    set context_bar {}
    set title "Error"
}

#This is a summary in the portlet we don't want it to be too long.

set more_link ""
if { [string length $publish_body] > 1000 } {
    set publish_body [string_truncate -len 1000 -- $publish_body]
    set more_link "<br><b>&raquo;</b> <a href=\"$url\">[_ news-includelet.Read_more]</a>"
}

set publish_body [ad_html_text_convert -from $publish_format -to text/html -- $publish_body]

