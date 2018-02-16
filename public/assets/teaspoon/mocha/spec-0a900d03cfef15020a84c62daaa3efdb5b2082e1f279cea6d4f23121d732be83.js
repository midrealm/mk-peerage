(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Teaspoon.Mocha.Spec = (function(superClass) {
    extend(Spec, superClass);

    function Spec(spec) {
      this.spec = spec;
      this.fullDescription = this.spec.fullTitle();
      this.description = this.spec.title;
      this.link = this.filterUrl(this.fullDescription);
      this.parent = this.spec.parent;
      this.suiteName = this.parent.fullTitle();
      this.viewId = this.spec.viewId;
      this.pending = this.spec.pending;
    }

    Spec.prototype.errors = function() {
      if (!this.spec.err) {
        return [];
      }
      return [this.spec.err];
    };

    Spec.prototype.getParents = function() {
      var parent;
      if (this.parents) {
        return this.parents;
      }
      this.parents || (this.parents = []);
      parent = this.parent;
      while (parent) {
        parent = new Teaspoon.Mocha.Suite(parent);
        this.parents.unshift(parent);
        parent = parent.parent;
      }
      return this.parents;
    };

    Spec.prototype.result = function() {
      var status;
      status = "failed";
      if (this.spec.state === "passed" || this.spec.state === "skipped") {
        status = "passed";
      }
      if (this.spec.pending) {
        status = "pending";
      }
      return {
        status: status,
        skipped: this.spec.state === "skipped" || this.pending
      };
    };

    return Spec;

  })(Teaspoon.Spec);

}).call(this);
