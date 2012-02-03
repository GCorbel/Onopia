module RecordsHelper
  def category_for_record(category, record, options)
    select_tag("category_id", 
      options_from_collection_for_select(
        options, 'id', 'label',
        :selected => category.id,
      ),
      :class => "record_change_category",
      :id => "category_id_#{record.id}"
    )
  end
end
