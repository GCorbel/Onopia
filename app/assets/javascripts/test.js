(function ($) {
	"use strict";
	$.widget("wijmo.wijdropdown", {
		options: {
			zIndex: 1000,
			showingAnimation: { effect: "blind" },
			hidingAnimation: { effect: "blind" }
		},
		hoverClass: "ui-state-hover",
		activeClass: "ui-state-active",
		focusClass: "ui-state-focus",

		_setOption: function (key, value) {},

		_create: function () {},

		_createSelect: function () {},

		_buildList: function (list, listContainer, eleWidth) {},

		_handelEvents: function (ele) {},

		_bindEvents: function () {},

		_buildItem: function ($item) {},

		_show: function () {},

		_hide: function () {},

		_setValue: function () {},

		_initActiveItem: function () {},

		_activate: function (item) {},

		_deactivate: function () {},

		next: function () {},

		previous: function () {},

		nextPage: function () {},

		previousPage: function () {},

		refresh: function () {},

		_move: function (direction, edge) {},

		_movePage: function (direction) {},

		_getNextItem: function (next, direction, edge) {},

		destroy: function () {}
	});
} (jQuery));
