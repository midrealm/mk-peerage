(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Teaspoon.Mocha.Suite = (function(superClass) {
    extend(Suite, superClass);

    function Suite(suite) {
      var ref;
      this.suite = suite;
      this.fullDescription = this.suite.fullTitle();
      this.description = this.suite.title;
      this.link = this.filterUrl(this.fullDescription);
      this.parent = ((ref = this.suite.parent) != null ? ref.root : void 0) ? null : this.suite.parent;
      this.viewId = this.suite.viewId;
    }

    return Suite;

  })(Teaspoon.Suite);

}).call(this);
