$(document).ready ->
  $(".expander").wijexpander()
  sAjaxSource = "/users/records/";
  dataTable = loadDataTable(sAjaxSource)
  dataTable.fnSettings().fnServerData = ( sSource, aoData, fnCallback ) ->
    $.ajax({
      dataType: 'json'
      type: "GET"
      url: sSource
      data: aoData
      success:(json) ->
        data = json
        fnCallback(json)
        $('.record_change_category').each((i, item) ->
          $('category_id_'+data.aaData[i][4])
          item.onchange = (event) ->
            category_id = $('#category_id_'+data.aaData[i][4]+ ' option:selected').val()
            record = {"record": {"category_id": category_id} }
            $.ajax( {
                dataType: 'json'
                type: "PUT"
                url: "/records/" + data.aaData[i][4]
                data: record
            })
        )
    })
  dataTable.fnDraw()
