var app = window.app = {};

app.Countries = function() {
  this._input = $('#member_country_id');
  this._initAutocomplete();
};

app.StateProv = function() {
  this._input = $('#member_state_prov_id');
  this._initAutocomplete();
};

app.Airport = function() {
  this._input = $('#member_home_airport');
  this._initAutocomplete();
};

app.Citizenship = function() {
  this._input = $('#member_citizenship_id');
  this._initAutocomplete();
};

app.Residency = function() {
  this._input = $('#member_residency_id');
  this._initAutocomplete();
};

app.Countries.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/countries',
	      appendTo: '#country-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},
  _render: function(ul, item) {
    var markup = [
      '<span class="country_name">' + item.name + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },
  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};

app.Citizenship.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/countries',
	      appendTo: '#citizenship-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},
  _render: function(ul, item) {
    var markup = [
      '<span class="country_name">' + item.name + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },
  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};

app.Residency.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/countries',
	      appendTo: '#residency-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},
  _render: function(ul, item) {
    var markup = [
      '<span class="country_name">' + item.name + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },
  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};

app.StateProv.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/state_provs',
	      appendTo: '#state-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},
  _render: function(ul, item) {
    var markup = [
      '<span class="state_name">' + item.name + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },
  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};

app.Airport.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/airports',
	      appendTo: '#airport-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},
  _render: function(ul, item) {
    var markup = [
      '<span class="airport_name">' + item.name + ' (' + item.iata_faa + ')</span>',
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },
  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};

