import thx.benchmark.speed.Suite;

enum Option<T> {
    Some(v:T);
    None;
    None2;
}

class COption<T> {
    public var index:Int;
    function new(index:Int) {
        this.index = index;
    }
}
class CSome<T> extends COption<T> {
    public var value:T;
    public function new(value:T) {
        super(0);
        this.value = value;
    }
}

class Main {
    static function main() {
        var suite = new Suite();
        suite.add("array enum construction", function() {
            var v = null;
            @:measure v = Some(10);
            if (v == null) throw false;
        });
        suite.add("object enum construction", function() {
            var v = null;
            @:measure v = new CSome(10);
            if (v == null) throw false;
        });
        suite.add("anon enum construction", function() {
            var v = null;
            @:measure v = {index: 0, value: 10};
            if (v == null) throw false;
        });
        var stats = suite.run();
        trace(stats.toString());

        var suite = new Suite();
        suite.add("array enum matching", function() {
            var v = Some(10);
            function f(v:Option<Int>) return switch (v) {
                case Some(v): 1;
                case None: null;
                case None2: null;
            }
            var r = null;
            @:measure r = f(v);
            if (r == null) throw false;
        });
        suite.add("object enum matching", function() {
            var v = new CSome(10);
            function f(v:COption<Int>) return switch (v.index) {
                case 0: (cast v : CSome<Int>).value;
                case 1: null;
                default: null;
            }
            var r = null;
            @:measure r = f(v);
            if (r == null) throw false;
        });
        suite.add("anon enum matching", function() {
            var v = {index: 0, value: 10};
            function f(v) return switch (v.index) {
                case 0: v.value;
                case 1: null;
                default: null;
            }
            var r = null;
            @:measure r = f(v);
            if (r == null) throw false;
        });
        var stats = suite.run();
        trace(stats.toString());
    }
}
