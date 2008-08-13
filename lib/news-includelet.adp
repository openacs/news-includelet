<if @news_items:rowcount@ eq 0>
  <small>#news-includelet.No_News#</small>
</if>
<else>
  <if @news_items:rowcount@ gt 1>
    <ul>
  </if>
  <multiple name="news_items">
    <if @news_items:rowcount@ eq 1>
      <include src="summary" 
        item_id="@news_items.item_id@"
        url="@news_items.view_url@">
    </if>
    <else>
      <li>
        <a href="@news_items.url@item?item_id=@news_items.item_id@">@news_items.publish_title@</a>
        <small>(@news_items.publish_date@)</small>
      </li>
    </else>
  </multiple>
  <if @news_items:rowcount@ gt 1>
    </ul>
  </if>
</else>
