$.fn.dataTableExt.oApi.fnReloadAjax = function ( oSettings, sNewSource, fnCallback, bStandingRedraw ) {
  if ( typeof sNewSource != 'undefined' && sNewSource != null ) {
    oSettings.sAjaxSource = sNewSource;
  }
  this.oApi._fnProcessingDisplay( oSettings, true );
  var that = this;
  var iStart = oSettings._iDisplayStart;
 
  oSettings.fnServerData( oSettings.sAjaxSource, [], function(json) {
    if (json === undefined || json === null) return;
 
    var aData =  (oSettings.sAjaxDataProp !== "") ?
    that.oApi._fnGetObjectDataFn( oSettings.sAjaxDataProp )( json ) : json;		
    var aOldData = that.fnGetNodes( );
 
    if (aOldData.length !== aData.length) {
      /* Clear the old information from the table */
      that.oApi._fnClearTable( oSettings );
 
      for ( var i=0 ; i<aData.length ; i++ ) {
        that.oApi._fnAddData( oSettings, aData[i] );
      }
 
      oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
      that.fnDraw();
 
      if ( typeof bStandingRedraw != 'undefined' && bStandingRedraw === true ) {
        oSettings._iDisplayStart = iStart;
        that.fnDraw( false );
      }
    }
    else {
      for ( var i=0 ; i<aData.length ; i++ ) {
        for ( var j=0 ; j<aData[i].length ; j++) {
          var oCol = oSettings.aoColumns[j];			
          var sCellContents = aData[i][j];
 
          if ( typeof oCol.fnRender === 'function' && oCol.bUseRendered && oCol.mDataProp !== null ) {
            sCellContents = oCol.fnRender({
              "iDataRow":    i,
              "iDataColumn": j,
              "oSettings":   oSettings,
              "aData":       aData[i],
              "mDataProp":   oCol.mDataProp
            });
          }
 
          if (sCellContents != oSettings.aoData[i]._aData[j]) {
            that.fnUpdate( aData[i], i, j );
          }
        }
      }
    }
 
    that.oApi._fnProcessingDisplay( oSettings, false );
 
    /* Callback user function - for event handlers etc */
    if ( typeof fnCallback == 'function' && fnCallback != null ) {
      fnCallback( oSettings );
    }
  }, oSettings );
}
