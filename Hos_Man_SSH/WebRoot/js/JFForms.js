(function(a) {
	a.fn.JFforms = function() {
	};
	a.fn.JFforms.JFselectBox = function() {
		a(".custom-select").css("display", "none");
		a(".custom-select").each(
				function(b) {
					var c = a(this);
					var d = c.attr("id");
					var e = a("#" + d);
					var f = '<div class="custom-dropdown" id="' + d
							+ 'JFElement">' + '<div class="custom-head">'
							+ '<span href="#" class="current">'
							+ a(c).children("option:selected").text()
							+ "</span>"
							+ '<span class="selector"><a></a></span>'
							+ "</div>" + '<div class="custom-body"><ul>';
					var g = new Array;
					a(c).children("option").each(function() {
						var b = a(this).text();
						var c = a(this).attr("value");
						g.push("<li>" + b + "</li>")
					});
					f += g.join("") + "</ul></div></div>";
					a(c).after(f);
					var h = a("li", a("#" + d + "JFElement"));
					h.on("click", function() {
						var b = h.index(this);
						a("option:selected", e).removeAttr("selected");
						var c = a("option", "#" + d);
						a("option:eq(" + b + ")", e).attr("selected",
								"selected");
						a(this).addClass("selected");
						a(this).siblings().removeClass("selected");
						e.change();
						a("#" + d + "JFElement").find(".custom-head .current")
								.text(a(this).text());
						a(this).parent().find("li").slideToggle()
					})
				});
		a(".custom-dropdown .custom-head").on(
				"click",
				function(b) {
					var c = a(this).parents("div.custom-dropdown").find(
							".custom-body");
					var d = a(this).parent().attr("id");
					if (c.is(":visible")) {
						a(document).find("div.custom-dropdown:not(#" + d + ")")
								.find(".custom-body ul li").slideUp();
						a(document).find("div.custom-dropdown:not(#" + d + ")")
								.find(".custom-body").css("z-index", "2");
						c.css("z-index", "9999")
					}
					a(this).parents("div.custom-dropdown:eq(0)").find(
							".custom-body ul li").slideToggle("1000",
							function() {
								if (c.height() === 0) {
									c.css("z-index", "2")
								}
							})
				})
	};
	a.fn.JFforms.JFcheckRadio = function() {
		var b = a("input");
		b
				.each(function(b) {
					if (a(this).is("[type=checkbox],[type=radio]")) {
						var c = a(this);
						var d = a("label[for=" + c.attr("id") + "]");
						var e = c.is("[type=checkbox]") ? "checkbox" : "radio";
						a('<div class="custom-' + e + '"></div>').insertBefore(
								c).append(c, d);
						var f = a("input[name=" + c.attr("name") + "]");
						d.hover(function() {
							a(this).addClass("hover");
							if (e == "checkbox" && c.is(":checked")) {
								a(this).addClass("checkedHover")
							}
						}, function() {
							a(this).removeClass("hover checkedHover")
						});
						c
								.bind(
										"updateState",
										function() {
											if (c.is(":checked")) {
												if (c.is(":radio")) {
													f
															.each(function() {
																a(
																		"label[for="
																				+ a(
																						this)
																						.attr(
																								"id")
																				+ "]")
																		.removeClass(
																				"checked")
															})
												}
												d.addClass("checked")
											} else {
												d
														.removeClass("checked checkedHover checkedFocus")
											}
										}).trigger("updateState").click(
										function() {
											a(this).trigger("updateState")
										}).focus(function() {
									d.addClass("focus");
									if (e == "checkbox" && c.is(":checked")) {
										a(this).addClass("checkedFocus")
									}
								}).blur(function() {
									d.removeClass("focus checkedFocus")
								})
					}
				})
	};
	a.fn.JFforms.init = function() {
		a.fn.JFforms.JFselectBox();
		a.fn.JFforms.JFcheckRadio();
		a.fn.JFforms.resize();
		a.fn.JFforms.searchbox();
		a("body").not(".custom-dropdown").on("click", function(b) {
			b.stopPropagation();
			a(document).find(".custom-body ul li").slideUp()
		});
		a(".custom-dropdown").on("click", function(a) {
			a.stopPropagation()
		})
	};
	a.fn.JFforms.fixWidths = function() {
		var b = JC.GRID.isScrollbarVisible() ? a(window).width()
				+ JC.GRID.scrollbarWidth() : a(window).width();
		a("form input:not([type=button]), form textarea, form fieldset")
				.each(
						function() {
							var c = a(this);
							if (!c.parent().hasClass("search-input")) {
								var d = parseInt(c.css("padding-left"));
								var e = parseInt(c.css("padding-right"));
								var f = parseInt(c.parent().css("padding-left"));
								var g = parseInt(c.parent()
										.css("padding-right"));
								var h = parseInt(c.css("border-left-width"));
								var i = c.parent().innerWidth() - d - e - f - g
										- h * 2;
								i = b < 768 ? i - 2 : i;
								c.css("width", i)
							}
						});
		a(".search-box").each(function() {
			var b = a(this).width();
			a(this).find(".search-input").width(b - 32)
		});
		a(".custom-dropdown").each(function() {
			a(this).find(".custom-body").css("width", a(this).width() - 2)
		})
	};
	a.fn.JFforms.resize = function() {
		a.fn.JFforms.fixWidths()
	};
	a.fn.JFforms.searchbox = function() {
		a(".search-box.disabled input").attr("disabled", "disabled");
		a("input[type=text],input[type=search]").on("focus", function() {
			if (a(this).parent().hasClass("search-input")) {
				a(this).parent().siblings("div").addClass("border")
			}
		});
		a("input[type=text],input[type=search]").on("blur", function() {
			if (a(this).parent().hasClass("search-input")) {
				a(this).parent().siblings("div").removeClass("border")
			}
		})
	}
})(JFBase);
JFBase(function() {
	JFBase.fn.JFforms.init();
	var a;
	JFBase(window).resize(function() {
		clearTimeout(a);
		a = setTimeout(JFBase.fn.JFforms.resize, 1)
	})
});