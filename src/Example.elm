module Example exposing (code)


code : String
code =
    """
(function(scope){
'use strict';

function F(arity, fun, wrapper) {
  wrapper.a = arity;
  wrapper.f = fun;
  return wrapper;
}

function F2(fun) {
  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })
}
function F3(fun) {
  return F(3, fun, function(a) {
    return function(b) { return function(c) { return fun(a, b, c); }; };
  });
}
function F4(fun) {
  return F(4, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return fun(a, b, c, d); }; }; };
  });
}
function F5(fun) {
  return F(5, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };
  });
}
function F6(fun) {
  return F(6, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return fun(a, b, c, d, e, f); }; }; }; }; };
  });
}
function F7(fun) {
  return F(7, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };
  });
}
function F8(fun) {
  return F(8, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) {
    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };
  });
}
function F9(fun) {
  return F(9, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) { return function(i) {
    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };
  });
}

function A2(fun, a, b) {
  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);
}
function A3(fun, a, b, c) {
  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);
}
function A4(fun, a, b, c, d) {
  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);
}
function A5(fun, a, b, c, d, e) {
  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);
}
function A6(fun, a, b, c, d, e, f) {
  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);
}
function A7(fun, a, b, c, d, e, f, g) {
  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);
}
function A8(fun, a, b, c, d, e, f, g, h) {
  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);
}
function A9(fun, a, b, c, d, e, f, g, h, i) {
  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);
}

console.warn('Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.1/optimize for better performance and smaller assets.');


// EQUALITY

function _Utils_eq(x, y)
{
\tfor (
\t\tvar pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);
\t\tisEqual && (pair = stack.pop());
\t\tisEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)
\t\t)
\t{}

\treturn isEqual;
}

function _Utils_eqHelp(x, y, depth, stack)
{
\tif (x === y)
\t{
\t\treturn true;
\t}

\tif (typeof x !== 'object' || x === null || y === null)
\t{
\t\ttypeof x === 'function' && _Debug_crash(5);
\t\treturn false;
\t}

\tif (depth > 100)
\t{
\t\tstack.push(_Utils_Tuple2(x,y));
\t\treturn true;
\t}

\t/**/
\tif (x.$ === 'Set_elm_builtin')
\t{
\t\tx = $elm$core$Set$toList(x);
\t\ty = $elm$core$Set$toList(y);
\t}
\tif (x.$ === 'RBNode_elm_builtin' || x.$ === 'RBEmpty_elm_builtin')
\t{
\t\tx = $elm$core$Dict$toList(x);
\t\ty = $elm$core$Dict$toList(y);
\t}
\t//*/

\t/**_UNUSED/
\tif (x.$ < 0)
\t{
\t\tx = $elm$core$Dict$toList(x);
\t\ty = $elm$core$Dict$toList(y);
\t}
\t//*/

\tfor (var key in x)
\t{
\t\tif (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))
\t\t{
\t\t\treturn false;
\t\t}
\t}
\treturn true;
}

var _Utils_equal = F2(_Utils_eq);
var _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });



// COMPARISONS

// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on
// the particular integer values assigned to LT, EQ, and GT.

function _Utils_cmp(x, y, ord)
{
\tif (typeof x !== 'object')
\t{
\t\treturn x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;
\t}

\t/**/
\tif (x instanceof String)
\t{
\t\tvar a = x.valueOf();
\t\tvar b = y.valueOf();
\t\treturn a === b ? 0 : a < b ? -1 : 1;
\t}
\t//*/

\t/**_UNUSED/
\tif (typeof x.$ === 'undefined')
\t//*/
\t/**/
\tif (x.$[0] === '#')
\t//*/
\t{
\t\treturn (ord = _Utils_cmp(x.a, y.a))
\t\t\t? ord
\t\t\t: (ord = _Utils_cmp(x.b, y.b))
\t\t\t\t? ord
\t\t\t\t: _Utils_cmp(x.c, y.c);
\t}

\t// traverse conses until end of a list or a mismatch
\tfor (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES
\treturn ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);
}

var _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });
var _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });
var _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });
var _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });

var _Utils_compare = F2(function(x, y)
{
\tvar n = _Utils_cmp(x, y);
\treturn n < 0 ? $elm$core$Basics$LT : n ? $elm$core$Basics$GT : $elm$core$Basics$EQ;
});


// COMMON VALUES

var _Utils_Tuple0_UNUSED = 0;
var _Utils_Tuple0 = { $: '#0' };

function _Utils_Tuple2_UNUSED(a, b) { return { a: a, b: b }; }
function _Utils_Tuple2(a, b) { return { $: '#2', a: a, b: b }; }

function _Utils_Tuple3_UNUSED(a, b, c) { return { a: a, b: b, c: c }; }
function _Utils_Tuple3(a, b, c) { return { $: '#3', a: a, b: b, c: c }; }

function _Utils_chr_UNUSED(c) { return c; }
function _Utils_chr(c) { return new String(c); }


// RECORDS

function _Utils_update(oldRecord, updatedFields)
{
\tvar newRecord = {};

\tfor (var key in oldRecord)
\t{
\t\tnewRecord[key] = oldRecord[key];
\t}

\tfor (var key in updatedFields)
\t{
\t\tnewRecord[key] = updatedFields[key];
\t}

\treturn newRecord;
}


// APPEND

var _Utils_append = F2(_Utils_ap);

function _Utils_ap(xs, ys)
{
\t// append Strings
\tif (typeof xs === 'string')
\t{
\t\treturn xs + ys;
\t}

\t// append Lists
\tif (!xs.b)
\t{
\t\treturn ys;
\t}
\tvar root = _List_Cons(xs.a, ys);
\txs = xs.b
\tfor (var curr = root; xs.b; xs = xs.b) // WHILE_CONS
\t{
\t\tcurr = curr.b = _List_Cons(xs.a, ys);
\t}
\treturn root;
}



var _List_Nil_UNUSED = { $: 0 };
var _List_Nil = { $: '[]' };

function _List_Cons_UNUSED(hd, tl) { return { $: 1, a: hd, b: tl }; }
function _List_Cons(hd, tl) { return { $: '::', a: hd, b: tl }; }


var _List_cons = F2(_List_Cons);

function _List_fromArray(arr)
{
\tvar out = _List_Nil;
\tfor (var i = arr.length; i--; )
\t{
\t\tout = _List_Cons(arr[i], out);
\t}
\treturn out;
}

function _List_toArray(xs)
{
\tfor (var out = []; xs.b; xs = xs.b) // WHILE_CONS
\t{
\t\tout.push(xs.a);
\t}
\treturn out;
}

var _List_map2 = F3(function(f, xs, ys)
{
\tfor (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES
\t{
\t\tarr.push(A2(f, xs.a, ys.a));
\t}
\treturn _List_fromArray(arr);
});

var _List_map3 = F4(function(f, xs, ys, zs)
{
\tfor (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
\t{
\t\tarr.push(A3(f, xs.a, ys.a, zs.a));
\t}
\treturn _List_fromArray(arr);
});

var _List_map4 = F5(function(f, ws, xs, ys, zs)
{
\tfor (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
\t{
\t\tarr.push(A4(f, ws.a, xs.a, ys.a, zs.a));
\t}
\treturn _List_fromArray(arr);
});

var _List_map5 = F6(function(f, vs, ws, xs, ys, zs)
{
\tfor (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
\t{
\t\tarr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));
\t}
\treturn _List_fromArray(arr);
});

var _List_sortBy = F2(function(f, xs)
{
\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {
\t\treturn _Utils_cmp(f(a), f(b));
\t}));
});

var _List_sortWith = F2(function(f, xs)
{
\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {
\t\tvar ord = A2(f, a, b);
\t\treturn ord === $elm$core$Basics$EQ ? 0 : ord === $elm$core$Basics$LT ? -1 : 1;
\t}));
});



var _JsArray_empty = [];

function _JsArray_singleton(value)
{
    return [value];
}

function _JsArray_length(array)
{
    return array.length;
}

var _JsArray_initialize = F3(function(size, offset, func)
{
    var result = new Array(size);

    for (var i = 0; i < size; i++)
    {
        result[i] = func(offset + i);
    }

    return result;
});

var _JsArray_initializeFromList = F2(function (max, ls)
{
    var result = new Array(max);

    for (var i = 0; i < max && ls.b; i++)
    {
        result[i] = ls.a;
        ls = ls.b;
    }

    result.length = i;
    return _Utils_Tuple2(result, ls);
});

var _JsArray_unsafeGet = F2(function(index, array)
{
    return array[index];
});

var _JsArray_unsafeSet = F3(function(index, value, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[index] = value;
    return result;
});

var _JsArray_push = F2(function(value, array)
{
    var length = array.length;
    var result = new Array(length + 1);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[length] = value;
    return result;
});

var _JsArray_foldl = F3(function(func, acc, array)
{
    var length = array.length;

    for (var i = 0; i < length; i++)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_foldr = F3(function(func, acc, array)
{
    for (var i = array.length - 1; i >= 0; i--)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_map = F2(function(func, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = func(array[i]);
    }

    return result;
});

var _JsArray_indexedMap = F3(function(func, offset, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = A2(func, offset + i, array[i]);
    }

    return result;
});

var _JsArray_slice = F3(function(from, to, array)
{
    return array.slice(from, to);
});

var _JsArray_appendN = F3(function(n, dest, source)
{
    var destLen = dest.length;
    var itemsToCopy = n - destLen;

    if (itemsToCopy > source.length)
    {
        itemsToCopy = source.length;
    }

    var size = destLen + itemsToCopy;
    var result = new Array(size);

    for (var i = 0; i < destLen; i++)
    {
        result[i] = dest[i];
    }

    for (var i = 0; i < itemsToCopy; i++)
    {
        result[i + destLen] = source[i];
    }

    return result;
});



// LOG

var _Debug_log_UNUSED = F2(function(tag, value)
{
\treturn value;
});

var _Debug_log = F2(function(tag, value)
{
\tconsole.log(tag + ': ' + _Debug_toString(value));
\treturn value;
});


// TODOS

function _Debug_todo(moduleName, region)
{
\treturn function(message) {
\t\t_Debug_crash(8, moduleName, region, message);
\t};
}

function _Debug_todoCase(moduleName, region, value)
{
\treturn function(message) {
\t\t_Debug_crash(9, moduleName, region, value, message);
\t};
}


// TO STRING

function _Debug_toString_UNUSED(value)
{
\treturn '<internals>';
}

function _Debug_toString(value)
{
\treturn _Debug_toAnsiString(false, value);
}

function _Debug_toAnsiString(ansi, value)
{
\tif (typeof value === 'function')
\t{
\t\treturn _Debug_internalColor(ansi, '<function>');
\t}

\tif (typeof value === 'boolean')
\t{
\t\treturn _Debug_ctorColor(ansi, value ? 'True' : 'False');
\t}

\tif (typeof value === 'number')
\t{
\t\treturn _Debug_numberColor(ansi, value + '');
\t}

\tif (value instanceof String)
\t{
\t\treturn _Debug_charColor(ansi, "'" + _Debug_addSlashes(value, true) + "'");
\t}

\tif (typeof value === 'string')
\t{
\t\treturn _Debug_stringColor(ansi, '"' + _Debug_addSlashes(value, false) + '"');
\t}

\tif (typeof value === 'object' && '$' in value)
\t{
\t\tvar tag = value.$;

\t\tif (typeof tag === 'number')
\t\t{
\t\t\treturn _Debug_internalColor(ansi, '<internals>');
\t\t}

\t\tif (tag[0] === '#')
\t\t{
\t\t\tvar output = [];
\t\t\tfor (var k in value)
\t\t\t{
\t\t\t\tif (k === '$') continue;
\t\t\t\toutput.push(_Debug_toAnsiString(ansi, value[k]));
\t\t\t}
\t\t\treturn '(' + output.join(',') + ')';
\t\t}

\t\tif (tag === 'Set_elm_builtin')
\t\t{
\t\t\treturn _Debug_ctorColor(ansi, 'Set')
\t\t\t\t+ _Debug_fadeColor(ansi, '.fromList') + ' '
\t\t\t\t+ _Debug_toAnsiString(ansi, $elm$core$Set$toList(value));
\t\t}

\t\tif (tag === 'RBNode_elm_builtin' || tag === 'RBEmpty_elm_builtin')
\t\t{
\t\t\treturn _Debug_ctorColor(ansi, 'Dict')
\t\t\t\t+ _Debug_fadeColor(ansi, '.fromList') + ' '
\t\t\t\t+ _Debug_toAnsiString(ansi, $elm$core$Dict$toList(value));
\t\t}

\t\tif (tag === 'Array_elm_builtin')
\t\t{
\t\t\treturn _Debug_ctorColor(ansi, 'Array')
\t\t\t\t+ _Debug_fadeColor(ansi, '.fromList') + ' '
\t\t\t\t+ _Debug_toAnsiString(ansi, $elm$core$Array$toList(value));
\t\t}

\t\tif (tag === '::' || tag === '[]')
\t\t{
\t\t\tvar output = '[';

\t\t\tvalue.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)

\t\t\tfor (; value.b; value = value.b) // WHILE_CONS
\t\t\t{
\t\t\t\toutput += ',' + _Debug_toAnsiString(ansi, value.a);
\t\t\t}
\t\t\treturn output + ']';
\t\t}

\t\tvar output = '';
\t\tfor (var i in value)
\t\t{
\t\t\tif (i === '$') continue;
\t\t\tvar str = _Debug_toAnsiString(ansi, value[i]);
\t\t\tvar c0 = str[0];
\t\t\tvar parenless = c0 === '{' || c0 === '(' || c0 === '[' || c0 === '<' || c0 === '"' || str.indexOf(' ') < 0;
\t\t\toutput += ' ' + (parenless ? str : '(' + str + ')');
\t\t}
\t\treturn _Debug_ctorColor(ansi, tag) + output;
\t}

\tif (typeof DataView === 'function' && value instanceof DataView)
\t{
\t\treturn _Debug_stringColor(ansi, '<' + value.byteLength + ' bytes>');
\t}

\tif (typeof File !== 'undefined' && value instanceof File)
\t{
\t\treturn _Debug_internalColor(ansi, '<' + value.name + '>');
\t}

\tif (typeof value === 'object')
\t{
\t\tvar output = [];
\t\tfor (var key in value)
\t\t{
\t\t\tvar field = key[0] === '_' ? key.slice(1) : key;
\t\t\toutput.push(_Debug_fadeColor(ansi, field) + ' = ' + _Debug_toAnsiString(ansi, value[key]));
\t\t}
\t\tif (output.length === 0)
\t\t{
\t\t\treturn '{}';
\t\t}
\t\treturn '{ ' + output.join(', ') + ' }';
\t}

\treturn _Debug_internalColor(ansi, '<internals>');
}

function _Debug_addSlashes(str, isChar)
{
\tvar s = str
\t\t.replace(/\\\\/g, '\\\\\\\\')
\t\t.replace(/\\n/g, '\\\\n')
\t\t.replace(/\\t/g, '\\\\t')
\t\t.replace(/\\r/g, '\\\\r')
\t\t.replace(/\\v/g, '\\\\v')
\t\t.replace(/\\0/g, '\\\\0');

\tif (isChar)
\t{
\t\treturn s.replace(/\\'/g, '\\\\\\'');
\t}
\telse
\t{
\t\treturn s.replace(/\\"/g, '\\\\"');
\t}
}

function _Debug_ctorColor(ansi, string)
{
\treturn ansi ? '\\x1b[96m' + string + '\\x1b[0m' : string;
}

function _Debug_numberColor(ansi, string)
{
\treturn ansi ? '\\x1b[95m' + string + '\\x1b[0m' : string;
}

function _Debug_stringColor(ansi, string)
{
\treturn ansi ? '\\x1b[93m' + string + '\\x1b[0m' : string;
}

function _Debug_charColor(ansi, string)
{
\treturn ansi ? '\\x1b[92m' + string + '\\x1b[0m' : string;
}

function _Debug_fadeColor(ansi, string)
{
\treturn ansi ? '\\x1b[37m' + string + '\\x1b[0m' : string;
}

function _Debug_internalColor(ansi, string)
{
\treturn ansi ? '\\x1b[36m' + string + '\\x1b[0m' : string;
}

function _Debug_toHexDigit(n)
{
\treturn String.fromCharCode(n < 10 ? 48 + n : 55 + n);
}


// CRASH


function _Debug_crash_UNUSED(identifier)
{
\tthrow new Error('https://github.com/elm/core/blob/1.0.0/hints/' + identifier + '.md');
}


function _Debug_crash(identifier, fact1, fact2, fact3, fact4)
{
\tswitch(identifier)
\t{
\t\tcase 0:
\t\t\tthrow new Error('What node should I take over? In JavaScript I need something like:\\n\\n    Elm.Main.init({\\n        node: document.getElementById("elm-node")\\n    })\\n\\nYou need to do this with any Browser.sandbox or Browser.element program.');

\t\tcase 1:
\t\t\tthrow new Error('Browser.application programs cannot handle URLs like this:\\n\\n    ' + document.location.href + '\\n\\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.');

\t\tcase 2:
\t\t\tvar jsonErrorString = fact1;
\t\t\tthrow new Error('Problem with the flags given to your Elm program on initialization.\\n\\n' + jsonErrorString);

\t\tcase 3:
\t\t\tvar portName = fact1;
\t\t\tthrow new Error('There can only be one port named `' + portName + '`, but your program has multiple.');

\t\tcase 4:
\t\t\tvar portName = fact1;
\t\t\tvar problem = fact2;
\t\t\tthrow new Error('Trying to send an unexpected type of value through port `' + portName + '`:\\n' + problem);

\t\tcase 5:
\t\t\tthrow new Error('Trying to use `(==)` on functions.\\nThere is no way to know if functions are "the same" in the Elm sense.\\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.');

\t\tcase 6:
\t\t\tvar moduleName = fact1;
\t\t\tthrow new Error('Your page is loading multiple Elm scripts with a module named ' + moduleName + '. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!');

\t\tcase 8:
\t\t\tvar moduleName = fact1;
\t\t\tvar region = fact2;
\t\t\tvar message = fact3;
\t\t\tthrow new Error('TODO in module `' + moduleName + '` ' + _Debug_regionToString(region) + '\\n\\n' + message);

\t\tcase 9:
\t\t\tvar moduleName = fact1;
\t\t\tvar region = fact2;
\t\t\tvar value = fact3;
\t\t\tvar message = fact4;
\t\t\tthrow new Error(
\t\t\t\t'TODO in module `' + moduleName + '` from the `case` expression '
\t\t\t\t+ _Debug_regionToString(region) + '\\n\\nIt received the following value:\\n\\n    '
\t\t\t\t+ _Debug_toString(value).replace('\\n', '\\n    ')
\t\t\t\t+ '\\n\\nBut the branch that handles it says:\\n\\n    ' + message.replace('\\n', '\\n    ')
\t\t\t);

\t\tcase 10:
\t\t\tthrow new Error('Bug in https://github.com/elm/virtual-dom/issues');

\t\tcase 11:
\t\t\tthrow new Error('Cannot perform mod 0. Division by zero error.');
\t}
}

function _Debug_regionToString(region)
{
\tif (region.start.line === region.end.line)
\t{
\t\treturn 'on line ' + region.start.line;
\t}
\treturn 'on lines ' + region.start.line + ' through ' + region.end.line;
}



// MATH

var _Basics_add = F2(function(a, b) { return a + b; });
var _Basics_sub = F2(function(a, b) { return a - b; });
var _Basics_mul = F2(function(a, b) { return a * b; });
var _Basics_fdiv = F2(function(a, b) { return a / b; });
var _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });
var _Basics_pow = F2(Math.pow);

var _Basics_remainderBy = F2(function(b, a) { return a % b; });

// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf
var _Basics_modBy = F2(function(modulus, x)
{
\tvar answer = x % modulus;
\treturn modulus === 0
\t\t? _Debug_crash(11)
\t\t:
\t((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))
\t\t? answer + modulus
\t\t: answer;
});


// TRIGONOMETRY

var _Basics_pi = Math.PI;
var _Basics_e = Math.E;
var _Basics_cos = Math.cos;
var _Basics_sin = Math.sin;
var _Basics_tan = Math.tan;
var _Basics_acos = Math.acos;
var _Basics_asin = Math.asin;
var _Basics_atan = Math.atan;
var _Basics_atan2 = F2(Math.atan2);


// MORE MATH

function _Basics_toFloat(x) { return x; }
function _Basics_truncate(n) { return n | 0; }
function _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }

var _Basics_ceiling = Math.ceil;
var _Basics_floor = Math.floor;
var _Basics_round = Math.round;
var _Basics_sqrt = Math.sqrt;
var _Basics_log = Math.log;
var _Basics_isNaN = isNaN;


// BOOLEANS

function _Basics_not(bool) { return !bool; }
var _Basics_and = F2(function(a, b) { return a && b; });
var _Basics_or  = F2(function(a, b) { return a || b; });
var _Basics_xor = F2(function(a, b) { return a !== b; });



var _String_cons = F2(function(chr, str)
{
\treturn chr + str;
});

function _String_uncons(string)
{
\tvar word = string.charCodeAt(0);
\treturn !isNaN(word)
\t\t? $elm$core$Maybe$Just(
\t\t\t0xD800 <= word && word <= 0xDBFF
\t\t\t\t? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))
\t\t\t\t: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))
\t\t)
\t\t: $elm$core$Maybe$Nothing;
}

var _String_append = F2(function(a, b)
{
\treturn a + b;
});

function _String_length(str)
{
\treturn str.length;
}

var _String_map = F2(function(func, string)
{
\tvar len = string.length;
\tvar array = new Array(len);
\tvar i = 0;
\twhile (i < len)
\t{
\t\tvar word = string.charCodeAt(i);
\t\tif (0xD800 <= word && word <= 0xDBFF)
\t\t{
\t\t\tarray[i] = func(_Utils_chr(string[i] + string[i+1]));
\t\t\ti += 2;
\t\t\tcontinue;
\t\t}
\t\tarray[i] = func(_Utils_chr(string[i]));
\t\ti++;
\t}
\treturn array.join('');
});

var _String_filter = F2(function(isGood, str)
{
\tvar arr = [];
\tvar len = str.length;
\tvar i = 0;
\twhile (i < len)
\t{
\t\tvar char = str[i];
\t\tvar word = str.charCodeAt(i);
\t\ti++;
\t\tif (0xD800 <= word && word <= 0xDBFF)
\t\t{
\t\t\tchar += str[i];
\t\t\ti++;
\t\t}

\t\tif (isGood(_Utils_chr(char)))
\t\t{
\t\t\tarr.push(char);
\t\t}
\t}
\treturn arr.join('');
});

function _String_reverse(str)
{
\tvar len = str.length;
\tvar arr = new Array(len);
\tvar i = 0;
\twhile (i < len)
\t{
\t\tvar word = str.charCodeAt(i);
\t\tif (0xD800 <= word && word <= 0xDBFF)
\t\t{
\t\t\tarr[len - i] = str[i + 1];
\t\t\ti++;
\t\t\tarr[len - i] = str[i - 1];
\t\t\ti++;
\t\t}
\t\telse
\t\t{
\t\t\tarr[len - i] = str[i];
\t\t\ti++;
\t\t}
\t}
\treturn arr.join('');
}

var _String_foldl = F3(function(func, state, string)
{
\tvar len = string.length;
\tvar i = 0;
\twhile (i < len)
\t{
\t\tvar char = string[i];
\t\tvar word = string.charCodeAt(i);
\t\ti++;
\t\tif (0xD800 <= word && word <= 0xDBFF)
\t\t{
\t\t\tchar += string[i];
\t\t\ti++;
\t\t}
\t\tstate = A2(func, _Utils_chr(char), state);
\t}
\treturn state;
});

var _String_foldr = F3(function(func, state, string)
{
\tvar i = string.length;
\twhile (i--)
\t{
\t\tvar char = string[i];
\t\tvar word = string.charCodeAt(i);
\t\tif (0xDC00 <= word && word <= 0xDFFF)
\t\t{
\t\t\ti--;
\t\t\tchar = string[i] + char;
\t\t}
\t\tstate = A2(func, _Utils_chr(char), state);
\t}
\treturn state;
});

var _String_split = F2(function(sep, str)
{
\treturn str.split(sep);
});

var _String_join = F2(function(sep, strs)
{
\treturn strs.join(sep);
});

var _String_slice = F3(function(start, end, str) {
\treturn str.slice(start, end);
});

function _String_trim(str)
{
\treturn str.trim();
}

function _String_trimLeft(str)
{
\treturn str.replace(/^\\s+/, '');
}

function _String_trimRight(str)
{
\treturn str.replace(/\\s+$/, '');
}

function _String_words(str)
{
\treturn _List_fromArray(str.trim().split(/\\s+/g));
}

function _String_lines(str)
{
\treturn _List_fromArray(str.split(/\\r\\n|\\r|\\n/g));
}

function _String_toUpper(str)
{
\treturn str.toUpperCase();
}

function _String_toLower(str)
{
\treturn str.toLowerCase();
}

var _String_any = F2(function(isGood, string)
{
\tvar i = string.length;
\twhile (i--)
\t{
\t\tvar char = string[i];
\t\tvar word = string.charCodeAt(i);
\t\tif (0xDC00 <= word && word <= 0xDFFF)
\t\t{
\t\t\ti--;
\t\t\tchar = string[i] + char;
\t\t}
\t\tif (isGood(_Utils_chr(char)))
\t\t{
\t\t\treturn true;
\t\t}
\t}
\treturn false;
});

var _String_all = F2(function(isGood, string)
{
\tvar i = string.length;
\twhile (i--)
\t{
\t\tvar char = string[i];
\t\tvar word = string.charCodeAt(i);
\t\tif (0xDC00 <= word && word <= 0xDFFF)
\t\t{
\t\t\ti--;
\t\t\tchar = string[i] + char;
\t\t}
\t\tif (!isGood(_Utils_chr(char)))
\t\t{
\t\t\treturn false;
\t\t}
\t}
\treturn true;
});

var _String_contains = F2(function(sub, str)
{
\treturn str.indexOf(sub) > -1;
});

var _String_startsWith = F2(function(sub, str)
{
\treturn str.indexOf(sub) === 0;
});

var _String_endsWith = F2(function(sub, str)
{
\treturn str.length >= sub.length &&
\t\tstr.lastIndexOf(sub) === str.length - sub.length;
});

var _String_indexes = F2(function(sub, str)
{
\tvar subLen = sub.length;

\tif (subLen < 1)
\t{
\t\treturn _List_Nil;
\t}

\tvar i = 0;
\tvar is = [];

\twhile ((i = str.indexOf(sub, i)) > -1)
\t{
\t\tis.push(i);
\t\ti = i + subLen;
\t}

\treturn _List_fromArray(is);
});


// TO STRING

function _String_fromNumber(number)
{
\treturn number + '';
}


// INT CONVERSIONS

function _String_toInt(str)
{
\tvar total = 0;
\tvar code0 = str.charCodeAt(0);
\tvar start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;

\tfor (var i = start; i < str.length; ++i)
\t{
\t\tvar code = str.charCodeAt(i);
\t\tif (code < 0x30 || 0x39 < code)
\t\t{
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t}
\t\ttotal = 10 * total + code - 0x30;
\t}

\treturn i == start
\t\t? $elm$core$Maybe$Nothing
\t\t: $elm$core$Maybe$Just(code0 == 0x2D ? -total : total);
}


// FLOAT CONVERSIONS

function _String_toFloat(s)
{
\t// check if it is a hex, octal, or binary number
\tif (s.length === 0 || /[\\sxbo]/.test(s))
\t{
\t\treturn $elm$core$Maybe$Nothing;
\t}
\tvar n = +s;
\t// faster isNaN check
\treturn n === n ? $elm$core$Maybe$Just(n) : $elm$core$Maybe$Nothing;
}

function _String_fromList(chars)
{
\treturn _List_toArray(chars).join('');
}




function _Char_toCode(char)
{
\tvar code = char.charCodeAt(0);
\tif (0xD800 <= code && code <= 0xDBFF)
\t{
\t\treturn (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000
\t}
\treturn code;
}

function _Char_fromCode(code)
{
\treturn _Utils_chr(
\t\t(code < 0 || 0x10FFFF < code)
\t\t\t? '\\uFFFD'
\t\t\t:
\t\t(code <= 0xFFFF)
\t\t\t? String.fromCharCode(code)
\t\t\t:
\t\t(code -= 0x10000,
\t\t\tString.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)
\t\t)
\t);
}

function _Char_toUpper(char)
{
\treturn _Utils_chr(char.toUpperCase());
}

function _Char_toLower(char)
{
\treturn _Utils_chr(char.toLowerCase());
}

function _Char_toLocaleUpper(char)
{
\treturn _Utils_chr(char.toLocaleUpperCase());
}

function _Char_toLocaleLower(char)
{
\treturn _Utils_chr(char.toLocaleLowerCase());
}



/**/
function _Json_errorToString(error)
{
\treturn $elm$json$Json$Decode$errorToString(error);
}
//*/


// CORE DECODERS

function _Json_succeed(msg)
{
\treturn {
\t\t$: 0,
\t\ta: msg
\t};
}

function _Json_fail(msg)
{
\treturn {
\t\t$: 1,
\t\ta: msg
\t};
}

function _Json_decodePrim(decoder)
{
\treturn { $: 2, b: decoder };
}

var _Json_decodeInt = _Json_decodePrim(function(value) {
\treturn (typeof value !== 'number')
\t\t? _Json_expecting('an INT', value)
\t\t:
\t(-2147483647 < value && value < 2147483647 && (value | 0) === value)
\t\t? $elm$core$Result$Ok(value)
\t\t:
\t(isFinite(value) && !(value % 1))
\t\t? $elm$core$Result$Ok(value)
\t\t: _Json_expecting('an INT', value);
});

var _Json_decodeBool = _Json_decodePrim(function(value) {
\treturn (typeof value === 'boolean')
\t\t? $elm$core$Result$Ok(value)
\t\t: _Json_expecting('a BOOL', value);
});

var _Json_decodeFloat = _Json_decodePrim(function(value) {
\treturn (typeof value === 'number')
\t\t? $elm$core$Result$Ok(value)
\t\t: _Json_expecting('a FLOAT', value);
});

var _Json_decodeValue = _Json_decodePrim(function(value) {
\treturn $elm$core$Result$Ok(_Json_wrap(value));
});

var _Json_decodeString = _Json_decodePrim(function(value) {
\treturn (typeof value === 'string')
\t\t? $elm$core$Result$Ok(value)
\t\t: (value instanceof String)
\t\t\t? $elm$core$Result$Ok(value + '')
\t\t\t: _Json_expecting('a STRING', value);
});

function _Json_decodeList(decoder) { return { $: 3, b: decoder }; }
function _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }

function _Json_decodeNull(value) { return { $: 5, c: value }; }

var _Json_decodeField = F2(function(field, decoder)
{
\treturn {
\t\t$: 6,
\t\td: field,
\t\tb: decoder
\t};
});

var _Json_decodeIndex = F2(function(index, decoder)
{
\treturn {
\t\t$: 7,
\t\te: index,
\t\tb: decoder
\t};
});

function _Json_decodeKeyValuePairs(decoder)
{
\treturn {
\t\t$: 8,
\t\tb: decoder
\t};
}

function _Json_mapMany(f, decoders)
{
\treturn {
\t\t$: 9,
\t\tf: f,
\t\tg: decoders
\t};
}

var _Json_andThen = F2(function(callback, decoder)
{
\treturn {
\t\t$: 10,
\t\tb: decoder,
\t\th: callback
\t};
});

function _Json_oneOf(decoders)
{
\treturn {
\t\t$: 11,
\t\tg: decoders
\t};
}


// DECODING OBJECTS

var _Json_map1 = F2(function(f, d1)
{
\treturn _Json_mapMany(f, [d1]);
});

var _Json_map2 = F3(function(f, d1, d2)
{
\treturn _Json_mapMany(f, [d1, d2]);
});

var _Json_map3 = F4(function(f, d1, d2, d3)
{
\treturn _Json_mapMany(f, [d1, d2, d3]);
});

var _Json_map4 = F5(function(f, d1, d2, d3, d4)
{
\treturn _Json_mapMany(f, [d1, d2, d3, d4]);
});

var _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)
{
\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5]);
});

var _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)
{
\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);
});

var _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)
{
\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);
});

var _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)
{
\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);
});


// DECODE

var _Json_runOnString = F2(function(decoder, string)
{
\ttry
\t{
\t\tvar value = JSON.parse(string);
\t\treturn _Json_runHelp(decoder, value);
\t}
\tcatch (e)
\t{
\t\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, 'This is not valid JSON! ' + e.message, _Json_wrap(string)));
\t}
});

var _Json_run = F2(function(decoder, value)
{
\treturn _Json_runHelp(decoder, _Json_unwrap(value));
});

function _Json_runHelp(decoder, value)
{
\tswitch (decoder.$)
\t{
\t\tcase 2:
\t\t\treturn decoder.b(value);

\t\tcase 5:
\t\t\treturn (value === null)
\t\t\t\t? $elm$core$Result$Ok(decoder.c)
\t\t\t\t: _Json_expecting('null', value);

\t\tcase 3:
\t\t\tif (!_Json_isArray(value))
\t\t\t{
\t\t\t\treturn _Json_expecting('a LIST', value);
\t\t\t}
\t\t\treturn _Json_runArrayDecoder(decoder.b, value, _List_fromArray);

\t\tcase 4:
\t\t\tif (!_Json_isArray(value))
\t\t\t{
\t\t\t\treturn _Json_expecting('an ARRAY', value);
\t\t\t}
\t\t\treturn _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);

\t\tcase 6:
\t\t\tvar field = decoder.d;
\t\t\tif (typeof value !== 'object' || value === null || !(field in value))
\t\t\t{
\t\t\t\treturn _Json_expecting('an OBJECT with a field named `' + field + '`', value);
\t\t\t}
\t\t\tvar result = _Json_runHelp(decoder.b, value[field]);
\t\t\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, field, result.a));

\t\tcase 7:
\t\t\tvar index = decoder.e;
\t\t\tif (!_Json_isArray(value))
\t\t\t{
\t\t\t\treturn _Json_expecting('an ARRAY', value);
\t\t\t}
\t\t\tif (index >= value.length)
\t\t\t{
\t\t\t\treturn _Json_expecting('a LONGER array. Need index ' + index + ' but only see ' + value.length + ' entries', value);
\t\t\t}
\t\t\tvar result = _Json_runHelp(decoder.b, value[index]);
\t\t\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, index, result.a));

\t\tcase 8:
\t\t\tif (typeof value !== 'object' || value === null || _Json_isArray(value))
\t\t\t{
\t\t\t\treturn _Json_expecting('an OBJECT', value);
\t\t\t}

\t\t\tvar keyValuePairs = _List_Nil;
\t\t\t// TODO test perf of Object.keys and switch when support is good enough
\t\t\tfor (var key in value)
\t\t\t{
\t\t\t\tif (value.hasOwnProperty(key))
\t\t\t\t{
\t\t\t\t\tvar result = _Json_runHelp(decoder.b, value[key]);
\t\t\t\t\tif (!$elm$core$Result$isOk(result))
\t\t\t\t\t{
\t\t\t\t\t\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, key, result.a));
\t\t\t\t\t}
\t\t\t\t\tkeyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);
\t\t\t\t}
\t\t\t}
\t\t\treturn $elm$core$Result$Ok($elm$core$List$reverse(keyValuePairs));

\t\tcase 9:
\t\t\tvar answer = decoder.f;
\t\t\tvar decoders = decoder.g;
\t\t\tfor (var i = 0; i < decoders.length; i++)
\t\t\t{
\t\t\t\tvar result = _Json_runHelp(decoders[i], value);
\t\t\t\tif (!$elm$core$Result$isOk(result))
\t\t\t\t{
\t\t\t\t\treturn result;
\t\t\t\t}
\t\t\t\tanswer = answer(result.a);
\t\t\t}
\t\t\treturn $elm$core$Result$Ok(answer);

\t\tcase 10:
\t\t\tvar result = _Json_runHelp(decoder.b, value);
\t\t\treturn (!$elm$core$Result$isOk(result))
\t\t\t\t? result
\t\t\t\t: _Json_runHelp(decoder.h(result.a), value);

\t\tcase 11:
\t\t\tvar errors = _List_Nil;
\t\t\tfor (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS
\t\t\t{
\t\t\t\tvar result = _Json_runHelp(temp.a, value);
\t\t\t\tif ($elm$core$Result$isOk(result))
\t\t\t\t{
\t\t\t\t\treturn result;
\t\t\t\t}
\t\t\t\terrors = _List_Cons(result.a, errors);
\t\t\t}
\t\t\treturn $elm$core$Result$Err($elm$json$Json$Decode$OneOf($elm$core$List$reverse(errors)));

\t\tcase 1:
\t\t\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));

\t\tcase 0:
\t\t\treturn $elm$core$Result$Ok(decoder.a);
\t}
}

function _Json_runArrayDecoder(decoder, value, toElmValue)
{
\tvar len = value.length;
\tvar array = new Array(len);
\tfor (var i = 0; i < len; i++)
\t{
\t\tvar result = _Json_runHelp(decoder, value[i]);
\t\tif (!$elm$core$Result$isOk(result))
\t\t{
\t\t\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, i, result.a));
\t\t}
\t\tarray[i] = result.a;
\t}
\treturn $elm$core$Result$Ok(toElmValue(array));
}

function _Json_isArray(value)
{
\treturn Array.isArray(value) || (typeof FileList !== 'undefined' && value instanceof FileList);
}

function _Json_toElmArray(array)
{
\treturn A2($elm$core$Array$initialize, array.length, function(i) { return array[i]; });
}

function _Json_expecting(type, value)
{
\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, 'Expecting ' + type, _Json_wrap(value)));
}


// EQUALITY

function _Json_equality(x, y)
{
\tif (x === y)
\t{
\t\treturn true;
\t}

\tif (x.$ !== y.$)
\t{
\t\treturn false;
\t}

\tswitch (x.$)
\t{
\t\tcase 0:
\t\tcase 1:
\t\t\treturn x.a === y.a;

\t\tcase 2:
\t\t\treturn x.b === y.b;

\t\tcase 5:
\t\t\treturn x.c === y.c;

\t\tcase 3:
\t\tcase 4:
\t\tcase 8:
\t\t\treturn _Json_equality(x.b, y.b);

\t\tcase 6:
\t\t\treturn x.d === y.d && _Json_equality(x.b, y.b);

\t\tcase 7:
\t\t\treturn x.e === y.e && _Json_equality(x.b, y.b);

\t\tcase 9:
\t\t\treturn x.f === y.f && _Json_listEquality(x.g, y.g);

\t\tcase 10:
\t\t\treturn x.h === y.h && _Json_equality(x.b, y.b);

\t\tcase 11:
\t\t\treturn _Json_listEquality(x.g, y.g);
\t}
}

function _Json_listEquality(aDecoders, bDecoders)
{
\tvar len = aDecoders.length;
\tif (len !== bDecoders.length)
\t{
\t\treturn false;
\t}
\tfor (var i = 0; i < len; i++)
\t{
\t\tif (!_Json_equality(aDecoders[i], bDecoders[i]))
\t\t{
\t\t\treturn false;
\t\t}
\t}
\treturn true;
}


// ENCODE

var _Json_encode = F2(function(indentLevel, value)
{
\treturn JSON.stringify(_Json_unwrap(value), null, indentLevel) + '';
});

function _Json_wrap(value) { return { $: 0, a: value }; }
function _Json_unwrap(value) { return value.a; }

function _Json_wrap_UNUSED(value) { return value; }
function _Json_unwrap_UNUSED(value) { return value; }

function _Json_emptyArray() { return []; }
function _Json_emptyObject() { return {}; }

var _Json_addField = F3(function(key, value, object)
{
\tobject[key] = _Json_unwrap(value);
\treturn object;
});

function _Json_addEntry(func)
{
\treturn F2(function(entry, array)
\t{
\t\tarray.push(_Json_unwrap(func(entry)));
\t\treturn array;
\t});
}

var _Json_encodeNull = _Json_wrap(null);



// TASKS

function _Scheduler_succeed(value)
{
\treturn {
\t\t$: 0,
\t\ta: value
\t};
}

function _Scheduler_fail(error)
{
\treturn {
\t\t$: 1,
\t\ta: error
\t};
}

function _Scheduler_binding(callback)
{
\treturn {
\t\t$: 2,
\t\tb: callback,
\t\tc: null
\t};
}

var _Scheduler_andThen = F2(function(callback, task)
{
\treturn {
\t\t$: 3,
\t\tb: callback,
\t\td: task
\t};
});

var _Scheduler_onError = F2(function(callback, task)
{
\treturn {
\t\t$: 4,
\t\tb: callback,
\t\td: task
\t};
});

function _Scheduler_receive(callback)
{
\treturn {
\t\t$: 5,
\t\tb: callback
\t};
}


// PROCESSES

var _Scheduler_guid = 0;

function _Scheduler_rawSpawn(task)
{
\tvar proc = {
\t\t$: 0,
\t\te: _Scheduler_guid++,
\t\tf: task,
\t\tg: null,
\t\th: []
\t};

\t_Scheduler_enqueue(proc);

\treturn proc;
}

function _Scheduler_spawn(task)
{
\treturn _Scheduler_binding(function(callback) {
\t\tcallback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));
\t});
}

function _Scheduler_rawSend(proc, msg)
{
\tproc.h.push(msg);
\t_Scheduler_enqueue(proc);
}

var _Scheduler_send = F2(function(proc, msg)
{
\treturn _Scheduler_binding(function(callback) {
\t\t_Scheduler_rawSend(proc, msg);
\t\tcallback(_Scheduler_succeed(_Utils_Tuple0));
\t});
});

function _Scheduler_kill(proc)
{
\treturn _Scheduler_binding(function(callback) {
\t\tvar task = proc.f;
\t\tif (task.$ === 2 && task.c)
\t\t{
\t\t\ttask.c();
\t\t}

\t\tproc.f = null;

\t\tcallback(_Scheduler_succeed(_Utils_Tuple0));
\t});
}


/* STEP PROCESSES

type alias Process =
  { $ : tag
  , id : unique_id
  , root : Task
  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }
  , mailbox : [msg]
  }

*/


var _Scheduler_working = false;
var _Scheduler_queue = [];


function _Scheduler_enqueue(proc)
{
\t_Scheduler_queue.push(proc);
\tif (_Scheduler_working)
\t{
\t\treturn;
\t}
\t_Scheduler_working = true;
\twhile (proc = _Scheduler_queue.shift())
\t{
\t\t_Scheduler_step(proc);
\t}
\t_Scheduler_working = false;
}


function _Scheduler_step(proc)
{
\twhile (proc.f)
\t{
\t\tvar rootTag = proc.f.$;
\t\tif (rootTag === 0 || rootTag === 1)
\t\t{
\t\t\twhile (proc.g && proc.g.$ !== rootTag)
\t\t\t{
\t\t\t\tproc.g = proc.g.i;
\t\t\t}
\t\t\tif (!proc.g)
\t\t\t{
\t\t\t\treturn;
\t\t\t}
\t\t\tproc.f = proc.g.b(proc.f.a);
\t\t\tproc.g = proc.g.i;
\t\t}
\t\telse if (rootTag === 2)
\t\t{
\t\t\tproc.f.c = proc.f.b(function(newRoot) {
\t\t\t\tproc.f = newRoot;
\t\t\t\t_Scheduler_enqueue(proc);
\t\t\t});
\t\t\treturn;
\t\t}
\t\telse if (rootTag === 5)
\t\t{
\t\t\tif (proc.h.length === 0)
\t\t\t{
\t\t\t\treturn;
\t\t\t}
\t\t\tproc.f = proc.f.b(proc.h.shift());
\t\t}
\t\telse // if (rootTag === 3 || rootTag === 4)
\t\t{
\t\t\tproc.g = {
\t\t\t\t$: rootTag === 3 ? 0 : 1,
\t\t\t\tb: proc.f.b,
\t\t\t\ti: proc.g
\t\t\t};
\t\t\tproc.f = proc.f.d;
\t\t}
\t}
}



function _Process_sleep(time)
{
\treturn _Scheduler_binding(function(callback) {
\t\tvar id = setTimeout(function() {
\t\t\tcallback(_Scheduler_succeed(_Utils_Tuple0));
\t\t}, time);

\t\treturn function() { clearTimeout(id); };
\t});
}




// PROGRAMS


var _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)
{
\treturn _Platform_initialize(
\t\tflagDecoder,
\t\targs,
\t\timpl.init,
\t\timpl.update,
\t\timpl.subscriptions,
\t\tfunction() { return function() {} }
\t);
});



// INITIALIZE A PROGRAM


function _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)
{
\tvar result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args['flags'] : undefined));
\t$elm$core$Result$isOk(result) || _Debug_crash(2 /**/, _Json_errorToString(result.a) /**/);
\tvar managers = {};
\tvar initPair = init(result.a);
\tvar model = initPair.a;
\tvar stepper = stepperBuilder(sendToApp, model);
\tvar ports = _Platform_setupEffects(managers, sendToApp);

\tfunction sendToApp(msg, viewMetadata)
\t{
\t\tvar pair = A2(update, msg, model);
\t\tstepper(model = pair.a, viewMetadata);
\t\t_Platform_enqueueEffects(managers, pair.b, subscriptions(model));
\t}

\t_Platform_enqueueEffects(managers, initPair.b, subscriptions(model));

\treturn ports ? { ports: ports } : {};
}



// TRACK PRELOADS
//
// This is used by code in elm/browser and elm/http
// to register any HTTP requests that are triggered by init.
//


var _Platform_preload;


function _Platform_registerPreload(url)
{
\t_Platform_preload.add(url);
}



// EFFECT MANAGERS


var _Platform_effectManagers = {};


function _Platform_setupEffects(managers, sendToApp)
{
\tvar ports;

\t// setup all necessary effect managers
\tfor (var key in _Platform_effectManagers)
\t{
\t\tvar manager = _Platform_effectManagers[key];

\t\tif (manager.a)
\t\t{
\t\t\tports = ports || {};
\t\t\tports[key] = manager.a(key, sendToApp);
\t\t}

\t\tmanagers[key] = _Platform_instantiateManager(manager, sendToApp);
\t}

\treturn ports;
}


function _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)
{
\treturn {
\t\tb: init,
\t\tc: onEffects,
\t\td: onSelfMsg,
\t\te: cmdMap,
\t\tf: subMap
\t};
}


function _Platform_instantiateManager(info, sendToApp)
{
\tvar router = {
\t\tg: sendToApp,
\t\th: undefined
\t};

\tvar onEffects = info.c;
\tvar onSelfMsg = info.d;
\tvar cmdMap = info.e;
\tvar subMap = info.f;

\tfunction loop(state)
\t{
\t\treturn A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)
\t\t{
\t\t\tvar value = msg.a;

\t\t\tif (msg.$ === 0)
\t\t\t{
\t\t\t\treturn A3(onSelfMsg, router, value, state);
\t\t\t}

\t\t\treturn cmdMap && subMap
\t\t\t\t? A4(onEffects, router, value.i, value.j, state)
\t\t\t\t: A3(onEffects, router, cmdMap ? value.i : value.j, state);
\t\t}));
\t}

\treturn router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));
}



// ROUTING


var _Platform_sendToApp = F2(function(router, msg)
{
\treturn _Scheduler_binding(function(callback)
\t{
\t\trouter.g(msg);
\t\tcallback(_Scheduler_succeed(_Utils_Tuple0));
\t});
});


var _Platform_sendToSelf = F2(function(router, msg)
{
\treturn A2(_Scheduler_send, router.h, {
\t\t$: 0,
\t\ta: msg
\t});
});



// BAGS


function _Platform_leaf(home)
{
\treturn function(value)
\t{
\t\treturn {
\t\t\t$: 1,
\t\t\tk: home,
\t\t\tl: value
\t\t};
\t};
}


function _Platform_batch(list)
{
\treturn {
\t\t$: 2,
\t\tm: list
\t};
}


var _Platform_map = F2(function(tagger, bag)
{
\treturn {
\t\t$: 3,
\t\tn: tagger,
\t\to: bag
\t}
});



// PIPE BAGS INTO EFFECT MANAGERS
//
// Effects must be queued!
//
// Say your init contains a synchronous command, like Time.now or Time.here
//
//   - This will produce a batch of effects (FX_1)
//   - The synchronous task triggers the subsequent `update` call
//   - This will produce a batch of effects (FX_2)
//
// If we just start dispatching FX_2, subscriptions from FX_2 can be processed
// before subscriptions from FX_1. No good! Earlier versions of this code had
// this problem, leading to these reports:
//
//   https://github.com/elm/core/issues/980
//   https://github.com/elm/core/pull/981
//   https://github.com/elm/compiler/issues/1776
//
// The queue is necessary to avoid ordering issues for synchronous commands.


// Why use true/false here? Why not just check the length of the queue?
// The goal is to detect "are we currently dispatching effects?" If we
// are, we need to bail and let the ongoing while loop handle things.
//
// Now say the queue has 1 element. When we dequeue the final element,
// the queue will be empty, but we are still actively dispatching effects.
// So you could get queue jumping in a really tricky category of cases.
//
var _Platform_effectsQueue = [];
var _Platform_effectsActive = false;


function _Platform_enqueueEffects(managers, cmdBag, subBag)
{
\t_Platform_effectsQueue.push({ p: managers, q: cmdBag, r: subBag });

\tif (_Platform_effectsActive) return;

\t_Platform_effectsActive = true;
\tfor (var fx; fx = _Platform_effectsQueue.shift(); )
\t{
\t\t_Platform_dispatchEffects(fx.p, fx.q, fx.r);
\t}
\t_Platform_effectsActive = false;
}


function _Platform_dispatchEffects(managers, cmdBag, subBag)
{
\tvar effectsDict = {};
\t_Platform_gatherEffects(true, cmdBag, effectsDict, null);
\t_Platform_gatherEffects(false, subBag, effectsDict, null);

\tfor (var home in managers)
\t{
\t\t_Scheduler_rawSend(managers[home], {
\t\t\t$: 'fx',
\t\t\ta: effectsDict[home] || { i: _List_Nil, j: _List_Nil }
\t\t});
\t}
}


function _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)
{
\tswitch (bag.$)
\t{
\t\tcase 1:
\t\t\tvar home = bag.k;
\t\t\tvar effect = _Platform_toEffect(isCmd, home, taggers, bag.l);
\t\t\teffectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);
\t\t\treturn;

\t\tcase 2:
\t\t\tfor (var list = bag.m; list.b; list = list.b) // WHILE_CONS
\t\t\t{
\t\t\t\t_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);
\t\t\t}
\t\t\treturn;

\t\tcase 3:
\t\t\t_Platform_gatherEffects(isCmd, bag.o, effectsDict, {
\t\t\t\ts: bag.n,
\t\t\t\tt: taggers
\t\t\t});
\t\t\treturn;
\t}
}


function _Platform_toEffect(isCmd, home, taggers, value)
{
\tfunction applyTaggers(x)
\t{
\t\tfor (var temp = taggers; temp; temp = temp.t)
\t\t{
\t\t\tx = temp.s(x);
\t\t}
\t\treturn x;
\t}

\tvar map = isCmd
\t\t? _Platform_effectManagers[home].e
\t\t: _Platform_effectManagers[home].f;

\treturn A2(map, applyTaggers, value)
}


function _Platform_insert(isCmd, newEffect, effects)
{
\teffects = effects || { i: _List_Nil, j: _List_Nil };

\tisCmd
\t\t? (effects.i = _List_Cons(newEffect, effects.i))
\t\t: (effects.j = _List_Cons(newEffect, effects.j));

\treturn effects;
}



// PORTS


function _Platform_checkPortName(name)
{
\tif (_Platform_effectManagers[name])
\t{
\t\t_Debug_crash(3, name)
\t}
}



// OUTGOING PORTS


function _Platform_outgoingPort(name, converter)
{
\t_Platform_checkPortName(name);
\t_Platform_effectManagers[name] = {
\t\te: _Platform_outgoingPortMap,
\t\tu: converter,
\t\ta: _Platform_setupOutgoingPort
\t};
\treturn _Platform_leaf(name);
}


var _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });


function _Platform_setupOutgoingPort(name)
{
\tvar subs = [];
\tvar converter = _Platform_effectManagers[name].u;

\t// CREATE MANAGER

\tvar init = _Process_sleep(0);

\t_Platform_effectManagers[name].b = init;
\t_Platform_effectManagers[name].c = F3(function(router, cmdList, state)
\t{
\t\tfor ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS
\t\t{
\t\t\t// grab a separate reference to subs in case unsubscribe is called
\t\t\tvar currentSubs = subs;
\t\t\tvar value = _Json_unwrap(converter(cmdList.a));
\t\t\tfor (var i = 0; i < currentSubs.length; i++)
\t\t\t{
\t\t\t\tcurrentSubs[i](value);
\t\t\t}
\t\t}
\t\treturn init;
\t});

\t// PUBLIC API

\tfunction subscribe(callback)
\t{
\t\tsubs.push(callback);
\t}

\tfunction unsubscribe(callback)
\t{
\t\t// copy subs into a new array in case unsubscribe is called within a
\t\t// subscribed callback
\t\tsubs = subs.slice();
\t\tvar index = subs.indexOf(callback);
\t\tif (index >= 0)
\t\t{
\t\t\tsubs.splice(index, 1);
\t\t}
\t}

\treturn {
\t\tsubscribe: subscribe,
\t\tunsubscribe: unsubscribe
\t};
}



// INCOMING PORTS


function _Platform_incomingPort(name, converter)
{
\t_Platform_checkPortName(name);
\t_Platform_effectManagers[name] = {
\t\tf: _Platform_incomingPortMap,
\t\tu: converter,
\t\ta: _Platform_setupIncomingPort
\t};
\treturn _Platform_leaf(name);
}


var _Platform_incomingPortMap = F2(function(tagger, finalTagger)
{
\treturn function(value)
\t{
\t\treturn tagger(finalTagger(value));
\t};
});


function _Platform_setupIncomingPort(name, sendToApp)
{
\tvar subs = _List_Nil;
\tvar converter = _Platform_effectManagers[name].u;

\t// CREATE MANAGER

\tvar init = _Scheduler_succeed(null);

\t_Platform_effectManagers[name].b = init;
\t_Platform_effectManagers[name].c = F3(function(router, subList, state)
\t{
\t\tsubs = subList;
\t\treturn init;
\t});

\t// PUBLIC API

\tfunction send(incomingValue)
\t{
\t\tvar result = A2(_Json_run, converter, _Json_wrap(incomingValue));

\t\t$elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);

\t\tvar value = result.a;
\t\tfor (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS
\t\t{
\t\t\tsendToApp(temp.a(value));
\t\t}
\t}

\treturn { send: send };
}



// EXPORT ELM MODULES
//
// Have DEBUG and PROD versions so that we can (1) give nicer errors in
// debug mode and (2) not pay for the bits needed for that in prod mode.
//


function _Platform_export_UNUSED(exports)
{
\tscope['Elm']
\t\t? _Platform_mergeExportsProd(scope['Elm'], exports)
\t\t: scope['Elm'] = exports;
}


function _Platform_mergeExportsProd(obj, exports)
{
\tfor (var name in exports)
\t{
\t\t(name in obj)
\t\t\t? (name == 'init')
\t\t\t\t? _Debug_crash(6)
\t\t\t\t: _Platform_mergeExportsProd(obj[name], exports[name])
\t\t\t: (obj[name] = exports[name]);
\t}
}


function _Platform_export(exports)
{
\tscope['Elm']
\t\t? _Platform_mergeExportsDebug('Elm', scope['Elm'], exports)
\t\t: scope['Elm'] = exports;
}


function _Platform_mergeExportsDebug(moduleName, obj, exports)
{
\tfor (var name in exports)
\t{
\t\t(name in obj)
\t\t\t? (name == 'init')
\t\t\t\t? _Debug_crash(6, moduleName)
\t\t\t\t: _Platform_mergeExportsDebug(moduleName + '.' + name, obj[name], exports[name])
\t\t\t: (obj[name] = exports[name]);
\t}
}




// HELPERS


var _VirtualDom_divertHrefToApp;

var _VirtualDom_doc = typeof document !== 'undefined' ? document : {};


function _VirtualDom_appendChild(parent, child)
{
\tparent.appendChild(child);
}

var _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)
{
\t// NOTE: this function needs _Platform_export available to work

\t/**_UNUSED/
\tvar node = args['node'];
\t//*/
\t/**/
\tvar node = args && args['node'] ? args['node'] : _Debug_crash(0);
\t//*/

\tnode.parentNode.replaceChild(
\t\t_VirtualDom_render(virtualNode, function() {}),
\t\tnode
\t);

\treturn {};
});



// TEXT


function _VirtualDom_text(string)
{
\treturn {
\t\t$: 0,
\t\ta: string
\t};
}



// NODE


var _VirtualDom_nodeNS = F2(function(namespace, tag)
{
\treturn F2(function(factList, kidList)
\t{
\t\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
\t\t{
\t\t\tvar kid = kidList.a;
\t\t\tdescendantsCount += (kid.b || 0);
\t\t\tkids.push(kid);
\t\t}
\t\tdescendantsCount += kids.length;

\t\treturn {
\t\t\t$: 1,
\t\t\tc: tag,
\t\t\td: _VirtualDom_organizeFacts(factList),
\t\t\te: kids,
\t\t\tf: namespace,
\t\t\tb: descendantsCount
\t\t};
\t});
});


var _VirtualDom_node = _VirtualDom_nodeNS(undefined);



// KEYED NODE


var _VirtualDom_keyedNodeNS = F2(function(namespace, tag)
{
\treturn F2(function(factList, kidList)
\t{
\t\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
\t\t{
\t\t\tvar kid = kidList.a;
\t\t\tdescendantsCount += (kid.b.b || 0);
\t\t\tkids.push(kid);
\t\t}
\t\tdescendantsCount += kids.length;

\t\treturn {
\t\t\t$: 2,
\t\t\tc: tag,
\t\t\td: _VirtualDom_organizeFacts(factList),
\t\t\te: kids,
\t\t\tf: namespace,
\t\t\tb: descendantsCount
\t\t};
\t});
});


var _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);



// CUSTOM


function _VirtualDom_custom(factList, model, render, diff)
{
\treturn {
\t\t$: 3,
\t\td: _VirtualDom_organizeFacts(factList),
\t\tg: model,
\t\th: render,
\t\ti: diff
\t};
}



// MAP


var _VirtualDom_map = F2(function(tagger, node)
{
\treturn {
\t\t$: 4,
\t\tj: tagger,
\t\tk: node,
\t\tb: 1 + (node.b || 0)
\t};
});



// LAZY


function _VirtualDom_thunk(refs, thunk)
{
\treturn {
\t\t$: 5,
\t\tl: refs,
\t\tm: thunk,
\t\tk: undefined
\t};
}

var _VirtualDom_lazy = F2(function(func, a)
{
\treturn _VirtualDom_thunk([func, a], function() {
\t\treturn func(a);
\t});
});

var _VirtualDom_lazy2 = F3(function(func, a, b)
{
\treturn _VirtualDom_thunk([func, a, b], function() {
\t\treturn A2(func, a, b);
\t});
});

var _VirtualDom_lazy3 = F4(function(func, a, b, c)
{
\treturn _VirtualDom_thunk([func, a, b, c], function() {
\t\treturn A3(func, a, b, c);
\t});
});

var _VirtualDom_lazy4 = F5(function(func, a, b, c, d)
{
\treturn _VirtualDom_thunk([func, a, b, c, d], function() {
\t\treturn A4(func, a, b, c, d);
\t});
});

var _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)
{
\treturn _VirtualDom_thunk([func, a, b, c, d, e], function() {
\t\treturn A5(func, a, b, c, d, e);
\t});
});

var _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)
{
\treturn _VirtualDom_thunk([func, a, b, c, d, e, f], function() {
\t\treturn A6(func, a, b, c, d, e, f);
\t});
});

var _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)
{
\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {
\t\treturn A7(func, a, b, c, d, e, f, g);
\t});
});

var _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)
{
\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {
\t\treturn A8(func, a, b, c, d, e, f, g, h);
\t});
});



// FACTS


var _VirtualDom_on = F2(function(key, handler)
{
\treturn {
\t\t$: 'a0',
\t\tn: key,
\t\to: handler
\t};
});
var _VirtualDom_style = F2(function(key, value)
{
\treturn {
\t\t$: 'a1',
\t\tn: key,
\t\to: value
\t};
});
var _VirtualDom_property = F2(function(key, value)
{
\treturn {
\t\t$: 'a2',
\t\tn: key,
\t\to: value
\t};
});
var _VirtualDom_attribute = F2(function(key, value)
{
\treturn {
\t\t$: 'a3',
\t\tn: key,
\t\to: value
\t};
});
var _VirtualDom_attributeNS = F3(function(namespace, key, value)
{
\treturn {
\t\t$: 'a4',
\t\tn: key,
\t\to: { f: namespace, o: value }
\t};
});



// XSS ATTACK VECTOR CHECKS


function _VirtualDom_noScript(tag)
{
\treturn tag == 'script' ? 'p' : tag;
}

function _VirtualDom_noOnOrFormAction(key)
{
\treturn /^(on|formAction$)/i.test(key) ? 'data-' + key : key;
}

function _VirtualDom_noInnerHtmlOrFormAction(key)
{
\treturn key == 'innerHTML' || key == 'formAction' ? 'data-' + key : key;
}

function _VirtualDom_noJavaScriptUri_UNUSED(value)
{
\treturn /^javascript:/i.test(value.replace(/\\s/g,'')) ? '' : value;
}

function _VirtualDom_noJavaScriptUri(value)
{
\treturn /^javascript:/i.test(value.replace(/\\s/g,''))
\t\t? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
\t\t: value;
}

function _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)
{
\treturn /^\\s*(javascript:|data:text\\/html)/i.test(value) ? '' : value;
}

function _VirtualDom_noJavaScriptOrHtmlUri(value)
{
\treturn /^\\s*(javascript:|data:text\\/html)/i.test(value)
\t\t? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
\t\t: value;
}



// MAP FACTS


var _VirtualDom_mapAttribute = F2(function(func, attr)
{
\treturn (attr.$ === 'a0')
\t\t? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))
\t\t: attr;
});

function _VirtualDom_mapHandler(func, handler)
{
\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);

\t// 0 = Normal
\t// 1 = MayStopPropagation
\t// 2 = MayPreventDefault
\t// 3 = Custom

\treturn {
\t\t$: handler.$,
\t\ta:
\t\t\t!tag
\t\t\t\t? A2($elm$json$Json$Decode$map, func, handler.a)
\t\t\t\t:
\t\t\tA3($elm$json$Json$Decode$map2,
\t\t\t\ttag < 3
\t\t\t\t\t? _VirtualDom_mapEventTuple
\t\t\t\t\t: _VirtualDom_mapEventRecord,
\t\t\t\t$elm$json$Json$Decode$succeed(func),
\t\t\t\thandler.a
\t\t\t)
\t};
}

var _VirtualDom_mapEventTuple = F2(function(func, tuple)
{
\treturn _Utils_Tuple2(func(tuple.a), tuple.b);
});

var _VirtualDom_mapEventRecord = F2(function(func, record)
{
\treturn {
\t\tmessage: func(record.message),
\t\tstopPropagation: record.stopPropagation,
\t\tpreventDefault: record.preventDefault
\t}
});



// ORGANIZE FACTS


function _VirtualDom_organizeFacts(factList)
{
\tfor (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS
\t{
\t\tvar entry = factList.a;

\t\tvar tag = entry.$;
\t\tvar key = entry.n;
\t\tvar value = entry.o;

\t\tif (tag === 'a2')
\t\t{
\t\t\t(key === 'className')
\t\t\t\t? _VirtualDom_addClass(facts, key, _Json_unwrap(value))
\t\t\t\t: facts[key] = _Json_unwrap(value);

\t\t\tcontinue;
\t\t}

\t\tvar subFacts = facts[tag] || (facts[tag] = {});
\t\t(tag === 'a3' && key === 'class')
\t\t\t? _VirtualDom_addClass(subFacts, key, value)
\t\t\t: subFacts[key] = value;
\t}

\treturn facts;
}

function _VirtualDom_addClass(object, key, newClass)
{
\tvar classes = object[key];
\tobject[key] = classes ? classes + ' ' + newClass : newClass;
}



// RENDER


function _VirtualDom_render(vNode, eventNode)
{
\tvar tag = vNode.$;

\tif (tag === 5)
\t{
\t\treturn _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);
\t}

\tif (tag === 0)
\t{
\t\treturn _VirtualDom_doc.createTextNode(vNode.a);
\t}

\tif (tag === 4)
\t{
\t\tvar subNode = vNode.k;
\t\tvar tagger = vNode.j;

\t\twhile (subNode.$ === 4)
\t\t{
\t\t\ttypeof tagger !== 'object'
\t\t\t\t? tagger = [tagger, subNode.j]
\t\t\t\t: tagger.push(subNode.j);

\t\t\tsubNode = subNode.k;
\t\t}

\t\tvar subEventRoot = { j: tagger, p: eventNode };
\t\tvar domNode = _VirtualDom_render(subNode, subEventRoot);
\t\tdomNode.elm_event_node_ref = subEventRoot;
\t\treturn domNode;
\t}

\tif (tag === 3)
\t{
\t\tvar domNode = vNode.h(vNode.g);
\t\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);
\t\treturn domNode;
\t}

\t// at this point `tag` must be 1 or 2

\tvar domNode = vNode.f
\t\t? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)
\t\t: _VirtualDom_doc.createElement(vNode.c);

\tif (_VirtualDom_divertHrefToApp && vNode.c == 'a')
\t{
\t\tdomNode.addEventListener('click', _VirtualDom_divertHrefToApp(domNode));
\t}

\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);

\tfor (var kids = vNode.e, i = 0; i < kids.length; i++)
\t{
\t\t_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));
\t}

\treturn domNode;
}



// APPLY FACTS


function _VirtualDom_applyFacts(domNode, eventNode, facts)
{
\tfor (var key in facts)
\t{
\t\tvar value = facts[key];

\t\tkey === 'a1'
\t\t\t? _VirtualDom_applyStyles(domNode, value)
\t\t\t:
\t\tkey === 'a0'
\t\t\t? _VirtualDom_applyEvents(domNode, eventNode, value)
\t\t\t:
\t\tkey === 'a3'
\t\t\t? _VirtualDom_applyAttrs(domNode, value)
\t\t\t:
\t\tkey === 'a4'
\t\t\t? _VirtualDom_applyAttrsNS(domNode, value)
\t\t\t:
\t\t((key !== 'value' && key !== 'checked') || domNode[key] !== value) && (domNode[key] = value);
\t}
}



// APPLY STYLES


function _VirtualDom_applyStyles(domNode, styles)
{
\tvar domNodeStyle = domNode.style;

\tfor (var key in styles)
\t{
\t\tdomNodeStyle[key] = styles[key];
\t}
}



// APPLY ATTRS


function _VirtualDom_applyAttrs(domNode, attrs)
{
\tfor (var key in attrs)
\t{
\t\tvar value = attrs[key];
\t\ttypeof value !== 'undefined'
\t\t\t? domNode.setAttribute(key, value)
\t\t\t: domNode.removeAttribute(key);
\t}
}



// APPLY NAMESPACED ATTRS


function _VirtualDom_applyAttrsNS(domNode, nsAttrs)
{
\tfor (var key in nsAttrs)
\t{
\t\tvar pair = nsAttrs[key];
\t\tvar namespace = pair.f;
\t\tvar value = pair.o;

\t\ttypeof value !== 'undefined'
\t\t\t? domNode.setAttributeNS(namespace, key, value)
\t\t\t: domNode.removeAttributeNS(namespace, key);
\t}
}



// APPLY EVENTS


function _VirtualDom_applyEvents(domNode, eventNode, events)
{
\tvar allCallbacks = domNode.elmFs || (domNode.elmFs = {});

\tfor (var key in events)
\t{
\t\tvar newHandler = events[key];
\t\tvar oldCallback = allCallbacks[key];

\t\tif (!newHandler)
\t\t{
\t\t\tdomNode.removeEventListener(key, oldCallback);
\t\t\tallCallbacks[key] = undefined;
\t\t\tcontinue;
\t\t}

\t\tif (oldCallback)
\t\t{
\t\t\tvar oldHandler = oldCallback.q;
\t\t\tif (oldHandler.$ === newHandler.$)
\t\t\t{
\t\t\t\toldCallback.q = newHandler;
\t\t\t\tcontinue;
\t\t\t}
\t\t\tdomNode.removeEventListener(key, oldCallback);
\t\t}

\t\toldCallback = _VirtualDom_makeCallback(eventNode, newHandler);
\t\tdomNode.addEventListener(key, oldCallback,
\t\t\t_VirtualDom_passiveSupported
\t\t\t&& { passive: $elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }
\t\t);
\t\tallCallbacks[key] = oldCallback;
\t}
}



// PASSIVE EVENTS


var _VirtualDom_passiveSupported;

try
{
\twindow.addEventListener('t', null, Object.defineProperty({}, 'passive', {
\t\tget: function() { _VirtualDom_passiveSupported = true; }
\t}));
}
catch(e) {}



// EVENT HANDLERS


function _VirtualDom_makeCallback(eventNode, initialHandler)
{
\tfunction callback(event)
\t{
\t\tvar handler = callback.q;
\t\tvar result = _Json_runHelp(handler.a, event);

\t\tif (!$elm$core$Result$isOk(result))
\t\t{
\t\t\treturn;
\t\t}

\t\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);

\t\t// 0 = Normal
\t\t// 1 = MayStopPropagation
\t\t// 2 = MayPreventDefault
\t\t// 3 = Custom

\t\tvar value = result.a;
\t\tvar message = !tag ? value : tag < 3 ? value.a : value.message;
\t\tvar stopPropagation = tag == 1 ? value.b : tag == 3 && value.stopPropagation;
\t\tvar currentEventNode = (
\t\t\tstopPropagation && event.stopPropagation(),
\t\t\t(tag == 2 ? value.b : tag == 3 && value.preventDefault) && event.preventDefault(),
\t\t\teventNode
\t\t);
\t\tvar tagger;
\t\tvar i;
\t\twhile (tagger = currentEventNode.j)
\t\t{
\t\t\tif (typeof tagger == 'function')
\t\t\t{
\t\t\t\tmessage = tagger(message);
\t\t\t}
\t\t\telse
\t\t\t{
\t\t\t\tfor (var i = tagger.length; i--; )
\t\t\t\t{
\t\t\t\t\tmessage = tagger[i](message);
\t\t\t\t}
\t\t\t}
\t\t\tcurrentEventNode = currentEventNode.p;
\t\t}
\t\tcurrentEventNode(message, stopPropagation); // stopPropagation implies isSync
\t}

\tcallback.q = initialHandler;

\treturn callback;
}

function _VirtualDom_equalEvents(x, y)
{
\treturn x.$ == y.$ && _Json_equality(x.a, y.a);
}



// DIFF


// TODO: Should we do patches like in iOS?
//
// type Patch
//   = At Int Patch
//   | Batch (List Patch)
//   | Change ...
//
// How could it not be better?
//
function _VirtualDom_diff(x, y)
{
\tvar patches = [];
\t_VirtualDom_diffHelp(x, y, patches, 0);
\treturn patches;
}


function _VirtualDom_pushPatch(patches, type, index, data)
{
\tvar patch = {
\t\t$: type,
\t\tr: index,
\t\ts: data,
\t\tt: undefined,
\t\tu: undefined
\t};
\tpatches.push(patch);
\treturn patch;
}


function _VirtualDom_diffHelp(x, y, patches, index)
{
\tif (x === y)
\t{
\t\treturn;
\t}

\tvar xType = x.$;
\tvar yType = y.$;

\t// Bail if you run into different types of nodes. Implies that the
\t// structure has changed significantly and it's not worth a diff.
\tif (xType !== yType)
\t{
\t\tif (xType === 1 && yType === 2)
\t\t{
\t\t\ty = _VirtualDom_dekey(y);
\t\t\tyType = 1;
\t\t}
\t\telse
\t\t{
\t\t\t_VirtualDom_pushPatch(patches, 0, index, y);
\t\t\treturn;
\t\t}
\t}

\t// Now we know that both nodes are the same $.
\tswitch (yType)
\t{
\t\tcase 5:
\t\t\tvar xRefs = x.l;
\t\t\tvar yRefs = y.l;
\t\t\tvar i = xRefs.length;
\t\t\tvar same = i === yRefs.length;
\t\t\twhile (same && i--)
\t\t\t{
\t\t\t\tsame = xRefs[i] === yRefs[i];
\t\t\t}
\t\t\tif (same)
\t\t\t{
\t\t\t\ty.k = x.k;
\t\t\t\treturn;
\t\t\t}
\t\t\ty.k = y.m();
\t\t\tvar subPatches = [];
\t\t\t_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);
\t\t\tsubPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);
\t\t\treturn;

\t\tcase 4:
\t\t\t// gather nested taggers
\t\t\tvar xTaggers = x.j;
\t\t\tvar yTaggers = y.j;
\t\t\tvar nesting = false;

\t\t\tvar xSubNode = x.k;
\t\t\twhile (xSubNode.$ === 4)
\t\t\t{
\t\t\t\tnesting = true;

\t\t\t\ttypeof xTaggers !== 'object'
\t\t\t\t\t? xTaggers = [xTaggers, xSubNode.j]
\t\t\t\t\t: xTaggers.push(xSubNode.j);

\t\t\t\txSubNode = xSubNode.k;
\t\t\t}

\t\t\tvar ySubNode = y.k;
\t\t\twhile (ySubNode.$ === 4)
\t\t\t{
\t\t\t\tnesting = true;

\t\t\t\ttypeof yTaggers !== 'object'
\t\t\t\t\t? yTaggers = [yTaggers, ySubNode.j]
\t\t\t\t\t: yTaggers.push(ySubNode.j);

\t\t\t\tySubNode = ySubNode.k;
\t\t\t}

\t\t\t// Just bail if different numbers of taggers. This implies the
\t\t\t// structure of the virtual DOM has changed.
\t\t\tif (nesting && xTaggers.length !== yTaggers.length)
\t\t\t{
\t\t\t\t_VirtualDom_pushPatch(patches, 0, index, y);
\t\t\t\treturn;
\t\t\t}

\t\t\t// check if taggers are "the same"
\t\t\tif (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)
\t\t\t{
\t\t\t\t_VirtualDom_pushPatch(patches, 2, index, yTaggers);
\t\t\t}

\t\t\t// diff everything below the taggers
\t\t\t_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);
\t\t\treturn;

\t\tcase 0:
\t\t\tif (x.a !== y.a)
\t\t\t{
\t\t\t\t_VirtualDom_pushPatch(patches, 3, index, y.a);
\t\t\t}
\t\t\treturn;

\t\tcase 1:
\t\t\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);
\t\t\treturn;

\t\tcase 2:
\t\t\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);
\t\t\treturn;

\t\tcase 3:
\t\t\tif (x.h !== y.h)
\t\t\t{
\t\t\t\t_VirtualDom_pushPatch(patches, 0, index, y);
\t\t\t\treturn;
\t\t\t}

\t\t\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);
\t\t\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

\t\t\tvar patch = y.i(x.g, y.g);
\t\t\tpatch && _VirtualDom_pushPatch(patches, 5, index, patch);

\t\t\treturn;
\t}
}

// assumes the incoming arrays are the same length
function _VirtualDom_pairwiseRefEqual(as, bs)
{
\tfor (var i = 0; i < as.length; i++)
\t{
\t\tif (as[i] !== bs[i])
\t\t{
\t\t\treturn false;
\t\t}
\t}

\treturn true;
}

function _VirtualDom_diffNodes(x, y, patches, index, diffKids)
{
\t// Bail if obvious indicators have changed. Implies more serious
\t// structural changes such that it's not worth it to diff.
\tif (x.c !== y.c || x.f !== y.f)
\t{
\t\t_VirtualDom_pushPatch(patches, 0, index, y);
\t\treturn;
\t}

\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);
\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

\tdiffKids(x, y, patches, index);
}



// DIFF FACTS


// TODO Instead of creating a new diff object, it's possible to just test if
// there *is* a diff. During the actual patch, do the diff again and make the
// modifications directly. This way, there's no new allocations. Worth it?
function _VirtualDom_diffFacts(x, y, category)
{
\tvar diff;

\t// look for changes and removals
\tfor (var xKey in x)
\t{
\t\tif (xKey === 'a1' || xKey === 'a0' || xKey === 'a3' || xKey === 'a4')
\t\t{
\t\t\tvar subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);
\t\t\tif (subDiff)
\t\t\t{
\t\t\t\tdiff = diff || {};
\t\t\t\tdiff[xKey] = subDiff;
\t\t\t}
\t\t\tcontinue;
\t\t}

\t\t// remove if not in the new facts
\t\tif (!(xKey in y))
\t\t{
\t\t\tdiff = diff || {};
\t\t\tdiff[xKey] =
\t\t\t\t!category
\t\t\t\t\t? (typeof x[xKey] === 'string' ? '' : null)
\t\t\t\t\t:
\t\t\t\t(category === 'a1')
\t\t\t\t\t? ''
\t\t\t\t\t:
\t\t\t\t(category === 'a0' || category === 'a3')
\t\t\t\t\t? undefined
\t\t\t\t\t:
\t\t\t\t{ f: x[xKey].f, o: undefined };

\t\t\tcontinue;
\t\t}

\t\tvar xValue = x[xKey];
\t\tvar yValue = y[xKey];

\t\t// reference equal, so don't worry about it
\t\tif (xValue === yValue && xKey !== 'value' && xKey !== 'checked'
\t\t\t|| category === 'a0' && _VirtualDom_equalEvents(xValue, yValue))
\t\t{
\t\t\tcontinue;
\t\t}

\t\tdiff = diff || {};
\t\tdiff[xKey] = yValue;
\t}

\t// add new stuff
\tfor (var yKey in y)
\t{
\t\tif (!(yKey in x))
\t\t{
\t\t\tdiff = diff || {};
\t\t\tdiff[yKey] = y[yKey];
\t\t}
\t}

\treturn diff;
}



// DIFF KIDS


function _VirtualDom_diffKids(xParent, yParent, patches, index)
{
\tvar xKids = xParent.e;
\tvar yKids = yParent.e;

\tvar xLen = xKids.length;
\tvar yLen = yKids.length;

\t// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS

\tif (xLen > yLen)
\t{
\t\t_VirtualDom_pushPatch(patches, 6, index, {
\t\t\tv: yLen,
\t\t\ti: xLen - yLen
\t\t});
\t}
\telse if (xLen < yLen)
\t{
\t\t_VirtualDom_pushPatch(patches, 7, index, {
\t\t\tv: xLen,
\t\t\te: yKids
\t\t});
\t}

\t// PAIRWISE DIFF EVERYTHING ELSE

\tfor (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)
\t{
\t\tvar xKid = xKids[i];
\t\t_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);
\t\tindex += xKid.b || 0;
\t}
}



// KEYED DIFF


function _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)
{
\tvar localPatches = [];

\tvar changes = {}; // Dict String Entry
\tvar inserts = []; // Array { index : Int, entry : Entry }
\t// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }

\tvar xKids = xParent.e;
\tvar yKids = yParent.e;
\tvar xLen = xKids.length;
\tvar yLen = yKids.length;
\tvar xIndex = 0;
\tvar yIndex = 0;

\tvar index = rootIndex;

\twhile (xIndex < xLen && yIndex < yLen)
\t{
\t\tvar x = xKids[xIndex];
\t\tvar y = yKids[yIndex];

\t\tvar xKey = x.a;
\t\tvar yKey = y.a;
\t\tvar xNode = x.b;
\t\tvar yNode = y.b;

\t\tvar newMatch = undefined;
\t\tvar oldMatch = undefined;

\t\t// check if keys match

\t\tif (xKey === yKey)
\t\t{
\t\t\tindex++;
\t\t\t_VirtualDom_diffHelp(xNode, yNode, localPatches, index);
\t\t\tindex += xNode.b || 0;

\t\t\txIndex++;
\t\t\tyIndex++;
\t\t\tcontinue;
\t\t}

\t\t// look ahead 1 to detect insertions and removals.

\t\tvar xNext = xKids[xIndex + 1];
\t\tvar yNext = yKids[yIndex + 1];

\t\tif (xNext)
\t\t{
\t\t\tvar xNextKey = xNext.a;
\t\t\tvar xNextNode = xNext.b;
\t\t\toldMatch = yKey === xNextKey;
\t\t}

\t\tif (yNext)
\t\t{
\t\t\tvar yNextKey = yNext.a;
\t\t\tvar yNextNode = yNext.b;
\t\t\tnewMatch = xKey === yNextKey;
\t\t}


\t\t// swap x and y
\t\tif (newMatch && oldMatch)
\t\t{
\t\t\tindex++;
\t\t\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
\t\t\t_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);
\t\t\tindex += xNode.b || 0;

\t\t\tindex++;
\t\t\t_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);
\t\t\tindex += xNextNode.b || 0;

\t\t\txIndex += 2;
\t\t\tyIndex += 2;
\t\t\tcontinue;
\t\t}

\t\t// insert y
\t\tif (newMatch)
\t\t{
\t\t\tindex++;
\t\t\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
\t\t\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
\t\t\tindex += xNode.b || 0;

\t\t\txIndex += 1;
\t\t\tyIndex += 2;
\t\t\tcontinue;
\t\t}

\t\t// remove x
\t\tif (oldMatch)
\t\t{
\t\t\tindex++;
\t\t\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
\t\t\tindex += xNode.b || 0;

\t\t\tindex++;
\t\t\t_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);
\t\t\tindex += xNextNode.b || 0;

\t\t\txIndex += 2;
\t\t\tyIndex += 1;
\t\t\tcontinue;
\t\t}

\t\t// remove x, insert y
\t\tif (xNext && xNextKey === yNextKey)
\t\t{
\t\t\tindex++;
\t\t\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
\t\t\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
\t\t\tindex += xNode.b || 0;

\t\t\tindex++;
\t\t\t_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);
\t\t\tindex += xNextNode.b || 0;

\t\t\txIndex += 2;
\t\t\tyIndex += 2;
\t\t\tcontinue;
\t\t}

\t\tbreak;
\t}

\t// eat up any remaining nodes with removeNode and insertNode

\twhile (xIndex < xLen)
\t{
\t\tindex++;
\t\tvar x = xKids[xIndex];
\t\tvar xNode = x.b;
\t\t_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);
\t\tindex += xNode.b || 0;
\t\txIndex++;
\t}

\twhile (yIndex < yLen)
\t{
\t\tvar endInserts = endInserts || [];
\t\tvar y = yKids[yIndex];
\t\t_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);
\t\tyIndex++;
\t}

\tif (localPatches.length > 0 || inserts.length > 0 || endInserts)
\t{
\t\t_VirtualDom_pushPatch(patches, 8, rootIndex, {
\t\t\tw: localPatches,
\t\t\tx: inserts,
\t\t\ty: endInserts
\t\t});
\t}
}



// CHANGES FROM KEYED DIFF


var _VirtualDom_POSTFIX = '_elmW6BL';


function _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)
{
\tvar entry = changes[key];

\t// never seen this key before
\tif (!entry)
\t{
\t\tentry = {
\t\t\tc: 0,
\t\t\tz: vnode,
\t\t\tr: yIndex,
\t\t\ts: undefined
\t\t};

\t\tinserts.push({ r: yIndex, A: entry });
\t\tchanges[key] = entry;

\t\treturn;
\t}

\t// this key was removed earlier, a match!
\tif (entry.c === 1)
\t{
\t\tinserts.push({ r: yIndex, A: entry });

\t\tentry.c = 2;
\t\tvar subPatches = [];
\t\t_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);
\t\tentry.r = yIndex;
\t\tentry.s.s = {
\t\t\tw: subPatches,
\t\t\tA: entry
\t\t};

\t\treturn;
\t}

\t// this key has already been inserted or moved, a duplicate!
\t_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);
}


function _VirtualDom_removeNode(changes, localPatches, key, vnode, index)
{
\tvar entry = changes[key];

\t// never seen this key before
\tif (!entry)
\t{
\t\tvar patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);

\t\tchanges[key] = {
\t\t\tc: 1,
\t\t\tz: vnode,
\t\t\tr: index,
\t\t\ts: patch
\t\t};

\t\treturn;
\t}

\t// this key was inserted earlier, a match!
\tif (entry.c === 0)
\t{
\t\tentry.c = 2;
\t\tvar subPatches = [];
\t\t_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);

\t\t_VirtualDom_pushPatch(localPatches, 9, index, {
\t\t\tw: subPatches,
\t\t\tA: entry
\t\t});

\t\treturn;
\t}

\t// this key has already been removed or moved, a duplicate!
\t_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);
}



// ADD DOM NODES
//
// Each DOM node has an "index" assigned in order of traversal. It is important
// to minimize our crawl over the actual DOM, so these indexes (along with the
// descendantsCount of virtual nodes) let us skip touching entire subtrees of
// the DOM if we know there are no patches there.


function _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)
{
\t_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);
}


// assumes `patches` is non-empty and indexes increase monotonically.
function _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)
{
\tvar patch = patches[i];
\tvar index = patch.r;

\twhile (index === low)
\t{
\t\tvar patchType = patch.$;

\t\tif (patchType === 1)
\t\t{
\t\t\t_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);
\t\t}
\t\telse if (patchType === 8)
\t\t{
\t\t\tpatch.t = domNode;
\t\t\tpatch.u = eventNode;

\t\t\tvar subPatches = patch.s.w;
\t\t\tif (subPatches.length > 0)
\t\t\t{
\t\t\t\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
\t\t\t}
\t\t}
\t\telse if (patchType === 9)
\t\t{
\t\t\tpatch.t = domNode;
\t\t\tpatch.u = eventNode;

\t\t\tvar data = patch.s;
\t\t\tif (data)
\t\t\t{
\t\t\t\tdata.A.s = domNode;
\t\t\t\tvar subPatches = data.w;
\t\t\t\tif (subPatches.length > 0)
\t\t\t\t{
\t\t\t\t\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
\t\t\t\t}
\t\t\t}
\t\t}
\t\telse
\t\t{
\t\t\tpatch.t = domNode;
\t\t\tpatch.u = eventNode;
\t\t}

\t\ti++;

\t\tif (!(patch = patches[i]) || (index = patch.r) > high)
\t\t{
\t\t\treturn i;
\t\t}
\t}

\tvar tag = vNode.$;

\tif (tag === 4)
\t{
\t\tvar subNode = vNode.k;

\t\twhile (subNode.$ === 4)
\t\t{
\t\t\tsubNode = subNode.k;
\t\t}

\t\treturn _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);
\t}

\t// tag must be 1 or 2 at this point

\tvar vKids = vNode.e;
\tvar childNodes = domNode.childNodes;
\tfor (var j = 0; j < vKids.length; j++)
\t{
\t\tlow++;
\t\tvar vKid = tag === 1 ? vKids[j] : vKids[j].b;
\t\tvar nextLow = low + (vKid.b || 0);
\t\tif (low <= index && index <= nextLow)
\t\t{
\t\t\ti = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);
\t\t\tif (!(patch = patches[i]) || (index = patch.r) > high)
\t\t\t{
\t\t\t\treturn i;
\t\t\t}
\t\t}
\t\tlow = nextLow;
\t}
\treturn i;
}



// APPLY PATCHES


function _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)
{
\tif (patches.length === 0)
\t{
\t\treturn rootDomNode;
\t}

\t_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);
\treturn _VirtualDom_applyPatchesHelp(rootDomNode, patches);
}

function _VirtualDom_applyPatchesHelp(rootDomNode, patches)
{
\tfor (var i = 0; i < patches.length; i++)
\t{
\t\tvar patch = patches[i];
\t\tvar localDomNode = patch.t
\t\tvar newNode = _VirtualDom_applyPatch(localDomNode, patch);
\t\tif (localDomNode === rootDomNode)
\t\t{
\t\t\trootDomNode = newNode;
\t\t}
\t}
\treturn rootDomNode;
}

function _VirtualDom_applyPatch(domNode, patch)
{
\tswitch (patch.$)
\t{
\t\tcase 0:
\t\t\treturn _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);

\t\tcase 4:
\t\t\t_VirtualDom_applyFacts(domNode, patch.u, patch.s);
\t\t\treturn domNode;

\t\tcase 3:
\t\t\tdomNode.replaceData(0, domNode.length, patch.s);
\t\t\treturn domNode;

\t\tcase 1:
\t\t\treturn _VirtualDom_applyPatchesHelp(domNode, patch.s);

\t\tcase 2:
\t\t\tif (domNode.elm_event_node_ref)
\t\t\t{
\t\t\t\tdomNode.elm_event_node_ref.j = patch.s;
\t\t\t}
\t\t\telse
\t\t\t{
\t\t\t\tdomNode.elm_event_node_ref = { j: patch.s, p: patch.u };
\t\t\t}
\t\t\treturn domNode;

\t\tcase 6:
\t\t\tvar data = patch.s;
\t\t\tfor (var i = 0; i < data.i; i++)
\t\t\t{
\t\t\t\tdomNode.removeChild(domNode.childNodes[data.v]);
\t\t\t}
\t\t\treturn domNode;

\t\tcase 7:
\t\t\tvar data = patch.s;
\t\t\tvar kids = data.e;
\t\t\tvar i = data.v;
\t\t\tvar theEnd = domNode.childNodes[i];
\t\t\tfor (; i < kids.length; i++)
\t\t\t{
\t\t\t\tdomNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);
\t\t\t}
\t\t\treturn domNode;

\t\tcase 9:
\t\t\tvar data = patch.s;
\t\t\tif (!data)
\t\t\t{
\t\t\t\tdomNode.parentNode.removeChild(domNode);
\t\t\t\treturn domNode;
\t\t\t}
\t\t\tvar entry = data.A;
\t\t\tif (typeof entry.r !== 'undefined')
\t\t\t{
\t\t\t\tdomNode.parentNode.removeChild(domNode);
\t\t\t}
\t\t\tentry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);
\t\t\treturn domNode;

\t\tcase 8:
\t\t\treturn _VirtualDom_applyPatchReorder(domNode, patch);

\t\tcase 5:
\t\t\treturn patch.s(domNode);

\t\tdefault:
\t\t\t_Debug_crash(10); // 'Ran into an unknown patch!'
\t}
}


function _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)
{
\tvar parentNode = domNode.parentNode;
\tvar newNode = _VirtualDom_render(vNode, eventNode);

\tif (!newNode.elm_event_node_ref)
\t{
\t\tnewNode.elm_event_node_ref = domNode.elm_event_node_ref;
\t}

\tif (parentNode && newNode !== domNode)
\t{
\t\tparentNode.replaceChild(newNode, domNode);
\t}
\treturn newNode;
}


function _VirtualDom_applyPatchReorder(domNode, patch)
{
\tvar data = patch.s;

\t// remove end inserts
\tvar frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);

\t// removals
\tdomNode = _VirtualDom_applyPatchesHelp(domNode, data.w);

\t// inserts
\tvar inserts = data.x;
\tfor (var i = 0; i < inserts.length; i++)
\t{
\t\tvar insert = inserts[i];
\t\tvar entry = insert.A;
\t\tvar node = entry.c === 2
\t\t\t? entry.s
\t\t\t: _VirtualDom_render(entry.z, patch.u);
\t\tdomNode.insertBefore(node, domNode.childNodes[insert.r]);
\t}

\t// add end inserts
\tif (frag)
\t{
\t\t_VirtualDom_appendChild(domNode, frag);
\t}

\treturn domNode;
}


function _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)
{
\tif (!endInserts)
\t{
\t\treturn;
\t}

\tvar frag = _VirtualDom_doc.createDocumentFragment();
\tfor (var i = 0; i < endInserts.length; i++)
\t{
\t\tvar insert = endInserts[i];
\t\tvar entry = insert.A;
\t\t_VirtualDom_appendChild(frag, entry.c === 2
\t\t\t? entry.s
\t\t\t: _VirtualDom_render(entry.z, patch.u)
\t\t);
\t}
\treturn frag;
}


function _VirtualDom_virtualize(node)
{
\t// TEXT NODES

\tif (node.nodeType === 3)
\t{
\t\treturn _VirtualDom_text(node.textContent);
\t}


\t// WEIRD NODES

\tif (node.nodeType !== 1)
\t{
\t\treturn _VirtualDom_text('');
\t}


\t// ELEMENT NODES

\tvar attrList = _List_Nil;
\tvar attrs = node.attributes;
\tfor (var i = attrs.length; i--; )
\t{
\t\tvar attr = attrs[i];
\t\tvar name = attr.name;
\t\tvar value = attr.value;
\t\tattrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );
\t}

\tvar tag = node.tagName.toLowerCase();
\tvar kidList = _List_Nil;
\tvar kids = node.childNodes;

\tfor (var i = kids.length; i--; )
\t{
\t\tkidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);
\t}
\treturn A3(_VirtualDom_node, tag, attrList, kidList);
}

function _VirtualDom_dekey(keyedNode)
{
\tvar keyedKids = keyedNode.e;
\tvar len = keyedKids.length;
\tvar kids = new Array(len);
\tfor (var i = 0; i < len; i++)
\t{
\t\tkids[i] = keyedKids[i].b;
\t}

\treturn {
\t\t$: 1,
\t\tc: keyedNode.c,
\t\td: keyedNode.d,
\t\te: kids,
\t\tf: keyedNode.f,
\t\tb: keyedNode.b
\t};
}




// ELEMENT


var _Debugger_element;

var _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)
{
\treturn _Platform_initialize(
\t\tflagDecoder,
\t\targs,
\t\timpl.init,
\t\timpl.update,
\t\timpl.subscriptions,
\t\tfunction(sendToApp, initialModel) {
\t\t\tvar view = impl.view;
\t\t\t/**_UNUSED/
\t\t\tvar domNode = args['node'];
\t\t\t//*/
\t\t\t/**/
\t\t\tvar domNode = args && args['node'] ? args['node'] : _Debug_crash(0);
\t\t\t//*/
\t\t\tvar currNode = _VirtualDom_virtualize(domNode);

\t\t\treturn _Browser_makeAnimator(initialModel, function(model)
\t\t\t{
\t\t\t\tvar nextNode = view(model);
\t\t\t\tvar patches = _VirtualDom_diff(currNode, nextNode);
\t\t\t\tdomNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);
\t\t\t\tcurrNode = nextNode;
\t\t\t});
\t\t}
\t);
});



// DOCUMENT


var _Debugger_document;

var _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)
{
\treturn _Platform_initialize(
\t\tflagDecoder,
\t\targs,
\t\timpl.init,
\t\timpl.update,
\t\timpl.subscriptions,
\t\tfunction(sendToApp, initialModel) {
\t\t\tvar divertHrefToApp = impl.setup && impl.setup(sendToApp)
\t\t\tvar view = impl.view;
\t\t\tvar title = _VirtualDom_doc.title;
\t\t\tvar bodyNode = _VirtualDom_doc.body;
\t\t\tvar currNode = _VirtualDom_virtualize(bodyNode);
\t\t\treturn _Browser_makeAnimator(initialModel, function(model)
\t\t\t{
\t\t\t\t_VirtualDom_divertHrefToApp = divertHrefToApp;
\t\t\t\tvar doc = view(model);
\t\t\t\tvar nextNode = _VirtualDom_node('body')(_List_Nil)(doc.body);
\t\t\t\tvar patches = _VirtualDom_diff(currNode, nextNode);
\t\t\t\tbodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);
\t\t\t\tcurrNode = nextNode;
\t\t\t\t_VirtualDom_divertHrefToApp = 0;
\t\t\t\t(title !== doc.title) && (_VirtualDom_doc.title = title = doc.title);
\t\t\t});
\t\t}
\t);
});



// ANIMATION


var _Browser_cancelAnimationFrame =
\ttypeof cancelAnimationFrame !== 'undefined'
\t\t? cancelAnimationFrame
\t\t: function(id) { clearTimeout(id); };

var _Browser_requestAnimationFrame =
\ttypeof requestAnimationFrame !== 'undefined'
\t\t? requestAnimationFrame
\t\t: function(callback) { return setTimeout(callback, 1000 / 60); };


function _Browser_makeAnimator(model, draw)
{
\tdraw(model);

\tvar state = 0;

\tfunction updateIfNeeded()
\t{
\t\tstate = state === 1
\t\t\t? 0
\t\t\t: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );
\t}

\treturn function(nextModel, isSync)
\t{
\t\tmodel = nextModel;

\t\tisSync
\t\t\t? ( draw(model),
\t\t\t\tstate === 2 && (state = 1)
\t\t\t\t)
\t\t\t: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),
\t\t\t\tstate = 2
\t\t\t\t);
\t};
}



// APPLICATION


function _Browser_application(impl)
{
\tvar onUrlChange = impl.onUrlChange;
\tvar onUrlRequest = impl.onUrlRequest;
\tvar key = function() { key.a(onUrlChange(_Browser_getUrl())); };

\treturn _Browser_document({
\t\tsetup: function(sendToApp)
\t\t{
\t\t\tkey.a = sendToApp;
\t\t\t_Browser_window.addEventListener('popstate', key);
\t\t\t_Browser_window.navigator.userAgent.indexOf('Trident') < 0 || _Browser_window.addEventListener('hashchange', key);

\t\t\treturn F2(function(domNode, event)
\t\t\t{
\t\t\t\tif (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute('download'))
\t\t\t\t{
\t\t\t\t\tevent.preventDefault();
\t\t\t\t\tvar href = domNode.href;
\t\t\t\t\tvar curr = _Browser_getUrl();
\t\t\t\t\tvar next = $elm$url$Url$fromString(href).a;
\t\t\t\t\tsendToApp(onUrlRequest(
\t\t\t\t\t\t(next
\t\t\t\t\t\t\t&& curr.protocol === next.protocol
\t\t\t\t\t\t\t&& curr.host === next.host
\t\t\t\t\t\t\t&& curr.port_.a === next.port_.a
\t\t\t\t\t\t)
\t\t\t\t\t\t\t? $elm$browser$Browser$Internal(next)
\t\t\t\t\t\t\t: $elm$browser$Browser$External(href)
\t\t\t\t\t));
\t\t\t\t}
\t\t\t});
\t\t},
\t\tinit: function(flags)
\t\t{
\t\t\treturn A3(impl.init, flags, _Browser_getUrl(), key);
\t\t},
\t\tview: impl.view,
\t\tupdate: impl.update,
\t\tsubscriptions: impl.subscriptions
\t});
}

function _Browser_getUrl()
{
\treturn $elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);
}

var _Browser_go = F2(function(key, n)
{
\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {
\t\tn && history.go(n);
\t\tkey();
\t}));
});

var _Browser_pushUrl = F2(function(key, url)
{
\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {
\t\thistory.pushState({}, '', url);
\t\tkey();
\t}));
});

var _Browser_replaceUrl = F2(function(key, url)
{
\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {
\t\thistory.replaceState({}, '', url);
\t\tkey();
\t}));
});



// GLOBAL EVENTS


var _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };
var _Browser_doc = typeof document !== 'undefined' ? document : _Browser_fakeNode;
var _Browser_window = typeof window !== 'undefined' ? window : _Browser_fakeNode;

var _Browser_on = F3(function(node, eventName, sendToSelf)
{
\treturn _Scheduler_spawn(_Scheduler_binding(function(callback)
\t{
\t\tfunction handler(event)\t{ _Scheduler_rawSpawn(sendToSelf(event)); }
\t\tnode.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });
\t\treturn function() { node.removeEventListener(eventName, handler); };
\t}));
});

var _Browser_decodeEvent = F2(function(decoder, event)
{
\tvar result = _Json_runHelp(decoder, event);
\treturn $elm$core$Result$isOk(result) ? $elm$core$Maybe$Just(result.a) : $elm$core$Maybe$Nothing;
});



// PAGE VISIBILITY


function _Browser_visibilityInfo()
{
\treturn (typeof _VirtualDom_doc.hidden !== 'undefined')
\t\t? { hidden: 'hidden', change: 'visibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.mozHidden !== 'undefined')
\t\t? { hidden: 'mozHidden', change: 'mozvisibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.msHidden !== 'undefined')
\t\t? { hidden: 'msHidden', change: 'msvisibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.webkitHidden !== 'undefined')
\t\t? { hidden: 'webkitHidden', change: 'webkitvisibilitychange' }
\t\t: { hidden: 'hidden', change: 'visibilitychange' };
}



// ANIMATION FRAMES


function _Browser_rAF()
{
\treturn _Scheduler_binding(function(callback)
\t{
\t\tvar id = _Browser_requestAnimationFrame(function() {
\t\t\tcallback(_Scheduler_succeed(Date.now()));
\t\t});

\t\treturn function() {
\t\t\t_Browser_cancelAnimationFrame(id);
\t\t};
\t});
}


function _Browser_now()
{
\treturn _Scheduler_binding(function(callback)
\t{
\t\tcallback(_Scheduler_succeed(Date.now()));
\t});
}



// DOM STUFF


function _Browser_withNode(id, doStuff)
{
\treturn _Scheduler_binding(function(callback)
\t{
\t\t_Browser_requestAnimationFrame(function() {
\t\t\tvar node = document.getElementById(id);
\t\t\tcallback(node
\t\t\t\t? _Scheduler_succeed(doStuff(node))
\t\t\t\t: _Scheduler_fail($elm$browser$Browser$Dom$NotFound(id))
\t\t\t);
\t\t});
\t});
}


function _Browser_withWindow(doStuff)
{
\treturn _Scheduler_binding(function(callback)
\t{
\t\t_Browser_requestAnimationFrame(function() {
\t\t\tcallback(_Scheduler_succeed(doStuff()));
\t\t});
\t});
}


// FOCUS and BLUR


var _Browser_call = F2(function(functionName, id)
{
\treturn _Browser_withNode(id, function(node) {
\t\tnode[functionName]();
\t\treturn _Utils_Tuple0;
\t});
});



// WINDOW VIEWPORT


function _Browser_getViewport()
{
\treturn {
\t\tscene: _Browser_getScene(),
\t\tviewport: {
\t\t\tx: _Browser_window.pageXOffset,
\t\t\ty: _Browser_window.pageYOffset,
\t\t\twidth: _Browser_doc.documentElement.clientWidth,
\t\t\theight: _Browser_doc.documentElement.clientHeight
\t\t}
\t};
}

function _Browser_getScene()
{
\tvar body = _Browser_doc.body;
\tvar elem = _Browser_doc.documentElement;
\treturn {
\t\twidth: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),
\t\theight: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)
\t};
}

var _Browser_setViewport = F2(function(x, y)
{
\treturn _Browser_withWindow(function()
\t{
\t\t_Browser_window.scroll(x, y);
\t\treturn _Utils_Tuple0;
\t});
});



// ELEMENT VIEWPORT


function _Browser_getViewportOf(id)
{
\treturn _Browser_withNode(id, function(node)
\t{
\t\treturn {
\t\t\tscene: {
\t\t\t\twidth: node.scrollWidth,
\t\t\t\theight: node.scrollHeight
\t\t\t},
\t\t\tviewport: {
\t\t\t\tx: node.scrollLeft,
\t\t\t\ty: node.scrollTop,
\t\t\t\twidth: node.clientWidth,
\t\t\t\theight: node.clientHeight
\t\t\t}
\t\t};
\t});
}


var _Browser_setViewportOf = F3(function(id, x, y)
{
\treturn _Browser_withNode(id, function(node)
\t{
\t\tnode.scrollLeft = x;
\t\tnode.scrollTop = y;
\t\treturn _Utils_Tuple0;
\t});
});



// ELEMENT


function _Browser_getElement(id)
{
\treturn _Browser_withNode(id, function(node)
\t{
\t\tvar rect = node.getBoundingClientRect();
\t\tvar x = _Browser_window.pageXOffset;
\t\tvar y = _Browser_window.pageYOffset;
\t\treturn {
\t\t\tscene: _Browser_getScene(),
\t\t\tviewport: {
\t\t\t\tx: x,
\t\t\t\ty: y,
\t\t\t\twidth: _Browser_doc.documentElement.clientWidth,
\t\t\t\theight: _Browser_doc.documentElement.clientHeight
\t\t\t},
\t\t\telement: {
\t\t\t\tx: x + rect.left,
\t\t\t\ty: y + rect.top,
\t\t\t\twidth: rect.width,
\t\t\t\theight: rect.height
\t\t\t}
\t\t};
\t});
}



// LOAD and RELOAD


function _Browser_reload(skipCache)
{
\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)
\t{
\t\t_VirtualDom_doc.location.reload(skipCache);
\t}));
}

function _Browser_load(url)
{
\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)
\t{
\t\ttry
\t\t{
\t\t\t_Browser_window.location = url;
\t\t}
\t\tcatch(err)
\t\t{
\t\t\t// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.
\t\t\t// Other browsers reload the page, so let's be consistent about that.
\t\t\t_VirtualDom_doc.location.reload(false);
\t\t}
\t}));
}


// CREATE

var _Regex_never = /.^/;

var _Regex_fromStringWith = F2(function(options, string)
{
\tvar flags = 'g';
\tif (options.multiline) { flags += 'm'; }
\tif (options.caseInsensitive) { flags += 'i'; }

\ttry
\t{
\t\treturn $elm$core$Maybe$Just(new RegExp(string, flags));
\t}
\tcatch(error)
\t{
\t\treturn $elm$core$Maybe$Nothing;
\t}
});


// USE

var _Regex_contains = F2(function(re, string)
{
\treturn string.match(re) !== null;
});


var _Regex_findAtMost = F3(function(n, re, str)
{
\tvar out = [];
\tvar number = 0;
\tvar string = str;
\tvar lastIndex = re.lastIndex;
\tvar prevLastIndex = -1;
\tvar result;
\twhile (number++ < n && (result = re.exec(string)))
\t{
\t\tif (prevLastIndex == re.lastIndex) break;
\t\tvar i = result.length - 1;
\t\tvar subs = new Array(i);
\t\twhile (i > 0)
\t\t{
\t\t\tvar submatch = result[i];
\t\t\tsubs[--i] = submatch
\t\t\t\t? $elm$core$Maybe$Just(submatch)
\t\t\t\t: $elm$core$Maybe$Nothing;
\t\t}
\t\tout.push(A4($elm$regex$Regex$Match, result[0], result.index, number, _List_fromArray(subs)));
\t\tprevLastIndex = re.lastIndex;
\t}
\tre.lastIndex = lastIndex;
\treturn _List_fromArray(out);
});


var _Regex_replaceAtMost = F4(function(n, re, replacer, string)
{
\tvar count = 0;
\tfunction jsReplacer(match)
\t{
\t\tif (count++ >= n)
\t\t{
\t\t\treturn match;
\t\t}
\t\tvar i = arguments.length - 3;
\t\tvar submatches = new Array(i);
\t\twhile (i > 0)
\t\t{
\t\t\tvar submatch = arguments[i];
\t\t\tsubmatches[--i] = submatch
\t\t\t\t? $elm$core$Maybe$Just(submatch)
\t\t\t\t: $elm$core$Maybe$Nothing;
\t\t}
\t\treturn replacer(A4($elm$regex$Regex$Match, match, arguments[arguments.length - 2], count, _List_fromArray(submatches)));
\t}
\treturn string.replace(re, jsReplacer);
});

var _Regex_splitAtMost = F3(function(n, re, str)
{
\tvar string = str;
\tvar out = [];
\tvar start = re.lastIndex;
\tvar restoreLastIndex = re.lastIndex;
\twhile (n--)
\t{
\t\tvar result = re.exec(string);
\t\tif (!result) break;
\t\tout.push(string.slice(start, result.index));
\t\tstart = re.lastIndex;
\t}
\tout.push(string.slice(start));
\tre.lastIndex = restoreLastIndex;
\treturn _List_fromArray(out);
});

var _Regex_infinity = Infinity;



var _Bitwise_and = F2(function(a, b)
{
\treturn a & b;
});

var _Bitwise_or = F2(function(a, b)
{
\treturn a | b;
});

var _Bitwise_xor = F2(function(a, b)
{
\treturn a ^ b;
});

function _Bitwise_complement(a)
{
\treturn ~a;
};

var _Bitwise_shiftLeftBy = F2(function(offset, a)
{
\treturn a << offset;
});

var _Bitwise_shiftRightBy = F2(function(offset, a)
{
\treturn a >> offset;
});

var _Bitwise_shiftRightZfBy = F2(function(offset, a)
{
\treturn a >>> offset;
});
var $elm$core$Basics$EQ = {$: 'EQ'};
var $elm$core$Basics$GT = {$: 'GT'};
var $elm$core$Basics$LT = {$: 'LT'};
var $elm$core$List$cons = _List_cons;
var $elm$core$Dict$foldr = F3(
\tfunction (func, acc, t) {
\t\tfoldr:
\t\twhile (true) {
\t\t\tif (t.$ === 'RBEmpty_elm_builtin') {
\t\t\t\treturn acc;
\t\t\t} else {
\t\t\t\tvar key = t.b;
\t\t\t\tvar value = t.c;
\t\t\t\tvar left = t.d;
\t\t\t\tvar right = t.e;
\t\t\t\tvar $temp$func = func,
\t\t\t\t\t$temp$acc = A3(
\t\t\t\t\tfunc,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\tA3($elm$core$Dict$foldr, func, acc, right)),
\t\t\t\t\t$temp$t = left;
\t\t\t\tfunc = $temp$func;
\t\t\t\tacc = $temp$acc;
\t\t\t\tt = $temp$t;
\t\t\t\tcontinue foldr;
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$toList = function (dict) {
\treturn A3(
\t\t$elm$core$Dict$foldr,
\t\tF3(
\t\t\tfunction (key, value, list) {
\t\t\t\treturn A2(
\t\t\t\t\t$elm$core$List$cons,
\t\t\t\t\t_Utils_Tuple2(key, value),
\t\t\t\t\tlist);
\t\t\t}),
\t\t_List_Nil,
\t\tdict);
};
var $elm$core$Dict$keys = function (dict) {
\treturn A3(
\t\t$elm$core$Dict$foldr,
\t\tF3(
\t\t\tfunction (key, value, keyList) {
\t\t\t\treturn A2($elm$core$List$cons, key, keyList);
\t\t\t}),
\t\t_List_Nil,
\t\tdict);
};
var $elm$core$Set$toList = function (_v0) {
\tvar dict = _v0.a;
\treturn $elm$core$Dict$keys(dict);
};
var $elm$core$Elm$JsArray$foldr = _JsArray_foldr;
var $elm$core$Array$foldr = F3(
\tfunction (func, baseCase, _v0) {
\t\tvar tree = _v0.c;
\t\tvar tail = _v0.d;
\t\tvar helper = F2(
\t\t\tfunction (node, acc) {
\t\t\t\tif (node.$ === 'SubTree') {
\t\t\t\t\tvar subTree = node.a;
\t\t\t\t\treturn A3($elm$core$Elm$JsArray$foldr, helper, acc, subTree);
\t\t\t\t} else {
\t\t\t\t\tvar values = node.a;
\t\t\t\t\treturn A3($elm$core$Elm$JsArray$foldr, func, acc, values);
\t\t\t\t}
\t\t\t});
\t\treturn A3(
\t\t\t$elm$core$Elm$JsArray$foldr,
\t\t\thelper,
\t\t\tA3($elm$core$Elm$JsArray$foldr, func, baseCase, tail),
\t\t\ttree);
\t});
var $elm$core$Array$toList = function (array) {
\treturn A3($elm$core$Array$foldr, $elm$core$List$cons, _List_Nil, array);
};
var $elm$core$Result$Err = function (a) {
\treturn {$: 'Err', a: a};
};
var $elm$json$Json$Decode$Failure = F2(
\tfunction (a, b) {
\t\treturn {$: 'Failure', a: a, b: b};
\t});
var $elm$json$Json$Decode$Field = F2(
\tfunction (a, b) {
\t\treturn {$: 'Field', a: a, b: b};
\t});
var $elm$json$Json$Decode$Index = F2(
\tfunction (a, b) {
\t\treturn {$: 'Index', a: a, b: b};
\t});
var $elm$core$Result$Ok = function (a) {
\treturn {$: 'Ok', a: a};
};
var $elm$json$Json$Decode$OneOf = function (a) {
\treturn {$: 'OneOf', a: a};
};
var $elm$core$Basics$False = {$: 'False'};
var $elm$core$Basics$add = _Basics_add;
var $elm$core$Maybe$Just = function (a) {
\treturn {$: 'Just', a: a};
};
var $elm$core$Maybe$Nothing = {$: 'Nothing'};
var $elm$core$String$all = _String_all;
var $elm$core$Basics$and = _Basics_and;
var $elm$core$Basics$append = _Utils_append;
var $elm$json$Json$Encode$encode = _Json_encode;
var $elm$core$String$fromInt = _String_fromNumber;
var $elm$core$String$join = F2(
\tfunction (sep, chunks) {
\t\treturn A2(
\t\t\t_String_join,
\t\t\tsep,
\t\t\t_List_toArray(chunks));
\t});
var $elm$core$String$split = F2(
\tfunction (sep, string) {
\t\treturn _List_fromArray(
\t\t\tA2(_String_split, sep, string));
\t});
var $elm$json$Json$Decode$indent = function (str) {
\treturn A2(
\t\t$elm$core$String$join,
\t\t'\\n    ',
\t\tA2($elm$core$String$split, '\\n', str));
};
var $elm$core$List$foldl = F3(
\tfunction (func, acc, list) {
\t\tfoldl:
\t\twhile (true) {
\t\t\tif (!list.b) {
\t\t\t\treturn acc;
\t\t\t} else {
\t\t\t\tvar x = list.a;
\t\t\t\tvar xs = list.b;
\t\t\t\tvar $temp$func = func,
\t\t\t\t\t$temp$acc = A2(func, x, acc),
\t\t\t\t\t$temp$list = xs;
\t\t\t\tfunc = $temp$func;
\t\t\t\tacc = $temp$acc;
\t\t\t\tlist = $temp$list;
\t\t\t\tcontinue foldl;
\t\t\t}
\t\t}
\t});
var $elm$core$List$length = function (xs) {
\treturn A3(
\t\t$elm$core$List$foldl,
\t\tF2(
\t\t\tfunction (_v0, i) {
\t\t\t\treturn i + 1;
\t\t\t}),
\t\t0,
\t\txs);
};
var $elm$core$List$map2 = _List_map2;
var $elm$core$Basics$le = _Utils_le;
var $elm$core$Basics$sub = _Basics_sub;
var $elm$core$List$rangeHelp = F3(
\tfunction (lo, hi, list) {
\t\trangeHelp:
\t\twhile (true) {
\t\t\tif (_Utils_cmp(lo, hi) < 1) {
\t\t\t\tvar $temp$lo = lo,
\t\t\t\t\t$temp$hi = hi - 1,
\t\t\t\t\t$temp$list = A2($elm$core$List$cons, hi, list);
\t\t\t\tlo = $temp$lo;
\t\t\t\thi = $temp$hi;
\t\t\t\tlist = $temp$list;
\t\t\t\tcontinue rangeHelp;
\t\t\t} else {
\t\t\t\treturn list;
\t\t\t}
\t\t}
\t});
var $elm$core$List$range = F2(
\tfunction (lo, hi) {
\t\treturn A3($elm$core$List$rangeHelp, lo, hi, _List_Nil);
\t});
var $elm$core$List$indexedMap = F2(
\tfunction (f, xs) {
\t\treturn A3(
\t\t\t$elm$core$List$map2,
\t\t\tf,
\t\t\tA2(
\t\t\t\t$elm$core$List$range,
\t\t\t\t0,
\t\t\t\t$elm$core$List$length(xs) - 1),
\t\t\txs);
\t});
var $elm$core$Char$toCode = _Char_toCode;
var $elm$core$Char$isLower = function (_char) {
\tvar code = $elm$core$Char$toCode(_char);
\treturn (97 <= code) && (code <= 122);
};
var $elm$core$Char$isUpper = function (_char) {
\tvar code = $elm$core$Char$toCode(_char);
\treturn (code <= 90) && (65 <= code);
};
var $elm$core$Basics$or = _Basics_or;
var $elm$core$Char$isAlpha = function (_char) {
\treturn $elm$core$Char$isLower(_char) || $elm$core$Char$isUpper(_char);
};
var $elm$core$Char$isDigit = function (_char) {
\tvar code = $elm$core$Char$toCode(_char);
\treturn (code <= 57) && (48 <= code);
};
var $elm$core$Char$isAlphaNum = function (_char) {
\treturn $elm$core$Char$isLower(_char) || ($elm$core$Char$isUpper(_char) || $elm$core$Char$isDigit(_char));
};
var $elm$core$List$reverse = function (list) {
\treturn A3($elm$core$List$foldl, $elm$core$List$cons, _List_Nil, list);
};
var $elm$core$String$uncons = _String_uncons;
var $elm$json$Json$Decode$errorOneOf = F2(
\tfunction (i, error) {
\t\treturn '\\n\\n(' + ($elm$core$String$fromInt(i + 1) + (') ' + $elm$json$Json$Decode$indent(
\t\t\t$elm$json$Json$Decode$errorToString(error))));
\t});
var $elm$json$Json$Decode$errorToString = function (error) {
\treturn A2($elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);
};
var $elm$json$Json$Decode$errorToStringHelp = F2(
\tfunction (error, context) {
\t\terrorToStringHelp:
\t\twhile (true) {
\t\t\tswitch (error.$) {
\t\t\t\tcase 'Field':
\t\t\t\t\tvar f = error.a;
\t\t\t\t\tvar err = error.b;
\t\t\t\t\tvar isSimple = function () {
\t\t\t\t\t\tvar _v1 = $elm$core$String$uncons(f);
\t\t\t\t\t\tif (_v1.$ === 'Nothing') {
\t\t\t\t\t\t\treturn false;
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\tvar _v2 = _v1.a;
\t\t\t\t\t\t\tvar _char = _v2.a;
\t\t\t\t\t\t\tvar rest = _v2.b;
\t\t\t\t\t\t\treturn $elm$core$Char$isAlpha(_char) && A2($elm$core$String$all, $elm$core$Char$isAlphaNum, rest);
\t\t\t\t\t\t}
\t\t\t\t\t}();
\t\t\t\t\tvar fieldName = isSimple ? ('.' + f) : ('[\\'' + (f + '\\']'));
\t\t\t\t\tvar $temp$error = err,
\t\t\t\t\t\t$temp$context = A2($elm$core$List$cons, fieldName, context);
\t\t\t\t\terror = $temp$error;
\t\t\t\t\tcontext = $temp$context;
\t\t\t\t\tcontinue errorToStringHelp;
\t\t\t\tcase 'Index':
\t\t\t\t\tvar i = error.a;
\t\t\t\t\tvar err = error.b;
\t\t\t\t\tvar indexName = '[' + ($elm$core$String$fromInt(i) + ']');
\t\t\t\t\tvar $temp$error = err,
\t\t\t\t\t\t$temp$context = A2($elm$core$List$cons, indexName, context);
\t\t\t\t\terror = $temp$error;
\t\t\t\t\tcontext = $temp$context;
\t\t\t\t\tcontinue errorToStringHelp;
\t\t\t\tcase 'OneOf':
\t\t\t\t\tvar errors = error.a;
\t\t\t\t\tif (!errors.b) {
\t\t\t\t\t\treturn 'Ran into a Json.Decode.oneOf with no possibilities' + function () {
\t\t\t\t\t\t\tif (!context.b) {
\t\t\t\t\t\t\t\treturn '!';
\t\t\t\t\t\t\t} else {
\t\t\t\t\t\t\t\treturn ' at json' + A2(
\t\t\t\t\t\t\t\t\t$elm$core$String$join,
\t\t\t\t\t\t\t\t\t'',
\t\t\t\t\t\t\t\t\t$elm$core$List$reverse(context));
\t\t\t\t\t\t\t}
\t\t\t\t\t\t}();
\t\t\t\t\t} else {
\t\t\t\t\t\tif (!errors.b.b) {
\t\t\t\t\t\t\tvar err = errors.a;
\t\t\t\t\t\t\tvar $temp$error = err,
\t\t\t\t\t\t\t\t$temp$context = context;
\t\t\t\t\t\t\terror = $temp$error;
\t\t\t\t\t\t\tcontext = $temp$context;
\t\t\t\t\t\t\tcontinue errorToStringHelp;
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\tvar starter = function () {
\t\t\t\t\t\t\t\tif (!context.b) {
\t\t\t\t\t\t\t\t\treturn 'Json.Decode.oneOf';
\t\t\t\t\t\t\t\t} else {
\t\t\t\t\t\t\t\t\treturn 'The Json.Decode.oneOf at json' + A2(
\t\t\t\t\t\t\t\t\t\t$elm$core$String$join,
\t\t\t\t\t\t\t\t\t\t'',
\t\t\t\t\t\t\t\t\t\t$elm$core$List$reverse(context));
\t\t\t\t\t\t\t\t}
\t\t\t\t\t\t\t}();
\t\t\t\t\t\t\tvar introduction = starter + (' failed in the following ' + ($elm$core$String$fromInt(
\t\t\t\t\t\t\t\t$elm$core$List$length(errors)) + ' ways:'));
\t\t\t\t\t\t\treturn A2(
\t\t\t\t\t\t\t\t$elm$core$String$join,
\t\t\t\t\t\t\t\t'\\n\\n',
\t\t\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t\t\t$elm$core$List$cons,
\t\t\t\t\t\t\t\t\tintroduction,
\t\t\t\t\t\t\t\t\tA2($elm$core$List$indexedMap, $elm$json$Json$Decode$errorOneOf, errors)));
\t\t\t\t\t\t}
\t\t\t\t\t}
\t\t\t\tdefault:
\t\t\t\t\tvar msg = error.a;
\t\t\t\t\tvar json = error.b;
\t\t\t\t\tvar introduction = function () {
\t\t\t\t\t\tif (!context.b) {
\t\t\t\t\t\t\treturn 'Problem with the given value:\\n\\n';
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\treturn 'Problem with the value at json' + (A2(
\t\t\t\t\t\t\t\t$elm$core$String$join,
\t\t\t\t\t\t\t\t'',
\t\t\t\t\t\t\t\t$elm$core$List$reverse(context)) + ':\\n\\n    ');
\t\t\t\t\t\t}
\t\t\t\t\t}();
\t\t\t\t\treturn introduction + ($elm$json$Json$Decode$indent(
\t\t\t\t\t\tA2($elm$json$Json$Encode$encode, 4, json)) + ('\\n\\n' + msg));
\t\t\t}
\t\t}
\t});
var $elm$core$Array$branchFactor = 32;
var $elm$core$Array$Array_elm_builtin = F4(
\tfunction (a, b, c, d) {
\t\treturn {$: 'Array_elm_builtin', a: a, b: b, c: c, d: d};
\t});
var $elm$core$Elm$JsArray$empty = _JsArray_empty;
var $elm$core$Basics$ceiling = _Basics_ceiling;
var $elm$core$Basics$fdiv = _Basics_fdiv;
var $elm$core$Basics$logBase = F2(
\tfunction (base, number) {
\t\treturn _Basics_log(number) / _Basics_log(base);
\t});
var $elm$core$Basics$toFloat = _Basics_toFloat;
var $elm$core$Array$shiftStep = $elm$core$Basics$ceiling(
\tA2($elm$core$Basics$logBase, 2, $elm$core$Array$branchFactor));
var $elm$core$Array$empty = A4($elm$core$Array$Array_elm_builtin, 0, $elm$core$Array$shiftStep, $elm$core$Elm$JsArray$empty, $elm$core$Elm$JsArray$empty);
var $elm$core$Elm$JsArray$initialize = _JsArray_initialize;
var $elm$core$Array$Leaf = function (a) {
\treturn {$: 'Leaf', a: a};
};
var $elm$core$Basics$apL = F2(
\tfunction (f, x) {
\t\treturn f(x);
\t});
var $elm$core$Basics$apR = F2(
\tfunction (x, f) {
\t\treturn f(x);
\t});
var $elm$core$Basics$eq = _Utils_equal;
var $elm$core$Basics$floor = _Basics_floor;
var $elm$core$Elm$JsArray$length = _JsArray_length;
var $elm$core$Basics$gt = _Utils_gt;
var $elm$core$Basics$max = F2(
\tfunction (x, y) {
\t\treturn (_Utils_cmp(x, y) > 0) ? x : y;
\t});
var $elm$core$Basics$mul = _Basics_mul;
var $elm$core$Array$SubTree = function (a) {
\treturn {$: 'SubTree', a: a};
};
var $elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;
var $elm$core$Array$compressNodes = F2(
\tfunction (nodes, acc) {
\t\tcompressNodes:
\t\twhile (true) {
\t\t\tvar _v0 = A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodes);
\t\t\tvar node = _v0.a;
\t\t\tvar remainingNodes = _v0.b;
\t\t\tvar newAcc = A2(
\t\t\t\t$elm$core$List$cons,
\t\t\t\t$elm$core$Array$SubTree(node),
\t\t\t\tacc);
\t\t\tif (!remainingNodes.b) {
\t\t\t\treturn $elm$core$List$reverse(newAcc);
\t\t\t} else {
\t\t\t\tvar $temp$nodes = remainingNodes,
\t\t\t\t\t$temp$acc = newAcc;
\t\t\t\tnodes = $temp$nodes;
\t\t\t\tacc = $temp$acc;
\t\t\t\tcontinue compressNodes;
\t\t\t}
\t\t}
\t});
var $elm$core$Tuple$first = function (_v0) {
\tvar x = _v0.a;
\treturn x;
};
var $elm$core$Array$treeFromBuilder = F2(
\tfunction (nodeList, nodeListSize) {
\t\ttreeFromBuilder:
\t\twhile (true) {
\t\t\tvar newNodeSize = $elm$core$Basics$ceiling(nodeListSize / $elm$core$Array$branchFactor);
\t\t\tif (newNodeSize === 1) {
\t\t\t\treturn A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodeList).a;
\t\t\t} else {
\t\t\t\tvar $temp$nodeList = A2($elm$core$Array$compressNodes, nodeList, _List_Nil),
\t\t\t\t\t$temp$nodeListSize = newNodeSize;
\t\t\t\tnodeList = $temp$nodeList;
\t\t\t\tnodeListSize = $temp$nodeListSize;
\t\t\t\tcontinue treeFromBuilder;
\t\t\t}
\t\t}
\t});
var $elm$core$Array$builderToArray = F2(
\tfunction (reverseNodeList, builder) {
\t\tif (!builder.nodeListSize) {
\t\t\treturn A4(
\t\t\t\t$elm$core$Array$Array_elm_builtin,
\t\t\t\t$elm$core$Elm$JsArray$length(builder.tail),
\t\t\t\t$elm$core$Array$shiftStep,
\t\t\t\t$elm$core$Elm$JsArray$empty,
\t\t\t\tbuilder.tail);
\t\t} else {
\t\t\tvar treeLen = builder.nodeListSize * $elm$core$Array$branchFactor;
\t\t\tvar depth = $elm$core$Basics$floor(
\t\t\t\tA2($elm$core$Basics$logBase, $elm$core$Array$branchFactor, treeLen - 1));
\t\t\tvar correctNodeList = reverseNodeList ? $elm$core$List$reverse(builder.nodeList) : builder.nodeList;
\t\t\tvar tree = A2($elm$core$Array$treeFromBuilder, correctNodeList, builder.nodeListSize);
\t\t\treturn A4(
\t\t\t\t$elm$core$Array$Array_elm_builtin,
\t\t\t\t$elm$core$Elm$JsArray$length(builder.tail) + treeLen,
\t\t\t\tA2($elm$core$Basics$max, 5, depth * $elm$core$Array$shiftStep),
\t\t\t\ttree,
\t\t\t\tbuilder.tail);
\t\t}
\t});
var $elm$core$Basics$idiv = _Basics_idiv;
var $elm$core$Basics$lt = _Utils_lt;
var $elm$core$Array$initializeHelp = F5(
\tfunction (fn, fromIndex, len, nodeList, tail) {
\t\tinitializeHelp:
\t\twhile (true) {
\t\t\tif (fromIndex < 0) {
\t\t\t\treturn A2(
\t\t\t\t\t$elm$core$Array$builderToArray,
\t\t\t\t\tfalse,
\t\t\t\t\t{nodeList: nodeList, nodeListSize: (len / $elm$core$Array$branchFactor) | 0, tail: tail});
\t\t\t} else {
\t\t\t\tvar leaf = $elm$core$Array$Leaf(
\t\t\t\t\tA3($elm$core$Elm$JsArray$initialize, $elm$core$Array$branchFactor, fromIndex, fn));
\t\t\t\tvar $temp$fn = fn,
\t\t\t\t\t$temp$fromIndex = fromIndex - $elm$core$Array$branchFactor,
\t\t\t\t\t$temp$len = len,
\t\t\t\t\t$temp$nodeList = A2($elm$core$List$cons, leaf, nodeList),
\t\t\t\t\t$temp$tail = tail;
\t\t\t\tfn = $temp$fn;
\t\t\t\tfromIndex = $temp$fromIndex;
\t\t\t\tlen = $temp$len;
\t\t\t\tnodeList = $temp$nodeList;
\t\t\t\ttail = $temp$tail;
\t\t\t\tcontinue initializeHelp;
\t\t\t}
\t\t}
\t});
var $elm$core$Basics$remainderBy = _Basics_remainderBy;
var $elm$core$Array$initialize = F2(
\tfunction (len, fn) {
\t\tif (len <= 0) {
\t\t\treturn $elm$core$Array$empty;
\t\t} else {
\t\t\tvar tailLen = len % $elm$core$Array$branchFactor;
\t\t\tvar tail = A3($elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);
\t\t\tvar initialFromIndex = (len - tailLen) - $elm$core$Array$branchFactor;
\t\t\treturn A5($elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);
\t\t}
\t});
var $elm$core$Basics$True = {$: 'True'};
var $elm$core$Result$isOk = function (result) {
\tif (result.$ === 'Ok') {
\t\treturn true;
\t} else {
\t\treturn false;
\t}
};
var $elm$json$Json$Decode$map = _Json_map1;
var $elm$json$Json$Decode$map2 = _Json_map2;
var $elm$json$Json$Decode$succeed = _Json_succeed;
var $elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {
\tswitch (handler.$) {
\t\tcase 'Normal':
\t\t\treturn 0;
\t\tcase 'MayStopPropagation':
\t\t\treturn 1;
\t\tcase 'MayPreventDefault':
\t\t\treturn 2;
\t\tdefault:
\t\t\treturn 3;
\t}
};
var $elm$browser$Browser$External = function (a) {
\treturn {$: 'External', a: a};
};
var $elm$browser$Browser$Internal = function (a) {
\treturn {$: 'Internal', a: a};
};
var $elm$core$Basics$identity = function (x) {
\treturn x;
};
var $elm$browser$Browser$Dom$NotFound = function (a) {
\treturn {$: 'NotFound', a: a};
};
var $elm$url$Url$Http = {$: 'Http'};
var $elm$url$Url$Https = {$: 'Https'};
var $elm$url$Url$Url = F6(
\tfunction (protocol, host, port_, path, query, fragment) {
\t\treturn {fragment: fragment, host: host, path: path, port_: port_, protocol: protocol, query: query};
\t});
var $elm$core$String$contains = _String_contains;
var $elm$core$String$length = _String_length;
var $elm$core$String$slice = _String_slice;
var $elm$core$String$dropLeft = F2(
\tfunction (n, string) {
\t\treturn (n < 1) ? string : A3(
\t\t\t$elm$core$String$slice,
\t\t\tn,
\t\t\t$elm$core$String$length(string),
\t\t\tstring);
\t});
var $elm$core$String$indexes = _String_indexes;
var $elm$core$String$isEmpty = function (string) {
\treturn string === '';
};
var $elm$core$String$left = F2(
\tfunction (n, string) {
\t\treturn (n < 1) ? '' : A3($elm$core$String$slice, 0, n, string);
\t});
var $elm$core$String$toInt = _String_toInt;
var $elm$url$Url$chompBeforePath = F5(
\tfunction (protocol, path, params, frag, str) {
\t\tif ($elm$core$String$isEmpty(str) || A2($elm$core$String$contains, '@', str)) {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t} else {
\t\t\tvar _v0 = A2($elm$core$String$indexes, ':', str);
\t\t\tif (!_v0.b) {
\t\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\t\tA6($elm$url$Url$Url, protocol, str, $elm$core$Maybe$Nothing, path, params, frag));
\t\t\t} else {
\t\t\t\tif (!_v0.b.b) {
\t\t\t\t\tvar i = _v0.a;
\t\t\t\t\tvar _v1 = $elm$core$String$toInt(
\t\t\t\t\t\tA2($elm$core$String$dropLeft, i + 1, str));
\t\t\t\t\tif (_v1.$ === 'Nothing') {
\t\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\t\t} else {
\t\t\t\t\t\tvar port_ = _v1;
\t\t\t\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\t\t\t\tA6(
\t\t\t\t\t\t\t\t$elm$url$Url$Url,
\t\t\t\t\t\t\t\tprotocol,
\t\t\t\t\t\t\t\tA2($elm$core$String$left, i, str),
\t\t\t\t\t\t\t\tport_,
\t\t\t\t\t\t\t\tpath,
\t\t\t\t\t\t\t\tparams,
\t\t\t\t\t\t\t\tfrag));
\t\t\t\t\t}
\t\t\t\t} else {
\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $elm$url$Url$chompBeforeQuery = F4(
\tfunction (protocol, params, frag, str) {
\t\tif ($elm$core$String$isEmpty(str)) {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t} else {
\t\t\tvar _v0 = A2($elm$core$String$indexes, '/', str);
\t\t\tif (!_v0.b) {
\t\t\t\treturn A5($elm$url$Url$chompBeforePath, protocol, '/', params, frag, str);
\t\t\t} else {
\t\t\t\tvar i = _v0.a;
\t\t\t\treturn A5(
\t\t\t\t\t$elm$url$Url$chompBeforePath,
\t\t\t\t\tprotocol,
\t\t\t\t\tA2($elm$core$String$dropLeft, i, str),
\t\t\t\t\tparams,
\t\t\t\t\tfrag,
\t\t\t\t\tA2($elm$core$String$left, i, str));
\t\t\t}
\t\t}
\t});
var $elm$url$Url$chompBeforeFragment = F3(
\tfunction (protocol, frag, str) {
\t\tif ($elm$core$String$isEmpty(str)) {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t} else {
\t\t\tvar _v0 = A2($elm$core$String$indexes, '?', str);
\t\t\tif (!_v0.b) {
\t\t\t\treturn A4($elm$url$Url$chompBeforeQuery, protocol, $elm$core$Maybe$Nothing, frag, str);
\t\t\t} else {
\t\t\t\tvar i = _v0.a;
\t\t\t\treturn A4(
\t\t\t\t\t$elm$url$Url$chompBeforeQuery,
\t\t\t\t\tprotocol,
\t\t\t\t\t$elm$core$Maybe$Just(
\t\t\t\t\t\tA2($elm$core$String$dropLeft, i + 1, str)),
\t\t\t\t\tfrag,
\t\t\t\t\tA2($elm$core$String$left, i, str));
\t\t\t}
\t\t}
\t});
var $elm$url$Url$chompAfterProtocol = F2(
\tfunction (protocol, str) {
\t\tif ($elm$core$String$isEmpty(str)) {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t} else {
\t\t\tvar _v0 = A2($elm$core$String$indexes, '#', str);
\t\t\tif (!_v0.b) {
\t\t\t\treturn A3($elm$url$Url$chompBeforeFragment, protocol, $elm$core$Maybe$Nothing, str);
\t\t\t} else {
\t\t\t\tvar i = _v0.a;
\t\t\t\treturn A3(
\t\t\t\t\t$elm$url$Url$chompBeforeFragment,
\t\t\t\t\tprotocol,
\t\t\t\t\t$elm$core$Maybe$Just(
\t\t\t\t\t\tA2($elm$core$String$dropLeft, i + 1, str)),
\t\t\t\t\tA2($elm$core$String$left, i, str));
\t\t\t}
\t\t}
\t});
var $elm$core$String$startsWith = _String_startsWith;
var $elm$url$Url$fromString = function (str) {
\treturn A2($elm$core$String$startsWith, 'http://', str) ? A2(
\t\t$elm$url$Url$chompAfterProtocol,
\t\t$elm$url$Url$Http,
\t\tA2($elm$core$String$dropLeft, 7, str)) : (A2($elm$core$String$startsWith, 'https://', str) ? A2(
\t\t$elm$url$Url$chompAfterProtocol,
\t\t$elm$url$Url$Https,
\t\tA2($elm$core$String$dropLeft, 8, str)) : $elm$core$Maybe$Nothing);
};
var $elm$core$Basics$never = function (_v0) {
\tnever:
\twhile (true) {
\t\tvar nvr = _v0.a;
\t\tvar $temp$_v0 = nvr;
\t\t_v0 = $temp$_v0;
\t\tcontinue never;
\t}
};
var $elm$core$Task$Perform = function (a) {
\treturn {$: 'Perform', a: a};
};
var $elm$core$Task$succeed = _Scheduler_succeed;
var $elm$core$Task$init = $elm$core$Task$succeed(_Utils_Tuple0);
var $elm$core$List$foldrHelper = F4(
\tfunction (fn, acc, ctr, ls) {
\t\tif (!ls.b) {
\t\t\treturn acc;
\t\t} else {
\t\t\tvar a = ls.a;
\t\t\tvar r1 = ls.b;
\t\t\tif (!r1.b) {
\t\t\t\treturn A2(fn, a, acc);
\t\t\t} else {
\t\t\t\tvar b = r1.a;
\t\t\t\tvar r2 = r1.b;
\t\t\t\tif (!r2.b) {
\t\t\t\t\treturn A2(
\t\t\t\t\t\tfn,
\t\t\t\t\t\ta,
\t\t\t\t\t\tA2(fn, b, acc));
\t\t\t\t} else {
\t\t\t\t\tvar c = r2.a;
\t\t\t\t\tvar r3 = r2.b;
\t\t\t\t\tif (!r3.b) {
\t\t\t\t\t\treturn A2(
\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\ta,
\t\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\t\tb,
\t\t\t\t\t\t\t\tA2(fn, c, acc)));
\t\t\t\t\t} else {
\t\t\t\t\t\tvar d = r3.a;
\t\t\t\t\t\tvar r4 = r3.b;
\t\t\t\t\t\tvar res = (ctr > 500) ? A3(
\t\t\t\t\t\t\t$elm$core$List$foldl,
\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\tacc,
\t\t\t\t\t\t\t$elm$core$List$reverse(r4)) : A4($elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);
\t\t\t\t\t\treturn A2(
\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\ta,
\t\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\t\tb,
\t\t\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t\t\tfn,
\t\t\t\t\t\t\t\t\tc,
\t\t\t\t\t\t\t\t\tA2(fn, d, res))));
\t\t\t\t\t}
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $elm$core$List$foldr = F3(
\tfunction (fn, acc, ls) {
\t\treturn A4($elm$core$List$foldrHelper, fn, acc, 0, ls);
\t});
var $elm$core$List$map = F2(
\tfunction (f, xs) {
\t\treturn A3(
\t\t\t$elm$core$List$foldr,
\t\t\tF2(
\t\t\t\tfunction (x, acc) {
\t\t\t\t\treturn A2(
\t\t\t\t\t\t$elm$core$List$cons,
\t\t\t\t\t\tf(x),
\t\t\t\t\t\tacc);
\t\t\t\t}),
\t\t\t_List_Nil,
\t\t\txs);
\t});
var $elm$core$Task$andThen = _Scheduler_andThen;
var $elm$core$Task$map = F2(
\tfunction (func, taskA) {
\t\treturn A2(
\t\t\t$elm$core$Task$andThen,
\t\t\tfunction (a) {
\t\t\t\treturn $elm$core$Task$succeed(
\t\t\t\t\tfunc(a));
\t\t\t},
\t\t\ttaskA);
\t});
var $elm$core$Task$map2 = F3(
\tfunction (func, taskA, taskB) {
\t\treturn A2(
\t\t\t$elm$core$Task$andThen,
\t\t\tfunction (a) {
\t\t\t\treturn A2(
\t\t\t\t\t$elm$core$Task$andThen,
\t\t\t\t\tfunction (b) {
\t\t\t\t\t\treturn $elm$core$Task$succeed(
\t\t\t\t\t\t\tA2(func, a, b));
\t\t\t\t\t},
\t\t\t\t\ttaskB);
\t\t\t},
\t\t\ttaskA);
\t});
var $elm$core$Task$sequence = function (tasks) {
\treturn A3(
\t\t$elm$core$List$foldr,
\t\t$elm$core$Task$map2($elm$core$List$cons),
\t\t$elm$core$Task$succeed(_List_Nil),
\t\ttasks);
};
var $elm$core$Platform$sendToApp = _Platform_sendToApp;
var $elm$core$Task$spawnCmd = F2(
\tfunction (router, _v0) {
\t\tvar task = _v0.a;
\t\treturn _Scheduler_spawn(
\t\t\tA2(
\t\t\t\t$elm$core$Task$andThen,
\t\t\t\t$elm$core$Platform$sendToApp(router),
\t\t\t\ttask));
\t});
var $elm$core$Task$onEffects = F3(
\tfunction (router, commands, state) {
\t\treturn A2(
\t\t\t$elm$core$Task$map,
\t\t\tfunction (_v0) {
\t\t\t\treturn _Utils_Tuple0;
\t\t\t},
\t\t\t$elm$core$Task$sequence(
\t\t\t\tA2(
\t\t\t\t\t$elm$core$List$map,
\t\t\t\t\t$elm$core$Task$spawnCmd(router),
\t\t\t\t\tcommands)));
\t});
var $elm$core$Task$onSelfMsg = F3(
\tfunction (_v0, _v1, _v2) {
\t\treturn $elm$core$Task$succeed(_Utils_Tuple0);
\t});
var $elm$core$Task$cmdMap = F2(
\tfunction (tagger, _v0) {
\t\tvar task = _v0.a;
\t\treturn $elm$core$Task$Perform(
\t\t\tA2($elm$core$Task$map, tagger, task));
\t});
_Platform_effectManagers['Task'] = _Platform_createManager($elm$core$Task$init, $elm$core$Task$onEffects, $elm$core$Task$onSelfMsg, $elm$core$Task$cmdMap);
var $elm$core$Task$command = _Platform_leaf('Task');
var $elm$core$Task$perform = F2(
\tfunction (toMessage, task) {
\t\treturn $elm$core$Task$command(
\t\t\t$elm$core$Task$Perform(
\t\t\t\tA2($elm$core$Task$map, toMessage, task)));
\t});
var $elm$browser$Browser$element = _Browser_element;
var $author$project$Main$Textarea = {$: 'Textarea'};
var $author$project$Main$TextareaFocused = {$: 'TextareaFocused'};
var $elm$core$Basics$always = F2(
\tfunction (a, _v0) {
\t\treturn a;
\t});
var $elm$core$Basics$composeL = F3(
\tfunction (g, f, x) {
\t\treturn g(
\t\t\tf(x));
\t});
var $elm$core$Task$onError = _Scheduler_onError;
var $elm$core$Task$attempt = F2(
\tfunction (resultToMessage, task) {
\t\treturn $elm$core$Task$command(
\t\t\t$elm$core$Task$Perform(
\t\t\t\tA2(
\t\t\t\t\t$elm$core$Task$onError,
\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$core$Basics$composeL,
\t\t\t\t\t\tA2($elm$core$Basics$composeL, $elm$core$Task$succeed, resultToMessage),
\t\t\t\t\t\t$elm$core$Result$Err),
\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$core$Task$andThen,
\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t$elm$core$Basics$composeL,
\t\t\t\t\t\t\tA2($elm$core$Basics$composeL, $elm$core$Task$succeed, resultToMessage),
\t\t\t\t\t\t\t$elm$core$Result$Ok),
\t\t\t\t\t\ttask))));
\t});
var $elm$browser$Browser$Dom$focus = _Browser_call('focus');
var $author$project$Main$textareaId = 'textareaId';
var $author$project$Main$focusTextarea = A2(
\t$elm$core$Task$attempt,
\t$elm$core$Basics$always($author$project$Main$TextareaFocused),
\t$elm$browser$Browser$Dom$focus($author$project$Main$textareaId));
var $author$project$Main$init = function (_v0) {
\treturn _Utils_Tuple2(
\t\t{infoShown: false, page: $author$project$Main$Textarea},
\t\t$author$project$Main$focusTextarea);
};
var $elm$core$Platform$Sub$batch = _Platform_batch;
var $elm$core$Platform$Sub$none = $elm$core$Platform$Sub$batch(_List_Nil);
var $author$project$Main$subscriptions = function (_v0) {
\treturn $elm$core$Platform$Sub$none;
};
var $author$project$Main$Graph = function (a) {
\treturn {$: 'Graph', a: a};
};
var $author$project$Example$code = '\\n(function(scope){\\n\\'use strict\\';\\n\\nvar _Platform_effectManagers = {}, _Scheduler_enqueue; // added by elm-watch\\n\\nfunction F(arity, fun, wrapper) {\\n  wrapper.a = arity;\\n  wrapper.f = fun;\\n  return wrapper;\\n}\\n\\nfunction F2(fun) {\\n  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })\\n}\\nfunction F3(fun) {\\n  return F(3, fun, function(a) {\\n    return function(b) { return function(c) { return fun(a, b, c); }; };\\n  });\\n}\\nfunction F4(fun) {\\n  return F(4, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return fun(a, b, c, d); }; }; };\\n  });\\n}\\nfunction F5(fun) {\\n  return F(5, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };\\n  });\\n}\\nfunction F6(fun) {\\n  return F(6, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return function(e) { return function(f) {\\n    return fun(a, b, c, d, e, f); }; }; }; }; };\\n  });\\n}\\nfunction F7(fun) {\\n  return F(7, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return function(e) { return function(f) {\\n    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };\\n  });\\n}\\nfunction F8(fun) {\\n  return F(8, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return function(e) { return function(f) {\\n    return function(g) { return function(h) {\\n    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };\\n  });\\n}\\nfunction F9(fun) {\\n  return F(9, fun, function(a) { return function(b) { return function(c) {\\n    return function(d) { return function(e) { return function(f) {\\n    return function(g) { return function(h) { return function(i) {\\n    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };\\n  });\\n}\\n\\nfunction A2(fun, a, b) {\\n  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);\\n}\\nfunction A3(fun, a, b, c) {\\n  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);\\n}\\nfunction A4(fun, a, b, c, d) {\\n  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);\\n}\\nfunction A5(fun, a, b, c, d, e) {\\n  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);\\n}\\nfunction A6(fun, a, b, c, d, e, f) {\\n  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);\\n}\\nfunction A7(fun, a, b, c, d, e, f, g) {\\n  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);\\n}\\nfunction A8(fun, a, b, c, d, e, f, g, h) {\\n  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);\\n}\\nfunction A9(fun, a, b, c, d, e, f, g, h, i) {\\n  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);\\n}\\n\\nconsole.warn(\\'Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.1/optimize for better performance and smaller assets.\\');\\n\\n\\n// EQUALITY\\n\\nfunction _Utils_eq(x, y)\\n{\\n\\tfor (\\n\\t\\tvar pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);\\n\\t\\tisEqual && (pair = stack.pop());\\n\\t\\tisEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)\\n\\t\\t)\\n\\t{}\\n\\n\\treturn isEqual;\\n}\\n\\nfunction _Utils_eqHelp(x, y, depth, stack)\\n{\\n\\tif (x === y)\\n\\t{\\n\\t\\treturn true;\\n\\t}\\n\\n\\tif (typeof x !== \\'object\\' || x === null || y === null)\\n\\t{\\n\\t\\ttypeof x === \\'function\\' && _Debug_crash(5);\\n\\t\\treturn false;\\n\\t}\\n\\n\\tif (depth > 100)\\n\\t{\\n\\t\\tstack.push(_Utils_Tuple2(x,y));\\n\\t\\treturn true;\\n\\t}\\n\\n\\t/**/\\n\\tif (x.$ === \\'Set_elm_builtin\\')\\n\\t{\\n\\t\\tx = $elm$core$Set$toList(x);\\n\\t\\ty = $elm$core$Set$toList(y);\\n\\t}\\n\\tif (x.$ === \\'RBNode_elm_builtin\\' || x.$ === \\'RBEmpty_elm_builtin\\')\\n\\t{\\n\\t\\tx = $elm$core$Dict$toList(x);\\n\\t\\ty = $elm$core$Dict$toList(y);\\n\\t}\\n\\t//*/\\n\\n\\t/**_UNUSED/\\n\\tif (x.$ < 0)\\n\\t{\\n\\t\\tx = $elm$core$Dict$toList(x);\\n\\t\\ty = $elm$core$Dict$toList(y);\\n\\t}\\n\\t//*/\\n\\n\\tfor (var key in x)\\n\\t{\\n\\t\\tif (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))\\n\\t\\t{\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t}\\n\\treturn true;\\n}\\n\\nvar _Utils_equal = F2(_Utils_eq);\\nvar _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });\\n\\n\\n\\n// COMPARISONS\\n\\n// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on\\n// the particular integer values assigned to LT, EQ, and GT.\\n\\nfunction _Utils_cmp(x, y, ord)\\n{\\n\\tif (typeof x !== \\'object\\')\\n\\t{\\n\\t\\treturn x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;\\n\\t}\\n\\n\\t/**/\\n\\tif (x instanceof String)\\n\\t{\\n\\t\\tvar a = x.valueOf();\\n\\t\\tvar b = y.valueOf();\\n\\t\\treturn a === b ? 0 : a < b ? -1 : 1;\\n\\t}\\n\\t//*/\\n\\n\\t/**_UNUSED/\\n\\tif (typeof x.$ === \\'undefined\\')\\n\\t//*/\\n\\t/**/\\n\\tif (x.$[0] === \\'#\\')\\n\\t//*/\\n\\t{\\n\\t\\treturn (ord = _Utils_cmp(x.a, y.a))\\n\\t\\t\\t? ord\\n\\t\\t\\t: (ord = _Utils_cmp(x.b, y.b))\\n\\t\\t\\t\\t? ord\\n\\t\\t\\t\\t: _Utils_cmp(x.c, y.c);\\n\\t}\\n\\n\\t// traverse conses until end of a list or a mismatch\\n\\tfor (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES\\n\\treturn ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);\\n}\\n\\nvar _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });\\nvar _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });\\nvar _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });\\nvar _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });\\n\\nvar _Utils_compare = F2(function(x, y)\\n{\\n\\tvar n = _Utils_cmp(x, y);\\n\\treturn n < 0 ? $elm$core$Basics$LT : n ? $elm$core$Basics$GT : $elm$core$Basics$EQ;\\n});\\n\\n\\n// COMMON VALUES\\n\\nvar _Utils_Tuple0_UNUSED = 0;\\nvar _Utils_Tuple0 = { $: \\'#0\\' };\\n\\nfunction _Utils_Tuple2_UNUSED(a, b) { return { a: a, b: b }; }\\nfunction _Utils_Tuple2(a, b) { return { $: \\'#2\\', a: a, b: b }; }\\n\\nfunction _Utils_Tuple3_UNUSED(a, b, c) { return { a: a, b: b, c: c }; }\\nfunction _Utils_Tuple3(a, b, c) { return { $: \\'#3\\', a: a, b: b, c: c }; }\\n\\nfunction _Utils_chr_UNUSED(c) { return c; }\\nfunction _Utils_chr(c) { return new String(c); }\\n\\n\\n// RECORDS\\n\\nfunction _Utils_update(oldRecord, updatedFields)\\n{\\n\\tvar newRecord = {};\\n\\n\\tfor (var key in oldRecord)\\n\\t{\\n\\t\\tnewRecord[key] = oldRecord[key];\\n\\t}\\n\\n\\tfor (var key in updatedFields)\\n\\t{\\n\\t\\tnewRecord[key] = updatedFields[key];\\n\\t}\\n\\n\\treturn newRecord;\\n}\\n\\n\\n// APPEND\\n\\nvar _Utils_append = F2(_Utils_ap);\\n\\nfunction _Utils_ap(xs, ys)\\n{\\n\\t// append Strings\\n\\tif (typeof xs === \\'string\\')\\n\\t{\\n\\t\\treturn xs + ys;\\n\\t}\\n\\n\\t// append Lists\\n\\tif (!xs.b)\\n\\t{\\n\\t\\treturn ys;\\n\\t}\\n\\tvar root = _List_Cons(xs.a, ys);\\n\\txs = xs.b\\n\\tfor (var curr = root; xs.b; xs = xs.b) // WHILE_CONS\\n\\t{\\n\\t\\tcurr = curr.b = _List_Cons(xs.a, ys);\\n\\t}\\n\\treturn root;\\n}\\n\\n\\n\\nvar _List_Nil_UNUSED = { $: 0 };\\nvar _List_Nil = { $: \\'[]\\' };\\n\\nfunction _List_Cons_UNUSED(hd, tl) { return { $: 1, a: hd, b: tl }; }\\nfunction _List_Cons(hd, tl) { return { $: \\'::\\', a: hd, b: tl }; }\\n\\n\\nvar _List_cons = F2(_List_Cons);\\n\\nfunction _List_fromArray(arr)\\n{\\n\\tvar out = _List_Nil;\\n\\tfor (var i = arr.length; i--; )\\n\\t{\\n\\t\\tout = _List_Cons(arr[i], out);\\n\\t}\\n\\treturn out;\\n}\\n\\nfunction _List_toArray(xs)\\n{\\n\\tfor (var out = []; xs.b; xs = xs.b) // WHILE_CONS\\n\\t{\\n\\t\\tout.push(xs.a);\\n\\t}\\n\\treturn out;\\n}\\n\\nvar _List_map2 = F3(function(f, xs, ys)\\n{\\n\\tfor (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES\\n\\t{\\n\\t\\tarr.push(A2(f, xs.a, ys.a));\\n\\t}\\n\\treturn _List_fromArray(arr);\\n});\\n\\nvar _List_map3 = F4(function(f, xs, ys, zs)\\n{\\n\\tfor (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\n\\t{\\n\\t\\tarr.push(A3(f, xs.a, ys.a, zs.a));\\n\\t}\\n\\treturn _List_fromArray(arr);\\n});\\n\\nvar _List_map4 = F5(function(f, ws, xs, ys, zs)\\n{\\n\\tfor (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\n\\t{\\n\\t\\tarr.push(A4(f, ws.a, xs.a, ys.a, zs.a));\\n\\t}\\n\\treturn _List_fromArray(arr);\\n});\\n\\nvar _List_map5 = F6(function(f, vs, ws, xs, ys, zs)\\n{\\n\\tfor (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\n\\t{\\n\\t\\tarr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));\\n\\t}\\n\\treturn _List_fromArray(arr);\\n});\\n\\nvar _List_sortBy = F2(function(f, xs)\\n{\\n\\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {\\n\\t\\treturn _Utils_cmp(f(a), f(b));\\n\\t}));\\n});\\n\\nvar _List_sortWith = F2(function(f, xs)\\n{\\n\\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {\\n\\t\\tvar ord = A2(f, a, b);\\n\\t\\treturn ord === $elm$core$Basics$EQ ? 0 : ord === $elm$core$Basics$LT ? -1 : 1;\\n\\t}));\\n});\\n\\n\\n\\nvar _JsArray_empty = [];\\n\\nfunction _JsArray_singleton(value)\\n{\\n    return [value];\\n}\\n\\nfunction _JsArray_length(array)\\n{\\n    return array.length;\\n}\\n\\nvar _JsArray_initialize = F3(function(size, offset, func)\\n{\\n    var result = new Array(size);\\n\\n    for (var i = 0; i < size; i++)\\n    {\\n        result[i] = func(offset + i);\\n    }\\n\\n    return result;\\n});\\n\\nvar _JsArray_initializeFromList = F2(function (max, ls)\\n{\\n    var result = new Array(max);\\n\\n    for (var i = 0; i < max && ls.b; i++)\\n    {\\n        result[i] = ls.a;\\n        ls = ls.b;\\n    }\\n\\n    result.length = i;\\n    return _Utils_Tuple2(result, ls);\\n});\\n\\nvar _JsArray_unsafeGet = F2(function(index, array)\\n{\\n    return array[index];\\n});\\n\\nvar _JsArray_unsafeSet = F3(function(index, value, array)\\n{\\n    var length = array.length;\\n    var result = new Array(length);\\n\\n    for (var i = 0; i < length; i++)\\n    {\\n        result[i] = array[i];\\n    }\\n\\n    result[index] = value;\\n    return result;\\n});\\n\\nvar _JsArray_push = F2(function(value, array)\\n{\\n    var length = array.length;\\n    var result = new Array(length + 1);\\n\\n    for (var i = 0; i < length; i++)\\n    {\\n        result[i] = array[i];\\n    }\\n\\n    result[length] = value;\\n    return result;\\n});\\n\\nvar _JsArray_foldl = F3(function(func, acc, array)\\n{\\n    var length = array.length;\\n\\n    for (var i = 0; i < length; i++)\\n    {\\n        acc = A2(func, array[i], acc);\\n    }\\n\\n    return acc;\\n});\\n\\nvar _JsArray_foldr = F3(function(func, acc, array)\\n{\\n    for (var i = array.length - 1; i >= 0; i--)\\n    {\\n        acc = A2(func, array[i], acc);\\n    }\\n\\n    return acc;\\n});\\n\\nvar _JsArray_map = F2(function(func, array)\\n{\\n    var length = array.length;\\n    var result = new Array(length);\\n\\n    for (var i = 0; i < length; i++)\\n    {\\n        result[i] = func(array[i]);\\n    }\\n\\n    return result;\\n});\\n\\nvar _JsArray_indexedMap = F3(function(func, offset, array)\\n{\\n    var length = array.length;\\n    var result = new Array(length);\\n\\n    for (var i = 0; i < length; i++)\\n    {\\n        result[i] = A2(func, offset + i, array[i]);\\n    }\\n\\n    return result;\\n});\\n\\nvar _JsArray_slice = F3(function(from, to, array)\\n{\\n    return array.slice(from, to);\\n});\\n\\nvar _JsArray_appendN = F3(function(n, dest, source)\\n{\\n    var destLen = dest.length;\\n    var itemsToCopy = n - destLen;\\n\\n    if (itemsToCopy > source.length)\\n    {\\n        itemsToCopy = source.length;\\n    }\\n\\n    var size = destLen + itemsToCopy;\\n    var result = new Array(size);\\n\\n    for (var i = 0; i < destLen; i++)\\n    {\\n        result[i] = dest[i];\\n    }\\n\\n    for (var i = 0; i < itemsToCopy; i++)\\n    {\\n        result[i + destLen] = source[i];\\n    }\\n\\n    return result;\\n});\\n\\n\\n\\n// LOG\\n\\nvar _Debug_log_UNUSED = F2(function(tag, value)\\n{\\n\\treturn value;\\n});\\n\\nvar _Debug_log = F2(function(tag, value)\\n{\\n\\tconsole.log(tag + \\': \\' + _Debug_toString(value));\\n\\treturn value;\\n});\\n\\n\\n// TODOS\\n\\nfunction _Debug_todo(moduleName, region)\\n{\\n\\treturn function(message) {\\n\\t\\t_Debug_crash(8, moduleName, region, message);\\n\\t};\\n}\\n\\nfunction _Debug_todoCase(moduleName, region, value)\\n{\\n\\treturn function(message) {\\n\\t\\t_Debug_crash(9, moduleName, region, value, message);\\n\\t};\\n}\\n\\n\\n// TO STRING\\n\\nfunction _Debug_toString_UNUSED(value)\\n{\\n\\treturn \\'<internals>\\';\\n}\\n\\nfunction _Debug_toString(value)\\n{\\n\\treturn _Debug_toAnsiString(false, value);\\n}\\n\\nfunction _Debug_toAnsiString(ansi, value)\\n{\\n\\tif (typeof value === \\'function\\')\\n\\t{\\n\\t\\treturn _Debug_internalColor(ansi, \\'<function>\\');\\n\\t}\\n\\n\\tif (typeof value === \\'boolean\\')\\n\\t{\\n\\t\\treturn _Debug_ctorColor(ansi, value ? \\'True\\' : \\'False\\');\\n\\t}\\n\\n\\tif (typeof value === \\'number\\')\\n\\t{\\n\\t\\treturn _Debug_numberColor(ansi, value + \\'\\');\\n\\t}\\n\\n\\tif (value instanceof String)\\n\\t{\\n\\t\\treturn _Debug_charColor(ansi, "\\'" + _Debug_addSlashes(value, true) + "\\'");\\n\\t}\\n\\n\\tif (typeof value === \\'string\\')\\n\\t{\\n\\t\\treturn _Debug_stringColor(ansi, \\'"\\' + _Debug_addSlashes(value, false) + \\'"\\');\\n\\t}\\n\\n\\tif (typeof value === \\'object\\' && \\'$\\' in value)\\n\\t{\\n\\t\\tvar tag = value.$;\\n\\n\\t\\tif (typeof tag === \\'number\\')\\n\\t\\t{\\n\\t\\t\\treturn _Debug_internalColor(ansi, \\'<internals>\\');\\n\\t\\t}\\n\\n\\t\\tif (tag[0] === \\'#\\')\\n\\t\\t{\\n\\t\\t\\tvar output = [];\\n\\t\\t\\tfor (var k in value)\\n\\t\\t\\t{\\n\\t\\t\\t\\tif (k === \\'$\\') continue;\\n\\t\\t\\t\\toutput.push(_Debug_toAnsiString(ansi, value[k]));\\n\\t\\t\\t}\\n\\t\\t\\treturn \\'(\\' + output.join(\\',\\') + \\')\\';\\n\\t\\t}\\n\\n\\t\\tif (tag === \\'Set_elm_builtin\\')\\n\\t\\t{\\n\\t\\t\\treturn _Debug_ctorColor(ansi, \\'Set\\')\\n\\t\\t\\t\\t+ _Debug_fadeColor(ansi, \\'.fromList\\') + \\' \\'\\n\\t\\t\\t\\t+ _Debug_toAnsiString(ansi, $elm$core$Set$toList(value));\\n\\t\\t}\\n\\n\\t\\tif (tag === \\'RBNode_elm_builtin\\' || tag === \\'RBEmpty_elm_builtin\\')\\n\\t\\t{\\n\\t\\t\\treturn _Debug_ctorColor(ansi, \\'Dict\\')\\n\\t\\t\\t\\t+ _Debug_fadeColor(ansi, \\'.fromList\\') + \\' \\'\\n\\t\\t\\t\\t+ _Debug_toAnsiString(ansi, $elm$core$Dict$toList(value));\\n\\t\\t}\\n\\n\\t\\tif (tag === \\'Array_elm_builtin\\')\\n\\t\\t{\\n\\t\\t\\treturn _Debug_ctorColor(ansi, \\'Array\\')\\n\\t\\t\\t\\t+ _Debug_fadeColor(ansi, \\'.fromList\\') + \\' \\'\\n\\t\\t\\t\\t+ _Debug_toAnsiString(ansi, $elm$core$Array$toList(value));\\n\\t\\t}\\n\\n\\t\\tif (tag === \\'::\\' || tag === \\'[]\\')\\n\\t\\t{\\n\\t\\t\\tvar output = \\'[\\';\\n\\n\\t\\t\\tvalue.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)\\n\\n\\t\\t\\tfor (; value.b; value = value.b) // WHILE_CONS\\n\\t\\t\\t{\\n\\t\\t\\t\\toutput += \\',\\' + _Debug_toAnsiString(ansi, value.a);\\n\\t\\t\\t}\\n\\t\\t\\treturn output + \\']\\';\\n\\t\\t}\\n\\n\\t\\tvar output = \\'\\';\\n\\t\\tfor (var i in value)\\n\\t\\t{\\n\\t\\t\\tif (i === \\'$\\') continue;\\n\\t\\t\\tvar str = _Debug_toAnsiString(ansi, value[i]);\\n\\t\\t\\tvar c0 = str[0];\\n\\t\\t\\tvar parenless = c0 === \\'{\\' || c0 === \\'(\\' || c0 === \\'[\\' || c0 === \\'<\\' || c0 === \\'"\\' || str.indexOf(\\' \\') < 0;\\n\\t\\t\\toutput += \\' \\' + (parenless ? str : \\'(\\' + str + \\')\\');\\n\\t\\t}\\n\\t\\treturn _Debug_ctorColor(ansi, tag) + output;\\n\\t}\\n\\n\\tif (typeof DataView === \\'function\\' && value instanceof DataView)\\n\\t{\\n\\t\\treturn _Debug_stringColor(ansi, \\'<\\' + value.byteLength + \\' bytes>\\');\\n\\t}\\n\\n\\tif (typeof File !== \\'undefined\\' && value instanceof File)\\n\\t{\\n\\t\\treturn _Debug_internalColor(ansi, \\'<\\' + value.name + \\'>\\');\\n\\t}\\n\\n\\tif (typeof value === \\'object\\')\\n\\t{\\n\\t\\tvar output = [];\\n\\t\\tfor (var key in value)\\n\\t\\t{\\n\\t\\t\\tvar field = key[0] === \\'_\\' ? key.slice(1) : key;\\n\\t\\t\\toutput.push(_Debug_fadeColor(ansi, field) + \\' = \\' + _Debug_toAnsiString(ansi, value[key]));\\n\\t\\t}\\n\\t\\tif (output.length === 0)\\n\\t\\t{\\n\\t\\t\\treturn \\'{}\\';\\n\\t\\t}\\n\\t\\treturn \\'{ \\' + output.join(\\', \\') + \\' }\\';\\n\\t}\\n\\n\\treturn _Debug_internalColor(ansi, \\'<internals>\\');\\n}\\n\\nfunction _Debug_addSlashes(str, isChar)\\n{\\n\\tvar s = str\\n\\t\\t.replace(/\\\\\\\\/g, \\'\\\\\\\\\\\\\\\\\\')\\n\\t\\t.replace(/\\\\n/g, \\'\\\\\\\\n\\')\\n\\t\\t.replace(/\\\\t/g, \\'\\\\\\\\t\\')\\n\\t\\t.replace(/\\\\r/g, \\'\\\\\\\\r\\')\\n\\t\\t.replace(/\\\\v/g, \\'\\\\\\\\v\\')\\n\\t\\t.replace(/\\\\0/g, \\'\\\\\\\\0\\');\\n\\n\\tif (isChar)\\n\\t{\\n\\t\\treturn s.replace(/\\\\\\'/g, \\'\\\\\\\\\\\\\\'\\');\\n\\t}\\n\\telse\\n\\t{\\n\\t\\treturn s.replace(/\\\\"/g, \\'\\\\\\\\"\\');\\n\\t}\\n}\\n\\nfunction _Debug_ctorColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[96m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_numberColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[95m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_stringColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[93m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_charColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[92m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_fadeColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[37m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_internalColor(ansi, string)\\n{\\n\\treturn ansi ? \\'\\\\x1b[36m\\' + string + \\'\\\\x1b[0m\\' : string;\\n}\\n\\nfunction _Debug_toHexDigit(n)\\n{\\n\\treturn String.fromCharCode(n < 10 ? 48 + n : 55 + n);\\n}\\n\\n\\n// CRASH\\n\\n\\nfunction _Debug_crash_UNUSED(identifier)\\n{\\n\\tthrow new Error(\\'https://github.com/elm/core/blob/1.0.0/hints/\\' + identifier + \\'.md\\');\\n}\\n\\n\\nfunction _Debug_crash(identifier, fact1, fact2, fact3, fact4)\\n{\\n\\tswitch(identifier)\\n\\t{\\n\\t\\tcase 0:\\n\\t\\t\\tthrow new Error(\\'What node should I take over? In JavaScript I need something like:\\\\n\\\\n    Elm.Main.init({\\\\n        node: document.getElementById("elm-node")\\\\n    })\\\\n\\\\nYou need to do this with any Browser.sandbox or Browser.element program.\\');\\n\\n\\t\\tcase 1:\\n\\t\\t\\tthrow new Error(\\'Browser.application programs cannot handle URLs like this:\\\\n\\\\n    \\' + document.location.href + \\'\\\\n\\\\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.\\');\\n\\n\\t\\tcase 2:\\n\\t\\t\\tvar jsonErrorString = fact1;\\n\\t\\t\\tthrow new Error(\\'Problem with the flags given to your Elm program on initialization.\\\\n\\\\n\\' + jsonErrorString);\\n\\n\\t\\tcase 3:\\n\\t\\t\\tvar portName = fact1;\\n\\t\\t\\tthrow new Error(\\'There can only be one port named `\\' + portName + \\'`, but your program has multiple.\\');\\n\\n\\t\\tcase 4:\\n\\t\\t\\tvar portName = fact1;\\n\\t\\t\\tvar problem = fact2;\\n\\t\\t\\tthrow new Error(\\'Trying to send an unexpected type of value through port `\\' + portName + \\'`:\\\\n\\' + problem);\\n\\n\\t\\tcase 5:\\n\\t\\t\\tthrow new Error(\\'Trying to use `(==)` on functions.\\\\nThere is no way to know if functions are "the same" in the Elm sense.\\\\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.\\');\\n\\n\\t\\tcase 6:\\n\\t\\t\\tvar moduleName = fact1;\\n\\t\\t\\tthrow new Error(\\'Your page is loading multiple Elm scripts with a module named \\' + moduleName + \\'. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!\\');\\n\\n\\t\\tcase 8:\\n\\t\\t\\tvar moduleName = fact1;\\n\\t\\t\\tvar region = fact2;\\n\\t\\t\\tvar message = fact3;\\n\\t\\t\\tthrow new Error(\\'TODO in module `\\' + moduleName + \\'` \\' + _Debug_regionToString(region) + \\'\\\\n\\\\n\\' + message);\\n\\n\\t\\tcase 9:\\n\\t\\t\\tvar moduleName = fact1;\\n\\t\\t\\tvar region = fact2;\\n\\t\\t\\tvar value = fact3;\\n\\t\\t\\tvar message = fact4;\\n\\t\\t\\tthrow new Error(\\n\\t\\t\\t\\t\\'TODO in module `\\' + moduleName + \\'` from the `case` expression \\'\\n\\t\\t\\t\\t+ _Debug_regionToString(region) + \\'\\\\n\\\\nIt received the following value:\\\\n\\\\n    \\'\\n\\t\\t\\t\\t+ _Debug_toString(value).replace(\\'\\\\n\\', \\'\\\\n    \\')\\n\\t\\t\\t\\t+ \\'\\\\n\\\\nBut the branch that handles it says:\\\\n\\\\n    \\' + message.replace(\\'\\\\n\\', \\'\\\\n    \\')\\n\\t\\t\\t);\\n\\n\\t\\tcase 10:\\n\\t\\t\\tthrow new Error(\\'Bug in https://github.com/elm/virtual-dom/issues\\');\\n\\n\\t\\tcase 11:\\n\\t\\t\\tthrow new Error(\\'Cannot perform mod 0. Division by zero error.\\');\\n\\t}\\n}\\n\\nfunction _Debug_regionToString(region)\\n{\\n\\tif (region.start.line === region.end.line)\\n\\t{\\n\\t\\treturn \\'on line \\' + region.start.line;\\n\\t}\\n\\treturn \\'on lines \\' + region.start.line + \\' through \\' + region.end.line;\\n}\\n\\n\\n\\n// MATH\\n\\nvar _Basics_add = F2(function(a, b) { return a + b; });\\nvar _Basics_sub = F2(function(a, b) { return a - b; });\\nvar _Basics_mul = F2(function(a, b) { return a * b; });\\nvar _Basics_fdiv = F2(function(a, b) { return a / b; });\\nvar _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });\\nvar _Basics_pow = F2(Math.pow);\\n\\nvar _Basics_remainderBy = F2(function(b, a) { return a % b; });\\n\\n// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf\\nvar _Basics_modBy = F2(function(modulus, x)\\n{\\n\\tvar answer = x % modulus;\\n\\treturn modulus === 0\\n\\t\\t? _Debug_crash(11)\\n\\t\\t:\\n\\t((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))\\n\\t\\t? answer + modulus\\n\\t\\t: answer;\\n});\\n\\n\\n// TRIGONOMETRY\\n\\nvar _Basics_pi = Math.PI;\\nvar _Basics_e = Math.E;\\nvar _Basics_cos = Math.cos;\\nvar _Basics_sin = Math.sin;\\nvar _Basics_tan = Math.tan;\\nvar _Basics_acos = Math.acos;\\nvar _Basics_asin = Math.asin;\\nvar _Basics_atan = Math.atan;\\nvar _Basics_atan2 = F2(Math.atan2);\\n\\n\\n// MORE MATH\\n\\nfunction _Basics_toFloat(x) { return x; }\\nfunction _Basics_truncate(n) { return n | 0; }\\nfunction _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }\\n\\nvar _Basics_ceiling = Math.ceil;\\nvar _Basics_floor = Math.floor;\\nvar _Basics_round = Math.round;\\nvar _Basics_sqrt = Math.sqrt;\\nvar _Basics_log = Math.log;\\nvar _Basics_isNaN = isNaN;\\n\\n\\n// BOOLEANS\\n\\nfunction _Basics_not(bool) { return !bool; }\\nvar _Basics_and = F2(function(a, b) { return a && b; });\\nvar _Basics_or  = F2(function(a, b) { return a || b; });\\nvar _Basics_xor = F2(function(a, b) { return a !== b; });\\n\\n\\n\\nvar _String_cons = F2(function(chr, str)\\n{\\n\\treturn chr + str;\\n});\\n\\nfunction _String_uncons(string)\\n{\\n\\tvar word = string.charCodeAt(0);\\n\\treturn !isNaN(word)\\n\\t\\t? $elm$core$Maybe$Just(\\n\\t\\t\\t0xD800 <= word && word <= 0xDBFF\\n\\t\\t\\t\\t? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))\\n\\t\\t\\t\\t: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))\\n\\t\\t)\\n\\t\\t: $elm$core$Maybe$Nothing;\\n}\\n\\nvar _String_append = F2(function(a, b)\\n{\\n\\treturn a + b;\\n});\\n\\nfunction _String_length(str)\\n{\\n\\treturn str.length;\\n}\\n\\nvar _String_map = F2(function(func, string)\\n{\\n\\tvar len = string.length;\\n\\tvar array = new Array(len);\\n\\tvar i = 0;\\n\\twhile (i < len)\\n\\t{\\n\\t\\tvar word = string.charCodeAt(i);\\n\\t\\tif (0xD800 <= word && word <= 0xDBFF)\\n\\t\\t{\\n\\t\\t\\tarray[i] = func(_Utils_chr(string[i] + string[i+1]));\\n\\t\\t\\ti += 2;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\t\\tarray[i] = func(_Utils_chr(string[i]));\\n\\t\\ti++;\\n\\t}\\n\\treturn array.join(\\'\\');\\n});\\n\\nvar _String_filter = F2(function(isGood, str)\\n{\\n\\tvar arr = [];\\n\\tvar len = str.length;\\n\\tvar i = 0;\\n\\twhile (i < len)\\n\\t{\\n\\t\\tvar char = str[i];\\n\\t\\tvar word = str.charCodeAt(i);\\n\\t\\ti++;\\n\\t\\tif (0xD800 <= word && word <= 0xDBFF)\\n\\t\\t{\\n\\t\\t\\tchar += str[i];\\n\\t\\t\\ti++;\\n\\t\\t}\\n\\n\\t\\tif (isGood(_Utils_chr(char)))\\n\\t\\t{\\n\\t\\t\\tarr.push(char);\\n\\t\\t}\\n\\t}\\n\\treturn arr.join(\\'\\');\\n});\\n\\nfunction _String_reverse(str)\\n{\\n\\tvar len = str.length;\\n\\tvar arr = new Array(len);\\n\\tvar i = 0;\\n\\twhile (i < len)\\n\\t{\\n\\t\\tvar word = str.charCodeAt(i);\\n\\t\\tif (0xD800 <= word && word <= 0xDBFF)\\n\\t\\t{\\n\\t\\t\\tarr[len - i] = str[i + 1];\\n\\t\\t\\ti++;\\n\\t\\t\\tarr[len - i] = str[i - 1];\\n\\t\\t\\ti++;\\n\\t\\t}\\n\\t\\telse\\n\\t\\t{\\n\\t\\t\\tarr[len - i] = str[i];\\n\\t\\t\\ti++;\\n\\t\\t}\\n\\t}\\n\\treturn arr.join(\\'\\');\\n}\\n\\nvar _String_foldl = F3(function(func, state, string)\\n{\\n\\tvar len = string.length;\\n\\tvar i = 0;\\n\\twhile (i < len)\\n\\t{\\n\\t\\tvar char = string[i];\\n\\t\\tvar word = string.charCodeAt(i);\\n\\t\\ti++;\\n\\t\\tif (0xD800 <= word && word <= 0xDBFF)\\n\\t\\t{\\n\\t\\t\\tchar += string[i];\\n\\t\\t\\ti++;\\n\\t\\t}\\n\\t\\tstate = A2(func, _Utils_chr(char), state);\\n\\t}\\n\\treturn state;\\n});\\n\\nvar _String_foldr = F3(function(func, state, string)\\n{\\n\\tvar i = string.length;\\n\\twhile (i--)\\n\\t{\\n\\t\\tvar char = string[i];\\n\\t\\tvar word = string.charCodeAt(i);\\n\\t\\tif (0xDC00 <= word && word <= 0xDFFF)\\n\\t\\t{\\n\\t\\t\\ti--;\\n\\t\\t\\tchar = string[i] + char;\\n\\t\\t}\\n\\t\\tstate = A2(func, _Utils_chr(char), state);\\n\\t}\\n\\treturn state;\\n});\\n\\nvar _String_split = F2(function(sep, str)\\n{\\n\\treturn str.split(sep);\\n});\\n\\nvar _String_join = F2(function(sep, strs)\\n{\\n\\treturn strs.join(sep);\\n});\\n\\nvar _String_slice = F3(function(start, end, str) {\\n\\treturn str.slice(start, end);\\n});\\n\\nfunction _String_trim(str)\\n{\\n\\treturn str.trim();\\n}\\n\\nfunction _String_trimLeft(str)\\n{\\n\\treturn str.replace(/^\\\\s+/, \\'\\');\\n}\\n\\nfunction _String_trimRight(str)\\n{\\n\\treturn str.replace(/\\\\s+$/, \\'\\');\\n}\\n\\nfunction _String_words(str)\\n{\\n\\treturn _List_fromArray(str.trim().split(/\\\\s+/g));\\n}\\n\\nfunction _String_lines(str)\\n{\\n\\treturn _List_fromArray(str.split(/\\\\r\\\\n|\\\\r|\\\\n/g));\\n}\\n\\nfunction _String_toUpper(str)\\n{\\n\\treturn str.toUpperCase();\\n}\\n\\nfunction _String_toLower(str)\\n{\\n\\treturn str.toLowerCase();\\n}\\n\\nvar _String_any = F2(function(isGood, string)\\n{\\n\\tvar i = string.length;\\n\\twhile (i--)\\n\\t{\\n\\t\\tvar char = string[i];\\n\\t\\tvar word = string.charCodeAt(i);\\n\\t\\tif (0xDC00 <= word && word <= 0xDFFF)\\n\\t\\t{\\n\\t\\t\\ti--;\\n\\t\\t\\tchar = string[i] + char;\\n\\t\\t}\\n\\t\\tif (isGood(_Utils_chr(char)))\\n\\t\\t{\\n\\t\\t\\treturn true;\\n\\t\\t}\\n\\t}\\n\\treturn false;\\n});\\n\\nvar _String_all = F2(function(isGood, string)\\n{\\n\\tvar i = string.length;\\n\\twhile (i--)\\n\\t{\\n\\t\\tvar char = string[i];\\n\\t\\tvar word = string.charCodeAt(i);\\n\\t\\tif (0xDC00 <= word && word <= 0xDFFF)\\n\\t\\t{\\n\\t\\t\\ti--;\\n\\t\\t\\tchar = string[i] + char;\\n\\t\\t}\\n\\t\\tif (!isGood(_Utils_chr(char)))\\n\\t\\t{\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t}\\n\\treturn true;\\n});\\n\\nvar _String_contains = F2(function(sub, str)\\n{\\n\\treturn str.indexOf(sub) > -1;\\n});\\n\\nvar _String_startsWith = F2(function(sub, str)\\n{\\n\\treturn str.indexOf(sub) === 0;\\n});\\n\\nvar _String_endsWith = F2(function(sub, str)\\n{\\n\\treturn str.length >= sub.length &&\\n\\t\\tstr.lastIndexOf(sub) === str.length - sub.length;\\n});\\n\\nvar _String_indexes = F2(function(sub, str)\\n{\\n\\tvar subLen = sub.length;\\n\\n\\tif (subLen < 1)\\n\\t{\\n\\t\\treturn _List_Nil;\\n\\t}\\n\\n\\tvar i = 0;\\n\\tvar is = [];\\n\\n\\twhile ((i = str.indexOf(sub, i)) > -1)\\n\\t{\\n\\t\\tis.push(i);\\n\\t\\ti = i + subLen;\\n\\t}\\n\\n\\treturn _List_fromArray(is);\\n});\\n\\n\\n// TO STRING\\n\\nfunction _String_fromNumber(number)\\n{\\n\\treturn number + \\'\\';\\n}\\n\\n\\n// INT CONVERSIONS\\n\\nfunction _String_toInt(str)\\n{\\n\\tvar total = 0;\\n\\tvar code0 = str.charCodeAt(0);\\n\\tvar start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;\\n\\n\\tfor (var i = start; i < str.length; ++i)\\n\\t{\\n\\t\\tvar code = str.charCodeAt(i);\\n\\t\\tif (code < 0x30 || 0x39 < code)\\n\\t\\t{\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t}\\n\\t\\ttotal = 10 * total + code - 0x30;\\n\\t}\\n\\n\\treturn i == start\\n\\t\\t? $elm$core$Maybe$Nothing\\n\\t\\t: $elm$core$Maybe$Just(code0 == 0x2D ? -total : total);\\n}\\n\\n\\n// FLOAT CONVERSIONS\\n\\nfunction _String_toFloat(s)\\n{\\n\\t// check if it is a hex, octal, or binary number\\n\\tif (s.length === 0 || /[\\\\sxbo]/.test(s))\\n\\t{\\n\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t}\\n\\tvar n = +s;\\n\\t// faster isNaN check\\n\\treturn n === n ? $elm$core$Maybe$Just(n) : $elm$core$Maybe$Nothing;\\n}\\n\\nfunction _String_fromList(chars)\\n{\\n\\treturn _List_toArray(chars).join(\\'\\');\\n}\\n\\n\\n\\n\\nfunction _Char_toCode(char)\\n{\\n\\tvar code = char.charCodeAt(0);\\n\\tif (0xD800 <= code && code <= 0xDBFF)\\n\\t{\\n\\t\\treturn (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000\\n\\t}\\n\\treturn code;\\n}\\n\\nfunction _Char_fromCode(code)\\n{\\n\\treturn _Utils_chr(\\n\\t\\t(code < 0 || 0x10FFFF < code)\\n\\t\\t\\t? \\'\\\\uFFFD\\'\\n\\t\\t\\t:\\n\\t\\t(code <= 0xFFFF)\\n\\t\\t\\t? String.fromCharCode(code)\\n\\t\\t\\t:\\n\\t\\t(code -= 0x10000,\\n\\t\\t\\tString.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)\\n\\t\\t)\\n\\t);\\n}\\n\\nfunction _Char_toUpper(char)\\n{\\n\\treturn _Utils_chr(char.toUpperCase());\\n}\\n\\nfunction _Char_toLower(char)\\n{\\n\\treturn _Utils_chr(char.toLowerCase());\\n}\\n\\nfunction _Char_toLocaleUpper(char)\\n{\\n\\treturn _Utils_chr(char.toLocaleUpperCase());\\n}\\n\\nfunction _Char_toLocaleLower(char)\\n{\\n\\treturn _Utils_chr(char.toLocaleLowerCase());\\n}\\n\\n\\n\\n/**/\\nfunction _Json_errorToString(error)\\n{\\n\\treturn $elm$json$Json$Decode$errorToString(error);\\n}\\n//*/\\n\\n\\n// CORE DECODERS\\n\\nfunction _Json_succeed(msg)\\n{\\n\\treturn {\\n\\t\\t$: 0,\\n\\t\\ta: msg\\n\\t};\\n}\\n\\nfunction _Json_fail(msg)\\n{\\n\\treturn {\\n\\t\\t$: 1,\\n\\t\\ta: msg\\n\\t};\\n}\\n\\nfunction _Json_decodePrim(decoder)\\n{\\n\\treturn { $: 2, b: decoder };\\n}\\n\\nvar _Json_decodeInt = _Json_decodePrim(function(value) {\\n\\treturn (typeof value !== \\'number\\')\\n\\t\\t? _Json_expecting(\\'an INT\\', value)\\n\\t\\t:\\n\\t(-2147483647 < value && value < 2147483647 && (value | 0) === value)\\n\\t\\t? $elm$core$Result$Ok(value)\\n\\t\\t:\\n\\t(isFinite(value) && !(value % 1))\\n\\t\\t? $elm$core$Result$Ok(value)\\n\\t\\t: _Json_expecting(\\'an INT\\', value);\\n});\\n\\nvar _Json_decodeBool = _Json_decodePrim(function(value) {\\n\\treturn (typeof value === \\'boolean\\')\\n\\t\\t? $elm$core$Result$Ok(value)\\n\\t\\t: _Json_expecting(\\'a BOOL\\', value);\\n});\\n\\nvar _Json_decodeFloat = _Json_decodePrim(function(value) {\\n\\treturn (typeof value === \\'number\\')\\n\\t\\t? $elm$core$Result$Ok(value)\\n\\t\\t: _Json_expecting(\\'a FLOAT\\', value);\\n});\\n\\nvar _Json_decodeValue = _Json_decodePrim(function(value) {\\n\\treturn $elm$core$Result$Ok(_Json_wrap(value));\\n});\\n\\nvar _Json_decodeString = _Json_decodePrim(function(value) {\\n\\treturn (typeof value === \\'string\\')\\n\\t\\t? $elm$core$Result$Ok(value)\\n\\t\\t: (value instanceof String)\\n\\t\\t\\t? $elm$core$Result$Ok(value + \\'\\')\\n\\t\\t\\t: _Json_expecting(\\'a STRING\\', value);\\n});\\n\\nfunction _Json_decodeList(decoder) { return { $: 3, b: decoder }; }\\nfunction _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }\\n\\nfunction _Json_decodeNull(value) { return { $: 5, c: value }; }\\n\\nvar _Json_decodeField = F2(function(field, decoder)\\n{\\n\\treturn {\\n\\t\\t$: 6,\\n\\t\\td: field,\\n\\t\\tb: decoder\\n\\t};\\n});\\n\\nvar _Json_decodeIndex = F2(function(index, decoder)\\n{\\n\\treturn {\\n\\t\\t$: 7,\\n\\t\\te: index,\\n\\t\\tb: decoder\\n\\t};\\n});\\n\\nfunction _Json_decodeKeyValuePairs(decoder)\\n{\\n\\treturn {\\n\\t\\t$: 8,\\n\\t\\tb: decoder\\n\\t};\\n}\\n\\nfunction _Json_mapMany(f, decoders)\\n{\\n\\treturn {\\n\\t\\t$: 9,\\n\\t\\tf: f,\\n\\t\\tg: decoders\\n\\t};\\n}\\n\\nvar _Json_andThen = F2(function(callback, decoder)\\n{\\n\\treturn {\\n\\t\\t$: 10,\\n\\t\\tb: decoder,\\n\\t\\th: callback\\n\\t};\\n});\\n\\nfunction _Json_oneOf(decoders)\\n{\\n\\treturn {\\n\\t\\t$: 11,\\n\\t\\tg: decoders\\n\\t};\\n}\\n\\n\\n// DECODING OBJECTS\\n\\nvar _Json_map1 = F2(function(f, d1)\\n{\\n\\treturn _Json_mapMany(f, [d1]);\\n});\\n\\nvar _Json_map2 = F3(function(f, d1, d2)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2]);\\n});\\n\\nvar _Json_map3 = F4(function(f, d1, d2, d3)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3]);\\n});\\n\\nvar _Json_map4 = F5(function(f, d1, d2, d3, d4)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3, d4]);\\n});\\n\\nvar _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5]);\\n});\\n\\nvar _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);\\n});\\n\\nvar _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);\\n});\\n\\nvar _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)\\n{\\n\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);\\n});\\n\\n\\n// DECODE\\n\\nvar _Json_runOnString = F2(function(decoder, string)\\n{\\n\\ttry\\n\\t{\\n\\t\\tvar value = JSON.parse(string);\\n\\t\\treturn _Json_runHelp(decoder, value);\\n\\t}\\n\\tcatch (e)\\n\\t{\\n\\t\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, \\'This is not valid JSON! \\' + e.message, _Json_wrap(string)));\\n\\t}\\n});\\n\\nvar _Json_run = F2(function(decoder, value)\\n{\\n\\treturn _Json_runHelp(decoder, _Json_unwrap(value));\\n});\\n\\nfunction _Json_runHelp(decoder, value)\\n{\\n\\tswitch (decoder.$)\\n\\t{\\n\\t\\tcase 2:\\n\\t\\t\\treturn decoder.b(value);\\n\\n\\t\\tcase 5:\\n\\t\\t\\treturn (value === null)\\n\\t\\t\\t\\t? $elm$core$Result$Ok(decoder.c)\\n\\t\\t\\t\\t: _Json_expecting(\\'null\\', value);\\n\\n\\t\\tcase 3:\\n\\t\\t\\tif (!_Json_isArray(value))\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'a LIST\\', value);\\n\\t\\t\\t}\\n\\t\\t\\treturn _Json_runArrayDecoder(decoder.b, value, _List_fromArray);\\n\\n\\t\\tcase 4:\\n\\t\\t\\tif (!_Json_isArray(value))\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'an ARRAY\\', value);\\n\\t\\t\\t}\\n\\t\\t\\treturn _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);\\n\\n\\t\\tcase 6:\\n\\t\\t\\tvar field = decoder.d;\\n\\t\\t\\tif (typeof value !== \\'object\\' || value === null || !(field in value))\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'an OBJECT with a field named `\\' + field + \\'`\\', value);\\n\\t\\t\\t}\\n\\t\\t\\tvar result = _Json_runHelp(decoder.b, value[field]);\\n\\t\\t\\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, field, result.a));\\n\\n\\t\\tcase 7:\\n\\t\\t\\tvar index = decoder.e;\\n\\t\\t\\tif (!_Json_isArray(value))\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'an ARRAY\\', value);\\n\\t\\t\\t}\\n\\t\\t\\tif (index >= value.length)\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'a LONGER array. Need index \\' + index + \\' but only see \\' + value.length + \\' entries\\', value);\\n\\t\\t\\t}\\n\\t\\t\\tvar result = _Json_runHelp(decoder.b, value[index]);\\n\\t\\t\\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, index, result.a));\\n\\n\\t\\tcase 8:\\n\\t\\t\\tif (typeof value !== \\'object\\' || value === null || _Json_isArray(value))\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn _Json_expecting(\\'an OBJECT\\', value);\\n\\t\\t\\t}\\n\\n\\t\\t\\tvar keyValuePairs = _List_Nil;\\n\\t\\t\\t// TODO test perf of Object.keys and switch when support is good enough\\n\\t\\t\\tfor (var key in value)\\n\\t\\t\\t{\\n\\t\\t\\t\\tif (value.hasOwnProperty(key))\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\tvar result = _Json_runHelp(decoder.b, value[key]);\\n\\t\\t\\t\\t\\tif (!$elm$core$Result$isOk(result))\\n\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, key, result.a));\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\tkeyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t\\treturn $elm$core$Result$Ok($elm$core$List$reverse(keyValuePairs));\\n\\n\\t\\tcase 9:\\n\\t\\t\\tvar answer = decoder.f;\\n\\t\\t\\tvar decoders = decoder.g;\\n\\t\\t\\tfor (var i = 0; i < decoders.length; i++)\\n\\t\\t\\t{\\n\\t\\t\\t\\tvar result = _Json_runHelp(decoders[i], value);\\n\\t\\t\\t\\tif (!$elm$core$Result$isOk(result))\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\treturn result;\\n\\t\\t\\t\\t}\\n\\t\\t\\t\\tanswer = answer(result.a);\\n\\t\\t\\t}\\n\\t\\t\\treturn $elm$core$Result$Ok(answer);\\n\\n\\t\\tcase 10:\\n\\t\\t\\tvar result = _Json_runHelp(decoder.b, value);\\n\\t\\t\\treturn (!$elm$core$Result$isOk(result))\\n\\t\\t\\t\\t? result\\n\\t\\t\\t\\t: _Json_runHelp(decoder.h(result.a), value);\\n\\n\\t\\tcase 11:\\n\\t\\t\\tvar errors = _List_Nil;\\n\\t\\t\\tfor (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS\\n\\t\\t\\t{\\n\\t\\t\\t\\tvar result = _Json_runHelp(temp.a, value);\\n\\t\\t\\t\\tif ($elm$core$Result$isOk(result))\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\treturn result;\\n\\t\\t\\t\\t}\\n\\t\\t\\t\\terrors = _List_Cons(result.a, errors);\\n\\t\\t\\t}\\n\\t\\t\\treturn $elm$core$Result$Err($elm$json$Json$Decode$OneOf($elm$core$List$reverse(errors)));\\n\\n\\t\\tcase 1:\\n\\t\\t\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));\\n\\n\\t\\tcase 0:\\n\\t\\t\\treturn $elm$core$Result$Ok(decoder.a);\\n\\t}\\n}\\n\\nfunction _Json_runArrayDecoder(decoder, value, toElmValue)\\n{\\n\\tvar len = value.length;\\n\\tvar array = new Array(len);\\n\\tfor (var i = 0; i < len; i++)\\n\\t{\\n\\t\\tvar result = _Json_runHelp(decoder, value[i]);\\n\\t\\tif (!$elm$core$Result$isOk(result))\\n\\t\\t{\\n\\t\\t\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, i, result.a));\\n\\t\\t}\\n\\t\\tarray[i] = result.a;\\n\\t}\\n\\treturn $elm$core$Result$Ok(toElmValue(array));\\n}\\n\\nfunction _Json_isArray(value)\\n{\\n\\treturn Array.isArray(value) || (typeof FileList !== \\'undefined\\' && value instanceof FileList);\\n}\\n\\nfunction _Json_toElmArray(array)\\n{\\n\\treturn A2($elm$core$Array$initialize, array.length, function(i) { return array[i]; });\\n}\\n\\nfunction _Json_expecting(type, value)\\n{\\n\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, \\'Expecting \\' + type, _Json_wrap(value)));\\n}\\n\\n\\n// EQUALITY\\n\\nfunction _Json_equality(x, y)\\n{\\n\\tif (x === y)\\n\\t{\\n\\t\\treturn true;\\n\\t}\\n\\n\\tif (x.$ !== y.$)\\n\\t{\\n\\t\\treturn false;\\n\\t}\\n\\n\\tswitch (x.$)\\n\\t{\\n\\t\\tcase 0:\\n\\t\\tcase 1:\\n\\t\\t\\treturn x.a === y.a;\\n\\n\\t\\tcase 2:\\n\\t\\t\\treturn x.b === y.b;\\n\\n\\t\\tcase 5:\\n\\t\\t\\treturn x.c === y.c;\\n\\n\\t\\tcase 3:\\n\\t\\tcase 4:\\n\\t\\tcase 8:\\n\\t\\t\\treturn _Json_equality(x.b, y.b);\\n\\n\\t\\tcase 6:\\n\\t\\t\\treturn x.d === y.d && _Json_equality(x.b, y.b);\\n\\n\\t\\tcase 7:\\n\\t\\t\\treturn x.e === y.e && _Json_equality(x.b, y.b);\\n\\n\\t\\tcase 9:\\n\\t\\t\\treturn x.f === y.f && _Json_listEquality(x.g, y.g);\\n\\n\\t\\tcase 10:\\n\\t\\t\\treturn x.h === y.h && _Json_equality(x.b, y.b);\\n\\n\\t\\tcase 11:\\n\\t\\t\\treturn _Json_listEquality(x.g, y.g);\\n\\t}\\n}\\n\\nfunction _Json_listEquality(aDecoders, bDecoders)\\n{\\n\\tvar len = aDecoders.length;\\n\\tif (len !== bDecoders.length)\\n\\t{\\n\\t\\treturn false;\\n\\t}\\n\\tfor (var i = 0; i < len; i++)\\n\\t{\\n\\t\\tif (!_Json_equality(aDecoders[i], bDecoders[i]))\\n\\t\\t{\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t}\\n\\treturn true;\\n}\\n\\n\\n// ENCODE\\n\\nvar _Json_encode = F2(function(indentLevel, value)\\n{\\n\\treturn JSON.stringify(_Json_unwrap(value), null, indentLevel) + \\'\\';\\n});\\n\\nfunction _Json_wrap(value) { return { $: 0, a: value }; }\\nfunction _Json_unwrap(value) { return value.a; }\\n\\nfunction _Json_wrap_UNUSED(value) { return value; }\\nfunction _Json_unwrap_UNUSED(value) { return value; }\\n\\nfunction _Json_emptyArray() { return []; }\\nfunction _Json_emptyObject() { return {}; }\\n\\nvar _Json_addField = F3(function(key, value, object)\\n{\\n\\tobject[key] = _Json_unwrap(value);\\n\\treturn object;\\n});\\n\\nfunction _Json_addEntry(func)\\n{\\n\\treturn F2(function(entry, array)\\n\\t{\\n\\t\\tarray.push(_Json_unwrap(func(entry)));\\n\\t\\treturn array;\\n\\t});\\n}\\n\\nvar _Json_encodeNull = _Json_wrap(null);\\n\\n\\n\\n// TASKS\\n\\nfunction _Scheduler_succeed(value)\\n{\\n\\treturn {\\n\\t\\t$: 0,\\n\\t\\ta: value\\n\\t};\\n}\\n\\nfunction _Scheduler_fail(error)\\n{\\n\\treturn {\\n\\t\\t$: 1,\\n\\t\\ta: error\\n\\t};\\n}\\n\\n// This function was slightly modified by elm-watch.\\nfunction _Scheduler_binding(callback)\\n{\\n\\treturn {\\n\\t\\t$: 2,\\n\\t\\tb: callback,\\n\\t\\t// c: null // commented out by elm-watch\\n\\t\\tc: Function.prototype // added by elm-watch\\n\\t};\\n}\\n\\nvar _Scheduler_andThen = F2(function(callback, task)\\n{\\n\\treturn {\\n\\t\\t$: 3,\\n\\t\\tb: callback,\\n\\t\\td: task\\n\\t};\\n});\\n\\nvar _Scheduler_onError = F2(function(callback, task)\\n{\\n\\treturn {\\n\\t\\t$: 4,\\n\\t\\tb: callback,\\n\\t\\td: task\\n\\t};\\n});\\n\\nfunction _Scheduler_receive(callback)\\n{\\n\\treturn {\\n\\t\\t$: 5,\\n\\t\\tb: callback\\n\\t};\\n}\\n\\n\\n// PROCESSES\\n\\nvar _Scheduler_guid = 0;\\n\\nfunction _Scheduler_rawSpawn(task)\\n{\\n\\tvar proc = {\\n\\t\\t$: 0,\\n\\t\\te: _Scheduler_guid++,\\n\\t\\tf: task,\\n\\t\\tg: null,\\n\\t\\th: []\\n\\t};\\n\\n\\t_Scheduler_enqueue(proc);\\n\\n\\treturn proc;\\n}\\n\\nfunction _Scheduler_spawn(task)\\n{\\n\\treturn _Scheduler_binding(function(callback) {\\n\\t\\tcallback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));\\n\\t});\\n}\\n\\nfunction _Scheduler_rawSend(proc, msg)\\n{\\n\\tproc.h.push(msg);\\n\\t_Scheduler_enqueue(proc);\\n}\\n\\nvar _Scheduler_send = F2(function(proc, msg)\\n{\\n\\treturn _Scheduler_binding(function(callback) {\\n\\t\\t_Scheduler_rawSend(proc, msg);\\n\\t\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\n\\t});\\n});\\n\\nfunction _Scheduler_kill(proc)\\n{\\n\\treturn _Scheduler_binding(function(callback) {\\n\\t\\tvar task = proc.f;\\n\\t\\tif (task.$ === 2 && task.c)\\n\\t\\t{\\n\\t\\t\\ttask.c();\\n\\t\\t}\\n\\n\\t\\tproc.f = null;\\n\\n\\t\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\n\\t});\\n}\\n\\n\\n/* STEP PROCESSES\\n\\ntype alias Process =\\n  { $ : tag\\n  , id : unique_id\\n  , root : Task\\n  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }\\n  , mailbox : [msg]\\n  }\\n\\n*/\\n\\n\\nvar _Scheduler_working = false;\\nvar _Scheduler_queue = [];\\n\\n\\nfunction _Scheduler_enqueue(proc)\\n{\\n\\t_Scheduler_queue.push(proc);\\n\\tif (_Scheduler_working)\\n\\t{\\n\\t\\treturn;\\n\\t}\\n\\t_Scheduler_working = true;\\n\\twhile (proc = _Scheduler_queue.shift())\\n\\t{\\n\\t\\t_Scheduler_step(proc);\\n\\t}\\n\\t_Scheduler_working = false;\\n}\\n\\n\\nfunction _Scheduler_step(proc)\\n{\\n\\twhile (proc.f)\\n\\t{\\n\\t\\tvar rootTag = proc.f.$;\\n\\t\\tif (rootTag === 0 || rootTag === 1)\\n\\t\\t{\\n\\t\\t\\twhile (proc.g && proc.g.$ !== rootTag)\\n\\t\\t\\t{\\n\\t\\t\\t\\tproc.g = proc.g.i;\\n\\t\\t\\t}\\n\\t\\t\\tif (!proc.g)\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn;\\n\\t\\t\\t}\\n\\t\\t\\tproc.f = proc.g.b(proc.f.a);\\n\\t\\t\\tproc.g = proc.g.i;\\n\\t\\t}\\n\\t\\telse if (rootTag === 2)\\n\\t\\t{\\n\\t\\t\\tproc.f.c = proc.f.b(function(newRoot) {\\n\\t\\t\\t\\tproc.f = newRoot;\\n\\t\\t\\t\\t_Scheduler_enqueue(proc);\\n\\t\\t\\t// }); // commented out by elm-watch\\n\\t\\t\\t}) || Function.prototype; // added by elm-watch\\n\\t\\t\\treturn;\\n\\t\\t}\\n\\t\\telse if (rootTag === 5)\\n\\t\\t{\\n\\t\\t\\tif (proc.h.length === 0)\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn;\\n\\t\\t\\t}\\n\\t\\t\\tproc.f = proc.f.b(proc.h.shift());\\n\\t\\t}\\n\\t\\telse // if (rootTag === 3 || rootTag === 4)\\n\\t\\t{\\n\\t\\t\\tproc.g = {\\n\\t\\t\\t\\t$: rootTag === 3 ? 0 : 1,\\n\\t\\t\\t\\tb: proc.f.b,\\n\\t\\t\\t\\ti: proc.g\\n\\t\\t\\t};\\n\\t\\t\\tproc.f = proc.f.d;\\n\\t\\t}\\n\\t}\\n}\\n\\n\\n\\nfunction _Process_sleep(time)\\n{\\n\\treturn _Scheduler_binding(function(callback) {\\n\\t\\tvar id = setTimeout(function() {\\n\\t\\t\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\n\\t\\t}, time);\\n\\n\\t\\treturn function() { clearTimeout(id); };\\n\\t});\\n}\\n\\n\\n\\n\\n// PROGRAMS\\n\\n\\n// This function was slightly modified by elm-watch.\\nvar _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)\\n{\\n\\treturn _Platform_initialize(\\n\\t\\t"Platform.worker", // added by elm-watch\\n\\t\\tdebugMetadata, // added by elm-watch\\n\\t\\tflagDecoder,\\n\\t\\targs,\\n\\t\\timpl.init,\\n\\t\\t// impl.update, // commented out by elm-watch\\n\\t\\t// impl.subscriptions, // commented out by elm-watch\\n\\t\\timpl, // added by elm-watch\\n\\t\\tfunction() { return function() {} }\\n\\t);\\n});\\n\\n\\n\\n// INITIALIZE A PROGRAM\\n\\n\\n// This whole function was changed by elm-watch.\\nfunction _Platform_initialize(programType, debugMetadata, flagDecoder, args, init, impl, stepperBuilder)\\n{\\n\\tif (args === "__elmWatchReturnData") {\\n\\t\\treturn { impl: impl, debugMetadata: debugMetadata, flagDecoder : flagDecoder, programType: programType };\\n\\t}\\n\\n\\tvar flags = _Json_wrap(args ? args[\\'flags\\'] : undefined);\\n\\tvar flagResult = A2(_Json_run, flagDecoder, flags);\\n\\t$elm$core$Result$isOk(flagResult) || _Debug_crash(2 /**/, _Json_errorToString(flagResult.a) /**/);\\n\\tvar managers = {};\\n\\tvar initUrl = programType === "Browser.application" ? _Browser_getUrl() : undefined;\\n\\twindow.__ELM_WATCH_INIT_URL = initUrl;\\n\\tvar initPair = init(flagResult.a);\\n\\tvar model = initPair.a;\\n\\tvar stepper = stepperBuilder(sendToApp, model);\\n\\tvar ports = _Platform_setupEffects(managers, sendToApp);\\n\\tvar update;\\n\\tvar subscriptions;\\n\\n\\tfunction setUpdateAndSubscriptions() {\\n\\t\\tupdate = impl.update || impl._impl.update;\\n\\t\\tsubscriptions = impl.subscriptions || impl._impl.subscriptions;\\n\\t\\tif (typeof $elm$browser$Debugger$Main$wrapUpdate !== "undefined") {\\n\\t\\t\\tupdate = $elm$browser$Debugger$Main$wrapUpdate(update);\\n\\t\\t\\tsubscriptions = $elm$browser$Debugger$Main$wrapSubs(subscriptions);\\n\\t\\t}\\n\\t}\\n\\n\\tfunction sendToApp(msg, viewMetadata) {\\n\\t\\tvar pair = A2(update, msg, model);\\n\\t\\tstepper(model = pair.a, viewMetadata);\\n\\t\\t_Platform_enqueueEffects(managers, pair.b, subscriptions(model));\\n\\t}\\n\\n\\tsetUpdateAndSubscriptions();\\n\\t_Platform_enqueueEffects(managers, initPair.b, subscriptions(model));\\n\\n\\tfunction __elmWatchHotReload(newData, new_Platform_effectManagers, new_Scheduler_enqueue, moduleName) {\\n\\t\\t_Platform_enqueueEffects(managers, _Platform_batch(_List_Nil), _Platform_batch(_List_Nil));\\n\\t\\t_Scheduler_enqueue = new_Scheduler_enqueue;\\n\\n\\t\\tfor (var key in new_Platform_effectManagers) {\\n\\t\\t\\tvar manager = new_Platform_effectManagers[key];\\n\\t\\t\\tif (!(key in _Platform_effectManagers)) {\\n\\t\\t\\t\\t_Platform_effectManagers[key] = manager;\\n\\t\\t\\t\\tmanagers[key] = _Platform_instantiateManager(manager, sendToApp);\\n\\t\\t\\t\\tif (manager.a) {\\n\\t\\t\\t\\t\\tconsole.info("elm-watch: A new port \\'" + key + "\\' was added. You might want to reload the page!");\\n\\t\\t\\t\\t\\tmanager.a(key, sendToApp)\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\n\\t\\tfor (var key in newData.impl) {\\n\\t\\t\\tif (key === "_impl" && impl._impl) {\\n\\t\\t\\t\\tfor (var subKey in newData.impl[key]) {\\n\\t\\t\\t\\t\\timpl._impl[subKey] = newData.impl[key][subKey];\\n\\t\\t\\t\\t}\\n\\t\\t\\t} else {\\n\\t\\t\\t\\timpl[key] = newData.impl[key];\\n\\t\\t\\t}\\n\\t\\t}\\n\\n\\t\\tvar newFlagResult = A2(_Json_run, newData.flagDecoder, flags);\\n\\t\\tif (!$elm$core$Result$isOk(newFlagResult)) {\\n\\t\\t\\treturn { tag: "ReloadPage", reason: "the flags type in `" + moduleName + "` changed and now the passed flags aren\\'t correct anymore. The idea is to try to run with new flags!\\\\nThis is the error:\\\\n" + _Json_errorToString(newFlagResult.a) };\\n\\t\\t}\\n\\t\\tif (!_Utils_eq_elmWatchInternal(debugMetadata, newData.debugMetadata)) {\\n\\t\\t\\treturn { tag: "ReloadPage", reason: "the message type in `" + moduleName + \\'` changed in debug mode ("debug metadata" changed).\\' };\\n\\t\\t}\\n\\t\\tinit = impl.init || impl._impl.init;\\n\\t\\tif (typeof $elm$browser$Debugger$Main$wrapInit !== "undefined") {\\n\\t\\t\\tinit = A3($elm$browser$Debugger$Main$wrapInit, _Json_wrap(newData.debugMetadata), initPair.a.popout, init);\\n\\t\\t}\\n\\t\\twindow.__ELM_WATCH_INIT_URL = initUrl;\\n\\t\\tvar newInitPair = init(newFlagResult.a);\\n\\t\\tif (!_Utils_eq_elmWatchInternal(initPair, newInitPair)) {\\n\\t\\t\\treturn { tag: "ReloadPage", reason: "`" + moduleName + ".init` returned something different than last time. Let\\'s start fresh!" };\\n\\t\\t}\\n\\n\\t\\tsetUpdateAndSubscriptions();\\n\\t\\tstepper(model, true /* isSync */);\\n\\t\\t_Platform_enqueueEffects(managers, _Platform_batch(_List_Nil), subscriptions(model));\\n\\t\\treturn { tag: "Success" };\\n\\t}\\n\\n\\treturn Object.defineProperties(\\n\\t\\tports ? { ports: ports } : {},\\n\\t\\t{\\n\\t\\t\\t__elmWatchHotReload: { value: __elmWatchHotReload },\\n\\t\\t\\t__elmWatchProgramType: { value: programType },\\n\\t\\t}\\n\\t);\\n}\\n\\n// This whole function was added by elm-watch.\\n// Copy-paste of _Utils_eq but does not assume that x and y have the same type,\\n// and considers functions to always be equal.\\nfunction _Utils_eq_elmWatchInternal(x, y)\\n{\\n\\tfor (\\n\\t\\tvar pair, stack = [], isEqual = _Utils_eqHelp_elmWatchInternal(x, y, 0, stack);\\n\\t\\tisEqual && (pair = stack.pop());\\n\\t\\tisEqual = _Utils_eqHelp_elmWatchInternal(pair.a, pair.b, 0, stack)\\n\\t\\t)\\n\\t{}\\n\\n\\treturn isEqual;\\n}\\n\\n// This whole function was added by elm-watch.\\nfunction _Utils_eqHelp_elmWatchInternal(x, y, depth, stack)\\n{\\n\\tif (x === y) {\\n\\t\\treturn true;\\n\\t}\\n\\n\\tvar xType = _Utils_typeof_elmWatchInternal(x);\\n\\tvar yType = _Utils_typeof_elmWatchInternal(y);\\n\\n\\tif (xType !== yType) {\\n\\t\\treturn false;\\n\\t}\\n\\n\\tswitch (xType) {\\n\\t\\tcase "primitive":\\n\\t\\t\\treturn false;\\n\\t\\tcase "function":\\n\\t\\t\\treturn true;\\n\\t}\\n\\n\\tif (x.$ !== y.$) {\\n\\t\\treturn false;\\n\\t}\\n\\n\\tif (x.$ === \\'Set_elm_builtin\\') {\\n\\t\\tx = $elm$core$Set$toList(x);\\n\\t\\ty = $elm$core$Set$toList(y);\\n\\t} else if (x.$ === \\'RBNode_elm_builtin\\' || x.$ === \\'RBEmpty_elm_builtin\\' || x.$ < 0) {\\n\\t\\tx = $elm$core$Dict$toList(x);\\n\\t\\ty = $elm$core$Dict$toList(y);\\n\\t}\\n\\n\\tif (Object.keys(x).length !== Object.keys(y).length) {\\n\\t\\treturn false;\\n\\t}\\n\\n\\tif (depth > 100) {\\n\\t\\tstack.push(_Utils_Tuple2(x, y));\\n\\t\\treturn true;\\n\\t}\\n\\n\\tfor (var key in x) {\\n\\t\\tif (!_Utils_eqHelp_elmWatchInternal(x[key], y[key], depth + 1, stack)) {\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t}\\n\\treturn true;\\n}\\n\\n// This whole function was added by elm-watch.\\nfunction _Utils_typeof_elmWatchInternal(x)\\n{\\n\\tvar type = typeof x;\\n\\treturn type === "function"\\n\\t\\t? "function"\\n\\t\\t: type !== "object" || type === null\\n\\t\\t? "primitive"\\n\\t\\t: "objectOrArray";\\n}\\n\\n\\n\\n// TRACK PRELOADS\\n//\\n// This is used by code in elm/browser and elm/http\\n// to register any HTTP requests that are triggered by init.\\n//\\n\\n\\nvar _Platform_preload;\\n\\n\\nfunction _Platform_registerPreload(url)\\n{\\n\\t_Platform_preload.add(url);\\n}\\n\\n\\n\\n// EFFECT MANAGERS\\n\\n\\nvar _Platform_effectManagers = {};\\n\\n\\nfunction _Platform_setupEffects(managers, sendToApp)\\n{\\n\\tvar ports;\\n\\n\\t// setup all necessary effect managers\\n\\tfor (var key in _Platform_effectManagers)\\n\\t{\\n\\t\\tvar manager = _Platform_effectManagers[key];\\n\\n\\t\\tif (manager.a)\\n\\t\\t{\\n\\t\\t\\tports = ports || {};\\n\\t\\t\\tports[key] = manager.a(key, sendToApp);\\n\\t\\t}\\n\\n\\t\\tmanagers[key] = _Platform_instantiateManager(manager, sendToApp);\\n\\t}\\n\\n\\treturn ports;\\n}\\n\\n\\nfunction _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)\\n{\\n\\treturn {\\n\\t\\tb: init,\\n\\t\\tc: onEffects,\\n\\t\\td: onSelfMsg,\\n\\t\\te: cmdMap,\\n\\t\\tf: subMap\\n\\t};\\n}\\n\\n\\nfunction _Platform_instantiateManager(info, sendToApp)\\n{\\n\\tvar router = {\\n\\t\\tg: sendToApp,\\n\\t\\th: undefined\\n\\t};\\n\\n\\tvar onEffects = info.c;\\n\\tvar onSelfMsg = info.d;\\n\\tvar cmdMap = info.e;\\n\\tvar subMap = info.f;\\n\\n\\tfunction loop(state)\\n\\t{\\n\\t\\treturn A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)\\n\\t\\t{\\n\\t\\t\\tvar value = msg.a;\\n\\n\\t\\t\\tif (msg.$ === 0)\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn A3(onSelfMsg, router, value, state);\\n\\t\\t\\t}\\n\\n\\t\\t\\treturn cmdMap && subMap\\n\\t\\t\\t\\t? A4(onEffects, router, value.i, value.j, state)\\n\\t\\t\\t\\t: A3(onEffects, router, cmdMap ? value.i : value.j, state);\\n\\t\\t}));\\n\\t}\\n\\n\\treturn router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));\\n}\\n\\n\\n\\n// ROUTING\\n\\n\\nvar _Platform_sendToApp = F2(function(router, msg)\\n{\\n\\treturn _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\trouter.g(msg);\\n\\t\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\n\\t});\\n});\\n\\n\\nvar _Platform_sendToSelf = F2(function(router, msg)\\n{\\n\\treturn A2(_Scheduler_send, router.h, {\\n\\t\\t$: 0,\\n\\t\\ta: msg\\n\\t});\\n});\\n\\n\\n\\n// BAGS\\n\\n\\nfunction _Platform_leaf(home)\\n{\\n\\treturn function(value)\\n\\t{\\n\\t\\treturn {\\n\\t\\t\\t$: 1,\\n\\t\\t\\tk: home,\\n\\t\\t\\tl: value\\n\\t\\t};\\n\\t};\\n}\\n\\n\\nfunction _Platform_batch(list)\\n{\\n\\treturn {\\n\\t\\t$: 2,\\n\\t\\tm: list\\n\\t};\\n}\\n\\n\\nvar _Platform_map = F2(function(tagger, bag)\\n{\\n\\treturn {\\n\\t\\t$: 3,\\n\\t\\tn: tagger,\\n\\t\\to: bag\\n\\t}\\n});\\n\\n\\n\\n// PIPE BAGS INTO EFFECT MANAGERS\\n//\\n// Effects must be queued!\\n//\\n// Say your init contains a synchronous command, like Time.now or Time.here\\n//\\n//   - This will produce a batch of effects (FX_1)\\n//   - The synchronous task triggers the subsequent `update` call\\n//   - This will produce a batch of effects (FX_2)\\n//\\n// If we just start dispatching FX_2, subscriptions from FX_2 can be processed\\n// before subscriptions from FX_1. No good! Earlier versions of this code had\\n// this problem, leading to these reports:\\n//\\n//   https://github.com/elm/core/issues/980\\n//   https://github.com/elm/core/pull/981\\n//   https://github.com/elm/compiler/issues/1776\\n//\\n// The queue is necessary to avoid ordering issues for synchronous commands.\\n\\n\\n// Why use true/false here? Why not just check the length of the queue?\\n// The goal is to detect "are we currently dispatching effects?" If we\\n// are, we need to bail and let the ongoing while loop handle things.\\n//\\n// Now say the queue has 1 element. When we dequeue the final element,\\n// the queue will be empty, but we are still actively dispatching effects.\\n// So you could get queue jumping in a really tricky category of cases.\\n//\\nvar _Platform_effectsQueue = [];\\nvar _Platform_effectsActive = false;\\n\\n\\nfunction _Platform_enqueueEffects(managers, cmdBag, subBag)\\n{\\n\\t_Platform_effectsQueue.push({ p: managers, q: cmdBag, r: subBag });\\n\\n\\tif (_Platform_effectsActive) return;\\n\\n\\t_Platform_effectsActive = true;\\n\\tfor (var fx; fx = _Platform_effectsQueue.shift(); )\\n\\t{\\n\\t\\t_Platform_dispatchEffects(fx.p, fx.q, fx.r);\\n\\t}\\n\\t_Platform_effectsActive = false;\\n}\\n\\n\\nfunction _Platform_dispatchEffects(managers, cmdBag, subBag)\\n{\\n\\tvar effectsDict = {};\\n\\t_Platform_gatherEffects(true, cmdBag, effectsDict, null);\\n\\t_Platform_gatherEffects(false, subBag, effectsDict, null);\\n\\n\\tfor (var home in managers)\\n\\t{\\n\\t\\t_Scheduler_rawSend(managers[home], {\\n\\t\\t\\t$: \\'fx\\',\\n\\t\\t\\ta: effectsDict[home] || { i: _List_Nil, j: _List_Nil }\\n\\t\\t});\\n\\t}\\n}\\n\\n\\nfunction _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)\\n{\\n\\tswitch (bag.$)\\n\\t{\\n\\t\\tcase 1:\\n\\t\\t\\tvar home = bag.k;\\n\\t\\t\\tvar effect = _Platform_toEffect(isCmd, home, taggers, bag.l);\\n\\t\\t\\teffectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 2:\\n\\t\\t\\tfor (var list = bag.m; list.b; list = list.b) // WHILE_CONS\\n\\t\\t\\t{\\n\\t\\t\\t\\t_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);\\n\\t\\t\\t}\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 3:\\n\\t\\t\\t_Platform_gatherEffects(isCmd, bag.o, effectsDict, {\\n\\t\\t\\t\\ts: bag.n,\\n\\t\\t\\t\\tt: taggers\\n\\t\\t\\t});\\n\\t\\t\\treturn;\\n\\t}\\n}\\n\\n\\nfunction _Platform_toEffect(isCmd, home, taggers, value)\\n{\\n\\tfunction applyTaggers(x)\\n\\t{\\n\\t\\tfor (var temp = taggers; temp; temp = temp.t)\\n\\t\\t{\\n\\t\\t\\tx = temp.s(x);\\n\\t\\t}\\n\\t\\treturn x;\\n\\t}\\n\\n\\tvar map = isCmd\\n\\t\\t? _Platform_effectManagers[home].e\\n\\t\\t: _Platform_effectManagers[home].f;\\n\\n\\treturn A2(map, applyTaggers, value)\\n}\\n\\n\\nfunction _Platform_insert(isCmd, newEffect, effects)\\n{\\n\\teffects = effects || { i: _List_Nil, j: _List_Nil };\\n\\n\\tisCmd\\n\\t\\t? (effects.i = _List_Cons(newEffect, effects.i))\\n\\t\\t: (effects.j = _List_Cons(newEffect, effects.j));\\n\\n\\treturn effects;\\n}\\n\\n\\n\\n// PORTS\\n\\n\\nfunction _Platform_checkPortName(name)\\n{\\n\\tif (_Platform_effectManagers[name])\\n\\t{\\n\\t\\t_Debug_crash(3, name)\\n\\t}\\n}\\n\\n\\n\\n// OUTGOING PORTS\\n\\n\\nfunction _Platform_outgoingPort(name, converter)\\n{\\n\\t_Platform_checkPortName(name);\\n\\t_Platform_effectManagers[name] = {\\n\\t\\te: _Platform_outgoingPortMap,\\n\\t\\tu: converter,\\n\\t\\ta: _Platform_setupOutgoingPort\\n\\t};\\n\\treturn _Platform_leaf(name);\\n}\\n\\n\\nvar _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });\\n\\n\\nfunction _Platform_setupOutgoingPort(name)\\n{\\n\\tvar subs = [];\\n\\tvar converter = _Platform_effectManagers[name].u;\\n\\n\\t// CREATE MANAGER\\n\\n\\tvar init = _Process_sleep(0);\\n\\n\\t_Platform_effectManagers[name].b = init;\\n\\t_Platform_effectManagers[name].c = F3(function(router, cmdList, state)\\n\\t{\\n\\t\\tfor ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS\\n\\t\\t{\\n\\t\\t\\t// grab a separate reference to subs in case unsubscribe is called\\n\\t\\t\\tvar currentSubs = subs;\\n\\t\\t\\tvar value = _Json_unwrap(converter(cmdList.a));\\n\\t\\t\\tfor (var i = 0; i < currentSubs.length; i++)\\n\\t\\t\\t{\\n\\t\\t\\t\\tcurrentSubs[i](value);\\n\\t\\t\\t}\\n\\t\\t}\\n\\t\\treturn init;\\n\\t});\\n\\n\\t// PUBLIC API\\n\\n\\tfunction subscribe(callback)\\n\\t{\\n\\t\\tsubs.push(callback);\\n\\t}\\n\\n\\tfunction unsubscribe(callback)\\n\\t{\\n\\t\\t// copy subs into a new array in case unsubscribe is called within a\\n\\t\\t// subscribed callback\\n\\t\\tsubs = subs.slice();\\n\\t\\tvar index = subs.indexOf(callback);\\n\\t\\tif (index >= 0)\\n\\t\\t{\\n\\t\\t\\tsubs.splice(index, 1);\\n\\t\\t}\\n\\t}\\n\\n\\treturn {\\n\\t\\tsubscribe: subscribe,\\n\\t\\tunsubscribe: unsubscribe\\n\\t};\\n}\\n\\n\\n\\n// INCOMING PORTS\\n\\n\\nfunction _Platform_incomingPort(name, converter)\\n{\\n\\t_Platform_checkPortName(name);\\n\\t_Platform_effectManagers[name] = {\\n\\t\\tf: _Platform_incomingPortMap,\\n\\t\\tu: converter,\\n\\t\\ta: _Platform_setupIncomingPort\\n\\t};\\n\\treturn _Platform_leaf(name);\\n}\\n\\n\\nvar _Platform_incomingPortMap = F2(function(tagger, finalTagger)\\n{\\n\\treturn function(value)\\n\\t{\\n\\t\\treturn tagger(finalTagger(value));\\n\\t};\\n});\\n\\n\\nfunction _Platform_setupIncomingPort(name, sendToApp)\\n{\\n\\tvar subs = _List_Nil;\\n\\tvar converter = _Platform_effectManagers[name].u;\\n\\n\\t// CREATE MANAGER\\n\\n\\tvar init = _Scheduler_succeed(null);\\n\\n\\t_Platform_effectManagers[name].b = init;\\n\\t_Platform_effectManagers[name].c = F3(function(router, subList, state)\\n\\t{\\n\\t\\tsubs = subList;\\n\\t\\treturn init;\\n\\t});\\n\\n\\t// PUBLIC API\\n\\n\\tfunction send(incomingValue)\\n\\t{\\n\\t\\tvar result = A2(_Json_run, converter, _Json_wrap(incomingValue));\\n\\n\\t\\t$elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);\\n\\n\\t\\tvar value = result.a;\\n\\t\\tfor (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS\\n\\t\\t{\\n\\t\\t\\tsendToApp(temp.a(value));\\n\\t\\t}\\n\\t}\\n\\n\\treturn { send: send };\\n}\\n\\n\\n\\n// EXPORT ELM MODULES\\n//\\n// Have DEBUG and PROD versions so that we can (1) give nicer errors in\\n// debug mode and (2) not pay for the bits needed for that in prod mode.\\n//\\n\\n\\nfunction _Platform_export_UNUSED(exports)\\n{\\n\\tscope[\\'Elm\\']\\n\\t\\t? _Platform_mergeExportsProd(scope[\\'Elm\\'], exports)\\n\\t\\t: scope[\\'Elm\\'] = exports;\\n}\\n\\n\\nfunction _Platform_mergeExportsProd(obj, exports)\\n{\\n\\tfor (var name in exports)\\n\\t{\\n\\t\\t(name in obj)\\n\\t\\t\\t? (name == \\'init\\')\\n\\t\\t\\t\\t? _Debug_crash(6)\\n\\t\\t\\t\\t: _Platform_mergeExportsProd(obj[name], exports[name])\\n\\t\\t\\t: (obj[name] = exports[name]);\\n\\t}\\n}\\n\\n\\n// This whole function was changed by elm-watch.\\nfunction _Platform_export(exports)\\n{\\n\\tvar reloadReasons = _Platform_mergeExportsElmWatch(\\'Elm\\', scope[\\'Elm\\'] || (scope[\\'Elm\\'] = {}), exports);\\n\\tif (reloadReasons.length > 0) {\\n\\t\\tthrow new Error(["ELM_WATCH_RELOAD_NEEDED"].concat(Array.from(new Set(reloadReasons))).join("\\\\n\\\\n---\\\\n\\\\n"));\\n\\t}\\n}\\n\\n// This whole function was added by elm-watch.\\nfunction _Platform_mergeExportsElmWatch(moduleName, obj, exports)\\n{\\n\\tvar reloadReasons = [];\\n\\tfor (var name in exports) {\\n\\t\\tif (name === "init") {\\n\\t\\t\\tif ("init" in obj) {\\n\\t\\t\\t\\tif ("__elmWatchApps" in obj) {\\n\\t\\t\\t\\t\\tvar data = exports.init("__elmWatchReturnData");\\n\\t\\t\\t\\t\\tfor (var index = 0; index < obj.__elmWatchApps.length; index++) {\\n\\t\\t\\t\\t\\t\\tvar app = obj.__elmWatchApps[index];\\n\\t\\t\\t\\t\\t\\tif (app.__elmWatchProgramType !== data.programType) {\\n\\t\\t\\t\\t\\t\\t\\treloadReasons.push("`" + moduleName + ".main` changed from `" + app.__elmWatchProgramType + "` to `" + data.programType + "`.");\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\tvar result;\\n\\t\\t\\t\\t\\t\\t\\ttry {\\n\\t\\t\\t\\t\\t\\t\\t\\tresult = app.__elmWatchHotReload(data, _Platform_effectManagers, _Scheduler_enqueue, moduleName);\\n\\t\\t\\t\\t\\t\\t\\t\\tswitch (result.tag) {\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tcase "Success":\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tbreak;\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tcase "ReloadPage":\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\treloadReasons.push(result.reason);\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tbreak;\\n\\t\\t\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t\\t\\t} catch (error) {\\n\\t\\t\\t\\t\\t\\t\\t\\treloadReasons.push("hot reload for `" + moduleName + "` failed, probably because of incompatible model changes.\\\\nThis is the error:\\\\n" + error + "\\\\n" + (error ? error.stack : ""));\\n\\t\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tthrow new Error("elm-watch: I\\'m trying to create `" + moduleName + ".init`, but it already exists and wasn\\'t created by elm-watch. Maybe a duplicate script is getting loaded accidentally?");\\n\\t\\t\\t\\t}\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tobj.__elmWatchApps = [];\\n\\t\\t\\t\\tobj.init = function() {\\n\\t\\t\\t\\t\\tvar app = exports.init.apply(exports, arguments);\\n\\t\\t\\t\\t\\tobj.__elmWatchApps.push(app);\\n\\t\\t\\t\\t\\twindow.__ELM_WATCH_ON_INIT();\\n\\t\\t\\t\\t\\treturn app;\\n\\t\\t\\t\\t};\\n\\t\\t\\t}\\n\\t\\t} else {\\n\\t\\t\\tvar innerReasons = _Platform_mergeExportsElmWatch(moduleName + "." + name, obj[name] || (obj[name] = {}), exports[name]);\\n\\t\\t\\treloadReasons = reloadReasons.concat(innerReasons);\\n\\t\\t}\\n\\t}\\n\\treturn reloadReasons;\\n}\\n\\n\\nfunction _Platform_mergeExportsDebug(moduleName, obj, exports)\\n{\\n\\tfor (var name in exports)\\n\\t{\\n\\t\\t(name in obj)\\n\\t\\t\\t? (name == \\'init\\')\\n\\t\\t\\t\\t? _Debug_crash(6, moduleName)\\n\\t\\t\\t\\t: _Platform_mergeExportsDebug(moduleName + \\'.\\' + name, obj[name], exports[name])\\n\\t\\t\\t: (obj[name] = exports[name]);\\n\\t}\\n}\\n\\n\\n\\n\\n// HELPERS\\n\\n\\nvar _VirtualDom_divertHrefToApp;\\n\\nvar _VirtualDom_doc = typeof document !== \\'undefined\\' ? document : {};\\n\\n\\nfunction _VirtualDom_appendChild(parent, child)\\n{\\n\\tparent.appendChild(child);\\n}\\n\\n// This whole function was changed by elm-watch.\\nvar _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)\\n{\\n\\tvar programType = "Html";\\n\\n\\tif (args === "__elmWatchReturnData") {\\n\\t\\treturn { virtualNode: virtualNode, programType: programType };\\n\\t}\\n\\n\\t/**_UNUSED/ // always UNUSED with elm-watch\\n\\tvar node = args[\\'node\\'];\\n\\t//*/\\n\\t/**/\\n\\tvar node = args && args[\\'node\\'] ? args[\\'node\\'] : _Debug_crash(0);\\n\\t//*/\\n\\n\\tvar nextNode = _VirtualDom_render(virtualNode, function() {});\\n\\tnode.parentNode.replaceChild(nextNode, node);\\n\\tnode = nextNode;\\n\\tvar sendToApp = function() {};\\n\\n\\tfunction __elmWatchHotReload(newData) {\\n\\t\\tvar patches = _VirtualDom_diff(virtualNode, newData.virtualNode);\\n\\t\\tnode = _VirtualDom_applyPatches(node, virtualNode, patches, sendToApp);\\n\\t\\tvirtualNode = newData.virtualNode;\\n\\t\\treturn { tag: "Success" };\\n\\t}\\n\\n\\treturn Object.defineProperties(\\n\\t\\t{},\\n\\t\\t{\\n\\t\\t\\t__elmWatchHotReload: { value: __elmWatchHotReload },\\n\\t\\t\\t__elmWatchProgramType: { value: programType },\\n\\t\\t}\\n\\t);\\n});\\n\\n\\n\\n// TEXT\\n\\n\\nfunction _VirtualDom_text(string)\\n{\\n\\treturn {\\n\\t\\t$: 0,\\n\\t\\ta: string\\n\\t};\\n}\\n\\n\\n\\n// NODE\\n\\n\\nvar _VirtualDom_nodeNS = F2(function(namespace, tag)\\n{\\n\\treturn F2(function(factList, kidList)\\n\\t{\\n\\t\\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS\\n\\t\\t{\\n\\t\\t\\tvar kid = kidList.a;\\n\\t\\t\\tdescendantsCount += (kid.b || 0);\\n\\t\\t\\tkids.push(kid);\\n\\t\\t}\\n\\t\\tdescendantsCount += kids.length;\\n\\n\\t\\treturn {\\n\\t\\t\\t$: 1,\\n\\t\\t\\tc: tag,\\n\\t\\t\\td: _VirtualDom_organizeFacts(factList),\\n\\t\\t\\te: kids,\\n\\t\\t\\tf: namespace,\\n\\t\\t\\tb: descendantsCount\\n\\t\\t};\\n\\t});\\n});\\n\\n\\nvar _VirtualDom_node = _VirtualDom_nodeNS(undefined);\\n\\n\\n\\n// KEYED NODE\\n\\n\\nvar _VirtualDom_keyedNodeNS = F2(function(namespace, tag)\\n{\\n\\treturn F2(function(factList, kidList)\\n\\t{\\n\\t\\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS\\n\\t\\t{\\n\\t\\t\\tvar kid = kidList.a;\\n\\t\\t\\tdescendantsCount += (kid.b.b || 0);\\n\\t\\t\\tkids.push(kid);\\n\\t\\t}\\n\\t\\tdescendantsCount += kids.length;\\n\\n\\t\\treturn {\\n\\t\\t\\t$: 2,\\n\\t\\t\\tc: tag,\\n\\t\\t\\td: _VirtualDom_organizeFacts(factList),\\n\\t\\t\\te: kids,\\n\\t\\t\\tf: namespace,\\n\\t\\t\\tb: descendantsCount\\n\\t\\t};\\n\\t});\\n});\\n\\n\\nvar _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);\\n\\n\\n\\n// CUSTOM\\n\\n\\nfunction _VirtualDom_custom(factList, model, render, diff)\\n{\\n\\treturn {\\n\\t\\t$: 3,\\n\\t\\td: _VirtualDom_organizeFacts(factList),\\n\\t\\tg: model,\\n\\t\\th: render,\\n\\t\\ti: diff\\n\\t};\\n}\\n\\n\\n\\n// MAP\\n\\n\\nvar _VirtualDom_map = F2(function(tagger, node)\\n{\\n\\treturn {\\n\\t\\t$: 4,\\n\\t\\tj: tagger,\\n\\t\\tk: node,\\n\\t\\tb: 1 + (node.b || 0)\\n\\t};\\n});\\n\\n\\n\\n// LAZY\\n\\n\\nfunction _VirtualDom_thunk(refs, thunk)\\n{\\n\\treturn {\\n\\t\\t$: 5,\\n\\t\\tl: refs,\\n\\t\\tm: thunk,\\n\\t\\tk: undefined\\n\\t};\\n}\\n\\nvar _VirtualDom_lazy = F2(function(func, a)\\n{\\n\\treturn _VirtualDom_thunk([func, a], function() {\\n\\t\\treturn func(a);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy2 = F3(function(func, a, b)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b], function() {\\n\\t\\treturn A2(func, a, b);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy3 = F4(function(func, a, b, c)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c], function() {\\n\\t\\treturn A3(func, a, b, c);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy4 = F5(function(func, a, b, c, d)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c, d], function() {\\n\\t\\treturn A4(func, a, b, c, d);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c, d, e], function() {\\n\\t\\treturn A5(func, a, b, c, d, e);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f], function() {\\n\\t\\treturn A6(func, a, b, c, d, e, f);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {\\n\\t\\treturn A7(func, a, b, c, d, e, f, g);\\n\\t});\\n});\\n\\nvar _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)\\n{\\n\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {\\n\\t\\treturn A8(func, a, b, c, d, e, f, g, h);\\n\\t});\\n});\\n\\n\\n\\n// FACTS\\n\\n\\nvar _VirtualDom_on = F2(function(key, handler)\\n{\\n\\treturn {\\n\\t\\t$: \\'a0\\',\\n\\t\\tn: key,\\n\\t\\to: handler\\n\\t};\\n});\\nvar _VirtualDom_style = F2(function(key, value)\\n{\\n\\treturn {\\n\\t\\t$: \\'a1\\',\\n\\t\\tn: key,\\n\\t\\to: value\\n\\t};\\n});\\nvar _VirtualDom_property = F2(function(key, value)\\n{\\n\\treturn {\\n\\t\\t$: \\'a2\\',\\n\\t\\tn: key,\\n\\t\\to: value\\n\\t};\\n});\\nvar _VirtualDom_attribute = F2(function(key, value)\\n{\\n\\treturn {\\n\\t\\t$: \\'a3\\',\\n\\t\\tn: key,\\n\\t\\to: value\\n\\t};\\n});\\nvar _VirtualDom_attributeNS = F3(function(namespace, key, value)\\n{\\n\\treturn {\\n\\t\\t$: \\'a4\\',\\n\\t\\tn: key,\\n\\t\\to: { f: namespace, o: value }\\n\\t};\\n});\\n\\n\\n\\n// XSS ATTACK VECTOR CHECKS\\n\\n\\nfunction _VirtualDom_noScript(tag)\\n{\\n\\treturn tag == \\'script\\' ? \\'p\\' : tag;\\n}\\n\\nfunction _VirtualDom_noOnOrFormAction(key)\\n{\\n\\treturn /^(on|formAction$)/i.test(key) ? \\'data-\\' + key : key;\\n}\\n\\nfunction _VirtualDom_noInnerHtmlOrFormAction(key)\\n{\\n\\treturn key == \\'innerHTML\\' || key == \\'formAction\\' ? \\'data-\\' + key : key;\\n}\\n\\nfunction _VirtualDom_noJavaScriptUri_UNUSED(value)\\n{\\n\\treturn /^javascript:/i.test(value.replace(/\\\\s/g,\\'\\')) ? \\'\\' : value;\\n}\\n\\nfunction _VirtualDom_noJavaScriptUri(value)\\n{\\n\\treturn /^javascript:/i.test(value.replace(/\\\\s/g,\\'\\'))\\n\\t\\t? \\'javascript:alert("This is an XSS vector. Please use ports or web components instead.")\\'\\n\\t\\t: value;\\n}\\n\\nfunction _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)\\n{\\n\\treturn /^\\\\s*(javascript:|data:text\\\\/html)/i.test(value) ? \\'\\' : value;\\n}\\n\\nfunction _VirtualDom_noJavaScriptOrHtmlUri(value)\\n{\\n\\treturn /^\\\\s*(javascript:|data:text\\\\/html)/i.test(value)\\n\\t\\t? \\'javascript:alert("This is an XSS vector. Please use ports or web components instead.")\\'\\n\\t\\t: value;\\n}\\n\\n\\n\\n// MAP FACTS\\n\\n\\nvar _VirtualDom_mapAttribute = F2(function(func, attr)\\n{\\n\\treturn (attr.$ === \\'a0\\')\\n\\t\\t? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))\\n\\t\\t: attr;\\n});\\n\\nfunction _VirtualDom_mapHandler(func, handler)\\n{\\n\\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);\\n\\n\\t// 0 = Normal\\n\\t// 1 = MayStopPropagation\\n\\t// 2 = MayPreventDefault\\n\\t// 3 = Custom\\n\\n\\treturn {\\n\\t\\t$: handler.$,\\n\\t\\ta:\\n\\t\\t\\t!tag\\n\\t\\t\\t\\t? A2($elm$json$Json$Decode$map, func, handler.a)\\n\\t\\t\\t\\t:\\n\\t\\t\\tA3($elm$json$Json$Decode$map2,\\n\\t\\t\\t\\ttag < 3\\n\\t\\t\\t\\t\\t? _VirtualDom_mapEventTuple\\n\\t\\t\\t\\t\\t: _VirtualDom_mapEventRecord,\\n\\t\\t\\t\\t$elm$json$Json$Decode$succeed(func),\\n\\t\\t\\t\\thandler.a\\n\\t\\t\\t)\\n\\t};\\n}\\n\\nvar _VirtualDom_mapEventTuple = F2(function(func, tuple)\\n{\\n\\treturn _Utils_Tuple2(func(tuple.a), tuple.b);\\n});\\n\\nvar _VirtualDom_mapEventRecord = F2(function(func, record)\\n{\\n\\treturn {\\n\\t\\tmessage: func(record.message),\\n\\t\\tstopPropagation: record.stopPropagation,\\n\\t\\tpreventDefault: record.preventDefault\\n\\t}\\n});\\n\\n\\n\\n// ORGANIZE FACTS\\n\\n\\nfunction _VirtualDom_organizeFacts(factList)\\n{\\n\\tfor (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS\\n\\t{\\n\\t\\tvar entry = factList.a;\\n\\n\\t\\tvar tag = entry.$;\\n\\t\\tvar key = entry.n;\\n\\t\\tvar value = entry.o;\\n\\n\\t\\tif (tag === \\'a2\\')\\n\\t\\t{\\n\\t\\t\\t(key === \\'className\\')\\n\\t\\t\\t\\t? _VirtualDom_addClass(facts, key, _Json_unwrap(value))\\n\\t\\t\\t\\t: facts[key] = _Json_unwrap(value);\\n\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\tvar subFacts = facts[tag] || (facts[tag] = {});\\n\\t\\t(tag === \\'a3\\' && key === \\'class\\')\\n\\t\\t\\t? _VirtualDom_addClass(subFacts, key, value)\\n\\t\\t\\t: subFacts[key] = value;\\n\\t}\\n\\n\\treturn facts;\\n}\\n\\nfunction _VirtualDom_addClass(object, key, newClass)\\n{\\n\\tvar classes = object[key];\\n\\tobject[key] = classes ? classes + \\' \\' + newClass : newClass;\\n}\\n\\n\\n\\n// RENDER\\n\\n\\nfunction _VirtualDom_render(vNode, eventNode)\\n{\\n\\tvar tag = vNode.$;\\n\\n\\tif (tag === 5)\\n\\t{\\n\\t\\treturn _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);\\n\\t}\\n\\n\\tif (tag === 0)\\n\\t{\\n\\t\\treturn _VirtualDom_doc.createTextNode(vNode.a);\\n\\t}\\n\\n\\tif (tag === 4)\\n\\t{\\n\\t\\tvar subNode = vNode.k;\\n\\t\\tvar tagger = vNode.j;\\n\\n\\t\\twhile (subNode.$ === 4)\\n\\t\\t{\\n\\t\\t\\ttypeof tagger !== \\'object\\'\\n\\t\\t\\t\\t? tagger = [tagger, subNode.j]\\n\\t\\t\\t\\t: tagger.push(subNode.j);\\n\\n\\t\\t\\tsubNode = subNode.k;\\n\\t\\t}\\n\\n\\t\\tvar subEventRoot = { j: tagger, p: eventNode };\\n\\t\\tvar domNode = _VirtualDom_render(subNode, subEventRoot);\\n\\t\\tdomNode.elm_event_node_ref = subEventRoot;\\n\\t\\treturn domNode;\\n\\t}\\n\\n\\tif (tag === 3)\\n\\t{\\n\\t\\tvar domNode = vNode.h(vNode.g);\\n\\t\\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);\\n\\t\\treturn domNode;\\n\\t}\\n\\n\\t// at this point `tag` must be 1 or 2\\n\\n\\tvar domNode = vNode.f\\n\\t\\t? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)\\n\\t\\t: _VirtualDom_doc.createElement(vNode.c);\\n\\n\\tif (_VirtualDom_divertHrefToApp && vNode.c == \\'a\\')\\n\\t{\\n\\t\\tdomNode.addEventListener(\\'click\\', _VirtualDom_divertHrefToApp(domNode));\\n\\t}\\n\\n\\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);\\n\\n\\tfor (var kids = vNode.e, i = 0; i < kids.length; i++)\\n\\t{\\n\\t\\t_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));\\n\\t}\\n\\n\\treturn domNode;\\n}\\n\\n\\n\\n// APPLY FACTS\\n\\n\\nfunction _VirtualDom_applyFacts(domNode, eventNode, facts)\\n{\\n\\tfor (var key in facts)\\n\\t{\\n\\t\\tvar value = facts[key];\\n\\n\\t\\tkey === \\'a1\\'\\n\\t\\t\\t? _VirtualDom_applyStyles(domNode, value)\\n\\t\\t\\t:\\n\\t\\tkey === \\'a0\\'\\n\\t\\t\\t? _VirtualDom_applyEvents(domNode, eventNode, value)\\n\\t\\t\\t:\\n\\t\\tkey === \\'a3\\'\\n\\t\\t\\t? _VirtualDom_applyAttrs(domNode, value)\\n\\t\\t\\t:\\n\\t\\tkey === \\'a4\\'\\n\\t\\t\\t? _VirtualDom_applyAttrsNS(domNode, value)\\n\\t\\t\\t:\\n\\t\\t((key !== \\'value\\' && key !== \\'checked\\') || domNode[key] !== value) && (domNode[key] = value);\\n\\t}\\n}\\n\\n\\n\\n// APPLY STYLES\\n\\n\\nfunction _VirtualDom_applyStyles(domNode, styles)\\n{\\n\\tvar domNodeStyle = domNode.style;\\n\\n\\tfor (var key in styles)\\n\\t{\\n\\t\\tdomNodeStyle[key] = styles[key];\\n\\t}\\n}\\n\\n\\n\\n// APPLY ATTRS\\n\\n\\nfunction _VirtualDom_applyAttrs(domNode, attrs)\\n{\\n\\tfor (var key in attrs)\\n\\t{\\n\\t\\tvar value = attrs[key];\\n\\t\\ttypeof value !== \\'undefined\\'\\n\\t\\t\\t? domNode.setAttribute(key, value)\\n\\t\\t\\t: domNode.removeAttribute(key);\\n\\t}\\n}\\n\\n\\n\\n// APPLY NAMESPACED ATTRS\\n\\n\\nfunction _VirtualDom_applyAttrsNS(domNode, nsAttrs)\\n{\\n\\tfor (var key in nsAttrs)\\n\\t{\\n\\t\\tvar pair = nsAttrs[key];\\n\\t\\tvar namespace = pair.f;\\n\\t\\tvar value = pair.o;\\n\\n\\t\\ttypeof value !== \\'undefined\\'\\n\\t\\t\\t? domNode.setAttributeNS(namespace, key, value)\\n\\t\\t\\t: domNode.removeAttributeNS(namespace, key);\\n\\t}\\n}\\n\\n\\n\\n// APPLY EVENTS\\n\\n\\nfunction _VirtualDom_applyEvents(domNode, eventNode, events)\\n{\\n\\tvar allCallbacks = domNode.elmFs || (domNode.elmFs = {});\\n\\n\\tfor (var key in events)\\n\\t{\\n\\t\\tvar newHandler = events[key];\\n\\t\\tvar oldCallback = allCallbacks[key];\\n\\n\\t\\tif (!newHandler)\\n\\t\\t{\\n\\t\\t\\tdomNode.removeEventListener(key, oldCallback);\\n\\t\\t\\tallCallbacks[key] = undefined;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\tif (oldCallback)\\n\\t\\t{\\n\\t\\t\\tvar oldHandler = oldCallback.q;\\n\\t\\t\\tif (oldHandler.$ === newHandler.$)\\n\\t\\t\\t{\\n\\t\\t\\t\\toldCallback.q = newHandler;\\n\\t\\t\\t\\tcontinue;\\n\\t\\t\\t}\\n\\t\\t\\tdomNode.removeEventListener(key, oldCallback);\\n\\t\\t}\\n\\n\\t\\toldCallback = _VirtualDom_makeCallback(eventNode, newHandler);\\n\\t\\tdomNode.addEventListener(key, oldCallback,\\n\\t\\t\\t_VirtualDom_passiveSupported\\n\\t\\t\\t&& { passive: $elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }\\n\\t\\t);\\n\\t\\tallCallbacks[key] = oldCallback;\\n\\t}\\n}\\n\\n\\n\\n// PASSIVE EVENTS\\n\\n\\nvar _VirtualDom_passiveSupported;\\n\\ntry\\n{\\n\\twindow.addEventListener(\\'t\\', null, Object.defineProperty({}, \\'passive\\', {\\n\\t\\tget: function() { _VirtualDom_passiveSupported = true; }\\n\\t}));\\n}\\ncatch(e) {}\\n\\n\\n\\n// EVENT HANDLERS\\n\\n\\nfunction _VirtualDom_makeCallback(eventNode, initialHandler)\\n{\\n\\tfunction callback(event)\\n\\t{\\n\\t\\tvar handler = callback.q;\\n\\t\\tvar result = _Json_runHelp(handler.a, event);\\n\\n\\t\\tif (!$elm$core$Result$isOk(result))\\n\\t\\t{\\n\\t\\t\\treturn;\\n\\t\\t}\\n\\n\\t\\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);\\n\\n\\t\\t// 0 = Normal\\n\\t\\t// 1 = MayStopPropagation\\n\\t\\t// 2 = MayPreventDefault\\n\\t\\t// 3 = Custom\\n\\n\\t\\tvar value = result.a;\\n\\t\\tvar message = !tag ? value : tag < 3 ? value.a : value.message;\\n\\t\\tvar stopPropagation = tag == 1 ? value.b : tag == 3 && value.stopPropagation;\\n\\t\\tvar currentEventNode = (\\n\\t\\t\\tstopPropagation && event.stopPropagation(),\\n\\t\\t\\t(tag == 2 ? value.b : tag == 3 && value.preventDefault) && event.preventDefault(),\\n\\t\\t\\teventNode\\n\\t\\t);\\n\\t\\tvar tagger;\\n\\t\\tvar i;\\n\\t\\twhile (tagger = currentEventNode.j)\\n\\t\\t{\\n\\t\\t\\tif (typeof tagger == \\'function\\')\\n\\t\\t\\t{\\n\\t\\t\\t\\tmessage = tagger(message);\\n\\t\\t\\t}\\n\\t\\t\\telse\\n\\t\\t\\t{\\n\\t\\t\\t\\tfor (var i = tagger.length; i--; )\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\tmessage = tagger[i](message);\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t\\tcurrentEventNode = currentEventNode.p;\\n\\t\\t}\\n\\t\\tcurrentEventNode(message, stopPropagation); // stopPropagation implies isSync\\n\\t}\\n\\n\\tcallback.q = initialHandler;\\n\\n\\treturn callback;\\n}\\n\\nfunction _VirtualDom_equalEvents(x, y)\\n{\\n\\treturn x.$ == y.$ && _Json_equality(x.a, y.a);\\n}\\n\\n\\n\\n// DIFF\\n\\n\\n// TODO: Should we do patches like in iOS?\\n//\\n// type Patch\\n//   = At Int Patch\\n//   | Batch (List Patch)\\n//   | Change ...\\n//\\n// How could it not be better?\\n//\\nfunction _VirtualDom_diff(x, y)\\n{\\n\\tvar patches = [];\\n\\t_VirtualDom_diffHelp(x, y, patches, 0);\\n\\treturn patches;\\n}\\n\\n\\nfunction _VirtualDom_pushPatch(patches, type, index, data)\\n{\\n\\tvar patch = {\\n\\t\\t$: type,\\n\\t\\tr: index,\\n\\t\\ts: data,\\n\\t\\tt: undefined,\\n\\t\\tu: undefined\\n\\t};\\n\\tpatches.push(patch);\\n\\treturn patch;\\n}\\n\\n\\nfunction _VirtualDom_diffHelp(x, y, patches, index)\\n{\\n\\tif (x === y)\\n\\t{\\n\\t\\treturn;\\n\\t}\\n\\n\\tvar xType = x.$;\\n\\tvar yType = y.$;\\n\\n\\t// Bail if you run into different types of nodes. Implies that the\\n\\t// structure has changed significantly and it\\'s not worth a diff.\\n\\tif (xType !== yType)\\n\\t{\\n\\t\\tif (xType === 1 && yType === 2)\\n\\t\\t{\\n\\t\\t\\ty = _VirtualDom_dekey(y);\\n\\t\\t\\tyType = 1;\\n\\t\\t}\\n\\t\\telse\\n\\t\\t{\\n\\t\\t\\t_VirtualDom_pushPatch(patches, 0, index, y);\\n\\t\\t\\treturn;\\n\\t\\t}\\n\\t}\\n\\n\\t// Now we know that both nodes are the same $.\\n\\tswitch (yType)\\n\\t{\\n\\t\\tcase 5:\\n\\t\\t\\tvar xRefs = x.l;\\n\\t\\t\\tvar yRefs = y.l;\\n\\t\\t\\tvar i = xRefs.length;\\n\\t\\t\\tvar same = i === yRefs.length;\\n\\t\\t\\twhile (same && i--)\\n\\t\\t\\t{\\n\\t\\t\\t\\tsame = xRefs[i] === yRefs[i];\\n\\t\\t\\t}\\n\\t\\t\\tif (same)\\n\\t\\t\\t{\\n\\t\\t\\t\\ty.k = x.k;\\n\\t\\t\\t\\treturn;\\n\\t\\t\\t}\\n\\t\\t\\ty.k = y.m();\\n\\t\\t\\tvar subPatches = [];\\n\\t\\t\\t_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);\\n\\t\\t\\tsubPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 4:\\n\\t\\t\\t// gather nested taggers\\n\\t\\t\\tvar xTaggers = x.j;\\n\\t\\t\\tvar yTaggers = y.j;\\n\\t\\t\\tvar nesting = false;\\n\\n\\t\\t\\tvar xSubNode = x.k;\\n\\t\\t\\twhile (xSubNode.$ === 4)\\n\\t\\t\\t{\\n\\t\\t\\t\\tnesting = true;\\n\\n\\t\\t\\t\\ttypeof xTaggers !== \\'object\\'\\n\\t\\t\\t\\t\\t? xTaggers = [xTaggers, xSubNode.j]\\n\\t\\t\\t\\t\\t: xTaggers.push(xSubNode.j);\\n\\n\\t\\t\\t\\txSubNode = xSubNode.k;\\n\\t\\t\\t}\\n\\n\\t\\t\\tvar ySubNode = y.k;\\n\\t\\t\\twhile (ySubNode.$ === 4)\\n\\t\\t\\t{\\n\\t\\t\\t\\tnesting = true;\\n\\n\\t\\t\\t\\ttypeof yTaggers !== \\'object\\'\\n\\t\\t\\t\\t\\t? yTaggers = [yTaggers, ySubNode.j]\\n\\t\\t\\t\\t\\t: yTaggers.push(ySubNode.j);\\n\\n\\t\\t\\t\\tySubNode = ySubNode.k;\\n\\t\\t\\t}\\n\\n\\t\\t\\t// Just bail if different numbers of taggers. This implies the\\n\\t\\t\\t// structure of the virtual DOM has changed.\\n\\t\\t\\tif (nesting && xTaggers.length !== yTaggers.length)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_pushPatch(patches, 0, index, y);\\n\\t\\t\\t\\treturn;\\n\\t\\t\\t}\\n\\n\\t\\t\\t// check if taggers are "the same"\\n\\t\\t\\tif (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_pushPatch(patches, 2, index, yTaggers);\\n\\t\\t\\t}\\n\\n\\t\\t\\t// diff everything below the taggers\\n\\t\\t\\t_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 0:\\n\\t\\t\\tif (x.a !== y.a)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_pushPatch(patches, 3, index, y.a);\\n\\t\\t\\t}\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 1:\\n\\t\\t\\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 2:\\n\\t\\t\\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);\\n\\t\\t\\treturn;\\n\\n\\t\\tcase 3:\\n\\t\\t\\tif (x.h !== y.h)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_pushPatch(patches, 0, index, y);\\n\\t\\t\\t\\treturn;\\n\\t\\t\\t}\\n\\n\\t\\t\\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);\\n\\t\\t\\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);\\n\\n\\t\\t\\tvar patch = y.i(x.g, y.g);\\n\\t\\t\\tpatch && _VirtualDom_pushPatch(patches, 5, index, patch);\\n\\n\\t\\t\\treturn;\\n\\t}\\n}\\n\\n// assumes the incoming arrays are the same length\\nfunction _VirtualDom_pairwiseRefEqual(as, bs)\\n{\\n\\tfor (var i = 0; i < as.length; i++)\\n\\t{\\n\\t\\tif (as[i] !== bs[i])\\n\\t\\t{\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t}\\n\\n\\treturn true;\\n}\\n\\nfunction _VirtualDom_diffNodes(x, y, patches, index, diffKids)\\n{\\n\\t// Bail if obvious indicators have changed. Implies more serious\\n\\t// structural changes such that it\\'s not worth it to diff.\\n\\tif (x.c !== y.c || x.f !== y.f)\\n\\t{\\n\\t\\t_VirtualDom_pushPatch(patches, 0, index, y);\\n\\t\\treturn;\\n\\t}\\n\\n\\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);\\n\\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);\\n\\n\\tdiffKids(x, y, patches, index);\\n}\\n\\n\\n\\n// DIFF FACTS\\n\\n\\n// TODO Instead of creating a new diff object, it\\'s possible to just test if\\n// there *is* a diff. During the actual patch, do the diff again and make the\\n// modifications directly. This way, there\\'s no new allocations. Worth it?\\nfunction _VirtualDom_diffFacts(x, y, category)\\n{\\n\\tvar diff;\\n\\n\\t// look for changes and removals\\n\\tfor (var xKey in x)\\n\\t{\\n\\t\\tif (xKey === \\'a1\\' || xKey === \\'a0\\' || xKey === \\'a3\\' || xKey === \\'a4\\')\\n\\t\\t{\\n\\t\\t\\tvar subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);\\n\\t\\t\\tif (subDiff)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdiff = diff || {};\\n\\t\\t\\t\\tdiff[xKey] = subDiff;\\n\\t\\t\\t}\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\t// remove if not in the new facts\\n\\t\\tif (!(xKey in y))\\n\\t\\t{\\n\\t\\t\\tdiff = diff || {};\\n\\t\\t\\tdiff[xKey] =\\n\\t\\t\\t\\t!category\\n\\t\\t\\t\\t\\t? (typeof x[xKey] === \\'string\\' ? \\'\\' : null)\\n\\t\\t\\t\\t\\t:\\n\\t\\t\\t\\t(category === \\'a1\\')\\n\\t\\t\\t\\t\\t? \\'\\'\\n\\t\\t\\t\\t\\t:\\n\\t\\t\\t\\t(category === \\'a0\\' || category === \\'a3\\')\\n\\t\\t\\t\\t\\t? undefined\\n\\t\\t\\t\\t\\t:\\n\\t\\t\\t\\t{ f: x[xKey].f, o: undefined };\\n\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\tvar xValue = x[xKey];\\n\\t\\tvar yValue = y[xKey];\\n\\n\\t\\t// reference equal, so don\\'t worry about it\\n\\t\\tif (xValue === yValue && xKey !== \\'value\\' && xKey !== \\'checked\\'\\n\\t\\t\\t|| category === \\'a0\\' && _VirtualDom_equalEvents(xValue, yValue))\\n\\t\\t{\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\tdiff = diff || {};\\n\\t\\tdiff[xKey] = yValue;\\n\\t}\\n\\n\\t// add new stuff\\n\\tfor (var yKey in y)\\n\\t{\\n\\t\\tif (!(yKey in x))\\n\\t\\t{\\n\\t\\t\\tdiff = diff || {};\\n\\t\\t\\tdiff[yKey] = y[yKey];\\n\\t\\t}\\n\\t}\\n\\n\\treturn diff;\\n}\\n\\n\\n\\n// DIFF KIDS\\n\\n\\nfunction _VirtualDom_diffKids(xParent, yParent, patches, index)\\n{\\n\\tvar xKids = xParent.e;\\n\\tvar yKids = yParent.e;\\n\\n\\tvar xLen = xKids.length;\\n\\tvar yLen = yKids.length;\\n\\n\\t// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS\\n\\n\\tif (xLen > yLen)\\n\\t{\\n\\t\\t_VirtualDom_pushPatch(patches, 6, index, {\\n\\t\\t\\tv: yLen,\\n\\t\\t\\ti: xLen - yLen\\n\\t\\t});\\n\\t}\\n\\telse if (xLen < yLen)\\n\\t{\\n\\t\\t_VirtualDom_pushPatch(patches, 7, index, {\\n\\t\\t\\tv: xLen,\\n\\t\\t\\te: yKids\\n\\t\\t});\\n\\t}\\n\\n\\t// PAIRWISE DIFF EVERYTHING ELSE\\n\\n\\tfor (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)\\n\\t{\\n\\t\\tvar xKid = xKids[i];\\n\\t\\t_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);\\n\\t\\tindex += xKid.b || 0;\\n\\t}\\n}\\n\\n\\n\\n// KEYED DIFF\\n\\n\\nfunction _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)\\n{\\n\\tvar localPatches = [];\\n\\n\\tvar changes = {}; // Dict String Entry\\n\\tvar inserts = []; // Array { index : Int, entry : Entry }\\n\\t// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }\\n\\n\\tvar xKids = xParent.e;\\n\\tvar yKids = yParent.e;\\n\\tvar xLen = xKids.length;\\n\\tvar yLen = yKids.length;\\n\\tvar xIndex = 0;\\n\\tvar yIndex = 0;\\n\\n\\tvar index = rootIndex;\\n\\n\\twhile (xIndex < xLen && yIndex < yLen)\\n\\t{\\n\\t\\tvar x = xKids[xIndex];\\n\\t\\tvar y = yKids[yIndex];\\n\\n\\t\\tvar xKey = x.a;\\n\\t\\tvar yKey = y.a;\\n\\t\\tvar xNode = x.b;\\n\\t\\tvar yNode = y.b;\\n\\n\\t\\tvar newMatch = undefined;\\n\\t\\tvar oldMatch = undefined;\\n\\n\\t\\t// check if keys match\\n\\n\\t\\tif (xKey === yKey)\\n\\t\\t{\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_diffHelp(xNode, yNode, localPatches, index);\\n\\t\\t\\tindex += xNode.b || 0;\\n\\n\\t\\t\\txIndex++;\\n\\t\\t\\tyIndex++;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\t// look ahead 1 to detect insertions and removals.\\n\\n\\t\\tvar xNext = xKids[xIndex + 1];\\n\\t\\tvar yNext = yKids[yIndex + 1];\\n\\n\\t\\tif (xNext)\\n\\t\\t{\\n\\t\\t\\tvar xNextKey = xNext.a;\\n\\t\\t\\tvar xNextNode = xNext.b;\\n\\t\\t\\toldMatch = yKey === xNextKey;\\n\\t\\t}\\n\\n\\t\\tif (yNext)\\n\\t\\t{\\n\\t\\t\\tvar yNextKey = yNext.a;\\n\\t\\t\\tvar yNextNode = yNext.b;\\n\\t\\t\\tnewMatch = xKey === yNextKey;\\n\\t\\t}\\n\\n\\n\\t\\t// swap x and y\\n\\t\\tif (newMatch && oldMatch)\\n\\t\\t{\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);\\n\\t\\t\\t_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);\\n\\t\\t\\tindex += xNode.b || 0;\\n\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);\\n\\t\\t\\tindex += xNextNode.b || 0;\\n\\n\\t\\t\\txIndex += 2;\\n\\t\\t\\tyIndex += 2;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\t// insert y\\n\\t\\tif (newMatch)\\n\\t\\t{\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);\\n\\t\\t\\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);\\n\\t\\t\\tindex += xNode.b || 0;\\n\\n\\t\\t\\txIndex += 1;\\n\\t\\t\\tyIndex += 2;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\t// remove x\\n\\t\\tif (oldMatch)\\n\\t\\t{\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);\\n\\t\\t\\tindex += xNode.b || 0;\\n\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);\\n\\t\\t\\tindex += xNextNode.b || 0;\\n\\n\\t\\t\\txIndex += 2;\\n\\t\\t\\tyIndex += 1;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\t// remove x, insert y\\n\\t\\tif (xNext && xNextKey === yNextKey)\\n\\t\\t{\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);\\n\\t\\t\\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);\\n\\t\\t\\tindex += xNode.b || 0;\\n\\n\\t\\t\\tindex++;\\n\\t\\t\\t_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);\\n\\t\\t\\tindex += xNextNode.b || 0;\\n\\n\\t\\t\\txIndex += 2;\\n\\t\\t\\tyIndex += 2;\\n\\t\\t\\tcontinue;\\n\\t\\t}\\n\\n\\t\\tbreak;\\n\\t}\\n\\n\\t// eat up any remaining nodes with removeNode and insertNode\\n\\n\\twhile (xIndex < xLen)\\n\\t{\\n\\t\\tindex++;\\n\\t\\tvar x = xKids[xIndex];\\n\\t\\tvar xNode = x.b;\\n\\t\\t_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);\\n\\t\\tindex += xNode.b || 0;\\n\\t\\txIndex++;\\n\\t}\\n\\n\\twhile (yIndex < yLen)\\n\\t{\\n\\t\\tvar endInserts = endInserts || [];\\n\\t\\tvar y = yKids[yIndex];\\n\\t\\t_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);\\n\\t\\tyIndex++;\\n\\t}\\n\\n\\tif (localPatches.length > 0 || inserts.length > 0 || endInserts)\\n\\t{\\n\\t\\t_VirtualDom_pushPatch(patches, 8, rootIndex, {\\n\\t\\t\\tw: localPatches,\\n\\t\\t\\tx: inserts,\\n\\t\\t\\ty: endInserts\\n\\t\\t});\\n\\t}\\n}\\n\\n\\n\\n// CHANGES FROM KEYED DIFF\\n\\n\\nvar _VirtualDom_POSTFIX = \\'_elmW6BL\\';\\n\\n\\nfunction _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)\\n{\\n\\tvar entry = changes[key];\\n\\n\\t// never seen this key before\\n\\tif (!entry)\\n\\t{\\n\\t\\tentry = {\\n\\t\\t\\tc: 0,\\n\\t\\t\\tz: vnode,\\n\\t\\t\\tr: yIndex,\\n\\t\\t\\ts: undefined\\n\\t\\t};\\n\\n\\t\\tinserts.push({ r: yIndex, A: entry });\\n\\t\\tchanges[key] = entry;\\n\\n\\t\\treturn;\\n\\t}\\n\\n\\t// this key was removed earlier, a match!\\n\\tif (entry.c === 1)\\n\\t{\\n\\t\\tinserts.push({ r: yIndex, A: entry });\\n\\n\\t\\tentry.c = 2;\\n\\t\\tvar subPatches = [];\\n\\t\\t_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);\\n\\t\\tentry.r = yIndex;\\n\\t\\tentry.s.s = {\\n\\t\\t\\tw: subPatches,\\n\\t\\t\\tA: entry\\n\\t\\t};\\n\\n\\t\\treturn;\\n\\t}\\n\\n\\t// this key has already been inserted or moved, a duplicate!\\n\\t_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);\\n}\\n\\n\\nfunction _VirtualDom_removeNode(changes, localPatches, key, vnode, index)\\n{\\n\\tvar entry = changes[key];\\n\\n\\t// never seen this key before\\n\\tif (!entry)\\n\\t{\\n\\t\\tvar patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);\\n\\n\\t\\tchanges[key] = {\\n\\t\\t\\tc: 1,\\n\\t\\t\\tz: vnode,\\n\\t\\t\\tr: index,\\n\\t\\t\\ts: patch\\n\\t\\t};\\n\\n\\t\\treturn;\\n\\t}\\n\\n\\t// this key was inserted earlier, a match!\\n\\tif (entry.c === 0)\\n\\t{\\n\\t\\tentry.c = 2;\\n\\t\\tvar subPatches = [];\\n\\t\\t_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);\\n\\n\\t\\t_VirtualDom_pushPatch(localPatches, 9, index, {\\n\\t\\t\\tw: subPatches,\\n\\t\\t\\tA: entry\\n\\t\\t});\\n\\n\\t\\treturn;\\n\\t}\\n\\n\\t// this key has already been removed or moved, a duplicate!\\n\\t_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);\\n}\\n\\n\\n\\n// ADD DOM NODES\\n//\\n// Each DOM node has an "index" assigned in order of traversal. It is important\\n// to minimize our crawl over the actual DOM, so these indexes (along with the\\n// descendantsCount of virtual nodes) let us skip touching entire subtrees of\\n// the DOM if we know there are no patches there.\\n\\n\\nfunction _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)\\n{\\n\\t_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);\\n}\\n\\n\\n// assumes `patches` is non-empty and indexes increase monotonically.\\nfunction _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)\\n{\\n\\tvar patch = patches[i];\\n\\tvar index = patch.r;\\n\\n\\twhile (index === low)\\n\\t{\\n\\t\\tvar patchType = patch.$;\\n\\n\\t\\tif (patchType === 1)\\n\\t\\t{\\n\\t\\t\\t_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);\\n\\t\\t}\\n\\t\\telse if (patchType === 8)\\n\\t\\t{\\n\\t\\t\\tpatch.t = domNode;\\n\\t\\t\\tpatch.u = eventNode;\\n\\n\\t\\t\\tvar subPatches = patch.s.w;\\n\\t\\t\\tif (subPatches.length > 0)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);\\n\\t\\t\\t}\\n\\t\\t}\\n\\t\\telse if (patchType === 9)\\n\\t\\t{\\n\\t\\t\\tpatch.t = domNode;\\n\\t\\t\\tpatch.u = eventNode;\\n\\n\\t\\t\\tvar data = patch.s;\\n\\t\\t\\tif (data)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdata.A.s = domNode;\\n\\t\\t\\t\\tvar subPatches = data.w;\\n\\t\\t\\t\\tif (subPatches.length > 0)\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t\\telse\\n\\t\\t{\\n\\t\\t\\tpatch.t = domNode;\\n\\t\\t\\tpatch.u = eventNode;\\n\\t\\t}\\n\\n\\t\\ti++;\\n\\n\\t\\tif (!(patch = patches[i]) || (index = patch.r) > high)\\n\\t\\t{\\n\\t\\t\\treturn i;\\n\\t\\t}\\n\\t}\\n\\n\\tvar tag = vNode.$;\\n\\n\\tif (tag === 4)\\n\\t{\\n\\t\\tvar subNode = vNode.k;\\n\\n\\t\\twhile (subNode.$ === 4)\\n\\t\\t{\\n\\t\\t\\tsubNode = subNode.k;\\n\\t\\t}\\n\\n\\t\\treturn _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);\\n\\t}\\n\\n\\t// tag must be 1 or 2 at this point\\n\\n\\tvar vKids = vNode.e;\\n\\tvar childNodes = domNode.childNodes;\\n\\tfor (var j = 0; j < vKids.length; j++)\\n\\t{\\n\\t\\tlow++;\\n\\t\\tvar vKid = tag === 1 ? vKids[j] : vKids[j].b;\\n\\t\\tvar nextLow = low + (vKid.b || 0);\\n\\t\\tif (low <= index && index <= nextLow)\\n\\t\\t{\\n\\t\\t\\ti = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);\\n\\t\\t\\tif (!(patch = patches[i]) || (index = patch.r) > high)\\n\\t\\t\\t{\\n\\t\\t\\t\\treturn i;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t\\tlow = nextLow;\\n\\t}\\n\\treturn i;\\n}\\n\\n\\n\\n// APPLY PATCHES\\n\\n\\nfunction _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)\\n{\\n\\tif (patches.length === 0)\\n\\t{\\n\\t\\treturn rootDomNode;\\n\\t}\\n\\n\\t_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);\\n\\treturn _VirtualDom_applyPatchesHelp(rootDomNode, patches);\\n}\\n\\nfunction _VirtualDom_applyPatchesHelp(rootDomNode, patches)\\n{\\n\\tfor (var i = 0; i < patches.length; i++)\\n\\t{\\n\\t\\tvar patch = patches[i];\\n\\t\\tvar localDomNode = patch.t\\n\\t\\tvar newNode = _VirtualDom_applyPatch(localDomNode, patch);\\n\\t\\tif (localDomNode === rootDomNode)\\n\\t\\t{\\n\\t\\t\\trootDomNode = newNode;\\n\\t\\t}\\n\\t}\\n\\treturn rootDomNode;\\n}\\n\\nfunction _VirtualDom_applyPatch(domNode, patch)\\n{\\n\\tswitch (patch.$)\\n\\t{\\n\\t\\tcase 0:\\n\\t\\t\\treturn _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);\\n\\n\\t\\tcase 4:\\n\\t\\t\\t_VirtualDom_applyFacts(domNode, patch.u, patch.s);\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 3:\\n\\t\\t\\tdomNode.replaceData(0, domNode.length, patch.s);\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 1:\\n\\t\\t\\treturn _VirtualDom_applyPatchesHelp(domNode, patch.s);\\n\\n\\t\\tcase 2:\\n\\t\\t\\tif (domNode.elm_event_node_ref)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.elm_event_node_ref.j = patch.s;\\n\\t\\t\\t}\\n\\t\\t\\telse\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.elm_event_node_ref = { j: patch.s, p: patch.u };\\n\\t\\t\\t}\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 6:\\n\\t\\t\\tvar data = patch.s;\\n\\t\\t\\tfor (var i = 0; i < data.i; i++)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.removeChild(domNode.childNodes[data.v]);\\n\\t\\t\\t}\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 7:\\n\\t\\t\\tvar data = patch.s;\\n\\t\\t\\tvar kids = data.e;\\n\\t\\t\\tvar i = data.v;\\n\\t\\t\\tvar theEnd = domNode.childNodes[i];\\n\\t\\t\\tfor (; i < kids.length; i++)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);\\n\\t\\t\\t}\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 9:\\n\\t\\t\\tvar data = patch.s;\\n\\t\\t\\tif (!data)\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.parentNode.removeChild(domNode);\\n\\t\\t\\t\\treturn domNode;\\n\\t\\t\\t}\\n\\t\\t\\tvar entry = data.A;\\n\\t\\t\\tif (typeof entry.r !== \\'undefined\\')\\n\\t\\t\\t{\\n\\t\\t\\t\\tdomNode.parentNode.removeChild(domNode);\\n\\t\\t\\t}\\n\\t\\t\\tentry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);\\n\\t\\t\\treturn domNode;\\n\\n\\t\\tcase 8:\\n\\t\\t\\treturn _VirtualDom_applyPatchReorder(domNode, patch);\\n\\n\\t\\tcase 5:\\n\\t\\t\\treturn patch.s(domNode);\\n\\n\\t\\tdefault:\\n\\t\\t\\t_Debug_crash(10); // \\'Ran into an unknown patch!\\'\\n\\t}\\n}\\n\\n\\nfunction _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)\\n{\\n\\tvar parentNode = domNode.parentNode;\\n\\tvar newNode = _VirtualDom_render(vNode, eventNode);\\n\\n\\tif (!newNode.elm_event_node_ref)\\n\\t{\\n\\t\\tnewNode.elm_event_node_ref = domNode.elm_event_node_ref;\\n\\t}\\n\\n\\tif (parentNode && newNode !== domNode)\\n\\t{\\n\\t\\tparentNode.replaceChild(newNode, domNode);\\n\\t}\\n\\treturn newNode;\\n}\\n\\n\\nfunction _VirtualDom_applyPatchReorder(domNode, patch)\\n{\\n\\tvar data = patch.s;\\n\\n\\t// remove end inserts\\n\\tvar frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);\\n\\n\\t// removals\\n\\tdomNode = _VirtualDom_applyPatchesHelp(domNode, data.w);\\n\\n\\t// inserts\\n\\tvar inserts = data.x;\\n\\tfor (var i = 0; i < inserts.length; i++)\\n\\t{\\n\\t\\tvar insert = inserts[i];\\n\\t\\tvar entry = insert.A;\\n\\t\\tvar node = entry.c === 2\\n\\t\\t\\t? entry.s\\n\\t\\t\\t: _VirtualDom_render(entry.z, patch.u);\\n\\t\\tdomNode.insertBefore(node, domNode.childNodes[insert.r]);\\n\\t}\\n\\n\\t// add end inserts\\n\\tif (frag)\\n\\t{\\n\\t\\t_VirtualDom_appendChild(domNode, frag);\\n\\t}\\n\\n\\treturn domNode;\\n}\\n\\n\\nfunction _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)\\n{\\n\\tif (!endInserts)\\n\\t{\\n\\t\\treturn;\\n\\t}\\n\\n\\tvar frag = _VirtualDom_doc.createDocumentFragment();\\n\\tfor (var i = 0; i < endInserts.length; i++)\\n\\t{\\n\\t\\tvar insert = endInserts[i];\\n\\t\\tvar entry = insert.A;\\n\\t\\t_VirtualDom_appendChild(frag, entry.c === 2\\n\\t\\t\\t? entry.s\\n\\t\\t\\t: _VirtualDom_render(entry.z, patch.u)\\n\\t\\t);\\n\\t}\\n\\treturn frag;\\n}\\n\\n\\nfunction _VirtualDom_virtualize(node)\\n{\\n\\t// TEXT NODES\\n\\n\\tif (node.nodeType === 3)\\n\\t{\\n\\t\\treturn _VirtualDom_text(node.textContent);\\n\\t}\\n\\n\\n\\t// WEIRD NODES\\n\\n\\tif (node.nodeType !== 1)\\n\\t{\\n\\t\\treturn _VirtualDom_text(\\'\\');\\n\\t}\\n\\n\\n\\t// ELEMENT NODES\\n\\n\\tvar attrList = _List_Nil;\\n\\tvar attrs = node.attributes;\\n\\tfor (var i = attrs.length; i--; )\\n\\t{\\n\\t\\tvar attr = attrs[i];\\n\\t\\tvar name = attr.name;\\n\\t\\tvar value = attr.value;\\n\\t\\tattrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );\\n\\t}\\n\\n\\tvar tag = node.tagName.toLowerCase();\\n\\tvar kidList = _List_Nil;\\n\\tvar kids = node.childNodes;\\n\\n\\tfor (var i = kids.length; i--; )\\n\\t{\\n\\t\\tkidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);\\n\\t}\\n\\treturn A3(_VirtualDom_node, tag, attrList, kidList);\\n}\\n\\nfunction _VirtualDom_dekey(keyedNode)\\n{\\n\\tvar keyedKids = keyedNode.e;\\n\\tvar len = keyedKids.length;\\n\\tvar kids = new Array(len);\\n\\tfor (var i = 0; i < len; i++)\\n\\t{\\n\\t\\tkids[i] = keyedKids[i].b;\\n\\t}\\n\\n\\treturn {\\n\\t\\t$: 1,\\n\\t\\tc: keyedNode.c,\\n\\t\\td: keyedNode.d,\\n\\t\\te: kids,\\n\\t\\tf: keyedNode.f,\\n\\t\\tb: keyedNode.b\\n\\t};\\n}\\n\\n\\n\\n\\n// ELEMENT\\n\\n\\nvar _Debugger_element;\\n\\n// This function was slightly modified by elm-watch.\\nvar _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)\\n{\\n\\treturn _Platform_initialize(\\n\\t\\timpl._impl ? "Browser.sandbox" : "Browser.element", // added by elm-watch\\n\\t\\tdebugMetadata, // added by elm-watch\\n\\t\\tflagDecoder,\\n\\t\\targs,\\n\\t\\timpl.init,\\n\\t\\t// impl.update, // commented out by elm-watch\\n\\t\\t// impl.subscriptions, // commented out by elm-watch\\n\\t\\timpl, // added by elm-watch\\n\\t\\tfunction(sendToApp, initialModel) {\\n\\t\\t\\t// var view = impl.view; // commented out by elm-watch\\n\\t\\t\\t/**_UNUSED/ // always UNUSED with elm-watch\\n\\t\\t\\tvar domNode = args[\\'node\\'];\\n\\t\\t\\t//*/\\n\\t\\t\\t/**/\\n\\t\\t\\tvar domNode = args && args[\\'node\\'] ? args[\\'node\\'] : _Debug_crash(0);\\n\\t\\t\\t//*/\\n\\t\\t\\tvar currNode = _VirtualDom_virtualize(domNode);\\n\\n\\t\\t\\treturn _Browser_makeAnimator(initialModel, function(model)\\n\\t\\t\\t{\\n\\t\\t\\t\\t// var nextNode = view(model); // commented out by elm-watch\\n\\t\\t\\t\\tvar nextNode = impl.view(model); // added by elm-watch\\n\\t\\t\\t\\tvar patches = _VirtualDom_diff(currNode, nextNode);\\n\\t\\t\\t\\tdomNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);\\n\\t\\t\\t\\tcurrNode = nextNode;\\n\\t\\t\\t});\\n\\t\\t}\\n\\t);\\n});\\n\\n\\n\\n// DOCUMENT\\n\\n\\nvar _Debugger_document;\\n\\n// This function was slightly modified by elm-watch.\\nvar _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)\\n{\\n\\treturn _Platform_initialize(\\n\\t\\timpl._impl ? "Browser.application" : "Browser.document", // added by elm-watch\\n\\t\\tdebugMetadata, // added by elm-watch\\n\\t\\tflagDecoder,\\n\\t\\targs,\\n\\t\\timpl.init,\\n\\t\\t// impl.update, // commented out by elm-watch\\n\\t\\t// impl.subscriptions, // commented out by elm-watch\\n\\t\\timpl, // added by elm-watch\\n\\t\\tfunction(sendToApp, initialModel) {\\n\\t\\t\\tvar divertHrefToApp = impl.setup && impl.setup(sendToApp)\\n\\t\\t\\t// var view = impl.view; // commented out by elm-watch\\n\\t\\t\\tvar title = _VirtualDom_doc.title;\\n\\t\\t\\tvar bodyNode = _VirtualDom_doc.body;\\n\\t\\t\\tvar currNode = _VirtualDom_virtualize(bodyNode);\\n\\t\\t\\treturn _Browser_makeAnimator(initialModel, function(model)\\n\\t\\t\\t{\\n\\t\\t\\t\\t_VirtualDom_divertHrefToApp = divertHrefToApp;\\n\\t\\t\\t\\t// var doc = view(model); // commented out by elm-watch\\n\\t\\t\\t\\tvar doc = impl.view(model); // added by elm-watch\\n\\t\\t\\t\\tvar nextNode = _VirtualDom_node(\\'body\\')(_List_Nil)(doc.body);\\n\\t\\t\\t\\tvar patches = _VirtualDom_diff(currNode, nextNode);\\n\\t\\t\\t\\tbodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);\\n\\t\\t\\t\\tcurrNode = nextNode;\\n\\t\\t\\t\\t_VirtualDom_divertHrefToApp = 0;\\n\\t\\t\\t\\t(title !== doc.title) && (_VirtualDom_doc.title = title = doc.title);\\n\\t\\t\\t});\\n\\t\\t}\\n\\t);\\n});\\n\\n\\n\\n// ANIMATION\\n\\n\\nvar _Browser_cancelAnimationFrame =\\n\\ttypeof cancelAnimationFrame !== \\'undefined\\'\\n\\t\\t? cancelAnimationFrame\\n\\t\\t: function(id) { clearTimeout(id); };\\n\\nvar _Browser_requestAnimationFrame =\\n\\ttypeof requestAnimationFrame !== \\'undefined\\'\\n\\t\\t? requestAnimationFrame\\n\\t\\t: function(callback) { return setTimeout(callback, 1000 / 60); };\\n\\n\\nfunction _Browser_makeAnimator(model, draw)\\n{\\n\\tdraw(model);\\n\\n\\tvar state = 0;\\n\\n\\tfunction updateIfNeeded()\\n\\t{\\n\\t\\tstate = state === 1\\n\\t\\t\\t? 0\\n\\t\\t\\t: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );\\n\\t}\\n\\n\\treturn function(nextModel, isSync)\\n\\t{\\n\\t\\tmodel = nextModel;\\n\\n\\t\\tisSync\\n\\t\\t\\t? ( draw(model),\\n\\t\\t\\t\\tstate === 2 && (state = 1)\\n\\t\\t\\t\\t)\\n\\t\\t\\t: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),\\n\\t\\t\\t\\tstate = 2\\n\\t\\t\\t\\t);\\n\\t};\\n}\\n\\n\\n\\n// APPLICATION\\n\\n\\n// This function was slightly modified by elm-watch.\\nfunction _Browser_application(impl)\\n{\\n\\t// var onUrlChange = impl.onUrlChange; // commented out by elm-watch\\n\\t// var onUrlRequest = impl.onUrlRequest; // commented out by elm-watch\\n\\t// var key = function() { key.a(onUrlChange(_Browser_getUrl())); }; // commented out by elm-watch\\n\\tvar key = function() { key.a(impl.onUrlChange(_Browser_getUrl())); }; // added by elm-watch\\n\\n\\treturn _Browser_document({\\n\\t\\tsetup: function(sendToApp)\\n\\t\\t{\\n\\t\\t\\tkey.a = sendToApp;\\n\\t\\t\\t_Browser_window.addEventListener(\\'popstate\\', key);\\n\\t\\t\\t_Browser_window.navigator.userAgent.indexOf(\\'Trident\\') < 0 || _Browser_window.addEventListener(\\'hashchange\\', key);\\n\\n\\t\\t\\treturn F2(function(domNode, event)\\n\\t\\t\\t{\\n\\t\\t\\t\\tif (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute(\\'download\\'))\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\tevent.preventDefault();\\n\\t\\t\\t\\t\\tvar href = domNode.href;\\n\\t\\t\\t\\t\\tvar curr = _Browser_getUrl();\\n\\t\\t\\t\\t\\tvar next = $elm$url$Url$fromString(href).a;\\n\\t\\t\\t\\t\\tsendToApp(impl.onUrlRequest(\\n\\t\\t\\t\\t\\t\\t(next\\n\\t\\t\\t\\t\\t\\t\\t&& curr.protocol === next.protocol\\n\\t\\t\\t\\t\\t\\t\\t&& curr.host === next.host\\n\\t\\t\\t\\t\\t\\t\\t&& curr.port_.a === next.port_.a\\n\\t\\t\\t\\t\\t\\t)\\n\\t\\t\\t\\t\\t\\t\\t? $elm$browser$Browser$Internal(next)\\n\\t\\t\\t\\t\\t\\t\\t: $elm$browser$Browser$External(href)\\n\\t\\t\\t\\t\\t));\\n\\t\\t\\t\\t}\\n\\t\\t\\t});\\n\\t\\t},\\n\\t\\tinit: function(flags)\\n\\t\\t{\\n\\t\\t\\t// return A3(impl.init, flags, _Browser_getUrl(), key); // commented out by elm-watch\\n\\t\\t\\treturn A3(impl.init, flags, window.__ELM_WATCH_INIT_URL, key); // added by elm-watch\\n\\t\\t},\\n\\t\\t// view: impl.view, // commented out by elm-watch\\n\\t\\t// update: impl.update, // commented out by elm-watch\\n\\t\\t// subscriptions: impl.subscriptions // commented out by elm-watch\\n\\t\\tview: function(model) { return impl.view(model); }, // added by elm-watch\\n\\t\\t_impl: impl // added by elm-watch\\n\\t});\\n}\\n\\nfunction _Browser_getUrl()\\n{\\n\\treturn $elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);\\n}\\n\\nvar _Browser_go = F2(function(key, n)\\n{\\n\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\n\\t\\tn && history.go(n);\\n\\t\\tkey();\\n\\t}));\\n});\\n\\nvar _Browser_pushUrl = F2(function(key, url)\\n{\\n\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\n\\t\\thistory.pushState({}, \\'\\', url);\\n\\t\\tkey();\\n\\t}));\\n});\\n\\nvar _Browser_replaceUrl = F2(function(key, url)\\n{\\n\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\n\\t\\thistory.replaceState({}, \\'\\', url);\\n\\t\\tkey();\\n\\t}));\\n});\\n\\n\\n\\n// GLOBAL EVENTS\\n\\n\\nvar _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };\\nvar _Browser_doc = typeof document !== \\'undefined\\' ? document : _Browser_fakeNode;\\nvar _Browser_window = typeof window !== \\'undefined\\' ? window : _Browser_fakeNode;\\n\\nvar _Browser_on = F3(function(node, eventName, sendToSelf)\\n{\\n\\treturn _Scheduler_spawn(_Scheduler_binding(function(callback)\\n\\t{\\n\\t\\tfunction handler(event)\\t{ _Scheduler_rawSpawn(sendToSelf(event)); }\\n\\t\\tnode.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });\\n\\t\\treturn function() { node.removeEventListener(eventName, handler); };\\n\\t}));\\n});\\n\\nvar _Browser_decodeEvent = F2(function(decoder, event)\\n{\\n\\tvar result = _Json_runHelp(decoder, event);\\n\\treturn $elm$core$Result$isOk(result) ? $elm$core$Maybe$Just(result.a) : $elm$core$Maybe$Nothing;\\n});\\n\\n\\n\\n// PAGE VISIBILITY\\n\\n\\nfunction _Browser_visibilityInfo()\\n{\\n\\treturn (typeof _VirtualDom_doc.hidden !== \\'undefined\\')\\n\\t\\t? { hidden: \\'hidden\\', change: \\'visibilitychange\\' }\\n\\t\\t:\\n\\t(typeof _VirtualDom_doc.mozHidden !== \\'undefined\\')\\n\\t\\t? { hidden: \\'mozHidden\\', change: \\'mozvisibilitychange\\' }\\n\\t\\t:\\n\\t(typeof _VirtualDom_doc.msHidden !== \\'undefined\\')\\n\\t\\t? { hidden: \\'msHidden\\', change: \\'msvisibilitychange\\' }\\n\\t\\t:\\n\\t(typeof _VirtualDom_doc.webkitHidden !== \\'undefined\\')\\n\\t\\t? { hidden: \\'webkitHidden\\', change: \\'webkitvisibilitychange\\' }\\n\\t\\t: { hidden: \\'hidden\\', change: \\'visibilitychange\\' };\\n}\\n\\n\\n\\n// ANIMATION FRAMES\\n\\n\\nfunction _Browser_rAF()\\n{\\n\\treturn _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\tvar id = _Browser_requestAnimationFrame(function() {\\n\\t\\t\\tcallback(_Scheduler_succeed(Date.now()));\\n\\t\\t});\\n\\n\\t\\treturn function() {\\n\\t\\t\\t_Browser_cancelAnimationFrame(id);\\n\\t\\t};\\n\\t});\\n}\\n\\n\\nfunction _Browser_now()\\n{\\n\\treturn _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\tcallback(_Scheduler_succeed(Date.now()));\\n\\t});\\n}\\n\\n\\n\\n// DOM STUFF\\n\\n\\nfunction _Browser_withNode(id, doStuff)\\n{\\n\\treturn _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\t_Browser_requestAnimationFrame(function() {\\n\\t\\t\\tvar node = document.getElementById(id);\\n\\t\\t\\tcallback(node\\n\\t\\t\\t\\t? _Scheduler_succeed(doStuff(node))\\n\\t\\t\\t\\t: _Scheduler_fail($elm$browser$Browser$Dom$NotFound(id))\\n\\t\\t\\t);\\n\\t\\t});\\n\\t});\\n}\\n\\n\\nfunction _Browser_withWindow(doStuff)\\n{\\n\\treturn _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\t_Browser_requestAnimationFrame(function() {\\n\\t\\t\\tcallback(_Scheduler_succeed(doStuff()));\\n\\t\\t});\\n\\t});\\n}\\n\\n\\n// FOCUS and BLUR\\n\\n\\nvar _Browser_call = F2(function(functionName, id)\\n{\\n\\treturn _Browser_withNode(id, function(node) {\\n\\t\\tnode[functionName]();\\n\\t\\treturn _Utils_Tuple0;\\n\\t});\\n});\\n\\n\\n\\n// WINDOW VIEWPORT\\n\\n\\nfunction _Browser_getViewport()\\n{\\n\\treturn {\\n\\t\\tscene: _Browser_getScene(),\\n\\t\\tviewport: {\\n\\t\\t\\tx: _Browser_window.pageXOffset,\\n\\t\\t\\ty: _Browser_window.pageYOffset,\\n\\t\\t\\twidth: _Browser_doc.documentElement.clientWidth,\\n\\t\\t\\theight: _Browser_doc.documentElement.clientHeight\\n\\t\\t}\\n\\t};\\n}\\n\\nfunction _Browser_getScene()\\n{\\n\\tvar body = _Browser_doc.body;\\n\\tvar elem = _Browser_doc.documentElement;\\n\\treturn {\\n\\t\\twidth: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),\\n\\t\\theight: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)\\n\\t};\\n}\\n\\nvar _Browser_setViewport = F2(function(x, y)\\n{\\n\\treturn _Browser_withWindow(function()\\n\\t{\\n\\t\\t_Browser_window.scroll(x, y);\\n\\t\\treturn _Utils_Tuple0;\\n\\t});\\n});\\n\\n\\n\\n// ELEMENT VIEWPORT\\n\\n\\nfunction _Browser_getViewportOf(id)\\n{\\n\\treturn _Browser_withNode(id, function(node)\\n\\t{\\n\\t\\treturn {\\n\\t\\t\\tscene: {\\n\\t\\t\\t\\twidth: node.scrollWidth,\\n\\t\\t\\t\\theight: node.scrollHeight\\n\\t\\t\\t},\\n\\t\\t\\tviewport: {\\n\\t\\t\\t\\tx: node.scrollLeft,\\n\\t\\t\\t\\ty: node.scrollTop,\\n\\t\\t\\t\\twidth: node.clientWidth,\\n\\t\\t\\t\\theight: node.clientHeight\\n\\t\\t\\t}\\n\\t\\t};\\n\\t});\\n}\\n\\n\\nvar _Browser_setViewportOf = F3(function(id, x, y)\\n{\\n\\treturn _Browser_withNode(id, function(node)\\n\\t{\\n\\t\\tnode.scrollLeft = x;\\n\\t\\tnode.scrollTop = y;\\n\\t\\treturn _Utils_Tuple0;\\n\\t});\\n});\\n\\n\\n\\n// ELEMENT\\n\\n\\nfunction _Browser_getElement(id)\\n{\\n\\treturn _Browser_withNode(id, function(node)\\n\\t{\\n\\t\\tvar rect = node.getBoundingClientRect();\\n\\t\\tvar x = _Browser_window.pageXOffset;\\n\\t\\tvar y = _Browser_window.pageYOffset;\\n\\t\\treturn {\\n\\t\\t\\tscene: _Browser_getScene(),\\n\\t\\t\\tviewport: {\\n\\t\\t\\t\\tx: x,\\n\\t\\t\\t\\ty: y,\\n\\t\\t\\t\\twidth: _Browser_doc.documentElement.clientWidth,\\n\\t\\t\\t\\theight: _Browser_doc.documentElement.clientHeight\\n\\t\\t\\t},\\n\\t\\t\\telement: {\\n\\t\\t\\t\\tx: x + rect.left,\\n\\t\\t\\t\\ty: y + rect.top,\\n\\t\\t\\t\\twidth: rect.width,\\n\\t\\t\\t\\theight: rect.height\\n\\t\\t\\t}\\n\\t\\t};\\n\\t});\\n}\\n\\n\\n\\n// LOAD and RELOAD\\n\\n\\nfunction _Browser_reload(skipCache)\\n{\\n\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\t_VirtualDom_doc.location.reload(skipCache);\\n\\t}));\\n}\\n\\nfunction _Browser_load(url)\\n{\\n\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)\\n\\t{\\n\\t\\ttry\\n\\t\\t{\\n\\t\\t\\t_Browser_window.location = url;\\n\\t\\t}\\n\\t\\tcatch(err)\\n\\t\\t{\\n\\t\\t\\t// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.\\n\\t\\t\\t// Other browsers reload the page, so let\\'s be consistent about that.\\n\\t\\t\\t_VirtualDom_doc.location.reload(false);\\n\\t\\t}\\n\\t}));\\n}\\n\\n\\n// CREATE\\n\\nvar _Regex_never = /.^/;\\n\\nvar _Regex_fromStringWith = F2(function(options, string)\\n{\\n\\tvar flags = \\'g\\';\\n\\tif (options.multiline) { flags += \\'m\\'; }\\n\\tif (options.caseInsensitive) { flags += \\'i\\'; }\\n\\n\\ttry\\n\\t{\\n\\t\\treturn $elm$core$Maybe$Just(new RegExp(string, flags));\\n\\t}\\n\\tcatch(error)\\n\\t{\\n\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t}\\n});\\n\\n\\n// USE\\n\\nvar _Regex_contains = F2(function(re, string)\\n{\\n\\treturn string.match(re) !== null;\\n});\\n\\n\\nvar _Regex_findAtMost = F3(function(n, re, str)\\n{\\n\\tvar out = [];\\n\\tvar number = 0;\\n\\tvar string = str;\\n\\tvar lastIndex = re.lastIndex;\\n\\tvar prevLastIndex = -1;\\n\\tvar result;\\n\\twhile (number++ < n && (result = re.exec(string)))\\n\\t{\\n\\t\\tif (prevLastIndex == re.lastIndex) break;\\n\\t\\tvar i = result.length - 1;\\n\\t\\tvar subs = new Array(i);\\n\\t\\twhile (i > 0)\\n\\t\\t{\\n\\t\\t\\tvar submatch = result[i];\\n\\t\\t\\tsubs[--i] = submatch\\n\\t\\t\\t\\t? $elm$core$Maybe$Just(submatch)\\n\\t\\t\\t\\t: $elm$core$Maybe$Nothing;\\n\\t\\t}\\n\\t\\tout.push(A4($elm$regex$Regex$Match, result[0], result.index, number, _List_fromArray(subs)));\\n\\t\\tprevLastIndex = re.lastIndex;\\n\\t}\\n\\tre.lastIndex = lastIndex;\\n\\treturn _List_fromArray(out);\\n});\\n\\n\\nvar _Regex_replaceAtMost = F4(function(n, re, replacer, string)\\n{\\n\\tvar count = 0;\\n\\tfunction jsReplacer(match)\\n\\t{\\n\\t\\tif (count++ >= n)\\n\\t\\t{\\n\\t\\t\\treturn match;\\n\\t\\t}\\n\\t\\tvar i = arguments.length - 3;\\n\\t\\tvar submatches = new Array(i);\\n\\t\\twhile (i > 0)\\n\\t\\t{\\n\\t\\t\\tvar submatch = arguments[i];\\n\\t\\t\\tsubmatches[--i] = submatch\\n\\t\\t\\t\\t? $elm$core$Maybe$Just(submatch)\\n\\t\\t\\t\\t: $elm$core$Maybe$Nothing;\\n\\t\\t}\\n\\t\\treturn replacer(A4($elm$regex$Regex$Match, match, arguments[arguments.length - 2], count, _List_fromArray(submatches)));\\n\\t}\\n\\treturn string.replace(re, jsReplacer);\\n});\\n\\nvar _Regex_splitAtMost = F3(function(n, re, str)\\n{\\n\\tvar string = str;\\n\\tvar out = [];\\n\\tvar start = re.lastIndex;\\n\\tvar restoreLastIndex = re.lastIndex;\\n\\twhile (n--)\\n\\t{\\n\\t\\tvar result = re.exec(string);\\n\\t\\tif (!result) break;\\n\\t\\tout.push(string.slice(start, result.index));\\n\\t\\tstart = re.lastIndex;\\n\\t}\\n\\tout.push(string.slice(start));\\n\\tre.lastIndex = restoreLastIndex;\\n\\treturn _List_fromArray(out);\\n});\\n\\nvar _Regex_infinity = Infinity;\\n\\n\\n\\nvar _Bitwise_and = F2(function(a, b)\\n{\\n\\treturn a & b;\\n});\\n\\nvar _Bitwise_or = F2(function(a, b)\\n{\\n\\treturn a | b;\\n});\\n\\nvar _Bitwise_xor = F2(function(a, b)\\n{\\n\\treturn a ^ b;\\n});\\n\\nfunction _Bitwise_complement(a)\\n{\\n\\treturn ~a;\\n};\\n\\nvar _Bitwise_shiftLeftBy = F2(function(offset, a)\\n{\\n\\treturn a << offset;\\n});\\n\\nvar _Bitwise_shiftRightBy = F2(function(offset, a)\\n{\\n\\treturn a >> offset;\\n});\\n\\nvar _Bitwise_shiftRightZfBy = F2(function(offset, a)\\n{\\n\\treturn a >>> offset;\\n});\\nvar $elm$core$Basics$EQ = {$: \\'EQ\\'};\\nvar $elm$core$Basics$GT = {$: \\'GT\\'};\\nvar $elm$core$Basics$LT = {$: \\'LT\\'};\\nvar $elm$core$List$cons = _List_cons;\\nvar $elm$core$Dict$foldr = F3(\\n\\tfunction (func, acc, t) {\\n\\t\\tfoldr:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (t.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\t\\treturn acc;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar key = t.b;\\n\\t\\t\\t\\tvar value = t.c;\\n\\t\\t\\t\\tvar left = t.d;\\n\\t\\t\\t\\tvar right = t.e;\\n\\t\\t\\t\\tvar $temp$func = func,\\n\\t\\t\\t\\t\\t$temp$acc = A3(\\n\\t\\t\\t\\t\\tfunc,\\n\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\tA3($elm$core$Dict$foldr, func, acc, right)),\\n\\t\\t\\t\\t\\t$temp$t = left;\\n\\t\\t\\t\\tfunc = $temp$func;\\n\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\tt = $temp$t;\\n\\t\\t\\t\\tcontinue foldr;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$toList = function (dict) {\\n\\treturn A3(\\n\\t\\t$elm$core$Dict$foldr,\\n\\t\\tF3(\\n\\t\\t\\tfunction (key, value, list) {\\n\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t$elm$core$List$cons,\\n\\t\\t\\t\\t\\t_Utils_Tuple2(key, value),\\n\\t\\t\\t\\t\\tlist);\\n\\t\\t\\t}),\\n\\t\\t_List_Nil,\\n\\t\\tdict);\\n};\\nvar $elm$core$Dict$keys = function (dict) {\\n\\treturn A3(\\n\\t\\t$elm$core$Dict$foldr,\\n\\t\\tF3(\\n\\t\\t\\tfunction (key, value, keyList) {\\n\\t\\t\\t\\treturn A2($elm$core$List$cons, key, keyList);\\n\\t\\t\\t}),\\n\\t\\t_List_Nil,\\n\\t\\tdict);\\n};\\nvar $elm$core$Set$toList = function (_v0) {\\n\\tvar dict = _v0.a;\\n\\treturn $elm$core$Dict$keys(dict);\\n};\\nvar $elm$core$Elm$JsArray$foldr = _JsArray_foldr;\\nvar $elm$core$Array$foldr = F3(\\n\\tfunction (func, baseCase, _v0) {\\n\\t\\tvar tree = _v0.c;\\n\\t\\tvar tail = _v0.d;\\n\\t\\tvar helper = F2(\\n\\t\\t\\tfunction (node, acc) {\\n\\t\\t\\t\\tif (node.$ === \\'SubTree\\') {\\n\\t\\t\\t\\t\\tvar subTree = node.a;\\n\\t\\t\\t\\t\\treturn A3($elm$core$Elm$JsArray$foldr, helper, acc, subTree);\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar values = node.a;\\n\\t\\t\\t\\t\\treturn A3($elm$core$Elm$JsArray$foldr, func, acc, values);\\n\\t\\t\\t\\t}\\n\\t\\t\\t});\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$Elm$JsArray$foldr,\\n\\t\\t\\thelper,\\n\\t\\t\\tA3($elm$core$Elm$JsArray$foldr, func, baseCase, tail),\\n\\t\\t\\ttree);\\n\\t});\\nvar $elm$core$Array$toList = function (array) {\\n\\treturn A3($elm$core$Array$foldr, $elm$core$List$cons, _List_Nil, array);\\n};\\nvar $elm$core$Result$Err = function (a) {\\n\\treturn {$: \\'Err\\', a: a};\\n};\\nvar $elm$json$Json$Decode$Failure = F2(\\n\\tfunction (a, b) {\\n\\t\\treturn {$: \\'Failure\\', a: a, b: b};\\n\\t});\\nvar $elm$json$Json$Decode$Field = F2(\\n\\tfunction (a, b) {\\n\\t\\treturn {$: \\'Field\\', a: a, b: b};\\n\\t});\\nvar $elm$json$Json$Decode$Index = F2(\\n\\tfunction (a, b) {\\n\\t\\treturn {$: \\'Index\\', a: a, b: b};\\n\\t});\\nvar $elm$core$Result$Ok = function (a) {\\n\\treturn {$: \\'Ok\\', a: a};\\n};\\nvar $elm$json$Json$Decode$OneOf = function (a) {\\n\\treturn {$: \\'OneOf\\', a: a};\\n};\\nvar $elm$core$Basics$False = {$: \\'False\\'};\\nvar $elm$core$Basics$add = _Basics_add;\\nvar $elm$core$Maybe$Just = function (a) {\\n\\treturn {$: \\'Just\\', a: a};\\n};\\nvar $elm$core$Maybe$Nothing = {$: \\'Nothing\\'};\\nvar $elm$core$String$all = _String_all;\\nvar $elm$core$Basics$and = _Basics_and;\\nvar $elm$core$Basics$append = _Utils_append;\\nvar $elm$json$Json$Encode$encode = _Json_encode;\\nvar $elm$core$String$fromInt = _String_fromNumber;\\nvar $elm$core$String$join = F2(\\n\\tfunction (sep, chunks) {\\n\\t\\treturn A2(\\n\\t\\t\\t_String_join,\\n\\t\\t\\tsep,\\n\\t\\t\\t_List_toArray(chunks));\\n\\t});\\nvar $elm$core$String$split = F2(\\n\\tfunction (sep, string) {\\n\\t\\treturn _List_fromArray(\\n\\t\\t\\tA2(_String_split, sep, string));\\n\\t});\\nvar $elm$json$Json$Decode$indent = function (str) {\\n\\treturn A2(\\n\\t\\t$elm$core$String$join,\\n\\t\\t\\'\\\\n    \\',\\n\\t\\tA2($elm$core$String$split, \\'\\\\n\\', str));\\n};\\nvar $elm$core$List$foldl = F3(\\n\\tfunction (func, acc, list) {\\n\\t\\tfoldl:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (!list.b) {\\n\\t\\t\\t\\treturn acc;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar x = list.a;\\n\\t\\t\\t\\tvar xs = list.b;\\n\\t\\t\\t\\tvar $temp$func = func,\\n\\t\\t\\t\\t\\t$temp$acc = A2(func, x, acc),\\n\\t\\t\\t\\t\\t$temp$list = xs;\\n\\t\\t\\t\\tfunc = $temp$func;\\n\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\tlist = $temp$list;\\n\\t\\t\\t\\tcontinue foldl;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$length = function (xs) {\\n\\treturn A3(\\n\\t\\t$elm$core$List$foldl,\\n\\t\\tF2(\\n\\t\\t\\tfunction (_v0, i) {\\n\\t\\t\\t\\treturn i + 1;\\n\\t\\t\\t}),\\n\\t\\t0,\\n\\t\\txs);\\n};\\nvar $elm$core$List$map2 = _List_map2;\\nvar $elm$core$Basics$le = _Utils_le;\\nvar $elm$core$Basics$sub = _Basics_sub;\\nvar $elm$core$List$rangeHelp = F3(\\n\\tfunction (lo, hi, list) {\\n\\t\\trangeHelp:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (_Utils_cmp(lo, hi) < 1) {\\n\\t\\t\\t\\tvar $temp$lo = lo,\\n\\t\\t\\t\\t\\t$temp$hi = hi - 1,\\n\\t\\t\\t\\t\\t$temp$list = A2($elm$core$List$cons, hi, list);\\n\\t\\t\\t\\tlo = $temp$lo;\\n\\t\\t\\t\\thi = $temp$hi;\\n\\t\\t\\t\\tlist = $temp$list;\\n\\t\\t\\t\\tcontinue rangeHelp;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn list;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$range = F2(\\n\\tfunction (lo, hi) {\\n\\t\\treturn A3($elm$core$List$rangeHelp, lo, hi, _List_Nil);\\n\\t});\\nvar $elm$core$List$indexedMap = F2(\\n\\tfunction (f, xs) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$List$map2,\\n\\t\\t\\tf,\\n\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$core$List$range,\\n\\t\\t\\t\\t0,\\n\\t\\t\\t\\t$elm$core$List$length(xs) - 1),\\n\\t\\t\\txs);\\n\\t});\\nvar $elm$core$Char$toCode = _Char_toCode;\\nvar $elm$core$Char$isLower = function (_char) {\\n\\tvar code = $elm$core$Char$toCode(_char);\\n\\treturn (97 <= code) && (code <= 122);\\n};\\nvar $elm$core$Char$isUpper = function (_char) {\\n\\tvar code = $elm$core$Char$toCode(_char);\\n\\treturn (code <= 90) && (65 <= code);\\n};\\nvar $elm$core$Basics$or = _Basics_or;\\nvar $elm$core$Char$isAlpha = function (_char) {\\n\\treturn $elm$core$Char$isLower(_char) || $elm$core$Char$isUpper(_char);\\n};\\nvar $elm$core$Char$isDigit = function (_char) {\\n\\tvar code = $elm$core$Char$toCode(_char);\\n\\treturn (code <= 57) && (48 <= code);\\n};\\nvar $elm$core$Char$isAlphaNum = function (_char) {\\n\\treturn $elm$core$Char$isLower(_char) || ($elm$core$Char$isUpper(_char) || $elm$core$Char$isDigit(_char));\\n};\\nvar $elm$core$List$reverse = function (list) {\\n\\treturn A3($elm$core$List$foldl, $elm$core$List$cons, _List_Nil, list);\\n};\\nvar $elm$core$String$uncons = _String_uncons;\\nvar $elm$json$Json$Decode$errorOneOf = F2(\\n\\tfunction (i, error) {\\n\\t\\treturn \\'\\\\n\\\\n(\\' + ($elm$core$String$fromInt(i + 1) + (\\') \\' + $elm$json$Json$Decode$indent(\\n\\t\\t\\t$elm$json$Json$Decode$errorToString(error))));\\n\\t});\\nvar $elm$json$Json$Decode$errorToString = function (error) {\\n\\treturn A2($elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);\\n};\\nvar $elm$json$Json$Decode$errorToStringHelp = F2(\\n\\tfunction (error, context) {\\n\\t\\terrorToStringHelp:\\n\\t\\twhile (true) {\\n\\t\\t\\tswitch (error.$) {\\n\\t\\t\\t\\tcase \\'Field\\':\\n\\t\\t\\t\\t\\tvar f = error.a;\\n\\t\\t\\t\\t\\tvar err = error.b;\\n\\t\\t\\t\\t\\tvar isSimple = function () {\\n\\t\\t\\t\\t\\t\\tvar _v1 = $elm$core$String$uncons(f);\\n\\t\\t\\t\\t\\t\\tif (_v1.$ === \\'Nothing\\') {\\n\\t\\t\\t\\t\\t\\t\\treturn false;\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\tvar _v2 = _v1.a;\\n\\t\\t\\t\\t\\t\\t\\tvar _char = _v2.a;\\n\\t\\t\\t\\t\\t\\t\\tvar rest = _v2.b;\\n\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Char$isAlpha(_char) && A2($elm$core$String$all, $elm$core$Char$isAlphaNum, rest);\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}();\\n\\t\\t\\t\\t\\tvar fieldName = isSimple ? (\\'.\\' + f) : (\\'[\\\\\\'\\' + (f + \\'\\\\\\']\\'));\\n\\t\\t\\t\\t\\tvar $temp$error = err,\\n\\t\\t\\t\\t\\t\\t$temp$context = A2($elm$core$List$cons, fieldName, context);\\n\\t\\t\\t\\t\\terror = $temp$error;\\n\\t\\t\\t\\t\\tcontext = $temp$context;\\n\\t\\t\\t\\t\\tcontinue errorToStringHelp;\\n\\t\\t\\t\\tcase \\'Index\\':\\n\\t\\t\\t\\t\\tvar i = error.a;\\n\\t\\t\\t\\t\\tvar err = error.b;\\n\\t\\t\\t\\t\\tvar indexName = \\'[\\' + ($elm$core$String$fromInt(i) + \\']\\');\\n\\t\\t\\t\\t\\tvar $temp$error = err,\\n\\t\\t\\t\\t\\t\\t$temp$context = A2($elm$core$List$cons, indexName, context);\\n\\t\\t\\t\\t\\terror = $temp$error;\\n\\t\\t\\t\\t\\tcontext = $temp$context;\\n\\t\\t\\t\\t\\tcontinue errorToStringHelp;\\n\\t\\t\\t\\tcase \\'OneOf\\':\\n\\t\\t\\t\\t\\tvar errors = error.a;\\n\\t\\t\\t\\t\\tif (!errors.b) {\\n\\t\\t\\t\\t\\t\\treturn \\'Ran into a Json.Decode.oneOf with no possibilities\\' + function () {\\n\\t\\t\\t\\t\\t\\t\\tif (!context.b) {\\n\\t\\t\\t\\t\\t\\t\\t\\treturn \\'!\\';\\n\\t\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\t\\treturn \\' at json\\' + A2(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\'\\',\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$List$reverse(context));\\n\\t\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t\\t}();\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tif (!errors.b.b) {\\n\\t\\t\\t\\t\\t\\t\\tvar err = errors.a;\\n\\t\\t\\t\\t\\t\\t\\tvar $temp$error = err,\\n\\t\\t\\t\\t\\t\\t\\t\\t$temp$context = context;\\n\\t\\t\\t\\t\\t\\t\\terror = $temp$error;\\n\\t\\t\\t\\t\\t\\t\\tcontext = $temp$context;\\n\\t\\t\\t\\t\\t\\t\\tcontinue errorToStringHelp;\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\tvar starter = function () {\\n\\t\\t\\t\\t\\t\\t\\t\\tif (!context.b) {\\n\\t\\t\\t\\t\\t\\t\\t\\t\\treturn \\'Json.Decode.oneOf\\';\\n\\t\\t\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\t\\t\\treturn \\'The Json.Decode.oneOf at json\\' + A2(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\'\\',\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$List$reverse(context));\\n\\t\\t\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t\\t\\t}();\\n\\t\\t\\t\\t\\t\\t\\tvar introduction = starter + (\\' failed in the following \\' + ($elm$core$String$fromInt(\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$List$length(errors)) + \\' ways:\\'));\\n\\t\\t\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\'\\\\n\\\\n\\',\\n\\t\\t\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$List$cons,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tintroduction,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$List$indexedMap, $elm$json$Json$Decode$errorOneOf, errors)));\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\tvar msg = error.a;\\n\\t\\t\\t\\t\\tvar json = error.b;\\n\\t\\t\\t\\t\\tvar introduction = function () {\\n\\t\\t\\t\\t\\t\\tif (!context.b) {\\n\\t\\t\\t\\t\\t\\t\\treturn \\'Problem with the given value:\\\\n\\\\n\\';\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\treturn \\'Problem with the value at json\\' + (A2(\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\'\\',\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$List$reverse(context)) + \\':\\\\n\\\\n    \\');\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}();\\n\\t\\t\\t\\t\\treturn introduction + ($elm$json$Json$Decode$indent(\\n\\t\\t\\t\\t\\t\\tA2($elm$json$Json$Encode$encode, 4, json)) + (\\'\\\\n\\\\n\\' + msg));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Array$branchFactor = 32;\\nvar $elm$core$Array$Array_elm_builtin = F4(\\n\\tfunction (a, b, c, d) {\\n\\t\\treturn {$: \\'Array_elm_builtin\\', a: a, b: b, c: c, d: d};\\n\\t});\\nvar $elm$core$Elm$JsArray$empty = _JsArray_empty;\\nvar $elm$core$Basics$ceiling = _Basics_ceiling;\\nvar $elm$core$Basics$fdiv = _Basics_fdiv;\\nvar $elm$core$Basics$logBase = F2(\\n\\tfunction (base, number) {\\n\\t\\treturn _Basics_log(number) / _Basics_log(base);\\n\\t});\\nvar $elm$core$Basics$toFloat = _Basics_toFloat;\\nvar $elm$core$Array$shiftStep = $elm$core$Basics$ceiling(\\n\\tA2($elm$core$Basics$logBase, 2, $elm$core$Array$branchFactor));\\nvar $elm$core$Array$empty = A4($elm$core$Array$Array_elm_builtin, 0, $elm$core$Array$shiftStep, $elm$core$Elm$JsArray$empty, $elm$core$Elm$JsArray$empty);\\nvar $elm$core$Elm$JsArray$initialize = _JsArray_initialize;\\nvar $elm$core$Array$Leaf = function (a) {\\n\\treturn {$: \\'Leaf\\', a: a};\\n};\\nvar $elm$core$Basics$apL = F2(\\n\\tfunction (f, x) {\\n\\t\\treturn f(x);\\n\\t});\\nvar $elm$core$Basics$apR = F2(\\n\\tfunction (x, f) {\\n\\t\\treturn f(x);\\n\\t});\\nvar $elm$core$Basics$eq = _Utils_equal;\\nvar $elm$core$Basics$floor = _Basics_floor;\\nvar $elm$core$Elm$JsArray$length = _JsArray_length;\\nvar $elm$core$Basics$gt = _Utils_gt;\\nvar $elm$core$Basics$max = F2(\\n\\tfunction (x, y) {\\n\\t\\treturn (_Utils_cmp(x, y) > 0) ? x : y;\\n\\t});\\nvar $elm$core$Basics$mul = _Basics_mul;\\nvar $elm$core$Array$SubTree = function (a) {\\n\\treturn {$: \\'SubTree\\', a: a};\\n};\\nvar $elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;\\nvar $elm$core$Array$compressNodes = F2(\\n\\tfunction (nodes, acc) {\\n\\t\\tcompressNodes:\\n\\t\\twhile (true) {\\n\\t\\t\\tvar _v0 = A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodes);\\n\\t\\t\\tvar node = _v0.a;\\n\\t\\t\\tvar remainingNodes = _v0.b;\\n\\t\\t\\tvar newAcc = A2(\\n\\t\\t\\t\\t$elm$core$List$cons,\\n\\t\\t\\t\\t$elm$core$Array$SubTree(node),\\n\\t\\t\\t\\tacc);\\n\\t\\t\\tif (!remainingNodes.b) {\\n\\t\\t\\t\\treturn $elm$core$List$reverse(newAcc);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar $temp$nodes = remainingNodes,\\n\\t\\t\\t\\t\\t$temp$acc = newAcc;\\n\\t\\t\\t\\tnodes = $temp$nodes;\\n\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\tcontinue compressNodes;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Tuple$first = function (_v0) {\\n\\tvar x = _v0.a;\\n\\treturn x;\\n};\\nvar $elm$core$Array$treeFromBuilder = F2(\\n\\tfunction (nodeList, nodeListSize) {\\n\\t\\ttreeFromBuilder:\\n\\t\\twhile (true) {\\n\\t\\t\\tvar newNodeSize = $elm$core$Basics$ceiling(nodeListSize / $elm$core$Array$branchFactor);\\n\\t\\t\\tif (newNodeSize === 1) {\\n\\t\\t\\t\\treturn A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodeList).a;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar $temp$nodeList = A2($elm$core$Array$compressNodes, nodeList, _List_Nil),\\n\\t\\t\\t\\t\\t$temp$nodeListSize = newNodeSize;\\n\\t\\t\\t\\tnodeList = $temp$nodeList;\\n\\t\\t\\t\\tnodeListSize = $temp$nodeListSize;\\n\\t\\t\\t\\tcontinue treeFromBuilder;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Array$builderToArray = F2(\\n\\tfunction (reverseNodeList, builder) {\\n\\t\\tif (!builder.nodeListSize) {\\n\\t\\t\\treturn A4(\\n\\t\\t\\t\\t$elm$core$Array$Array_elm_builtin,\\n\\t\\t\\t\\t$elm$core$Elm$JsArray$length(builder.tail),\\n\\t\\t\\t\\t$elm$core$Array$shiftStep,\\n\\t\\t\\t\\t$elm$core$Elm$JsArray$empty,\\n\\t\\t\\t\\tbuilder.tail);\\n\\t\\t} else {\\n\\t\\t\\tvar treeLen = builder.nodeListSize * $elm$core$Array$branchFactor;\\n\\t\\t\\tvar depth = $elm$core$Basics$floor(\\n\\t\\t\\t\\tA2($elm$core$Basics$logBase, $elm$core$Array$branchFactor, treeLen - 1));\\n\\t\\t\\tvar correctNodeList = reverseNodeList ? $elm$core$List$reverse(builder.nodeList) : builder.nodeList;\\n\\t\\t\\tvar tree = A2($elm$core$Array$treeFromBuilder, correctNodeList, builder.nodeListSize);\\n\\t\\t\\treturn A4(\\n\\t\\t\\t\\t$elm$core$Array$Array_elm_builtin,\\n\\t\\t\\t\\t$elm$core$Elm$JsArray$length(builder.tail) + treeLen,\\n\\t\\t\\t\\tA2($elm$core$Basics$max, 5, depth * $elm$core$Array$shiftStep),\\n\\t\\t\\t\\ttree,\\n\\t\\t\\t\\tbuilder.tail);\\n\\t\\t}\\n\\t});\\nvar $elm$core$Basics$idiv = _Basics_idiv;\\nvar $elm$core$Basics$lt = _Utils_lt;\\nvar $elm$core$Array$initializeHelp = F5(\\n\\tfunction (fn, fromIndex, len, nodeList, tail) {\\n\\t\\tinitializeHelp:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (fromIndex < 0) {\\n\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t$elm$core$Array$builderToArray,\\n\\t\\t\\t\\t\\tfalse,\\n\\t\\t\\t\\t\\t{nodeList: nodeList, nodeListSize: (len / $elm$core$Array$branchFactor) | 0, tail: tail});\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar leaf = $elm$core$Array$Leaf(\\n\\t\\t\\t\\t\\tA3($elm$core$Elm$JsArray$initialize, $elm$core$Array$branchFactor, fromIndex, fn));\\n\\t\\t\\t\\tvar $temp$fn = fn,\\n\\t\\t\\t\\t\\t$temp$fromIndex = fromIndex - $elm$core$Array$branchFactor,\\n\\t\\t\\t\\t\\t$temp$len = len,\\n\\t\\t\\t\\t\\t$temp$nodeList = A2($elm$core$List$cons, leaf, nodeList),\\n\\t\\t\\t\\t\\t$temp$tail = tail;\\n\\t\\t\\t\\tfn = $temp$fn;\\n\\t\\t\\t\\tfromIndex = $temp$fromIndex;\\n\\t\\t\\t\\tlen = $temp$len;\\n\\t\\t\\t\\tnodeList = $temp$nodeList;\\n\\t\\t\\t\\ttail = $temp$tail;\\n\\t\\t\\t\\tcontinue initializeHelp;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Basics$remainderBy = _Basics_remainderBy;\\nvar $elm$core$Array$initialize = F2(\\n\\tfunction (len, fn) {\\n\\t\\tif (len <= 0) {\\n\\t\\t\\treturn $elm$core$Array$empty;\\n\\t\\t} else {\\n\\t\\t\\tvar tailLen = len % $elm$core$Array$branchFactor;\\n\\t\\t\\tvar tail = A3($elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);\\n\\t\\t\\tvar initialFromIndex = (len - tailLen) - $elm$core$Array$branchFactor;\\n\\t\\t\\treturn A5($elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);\\n\\t\\t}\\n\\t});\\nvar $elm$core$Basics$True = {$: \\'True\\'};\\nvar $elm$core$Result$isOk = function (result) {\\n\\tif (result.$ === \\'Ok\\') {\\n\\t\\treturn true;\\n\\t} else {\\n\\t\\treturn false;\\n\\t}\\n};\\nvar $elm$json$Json$Decode$map = _Json_map1;\\nvar $elm$json$Json$Decode$map2 = _Json_map2;\\nvar $elm$json$Json$Decode$succeed = _Json_succeed;\\nvar $elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {\\n\\tswitch (handler.$) {\\n\\t\\tcase \\'Normal\\':\\n\\t\\t\\treturn 0;\\n\\t\\tcase \\'MayStopPropagation\\':\\n\\t\\t\\treturn 1;\\n\\t\\tcase \\'MayPreventDefault\\':\\n\\t\\t\\treturn 2;\\n\\t\\tdefault:\\n\\t\\t\\treturn 3;\\n\\t}\\n};\\nvar $elm$browser$Browser$External = function (a) {\\n\\treturn {$: \\'External\\', a: a};\\n};\\nvar $elm$browser$Browser$Internal = function (a) {\\n\\treturn {$: \\'Internal\\', a: a};\\n};\\nvar $elm$core$Basics$identity = function (x) {\\n\\treturn x;\\n};\\nvar $elm$browser$Browser$Dom$NotFound = function (a) {\\n\\treturn {$: \\'NotFound\\', a: a};\\n};\\nvar $elm$url$Url$Http = {$: \\'Http\\'};\\nvar $elm$url$Url$Https = {$: \\'Https\\'};\\nvar $elm$url$Url$Url = F6(\\n\\tfunction (protocol, host, port_, path, query, fragment) {\\n\\t\\treturn {fragment: fragment, host: host, path: path, port_: port_, protocol: protocol, query: query};\\n\\t});\\nvar $elm$core$String$contains = _String_contains;\\nvar $elm$core$String$length = _String_length;\\nvar $elm$core$String$slice = _String_slice;\\nvar $elm$core$String$dropLeft = F2(\\n\\tfunction (n, string) {\\n\\t\\treturn (n < 1) ? string : A3(\\n\\t\\t\\t$elm$core$String$slice,\\n\\t\\t\\tn,\\n\\t\\t\\t$elm$core$String$length(string),\\n\\t\\t\\tstring);\\n\\t});\\nvar $elm$core$String$indexes = _String_indexes;\\nvar $elm$core$String$isEmpty = function (string) {\\n\\treturn string === \\'\\';\\n};\\nvar $elm$core$String$left = F2(\\n\\tfunction (n, string) {\\n\\t\\treturn (n < 1) ? \\'\\' : A3($elm$core$String$slice, 0, n, string);\\n\\t});\\nvar $elm$core$String$toInt = _String_toInt;\\nvar $elm$url$Url$chompBeforePath = F5(\\n\\tfunction (protocol, path, params, frag, str) {\\n\\t\\tif ($elm$core$String$isEmpty(str) || A2($elm$core$String$contains, \\'@\\', str)) {\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t} else {\\n\\t\\t\\tvar _v0 = A2($elm$core$String$indexes, \\':\\', str);\\n\\t\\t\\tif (!_v0.b) {\\n\\t\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\tA6($elm$url$Url$Url, protocol, str, $elm$core$Maybe$Nothing, path, params, frag));\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tif (!_v0.b.b) {\\n\\t\\t\\t\\t\\tvar i = _v0.a;\\n\\t\\t\\t\\t\\tvar _v1 = $elm$core$String$toInt(\\n\\t\\t\\t\\t\\t\\tA2($elm$core$String$dropLeft, i + 1, str));\\n\\t\\t\\t\\t\\tif (_v1.$ === \\'Nothing\\') {\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar port_ = _v1;\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\t\\tA6(\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$url$Url$Url,\\n\\t\\t\\t\\t\\t\\t\\t\\tprotocol,\\n\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$String$left, i, str),\\n\\t\\t\\t\\t\\t\\t\\t\\tport_,\\n\\t\\t\\t\\t\\t\\t\\t\\tpath,\\n\\t\\t\\t\\t\\t\\t\\t\\tparams,\\n\\t\\t\\t\\t\\t\\t\\t\\tfrag));\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$url$Url$chompBeforeQuery = F4(\\n\\tfunction (protocol, params, frag, str) {\\n\\t\\tif ($elm$core$String$isEmpty(str)) {\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t} else {\\n\\t\\t\\tvar _v0 = A2($elm$core$String$indexes, \\'/\\', str);\\n\\t\\t\\tif (!_v0.b) {\\n\\t\\t\\t\\treturn A5($elm$url$Url$chompBeforePath, protocol, \\'/\\', params, frag, str);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar i = _v0.a;\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$url$Url$chompBeforePath,\\n\\t\\t\\t\\t\\tprotocol,\\n\\t\\t\\t\\t\\tA2($elm$core$String$dropLeft, i, str),\\n\\t\\t\\t\\t\\tparams,\\n\\t\\t\\t\\t\\tfrag,\\n\\t\\t\\t\\t\\tA2($elm$core$String$left, i, str));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$url$Url$chompBeforeFragment = F3(\\n\\tfunction (protocol, frag, str) {\\n\\t\\tif ($elm$core$String$isEmpty(str)) {\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t} else {\\n\\t\\t\\tvar _v0 = A2($elm$core$String$indexes, \\'?\\', str);\\n\\t\\t\\tif (!_v0.b) {\\n\\t\\t\\t\\treturn A4($elm$url$Url$chompBeforeQuery, protocol, $elm$core$Maybe$Nothing, frag, str);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar i = _v0.a;\\n\\t\\t\\t\\treturn A4(\\n\\t\\t\\t\\t\\t$elm$url$Url$chompBeforeQuery,\\n\\t\\t\\t\\t\\tprotocol,\\n\\t\\t\\t\\t\\t$elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\tA2($elm$core$String$dropLeft, i + 1, str)),\\n\\t\\t\\t\\t\\tfrag,\\n\\t\\t\\t\\t\\tA2($elm$core$String$left, i, str));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$url$Url$chompAfterProtocol = F2(\\n\\tfunction (protocol, str) {\\n\\t\\tif ($elm$core$String$isEmpty(str)) {\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t} else {\\n\\t\\t\\tvar _v0 = A2($elm$core$String$indexes, \\'#\\', str);\\n\\t\\t\\tif (!_v0.b) {\\n\\t\\t\\t\\treturn A3($elm$url$Url$chompBeforeFragment, protocol, $elm$core$Maybe$Nothing, str);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar i = _v0.a;\\n\\t\\t\\t\\treturn A3(\\n\\t\\t\\t\\t\\t$elm$url$Url$chompBeforeFragment,\\n\\t\\t\\t\\t\\tprotocol,\\n\\t\\t\\t\\t\\t$elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\tA2($elm$core$String$dropLeft, i + 1, str)),\\n\\t\\t\\t\\t\\tA2($elm$core$String$left, i, str));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$String$startsWith = _String_startsWith;\\nvar $elm$url$Url$fromString = function (str) {\\n\\treturn A2($elm$core$String$startsWith, \\'http://\\', str) ? A2(\\n\\t\\t$elm$url$Url$chompAfterProtocol,\\n\\t\\t$elm$url$Url$Http,\\n\\t\\tA2($elm$core$String$dropLeft, 7, str)) : (A2($elm$core$String$startsWith, \\'https://\\', str) ? A2(\\n\\t\\t$elm$url$Url$chompAfterProtocol,\\n\\t\\t$elm$url$Url$Https,\\n\\t\\tA2($elm$core$String$dropLeft, 8, str)) : $elm$core$Maybe$Nothing);\\n};\\nvar $elm$core$Basics$never = function (_v0) {\\n\\tnever:\\n\\twhile (true) {\\n\\t\\tvar nvr = _v0.a;\\n\\t\\tvar $temp$_v0 = nvr;\\n\\t\\t_v0 = $temp$_v0;\\n\\t\\tcontinue never;\\n\\t}\\n};\\nvar $elm$core$Task$Perform = function (a) {\\n\\treturn {$: \\'Perform\\', a: a};\\n};\\nvar $elm$core$Task$succeed = _Scheduler_succeed;\\nvar $elm$core$Task$init = $elm$core$Task$succeed(_Utils_Tuple0);\\nvar $elm$core$List$foldrHelper = F4(\\n\\tfunction (fn, acc, ctr, ls) {\\n\\t\\tif (!ls.b) {\\n\\t\\t\\treturn acc;\\n\\t\\t} else {\\n\\t\\t\\tvar a = ls.a;\\n\\t\\t\\tvar r1 = ls.b;\\n\\t\\t\\tif (!r1.b) {\\n\\t\\t\\t\\treturn A2(fn, a, acc);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar b = r1.a;\\n\\t\\t\\t\\tvar r2 = r1.b;\\n\\t\\t\\t\\tif (!r2.b) {\\n\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\ta,\\n\\t\\t\\t\\t\\t\\tA2(fn, b, acc));\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar c = r2.a;\\n\\t\\t\\t\\t\\tvar r3 = r2.b;\\n\\t\\t\\t\\t\\tif (!r3.b) {\\n\\t\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\ta,\\n\\t\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\t\\tb,\\n\\t\\t\\t\\t\\t\\t\\t\\tA2(fn, c, acc)));\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar d = r3.a;\\n\\t\\t\\t\\t\\t\\tvar r4 = r3.b;\\n\\t\\t\\t\\t\\t\\tvar res = (ctr > 500) ? A3(\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$List$foldl,\\n\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\tacc,\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$List$reverse(r4)) : A4($elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);\\n\\t\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\ta,\\n\\t\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\t\\tb,\\n\\t\\t\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tfn,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tc,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tA2(fn, d, res))));\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$foldr = F3(\\n\\tfunction (fn, acc, ls) {\\n\\t\\treturn A4($elm$core$List$foldrHelper, fn, acc, 0, ls);\\n\\t});\\nvar $elm$core$List$map = F2(\\n\\tfunction (f, xs) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$List$foldr,\\n\\t\\t\\tF2(\\n\\t\\t\\t\\tfunction (x, acc) {\\n\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t$elm$core$List$cons,\\n\\t\\t\\t\\t\\t\\tf(x),\\n\\t\\t\\t\\t\\t\\tacc);\\n\\t\\t\\t\\t}),\\n\\t\\t\\t_List_Nil,\\n\\t\\t\\txs);\\n\\t});\\nvar $elm$core$Task$andThen = _Scheduler_andThen;\\nvar $elm$core$Task$map = F2(\\n\\tfunction (func, taskA) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$Task$andThen,\\n\\t\\t\\tfunction (a) {\\n\\t\\t\\t\\treturn $elm$core$Task$succeed(\\n\\t\\t\\t\\t\\tfunc(a));\\n\\t\\t\\t},\\n\\t\\t\\ttaskA);\\n\\t});\\nvar $elm$core$Task$map2 = F3(\\n\\tfunction (func, taskA, taskB) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$Task$andThen,\\n\\t\\t\\tfunction (a) {\\n\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t$elm$core$Task$andThen,\\n\\t\\t\\t\\t\\tfunction (b) {\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Task$succeed(\\n\\t\\t\\t\\t\\t\\t\\tA2(func, a, b));\\n\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\ttaskB);\\n\\t\\t\\t},\\n\\t\\t\\ttaskA);\\n\\t});\\nvar $elm$core$Task$sequence = function (tasks) {\\n\\treturn A3(\\n\\t\\t$elm$core$List$foldr,\\n\\t\\t$elm$core$Task$map2($elm$core$List$cons),\\n\\t\\t$elm$core$Task$succeed(_List_Nil),\\n\\t\\ttasks);\\n};\\nvar $elm$core$Platform$sendToApp = _Platform_sendToApp;\\nvar $elm$core$Task$spawnCmd = F2(\\n\\tfunction (router, _v0) {\\n\\t\\tvar task = _v0.a;\\n\\t\\treturn _Scheduler_spawn(\\n\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$core$Task$andThen,\\n\\t\\t\\t\\t$elm$core$Platform$sendToApp(router),\\n\\t\\t\\t\\ttask));\\n\\t});\\nvar $elm$core$Task$onEffects = F3(\\n\\tfunction (router, commands, state) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$Task$map,\\n\\t\\t\\tfunction (_v0) {\\n\\t\\t\\t\\treturn _Utils_Tuple0;\\n\\t\\t\\t},\\n\\t\\t\\t$elm$core$Task$sequence(\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t$elm$core$List$map,\\n\\t\\t\\t\\t\\t$elm$core$Task$spawnCmd(router),\\n\\t\\t\\t\\t\\tcommands)));\\n\\t});\\nvar $elm$core$Task$onSelfMsg = F3(\\n\\tfunction (_v0, _v1, _v2) {\\n\\t\\treturn $elm$core$Task$succeed(_Utils_Tuple0);\\n\\t});\\nvar $elm$core$Task$cmdMap = F2(\\n\\tfunction (tagger, _v0) {\\n\\t\\tvar task = _v0.a;\\n\\t\\treturn $elm$core$Task$Perform(\\n\\t\\t\\tA2($elm$core$Task$map, tagger, task));\\n\\t});\\n_Platform_effectManagers[\\'Task\\'] = _Platform_createManager($elm$core$Task$init, $elm$core$Task$onEffects, $elm$core$Task$onSelfMsg, $elm$core$Task$cmdMap);\\nvar $elm$core$Task$command = _Platform_leaf(\\'Task\\');\\nvar $elm$core$Task$perform = F2(\\n\\tfunction (toMessage, task) {\\n\\t\\treturn $elm$core$Task$command(\\n\\t\\t\\t$elm$core$Task$Perform(\\n\\t\\t\\t\\tA2($elm$core$Task$map, toMessage, task)));\\n\\t});\\nvar $elm$browser$Browser$element = _Browser_element;\\nvar $author$project$Main$Textarea = {$: \\'Textarea\\'};\\nvar $author$project$Main$TextareaFocused = {$: \\'TextareaFocused\\'};\\nvar $elm$core$Basics$always = F2(\\n\\tfunction (a, _v0) {\\n\\t\\treturn a;\\n\\t});\\nvar $elm$core$Basics$composeL = F3(\\n\\tfunction (g, f, x) {\\n\\t\\treturn g(\\n\\t\\t\\tf(x));\\n\\t});\\nvar $elm$core$Task$onError = _Scheduler_onError;\\nvar $elm$core$Task$attempt = F2(\\n\\tfunction (resultToMessage, task) {\\n\\t\\treturn $elm$core$Task$command(\\n\\t\\t\\t$elm$core$Task$Perform(\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t$elm$core$Task$onError,\\n\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$core$Basics$composeL,\\n\\t\\t\\t\\t\\t\\tA2($elm$core$Basics$composeL, $elm$core$Task$succeed, resultToMessage),\\n\\t\\t\\t\\t\\t\\t$elm$core$Result$Err),\\n\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$core$Task$andThen,\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Basics$composeL,\\n\\t\\t\\t\\t\\t\\t\\tA2($elm$core$Basics$composeL, $elm$core$Task$succeed, resultToMessage),\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Result$Ok),\\n\\t\\t\\t\\t\\t\\ttask))));\\n\\t});\\nvar $elm$browser$Browser$Dom$focus = _Browser_call(\\'focus\\');\\nvar $author$project$Main$textareaId = \\'textareaId\\';\\nvar $author$project$Main$focusTextarea = A2(\\n\\t$elm$core$Task$attempt,\\n\\t$elm$core$Basics$always($author$project$Main$TextareaFocused),\\n\\t$elm$browser$Browser$Dom$focus($author$project$Main$textareaId));\\nvar $author$project$Main$init = function (_v0) {\\n\\treturn _Utils_Tuple2(\\n\\t\\t{infoShown: false, page: $author$project$Main$Textarea},\\n\\t\\t$author$project$Main$focusTextarea);\\n};\\nvar $elm$core$Platform$Sub$batch = _Platform_batch;\\nvar $elm$core$Platform$Sub$none = $elm$core$Platform$Sub$batch(_List_Nil);\\nvar $author$project$Main$subscriptions = function (_v0) {\\n\\treturn $elm$core$Platform$Sub$none;\\n};\\nvar $author$project$Main$Graph = function (a) {\\n\\treturn {$: \\'Graph\\', a: a};\\n};\\nvar $author$project$Example$code = \\'\\\\n(function(scope){\\\\n\\\\\\'use strict\\\\\\';\\\\n\\\\nfunction F(arity, fun, wrapper) {\\\\n  wrapper.a = arity;\\\\n  wrapper.f = fun;\\\\n  return wrapper;\\\\n}\\\\n\\\\nfunction F2(fun) {\\\\n  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })\\\\n}\\\\nfunction F3(fun) {\\\\n  return F(3, fun, function(a) {\\\\n    return function(b) { return function(c) { return fun(a, b, c); }; };\\\\n  });\\\\n}\\\\nfunction F4(fun) {\\\\n  return F(4, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return fun(a, b, c, d); }; }; };\\\\n  });\\\\n}\\\\nfunction F5(fun) {\\\\n  return F(5, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };\\\\n  });\\\\n}\\\\nfunction F6(fun) {\\\\n  return F(6, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return function(e) { return function(f) {\\\\n    return fun(a, b, c, d, e, f); }; }; }; }; };\\\\n  });\\\\n}\\\\nfunction F7(fun) {\\\\n  return F(7, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return function(e) { return function(f) {\\\\n    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };\\\\n  });\\\\n}\\\\nfunction F8(fun) {\\\\n  return F(8, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return function(e) { return function(f) {\\\\n    return function(g) { return function(h) {\\\\n    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };\\\\n  });\\\\n}\\\\nfunction F9(fun) {\\\\n  return F(9, fun, function(a) { return function(b) { return function(c) {\\\\n    return function(d) { return function(e) { return function(f) {\\\\n    return function(g) { return function(h) { return function(i) {\\\\n    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };\\\\n  });\\\\n}\\\\n\\\\nfunction A2(fun, a, b) {\\\\n  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);\\\\n}\\\\nfunction A3(fun, a, b, c) {\\\\n  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);\\\\n}\\\\nfunction A4(fun, a, b, c, d) {\\\\n  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);\\\\n}\\\\nfunction A5(fun, a, b, c, d, e) {\\\\n  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);\\\\n}\\\\nfunction A6(fun, a, b, c, d, e, f) {\\\\n  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);\\\\n}\\\\nfunction A7(fun, a, b, c, d, e, f, g) {\\\\n  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);\\\\n}\\\\nfunction A8(fun, a, b, c, d, e, f, g, h) {\\\\n  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);\\\\n}\\\\nfunction A9(fun, a, b, c, d, e, f, g, h, i) {\\\\n  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);\\\\n}\\\\n\\\\n\\\\n\\\\n\\\\n// EQUALITY\\\\n\\\\nfunction _Utils_eq(x, y)\\\\n{\\\\n\\\\tfor (\\\\n\\\\t\\\\tvar pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);\\\\n\\\\t\\\\tisEqual && (pair = stack.pop());\\\\n\\\\t\\\\tisEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)\\\\n\\\\t\\\\t)\\\\n\\\\t{}\\\\n\\\\n\\\\treturn isEqual;\\\\n}\\\\n\\\\nfunction _Utils_eqHelp(x, y, depth, stack)\\\\n{\\\\n\\\\tif (x === y)\\\\n\\\\t{\\\\n\\\\t\\\\treturn true;\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof x !== \\\\\\'object\\\\\\' || x === null || y === null)\\\\n\\\\t{\\\\n\\\\t\\\\ttypeof x === \\\\\\'function\\\\\\' && _Debug_crash(5);\\\\n\\\\t\\\\treturn false;\\\\n\\\\t}\\\\n\\\\n\\\\tif (depth > 100)\\\\n\\\\t{\\\\n\\\\t\\\\tstack.push(_Utils_Tuple2(x,y));\\\\n\\\\t\\\\treturn true;\\\\n\\\\t}\\\\n\\\\n\\\\t/**_UNUSED/\\\\n\\\\tif (x.$ === \\\\\\'Set_elm_builtin\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\tx = $elm$core$Set$toList(x);\\\\n\\\\t\\\\ty = $elm$core$Set$toList(y);\\\\n\\\\t}\\\\n\\\\tif (x.$ === \\\\\\'RBNode_elm_builtin\\\\\\' || x.$ === \\\\\\'RBEmpty_elm_builtin\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\tx = $elm$core$Dict$toList(x);\\\\n\\\\t\\\\ty = $elm$core$Dict$toList(y);\\\\n\\\\t}\\\\n\\\\t//*/\\\\n\\\\n\\\\t/**/\\\\n\\\\tif (x.$ < 0)\\\\n\\\\t{\\\\n\\\\t\\\\tx = $elm$core$Dict$toList(x);\\\\n\\\\t\\\\ty = $elm$core$Dict$toList(y);\\\\n\\\\t}\\\\n\\\\t//*/\\\\n\\\\n\\\\tfor (var key in x)\\\\n\\\\t{\\\\n\\\\t\\\\tif (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn true;\\\\n}\\\\n\\\\nvar _Utils_equal = F2(_Utils_eq);\\\\nvar _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });\\\\n\\\\n\\\\n\\\\n// COMPARISONS\\\\n\\\\n// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on\\\\n// the particular integer values assigned to LT, EQ, and GT.\\\\n\\\\nfunction _Utils_cmp(x, y, ord)\\\\n{\\\\n\\\\tif (typeof x !== \\\\\\'object\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;\\\\n\\\\t}\\\\n\\\\n\\\\t/**_UNUSED/\\\\n\\\\tif (x instanceof String)\\\\n\\\\t{\\\\n\\\\t\\\\tvar a = x.valueOf();\\\\n\\\\t\\\\tvar b = y.valueOf();\\\\n\\\\t\\\\treturn a === b ? 0 : a < b ? -1 : 1;\\\\n\\\\t}\\\\n\\\\t//*/\\\\n\\\\n\\\\t/**/\\\\n\\\\tif (typeof x.$ === \\\\\\'undefined\\\\\\')\\\\n\\\\t//*/\\\\n\\\\t/**_UNUSED/\\\\n\\\\tif (x.$[0] === \\\\\\'#\\\\\\')\\\\n\\\\t//*/\\\\n\\\\t{\\\\n\\\\t\\\\treturn (ord = _Utils_cmp(x.a, y.a))\\\\n\\\\t\\\\t\\\\t? ord\\\\n\\\\t\\\\t\\\\t: (ord = _Utils_cmp(x.b, y.b))\\\\n\\\\t\\\\t\\\\t\\\\t? ord\\\\n\\\\t\\\\t\\\\t\\\\t: _Utils_cmp(x.c, y.c);\\\\n\\\\t}\\\\n\\\\n\\\\t// traverse conses until end of a list or a mismatch\\\\n\\\\tfor (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES\\\\n\\\\treturn ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);\\\\n}\\\\n\\\\nvar _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });\\\\nvar _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });\\\\nvar _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });\\\\nvar _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });\\\\n\\\\nvar _Utils_compare = F2(function(x, y)\\\\n{\\\\n\\\\tvar n = _Utils_cmp(x, y);\\\\n\\\\treturn n < 0 ? $elm$core$Basics$LT : n ? $elm$core$Basics$GT : $elm$core$Basics$EQ;\\\\n});\\\\n\\\\n\\\\n// COMMON VALUES\\\\n\\\\nvar _Utils_Tuple0 = 0;\\\\nvar _Utils_Tuple0_UNUSED = { $: \\\\\\'#0\\\\\\' };\\\\n\\\\nfunction _Utils_Tuple2(a, b) { return { a: a, b: b }; }\\\\nfunction _Utils_Tuple2_UNUSED(a, b) { return { $: \\\\\\'#2\\\\\\', a: a, b: b }; }\\\\n\\\\nfunction _Utils_Tuple3(a, b, c) { return { a: a, b: b, c: c }; }\\\\nfunction _Utils_Tuple3_UNUSED(a, b, c) { return { $: \\\\\\'#3\\\\\\', a: a, b: b, c: c }; }\\\\n\\\\nfunction _Utils_chr(c) { return c; }\\\\nfunction _Utils_chr_UNUSED(c) { return new String(c); }\\\\n\\\\n\\\\n// RECORDS\\\\n\\\\nfunction _Utils_update(oldRecord, updatedFields)\\\\n{\\\\n\\\\tvar newRecord = {};\\\\n\\\\n\\\\tfor (var key in oldRecord)\\\\n\\\\t{\\\\n\\\\t\\\\tnewRecord[key] = oldRecord[key];\\\\n\\\\t}\\\\n\\\\n\\\\tfor (var key in updatedFields)\\\\n\\\\t{\\\\n\\\\t\\\\tnewRecord[key] = updatedFields[key];\\\\n\\\\t}\\\\n\\\\n\\\\treturn newRecord;\\\\n}\\\\n\\\\n\\\\n// APPEND\\\\n\\\\nvar _Utils_append = F2(_Utils_ap);\\\\n\\\\nfunction _Utils_ap(xs, ys)\\\\n{\\\\n\\\\t// append Strings\\\\n\\\\tif (typeof xs === \\\\\\'string\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn xs + ys;\\\\n\\\\t}\\\\n\\\\n\\\\t// append Lists\\\\n\\\\tif (!xs.b)\\\\n\\\\t{\\\\n\\\\t\\\\treturn ys;\\\\n\\\\t}\\\\n\\\\tvar root = _List_Cons(xs.a, ys);\\\\n\\\\txs = xs.b\\\\n\\\\tfor (var curr = root; xs.b; xs = xs.b) // WHILE_CONS\\\\n\\\\t{\\\\n\\\\t\\\\tcurr = curr.b = _List_Cons(xs.a, ys);\\\\n\\\\t}\\\\n\\\\treturn root;\\\\n}\\\\n\\\\n\\\\n\\\\nvar _List_Nil = { $: 0 };\\\\nvar _List_Nil_UNUSED = { $: \\\\\\'[]\\\\\\' };\\\\n\\\\nfunction _List_Cons(hd, tl) { return { $: 1, a: hd, b: tl }; }\\\\nfunction _List_Cons_UNUSED(hd, tl) { return { $: \\\\\\'::\\\\\\', a: hd, b: tl }; }\\\\n\\\\n\\\\nvar _List_cons = F2(_List_Cons);\\\\n\\\\nfunction _List_fromArray(arr)\\\\n{\\\\n\\\\tvar out = _List_Nil;\\\\n\\\\tfor (var i = arr.length; i--; )\\\\n\\\\t{\\\\n\\\\t\\\\tout = _List_Cons(arr[i], out);\\\\n\\\\t}\\\\n\\\\treturn out;\\\\n}\\\\n\\\\nfunction _List_toArray(xs)\\\\n{\\\\n\\\\tfor (var out = []; xs.b; xs = xs.b) // WHILE_CONS\\\\n\\\\t{\\\\n\\\\t\\\\tout.push(xs.a);\\\\n\\\\t}\\\\n\\\\treturn out;\\\\n}\\\\n\\\\nvar _List_map2 = F3(function(f, xs, ys)\\\\n{\\\\n\\\\tfor (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES\\\\n\\\\t{\\\\n\\\\t\\\\tarr.push(A2(f, xs.a, ys.a));\\\\n\\\\t}\\\\n\\\\treturn _List_fromArray(arr);\\\\n});\\\\n\\\\nvar _List_map3 = F4(function(f, xs, ys, zs)\\\\n{\\\\n\\\\tfor (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\\\n\\\\t{\\\\n\\\\t\\\\tarr.push(A3(f, xs.a, ys.a, zs.a));\\\\n\\\\t}\\\\n\\\\treturn _List_fromArray(arr);\\\\n});\\\\n\\\\nvar _List_map4 = F5(function(f, ws, xs, ys, zs)\\\\n{\\\\n\\\\tfor (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\\\n\\\\t{\\\\n\\\\t\\\\tarr.push(A4(f, ws.a, xs.a, ys.a, zs.a));\\\\n\\\\t}\\\\n\\\\treturn _List_fromArray(arr);\\\\n});\\\\n\\\\nvar _List_map5 = F6(function(f, vs, ws, xs, ys, zs)\\\\n{\\\\n\\\\tfor (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES\\\\n\\\\t{\\\\n\\\\t\\\\tarr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));\\\\n\\\\t}\\\\n\\\\treturn _List_fromArray(arr);\\\\n});\\\\n\\\\nvar _List_sortBy = F2(function(f, xs)\\\\n{\\\\n\\\\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {\\\\n\\\\t\\\\treturn _Utils_cmp(f(a), f(b));\\\\n\\\\t}));\\\\n});\\\\n\\\\nvar _List_sortWith = F2(function(f, xs)\\\\n{\\\\n\\\\treturn _List_fromArray(_List_toArray(xs).sort(function(a, b) {\\\\n\\\\t\\\\tvar ord = A2(f, a, b);\\\\n\\\\t\\\\treturn ord === $elm$core$Basics$EQ ? 0 : ord === $elm$core$Basics$LT ? -1 : 1;\\\\n\\\\t}));\\\\n});\\\\n\\\\n\\\\n\\\\nvar _JsArray_empty = [];\\\\n\\\\nfunction _JsArray_singleton(value)\\\\n{\\\\n    return [value];\\\\n}\\\\n\\\\nfunction _JsArray_length(array)\\\\n{\\\\n    return array.length;\\\\n}\\\\n\\\\nvar _JsArray_initialize = F3(function(size, offset, func)\\\\n{\\\\n    var result = new Array(size);\\\\n\\\\n    for (var i = 0; i < size; i++)\\\\n    {\\\\n        result[i] = func(offset + i);\\\\n    }\\\\n\\\\n    return result;\\\\n});\\\\n\\\\nvar _JsArray_initializeFromList = F2(function (max, ls)\\\\n{\\\\n    var result = new Array(max);\\\\n\\\\n    for (var i = 0; i < max && ls.b; i++)\\\\n    {\\\\n        result[i] = ls.a;\\\\n        ls = ls.b;\\\\n    }\\\\n\\\\n    result.length = i;\\\\n    return _Utils_Tuple2(result, ls);\\\\n});\\\\n\\\\nvar _JsArray_unsafeGet = F2(function(index, array)\\\\n{\\\\n    return array[index];\\\\n});\\\\n\\\\nvar _JsArray_unsafeSet = F3(function(index, value, array)\\\\n{\\\\n    var length = array.length;\\\\n    var result = new Array(length);\\\\n\\\\n    for (var i = 0; i < length; i++)\\\\n    {\\\\n        result[i] = array[i];\\\\n    }\\\\n\\\\n    result[index] = value;\\\\n    return result;\\\\n});\\\\n\\\\nvar _JsArray_push = F2(function(value, array)\\\\n{\\\\n    var length = array.length;\\\\n    var result = new Array(length + 1);\\\\n\\\\n    for (var i = 0; i < length; i++)\\\\n    {\\\\n        result[i] = array[i];\\\\n    }\\\\n\\\\n    result[length] = value;\\\\n    return result;\\\\n});\\\\n\\\\nvar _JsArray_foldl = F3(function(func, acc, array)\\\\n{\\\\n    var length = array.length;\\\\n\\\\n    for (var i = 0; i < length; i++)\\\\n    {\\\\n        acc = A2(func, array[i], acc);\\\\n    }\\\\n\\\\n    return acc;\\\\n});\\\\n\\\\nvar _JsArray_foldr = F3(function(func, acc, array)\\\\n{\\\\n    for (var i = array.length - 1; i >= 0; i--)\\\\n    {\\\\n        acc = A2(func, array[i], acc);\\\\n    }\\\\n\\\\n    return acc;\\\\n});\\\\n\\\\nvar _JsArray_map = F2(function(func, array)\\\\n{\\\\n    var length = array.length;\\\\n    var result = new Array(length);\\\\n\\\\n    for (var i = 0; i < length; i++)\\\\n    {\\\\n        result[i] = func(array[i]);\\\\n    }\\\\n\\\\n    return result;\\\\n});\\\\n\\\\nvar _JsArray_indexedMap = F3(function(func, offset, array)\\\\n{\\\\n    var length = array.length;\\\\n    var result = new Array(length);\\\\n\\\\n    for (var i = 0; i < length; i++)\\\\n    {\\\\n        result[i] = A2(func, offset + i, array[i]);\\\\n    }\\\\n\\\\n    return result;\\\\n});\\\\n\\\\nvar _JsArray_slice = F3(function(from, to, array)\\\\n{\\\\n    return array.slice(from, to);\\\\n});\\\\n\\\\nvar _JsArray_appendN = F3(function(n, dest, source)\\\\n{\\\\n    var destLen = dest.length;\\\\n    var itemsToCopy = n - destLen;\\\\n\\\\n    if (itemsToCopy > source.length)\\\\n    {\\\\n        itemsToCopy = source.length;\\\\n    }\\\\n\\\\n    var size = destLen + itemsToCopy;\\\\n    var result = new Array(size);\\\\n\\\\n    for (var i = 0; i < destLen; i++)\\\\n    {\\\\n        result[i] = dest[i];\\\\n    }\\\\n\\\\n    for (var i = 0; i < itemsToCopy; i++)\\\\n    {\\\\n        result[i + destLen] = source[i];\\\\n    }\\\\n\\\\n    return result;\\\\n});\\\\n\\\\n\\\\n\\\\n// LOG\\\\n\\\\nvar _Debug_log = F2(function(tag, value)\\\\n{\\\\n\\\\treturn value;\\\\n});\\\\n\\\\nvar _Debug_log_UNUSED = F2(function(tag, value)\\\\n{\\\\n\\\\tconsole.log(tag + \\\\\\': \\\\\\' + _Debug_toString(value));\\\\n\\\\treturn value;\\\\n});\\\\n\\\\n\\\\n// TODOS\\\\n\\\\nfunction _Debug_todo(moduleName, region)\\\\n{\\\\n\\\\treturn function(message) {\\\\n\\\\t\\\\t_Debug_crash(8, moduleName, region, message);\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Debug_todoCase(moduleName, region, value)\\\\n{\\\\n\\\\treturn function(message) {\\\\n\\\\t\\\\t_Debug_crash(9, moduleName, region, value, message);\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n// TO STRING\\\\n\\\\nfunction _Debug_toString(value)\\\\n{\\\\n\\\\treturn \\\\\\'<internals>\\\\\\';\\\\n}\\\\n\\\\nfunction _Debug_toString_UNUSED(value)\\\\n{\\\\n\\\\treturn _Debug_toAnsiString(false, value);\\\\n}\\\\n\\\\nfunction _Debug_toAnsiString(ansi, value)\\\\n{\\\\n\\\\tif (typeof value === \\\\\\'function\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_internalColor(ansi, \\\\\\'<function>\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof value === \\\\\\'boolean\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_ctorColor(ansi, value ? \\\\\\'True\\\\\\' : \\\\\\'False\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof value === \\\\\\'number\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_numberColor(ansi, value + \\\\\\'\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (value instanceof String)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_charColor(ansi, "\\\\\\'" + _Debug_addSlashes(value, true) + "\\\\\\'");\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof value === \\\\\\'string\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_stringColor(ansi, \\\\\\'"\\\\\\' + _Debug_addSlashes(value, false) + \\\\\\'"\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof value === \\\\\\'object\\\\\\' && \\\\\\'$\\\\\\' in value)\\\\n\\\\t{\\\\n\\\\t\\\\tvar tag = value.$;\\\\n\\\\n\\\\t\\\\tif (typeof tag === \\\\\\'number\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn _Debug_internalColor(ansi, \\\\\\'<internals>\\\\\\');\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (tag[0] === \\\\\\'#\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar output = [];\\\\n\\\\t\\\\t\\\\tfor (var k in value)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tif (k === \\\\\\'$\\\\\\') continue;\\\\n\\\\t\\\\t\\\\t\\\\toutput.push(_Debug_toAnsiString(ansi, value[k]));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn \\\\\\'(\\\\\\' + output.join(\\\\\\',\\\\\\') + \\\\\\')\\\\\\';\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (tag === \\\\\\'Set_elm_builtin\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn _Debug_ctorColor(ansi, \\\\\\'Set\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_fadeColor(ansi, \\\\\\'.fromList\\\\\\') + \\\\\\' \\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_toAnsiString(ansi, $elm$core$Set$toList(value));\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (tag === \\\\\\'RBNode_elm_builtin\\\\\\' || tag === \\\\\\'RBEmpty_elm_builtin\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn _Debug_ctorColor(ansi, \\\\\\'Dict\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_fadeColor(ansi, \\\\\\'.fromList\\\\\\') + \\\\\\' \\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_toAnsiString(ansi, $elm$core$Dict$toList(value));\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (tag === \\\\\\'Array_elm_builtin\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn _Debug_ctorColor(ansi, \\\\\\'Array\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_fadeColor(ansi, \\\\\\'.fromList\\\\\\') + \\\\\\' \\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_toAnsiString(ansi, $elm$core$Array$toList(value));\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (tag === \\\\\\'::\\\\\\' || tag === \\\\\\'[]\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar output = \\\\\\'[\\\\\\';\\\\n\\\\n\\\\t\\\\t\\\\tvalue.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)\\\\n\\\\n\\\\t\\\\t\\\\tfor (; value.b; value = value.b) // WHILE_CONS\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\toutput += \\\\\\',\\\\\\' + _Debug_toAnsiString(ansi, value.a);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn output + \\\\\\']\\\\\\';\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tvar output = \\\\\\'\\\\\\';\\\\n\\\\t\\\\tfor (var i in value)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tif (i === \\\\\\'$\\\\\\') continue;\\\\n\\\\t\\\\t\\\\tvar str = _Debug_toAnsiString(ansi, value[i]);\\\\n\\\\t\\\\t\\\\tvar c0 = str[0];\\\\n\\\\t\\\\t\\\\tvar parenless = c0 === \\\\\\'{\\\\\\' || c0 === \\\\\\'(\\\\\\' || c0 === \\\\\\'[\\\\\\' || c0 === \\\\\\'<\\\\\\' || c0 === \\\\\\'"\\\\\\' || str.indexOf(\\\\\\' \\\\\\') < 0;\\\\n\\\\t\\\\t\\\\toutput += \\\\\\' \\\\\\' + (parenless ? str : \\\\\\'(\\\\\\' + str + \\\\\\')\\\\\\');\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\treturn _Debug_ctorColor(ansi, tag) + output;\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof DataView === \\\\\\'function\\\\\\' && value instanceof DataView)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_stringColor(ansi, \\\\\\'<\\\\\\' + value.byteLength + \\\\\\' bytes>\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof File !== \\\\\\'undefined\\\\\\' && value instanceof File)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _Debug_internalColor(ansi, \\\\\\'<\\\\\\' + value.name + \\\\\\'>\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\tif (typeof value === \\\\\\'object\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\tvar output = [];\\\\n\\\\t\\\\tfor (var key in value)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar field = key[0] === \\\\\\'_\\\\\\' ? key.slice(1) : key;\\\\n\\\\t\\\\t\\\\toutput.push(_Debug_fadeColor(ansi, field) + \\\\\\' = \\\\\\' + _Debug_toAnsiString(ansi, value[key]));\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tif (output.length === 0)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn \\\\\\'{}\\\\\\';\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\treturn \\\\\\'{ \\\\\\' + output.join(\\\\\\', \\\\\\') + \\\\\\' }\\\\\\';\\\\n\\\\t}\\\\n\\\\n\\\\treturn _Debug_internalColor(ansi, \\\\\\'<internals>\\\\\\');\\\\n}\\\\n\\\\nfunction _Debug_addSlashes(str, isChar)\\\\n{\\\\n\\\\tvar s = str\\\\n\\\\t\\\\t.replace(/\\\\\\\\\\\\\\\\/g, \\\\\\'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\')\\\\n\\\\t\\\\t.replace(/\\\\\\\\n/g, \\\\\\'\\\\\\\\\\\\\\\\n\\\\\\')\\\\n\\\\t\\\\t.replace(/\\\\\\\\t/g, \\\\\\'\\\\\\\\\\\\\\\\t\\\\\\')\\\\n\\\\t\\\\t.replace(/\\\\\\\\r/g, \\\\\\'\\\\\\\\\\\\\\\\r\\\\\\')\\\\n\\\\t\\\\t.replace(/\\\\\\\\v/g, \\\\\\'\\\\\\\\\\\\\\\\v\\\\\\')\\\\n\\\\t\\\\t.replace(/\\\\\\\\0/g, \\\\\\'\\\\\\\\\\\\\\\\0\\\\\\');\\\\n\\\\n\\\\tif (isChar)\\\\n\\\\t{\\\\n\\\\t\\\\treturn s.replace(/\\\\\\\\\\\\\\'/g, \\\\\\'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'\\\\\\');\\\\n\\\\t}\\\\n\\\\telse\\\\n\\\\t{\\\\n\\\\t\\\\treturn s.replace(/\\\\\\\\"/g, \\\\\\'\\\\\\\\\\\\\\\\"\\\\\\');\\\\n\\\\t}\\\\n}\\\\n\\\\nfunction _Debug_ctorColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[96m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_numberColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[95m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_stringColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[93m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_charColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[92m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_fadeColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[37m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_internalColor(ansi, string)\\\\n{\\\\n\\\\treturn ansi ? \\\\\\'\\\\\\\\x1b[36m\\\\\\' + string + \\\\\\'\\\\\\\\x1b[0m\\\\\\' : string;\\\\n}\\\\n\\\\nfunction _Debug_toHexDigit(n)\\\\n{\\\\n\\\\treturn String.fromCharCode(n < 10 ? 48 + n : 55 + n);\\\\n}\\\\n\\\\n\\\\n// CRASH\\\\n\\\\n\\\\nfunction _Debug_crash(identifier)\\\\n{\\\\n\\\\tthrow new Error(\\\\\\'https://github.com/elm/core/blob/1.0.0/hints/\\\\\\' + identifier + \\\\\\'.md\\\\\\');\\\\n}\\\\n\\\\n\\\\nfunction _Debug_crash_UNUSED(identifier, fact1, fact2, fact3, fact4)\\\\n{\\\\n\\\\tswitch(identifier)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'What node should I take over? In JavaScript I need something like:\\\\\\\\n\\\\\\\\n    Elm.Main.init({\\\\\\\\n        node: document.getElementById("elm-node")\\\\\\\\n    })\\\\\\\\n\\\\\\\\nYou need to do this with any Browser.sandbox or Browser.element program.\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Browser.application programs cannot handle URLs like this:\\\\\\\\n\\\\\\\\n    \\\\\\' + document.location.href + \\\\\\'\\\\\\\\n\\\\\\\\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\tvar jsonErrorString = fact1;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Problem with the flags given to your Elm program on initialization.\\\\\\\\n\\\\\\\\n\\\\\\' + jsonErrorString);\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\t\\\\tvar portName = fact1;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'There can only be one port named `\\\\\\' + portName + \\\\\\'`, but your program has multiple.\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 4:\\\\n\\\\t\\\\t\\\\tvar portName = fact1;\\\\n\\\\t\\\\t\\\\tvar problem = fact2;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Trying to send an unexpected type of value through port `\\\\\\' + portName + \\\\\\'`:\\\\\\\\n\\\\\\' + problem);\\\\n\\\\n\\\\t\\\\tcase 5:\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Trying to use `(==)` on functions.\\\\\\\\nThere is no way to know if functions are "the same" in the Elm sense.\\\\\\\\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 6:\\\\n\\\\t\\\\t\\\\tvar moduleName = fact1;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Your page is loading multiple Elm scripts with a module named \\\\\\' + moduleName + \\\\\\'. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 8:\\\\n\\\\t\\\\t\\\\tvar moduleName = fact1;\\\\n\\\\t\\\\t\\\\tvar region = fact2;\\\\n\\\\t\\\\t\\\\tvar message = fact3;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'TODO in module `\\\\\\' + moduleName + \\\\\\'` \\\\\\' + _Debug_regionToString(region) + \\\\\\'\\\\\\\\n\\\\\\\\n\\\\\\' + message);\\\\n\\\\n\\\\t\\\\tcase 9:\\\\n\\\\t\\\\t\\\\tvar moduleName = fact1;\\\\n\\\\t\\\\t\\\\tvar region = fact2;\\\\n\\\\t\\\\t\\\\tvar value = fact3;\\\\n\\\\t\\\\t\\\\tvar message = fact4;\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\\\'TODO in module `\\\\\\' + moduleName + \\\\\\'` from the `case` expression \\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_regionToString(region) + \\\\\\'\\\\\\\\n\\\\\\\\nIt received the following value:\\\\\\\\n\\\\\\\\n    \\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t+ _Debug_toString(value).replace(\\\\\\'\\\\\\\\n\\\\\\', \\\\\\'\\\\\\\\n    \\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t+ \\\\\\'\\\\\\\\n\\\\\\\\nBut the branch that handles it says:\\\\\\\\n\\\\\\\\n    \\\\\\' + message.replace(\\\\\\'\\\\\\\\n\\\\\\', \\\\\\'\\\\\\\\n    \\\\\\')\\\\n\\\\t\\\\t\\\\t);\\\\n\\\\n\\\\t\\\\tcase 10:\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Bug in https://github.com/elm/virtual-dom/issues\\\\\\');\\\\n\\\\n\\\\t\\\\tcase 11:\\\\n\\\\t\\\\t\\\\tthrow new Error(\\\\\\'Cannot perform mod 0. Division by zero error.\\\\\\');\\\\n\\\\t}\\\\n}\\\\n\\\\nfunction _Debug_regionToString(region)\\\\n{\\\\n\\\\tif (region.U.K === region.Z.K)\\\\n\\\\t{\\\\n\\\\t\\\\treturn \\\\\\'on line \\\\\\' + region.U.K;\\\\n\\\\t}\\\\n\\\\treturn \\\\\\'on lines \\\\\\' + region.U.K + \\\\\\' through \\\\\\' + region.Z.K;\\\\n}\\\\n\\\\n\\\\n\\\\n// MATH\\\\n\\\\nvar _Basics_add = F2(function(a, b) { return a + b; });\\\\nvar _Basics_sub = F2(function(a, b) { return a - b; });\\\\nvar _Basics_mul = F2(function(a, b) { return a * b; });\\\\nvar _Basics_fdiv = F2(function(a, b) { return a / b; });\\\\nvar _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });\\\\nvar _Basics_pow = F2(Math.pow);\\\\n\\\\nvar _Basics_remainderBy = F2(function(b, a) { return a % b; });\\\\n\\\\n// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf\\\\nvar _Basics_modBy = F2(function(modulus, x)\\\\n{\\\\n\\\\tvar answer = x % modulus;\\\\n\\\\treturn modulus === 0\\\\n\\\\t\\\\t? _Debug_crash(11)\\\\n\\\\t\\\\t:\\\\n\\\\t((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))\\\\n\\\\t\\\\t? answer + modulus\\\\n\\\\t\\\\t: answer;\\\\n});\\\\n\\\\n\\\\n// TRIGONOMETRY\\\\n\\\\nvar _Basics_pi = Math.PI;\\\\nvar _Basics_e = Math.E;\\\\nvar _Basics_cos = Math.cos;\\\\nvar _Basics_sin = Math.sin;\\\\nvar _Basics_tan = Math.tan;\\\\nvar _Basics_acos = Math.acos;\\\\nvar _Basics_asin = Math.asin;\\\\nvar _Basics_atan = Math.atan;\\\\nvar _Basics_atan2 = F2(Math.atan2);\\\\n\\\\n\\\\n// MORE MATH\\\\n\\\\nfunction _Basics_toFloat(x) { return x; }\\\\nfunction _Basics_truncate(n) { return n | 0; }\\\\nfunction _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }\\\\n\\\\nvar _Basics_ceiling = Math.ceil;\\\\nvar _Basics_floor = Math.floor;\\\\nvar _Basics_round = Math.round;\\\\nvar _Basics_sqrt = Math.sqrt;\\\\nvar _Basics_log = Math.log;\\\\nvar _Basics_isNaN = isNaN;\\\\n\\\\n\\\\n// BOOLEANS\\\\n\\\\nfunction _Basics_not(bool) { return !bool; }\\\\nvar _Basics_and = F2(function(a, b) { return a && b; });\\\\nvar _Basics_or  = F2(function(a, b) { return a || b; });\\\\nvar _Basics_xor = F2(function(a, b) { return a !== b; });\\\\n\\\\n\\\\n\\\\nvar _String_cons = F2(function(chr, str)\\\\n{\\\\n\\\\treturn chr + str;\\\\n});\\\\n\\\\nfunction _String_uncons(string)\\\\n{\\\\n\\\\tvar word = string.charCodeAt(0);\\\\n\\\\treturn !isNaN(word)\\\\n\\\\t\\\\t? $elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t0xD800 <= word && word <= 0xDBFF\\\\n\\\\t\\\\t\\\\t\\\\t? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))\\\\n\\\\t\\\\t\\\\t\\\\t: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))\\\\n\\\\t\\\\t)\\\\n\\\\t\\\\t: $elm$core$Maybe$Nothing;\\\\n}\\\\n\\\\nvar _String_append = F2(function(a, b)\\\\n{\\\\n\\\\treturn a + b;\\\\n});\\\\n\\\\nfunction _String_length(str)\\\\n{\\\\n\\\\treturn str.length;\\\\n}\\\\n\\\\nvar _String_map = F2(function(func, string)\\\\n{\\\\n\\\\tvar len = string.length;\\\\n\\\\tvar array = new Array(len);\\\\n\\\\tvar i = 0;\\\\n\\\\twhile (i < len)\\\\n\\\\t{\\\\n\\\\t\\\\tvar word = string.charCodeAt(i);\\\\n\\\\t\\\\tif (0xD800 <= word && word <= 0xDBFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tarray[i] = func(_Utils_chr(string[i] + string[i+1]));\\\\n\\\\t\\\\t\\\\ti += 2;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tarray[i] = func(_Utils_chr(string[i]));\\\\n\\\\t\\\\ti++;\\\\n\\\\t}\\\\n\\\\treturn array.join(\\\\\\'\\\\\\');\\\\n});\\\\n\\\\nvar _String_filter = F2(function(isGood, str)\\\\n{\\\\n\\\\tvar arr = [];\\\\n\\\\tvar len = str.length;\\\\n\\\\tvar i = 0;\\\\n\\\\twhile (i < len)\\\\n\\\\t{\\\\n\\\\t\\\\tvar char = str[i];\\\\n\\\\t\\\\tvar word = str.charCodeAt(i);\\\\n\\\\t\\\\ti++;\\\\n\\\\t\\\\tif (0xD800 <= word && word <= 0xDBFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tchar += str[i];\\\\n\\\\t\\\\t\\\\ti++;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (isGood(_Utils_chr(char)))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tarr.push(char);\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn arr.join(\\\\\\'\\\\\\');\\\\n});\\\\n\\\\nfunction _String_reverse(str)\\\\n{\\\\n\\\\tvar len = str.length;\\\\n\\\\tvar arr = new Array(len);\\\\n\\\\tvar i = 0;\\\\n\\\\twhile (i < len)\\\\n\\\\t{\\\\n\\\\t\\\\tvar word = str.charCodeAt(i);\\\\n\\\\t\\\\tif (0xD800 <= word && word <= 0xDBFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tarr[len - i] = str[i + 1];\\\\n\\\\t\\\\t\\\\ti++;\\\\n\\\\t\\\\t\\\\tarr[len - i] = str[i - 1];\\\\n\\\\t\\\\t\\\\ti++;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tarr[len - i] = str[i];\\\\n\\\\t\\\\t\\\\ti++;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn arr.join(\\\\\\'\\\\\\');\\\\n}\\\\n\\\\nvar _String_foldl = F3(function(func, state, string)\\\\n{\\\\n\\\\tvar len = string.length;\\\\n\\\\tvar i = 0;\\\\n\\\\twhile (i < len)\\\\n\\\\t{\\\\n\\\\t\\\\tvar char = string[i];\\\\n\\\\t\\\\tvar word = string.charCodeAt(i);\\\\n\\\\t\\\\ti++;\\\\n\\\\t\\\\tif (0xD800 <= word && word <= 0xDBFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tchar += string[i];\\\\n\\\\t\\\\t\\\\ti++;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tstate = A2(func, _Utils_chr(char), state);\\\\n\\\\t}\\\\n\\\\treturn state;\\\\n});\\\\n\\\\nvar _String_foldr = F3(function(func, state, string)\\\\n{\\\\n\\\\tvar i = string.length;\\\\n\\\\twhile (i--)\\\\n\\\\t{\\\\n\\\\t\\\\tvar char = string[i];\\\\n\\\\t\\\\tvar word = string.charCodeAt(i);\\\\n\\\\t\\\\tif (0xDC00 <= word && word <= 0xDFFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ti--;\\\\n\\\\t\\\\t\\\\tchar = string[i] + char;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tstate = A2(func, _Utils_chr(char), state);\\\\n\\\\t}\\\\n\\\\treturn state;\\\\n});\\\\n\\\\nvar _String_split = F2(function(sep, str)\\\\n{\\\\n\\\\treturn str.split(sep);\\\\n});\\\\n\\\\nvar _String_join = F2(function(sep, strs)\\\\n{\\\\n\\\\treturn strs.join(sep);\\\\n});\\\\n\\\\nvar _String_slice = F3(function(start, end, str) {\\\\n\\\\treturn str.slice(start, end);\\\\n});\\\\n\\\\nfunction _String_trim(str)\\\\n{\\\\n\\\\treturn str.trim();\\\\n}\\\\n\\\\nfunction _String_trimLeft(str)\\\\n{\\\\n\\\\treturn str.replace(/^\\\\\\\\s+/, \\\\\\'\\\\\\');\\\\n}\\\\n\\\\nfunction _String_trimRight(str)\\\\n{\\\\n\\\\treturn str.replace(/\\\\\\\\s+$/, \\\\\\'\\\\\\');\\\\n}\\\\n\\\\nfunction _String_words(str)\\\\n{\\\\n\\\\treturn _List_fromArray(str.trim().split(/\\\\\\\\s+/g));\\\\n}\\\\n\\\\nfunction _String_lines(str)\\\\n{\\\\n\\\\treturn _List_fromArray(str.split(/\\\\\\\\r\\\\\\\\n|\\\\\\\\r|\\\\\\\\n/g));\\\\n}\\\\n\\\\nfunction _String_toUpper(str)\\\\n{\\\\n\\\\treturn str.toUpperCase();\\\\n}\\\\n\\\\nfunction _String_toLower(str)\\\\n{\\\\n\\\\treturn str.toLowerCase();\\\\n}\\\\n\\\\nvar _String_any = F2(function(isGood, string)\\\\n{\\\\n\\\\tvar i = string.length;\\\\n\\\\twhile (i--)\\\\n\\\\t{\\\\n\\\\t\\\\tvar char = string[i];\\\\n\\\\t\\\\tvar word = string.charCodeAt(i);\\\\n\\\\t\\\\tif (0xDC00 <= word && word <= 0xDFFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ti--;\\\\n\\\\t\\\\t\\\\tchar = string[i] + char;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tif (isGood(_Utils_chr(char)))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn true;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn false;\\\\n});\\\\n\\\\nvar _String_all = F2(function(isGood, string)\\\\n{\\\\n\\\\tvar i = string.length;\\\\n\\\\twhile (i--)\\\\n\\\\t{\\\\n\\\\t\\\\tvar char = string[i];\\\\n\\\\t\\\\tvar word = string.charCodeAt(i);\\\\n\\\\t\\\\tif (0xDC00 <= word && word <= 0xDFFF)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ti--;\\\\n\\\\t\\\\t\\\\tchar = string[i] + char;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tif (!isGood(_Utils_chr(char)))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn true;\\\\n});\\\\n\\\\nvar _String_contains = F2(function(sub, str)\\\\n{\\\\n\\\\treturn str.indexOf(sub) > -1;\\\\n});\\\\n\\\\nvar _String_startsWith = F2(function(sub, str)\\\\n{\\\\n\\\\treturn str.indexOf(sub) === 0;\\\\n});\\\\n\\\\nvar _String_endsWith = F2(function(sub, str)\\\\n{\\\\n\\\\treturn str.length >= sub.length &&\\\\n\\\\t\\\\tstr.lastIndexOf(sub) === str.length - sub.length;\\\\n});\\\\n\\\\nvar _String_indexes = F2(function(sub, str)\\\\n{\\\\n\\\\tvar subLen = sub.length;\\\\n\\\\n\\\\tif (subLen < 1)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _List_Nil;\\\\n\\\\t}\\\\n\\\\n\\\\tvar i = 0;\\\\n\\\\tvar is = [];\\\\n\\\\n\\\\twhile ((i = str.indexOf(sub, i)) > -1)\\\\n\\\\t{\\\\n\\\\t\\\\tis.push(i);\\\\n\\\\t\\\\ti = i + subLen;\\\\n\\\\t}\\\\n\\\\n\\\\treturn _List_fromArray(is);\\\\n});\\\\n\\\\n\\\\n// TO STRING\\\\n\\\\nfunction _String_fromNumber(number)\\\\n{\\\\n\\\\treturn number + \\\\\\'\\\\\\';\\\\n}\\\\n\\\\n\\\\n// INT CONVERSIONS\\\\n\\\\nfunction _String_toInt(str)\\\\n{\\\\n\\\\tvar total = 0;\\\\n\\\\tvar code0 = str.charCodeAt(0);\\\\n\\\\tvar start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;\\\\n\\\\n\\\\tfor (var i = start; i < str.length; ++i)\\\\n\\\\t{\\\\n\\\\t\\\\tvar code = str.charCodeAt(i);\\\\n\\\\t\\\\tif (code < 0x30 || 0x39 < code)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\ttotal = 10 * total + code - 0x30;\\\\n\\\\t}\\\\n\\\\n\\\\treturn i == start\\\\n\\\\t\\\\t? $elm$core$Maybe$Nothing\\\\n\\\\t\\\\t: $elm$core$Maybe$Just(code0 == 0x2D ? -total : total);\\\\n}\\\\n\\\\n\\\\n// FLOAT CONVERSIONS\\\\n\\\\nfunction _String_toFloat(s)\\\\n{\\\\n\\\\t// check if it is a hex, octal, or binary number\\\\n\\\\tif (s.length === 0 || /[\\\\\\\\sxbo]/.test(s))\\\\n\\\\t{\\\\n\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t}\\\\n\\\\tvar n = +s;\\\\n\\\\t// faster isNaN check\\\\n\\\\treturn n === n ? $elm$core$Maybe$Just(n) : $elm$core$Maybe$Nothing;\\\\n}\\\\n\\\\nfunction _String_fromList(chars)\\\\n{\\\\n\\\\treturn _List_toArray(chars).join(\\\\\\'\\\\\\');\\\\n}\\\\n\\\\n\\\\n\\\\n\\\\nfunction _Char_toCode(char)\\\\n{\\\\n\\\\tvar code = char.charCodeAt(0);\\\\n\\\\tif (0xD800 <= code && code <= 0xDBFF)\\\\n\\\\t{\\\\n\\\\t\\\\treturn (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000\\\\n\\\\t}\\\\n\\\\treturn code;\\\\n}\\\\n\\\\nfunction _Char_fromCode(code)\\\\n{\\\\n\\\\treturn _Utils_chr(\\\\n\\\\t\\\\t(code < 0 || 0x10FFFF < code)\\\\n\\\\t\\\\t\\\\t? \\\\\\'\\\\\\\\uFFFD\\\\\\'\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t(code <= 0xFFFF)\\\\n\\\\t\\\\t\\\\t? String.fromCharCode(code)\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t(code -= 0x10000,\\\\n\\\\t\\\\t\\\\tString.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)\\\\n\\\\t\\\\t)\\\\n\\\\t);\\\\n}\\\\n\\\\nfunction _Char_toUpper(char)\\\\n{\\\\n\\\\treturn _Utils_chr(char.toUpperCase());\\\\n}\\\\n\\\\nfunction _Char_toLower(char)\\\\n{\\\\n\\\\treturn _Utils_chr(char.toLowerCase());\\\\n}\\\\n\\\\nfunction _Char_toLocaleUpper(char)\\\\n{\\\\n\\\\treturn _Utils_chr(char.toLocaleUpperCase());\\\\n}\\\\n\\\\nfunction _Char_toLocaleLower(char)\\\\n{\\\\n\\\\treturn _Utils_chr(char.toLocaleLowerCase());\\\\n}\\\\n\\\\n\\\\n\\\\n/**_UNUSED/\\\\nfunction _Json_errorToString(error)\\\\n{\\\\n\\\\treturn $elm$json$Json$Decode$errorToString(error);\\\\n}\\\\n//*/\\\\n\\\\n\\\\n// CORE DECODERS\\\\n\\\\nfunction _Json_succeed(msg)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 0,\\\\n\\\\t\\\\ta: msg\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Json_fail(msg)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 1,\\\\n\\\\t\\\\ta: msg\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Json_decodePrim(decoder)\\\\n{\\\\n\\\\treturn { $: 2, b: decoder };\\\\n}\\\\n\\\\nvar _Json_decodeInt = _Json_decodePrim(function(value) {\\\\n\\\\treturn (typeof value !== \\\\\\'number\\\\\\')\\\\n\\\\t\\\\t? _Json_expecting(\\\\\\'an INT\\\\\\', value)\\\\n\\\\t\\\\t:\\\\n\\\\t(-2147483647 < value && value < 2147483647 && (value | 0) === value)\\\\n\\\\t\\\\t? $elm$core$Result$Ok(value)\\\\n\\\\t\\\\t:\\\\n\\\\t(isFinite(value) && !(value % 1))\\\\n\\\\t\\\\t? $elm$core$Result$Ok(value)\\\\n\\\\t\\\\t: _Json_expecting(\\\\\\'an INT\\\\\\', value);\\\\n});\\\\n\\\\nvar _Json_decodeBool = _Json_decodePrim(function(value) {\\\\n\\\\treturn (typeof value === \\\\\\'boolean\\\\\\')\\\\n\\\\t\\\\t? $elm$core$Result$Ok(value)\\\\n\\\\t\\\\t: _Json_expecting(\\\\\\'a BOOL\\\\\\', value);\\\\n});\\\\n\\\\nvar _Json_decodeFloat = _Json_decodePrim(function(value) {\\\\n\\\\treturn (typeof value === \\\\\\'number\\\\\\')\\\\n\\\\t\\\\t? $elm$core$Result$Ok(value)\\\\n\\\\t\\\\t: _Json_expecting(\\\\\\'a FLOAT\\\\\\', value);\\\\n});\\\\n\\\\nvar _Json_decodeValue = _Json_decodePrim(function(value) {\\\\n\\\\treturn $elm$core$Result$Ok(_Json_wrap(value));\\\\n});\\\\n\\\\nvar _Json_decodeString = _Json_decodePrim(function(value) {\\\\n\\\\treturn (typeof value === \\\\\\'string\\\\\\')\\\\n\\\\t\\\\t? $elm$core$Result$Ok(value)\\\\n\\\\t\\\\t: (value instanceof String)\\\\n\\\\t\\\\t\\\\t? $elm$core$Result$Ok(value + \\\\\\'\\\\\\')\\\\n\\\\t\\\\t\\\\t: _Json_expecting(\\\\\\'a STRING\\\\\\', value);\\\\n});\\\\n\\\\nfunction _Json_decodeList(decoder) { return { $: 3, b: decoder }; }\\\\nfunction _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }\\\\n\\\\nfunction _Json_decodeNull(value) { return { $: 5, c: value }; }\\\\n\\\\nvar _Json_decodeField = F2(function(field, decoder)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 6,\\\\n\\\\t\\\\td: field,\\\\n\\\\t\\\\tb: decoder\\\\n\\\\t};\\\\n});\\\\n\\\\nvar _Json_decodeIndex = F2(function(index, decoder)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 7,\\\\n\\\\t\\\\te: index,\\\\n\\\\t\\\\tb: decoder\\\\n\\\\t};\\\\n});\\\\n\\\\nfunction _Json_decodeKeyValuePairs(decoder)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 8,\\\\n\\\\t\\\\tb: decoder\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Json_mapMany(f, decoders)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 9,\\\\n\\\\t\\\\tf: f,\\\\n\\\\t\\\\tg: decoders\\\\n\\\\t};\\\\n}\\\\n\\\\nvar _Json_andThen = F2(function(callback, decoder)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 10,\\\\n\\\\t\\\\tb: decoder,\\\\n\\\\t\\\\th: callback\\\\n\\\\t};\\\\n});\\\\n\\\\nfunction _Json_oneOf(decoders)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 11,\\\\n\\\\t\\\\tg: decoders\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n// DECODING OBJECTS\\\\n\\\\nvar _Json_map1 = F2(function(f, d1)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1]);\\\\n});\\\\n\\\\nvar _Json_map2 = F3(function(f, d1, d2)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2]);\\\\n});\\\\n\\\\nvar _Json_map3 = F4(function(f, d1, d2, d3)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3]);\\\\n});\\\\n\\\\nvar _Json_map4 = F5(function(f, d1, d2, d3, d4)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3, d4]);\\\\n});\\\\n\\\\nvar _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5]);\\\\n});\\\\n\\\\nvar _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);\\\\n});\\\\n\\\\nvar _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);\\\\n});\\\\n\\\\nvar _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)\\\\n{\\\\n\\\\treturn _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);\\\\n});\\\\n\\\\n\\\\n// DECODE\\\\n\\\\nvar _Json_runOnString = F2(function(decoder, string)\\\\n{\\\\n\\\\ttry\\\\n\\\\t{\\\\n\\\\t\\\\tvar value = JSON.parse(string);\\\\n\\\\t\\\\treturn _Json_runHelp(decoder, value);\\\\n\\\\t}\\\\n\\\\tcatch (e)\\\\n\\\\t{\\\\n\\\\t\\\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, \\\\\\'This is not valid JSON! \\\\\\' + e.message, _Json_wrap(string)));\\\\n\\\\t}\\\\n});\\\\n\\\\nvar _Json_run = F2(function(decoder, value)\\\\n{\\\\n\\\\treturn _Json_runHelp(decoder, _Json_unwrap(value));\\\\n});\\\\n\\\\nfunction _Json_runHelp(decoder, value)\\\\n{\\\\n\\\\tswitch (decoder.$)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\treturn decoder.b(value);\\\\n\\\\n\\\\t\\\\tcase 5:\\\\n\\\\t\\\\t\\\\treturn (value === null)\\\\n\\\\t\\\\t\\\\t\\\\t? $elm$core$Result$Ok(decoder.c)\\\\n\\\\t\\\\t\\\\t\\\\t: _Json_expecting(\\\\\\'null\\\\\\', value);\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\t\\\\tif (!_Json_isArray(value))\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'a LIST\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn _Json_runArrayDecoder(decoder.b, value, _List_fromArray);\\\\n\\\\n\\\\t\\\\tcase 4:\\\\n\\\\t\\\\t\\\\tif (!_Json_isArray(value))\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'an ARRAY\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);\\\\n\\\\n\\\\t\\\\tcase 6:\\\\n\\\\t\\\\t\\\\tvar field = decoder.d;\\\\n\\\\t\\\\t\\\\tif (typeof value !== \\\\\\'object\\\\\\' || value === null || !(field in value))\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'an OBJECT with a field named `\\\\\\' + field + \\\\\\'`\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tvar result = _Json_runHelp(decoder.b, value[field]);\\\\n\\\\t\\\\t\\\\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, field, result.a));\\\\n\\\\n\\\\t\\\\tcase 7:\\\\n\\\\t\\\\t\\\\tvar index = decoder.e;\\\\n\\\\t\\\\t\\\\tif (!_Json_isArray(value))\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'an ARRAY\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tif (index >= value.length)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'a LONGER array. Need index \\\\\\' + index + \\\\\\' but only see \\\\\\' + value.length + \\\\\\' entries\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tvar result = _Json_runHelp(decoder.b, value[index]);\\\\n\\\\t\\\\t\\\\treturn ($elm$core$Result$isOk(result)) ? result : $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, index, result.a));\\\\n\\\\n\\\\t\\\\tcase 8:\\\\n\\\\t\\\\t\\\\tif (typeof value !== \\\\\\'object\\\\\\' || value === null || _Json_isArray(value))\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn _Json_expecting(\\\\\\'an OBJECT\\\\\\', value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\tvar keyValuePairs = _List_Nil;\\\\n\\\\t\\\\t\\\\t// TODO test perf of Object.keys and switch when support is good enough\\\\n\\\\t\\\\t\\\\tfor (var key in value)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tif (value.hasOwnProperty(key))\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar result = _Json_runHelp(decoder.b, value[key]);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tif (!$elm$core$Result$isOk(result))\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Field, key, result.a));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tkeyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Ok($elm$core$List$reverse(keyValuePairs));\\\\n\\\\n\\\\t\\\\tcase 9:\\\\n\\\\t\\\\t\\\\tvar answer = decoder.f;\\\\n\\\\t\\\\t\\\\tvar decoders = decoder.g;\\\\n\\\\t\\\\t\\\\tfor (var i = 0; i < decoders.length; i++)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tvar result = _Json_runHelp(decoders[i], value);\\\\n\\\\t\\\\t\\\\t\\\\tif (!$elm$core$Result$isOk(result))\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn result;\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\tanswer = answer(result.a);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Ok(answer);\\\\n\\\\n\\\\t\\\\tcase 10:\\\\n\\\\t\\\\t\\\\tvar result = _Json_runHelp(decoder.b, value);\\\\n\\\\t\\\\t\\\\treturn (!$elm$core$Result$isOk(result))\\\\n\\\\t\\\\t\\\\t\\\\t? result\\\\n\\\\t\\\\t\\\\t\\\\t: _Json_runHelp(decoder.h(result.a), value);\\\\n\\\\n\\\\t\\\\tcase 11:\\\\n\\\\t\\\\t\\\\tvar errors = _List_Nil;\\\\n\\\\t\\\\t\\\\tfor (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tvar result = _Json_runHelp(temp.a, value);\\\\n\\\\t\\\\t\\\\t\\\\tif ($elm$core$Result$isOk(result))\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn result;\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\terrors = _List_Cons(result.a, errors);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Err($elm$json$Json$Decode$OneOf($elm$core$List$reverse(errors)));\\\\n\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));\\\\n\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Ok(decoder.a);\\\\n\\\\t}\\\\n}\\\\n\\\\nfunction _Json_runArrayDecoder(decoder, value, toElmValue)\\\\n{\\\\n\\\\tvar len = value.length;\\\\n\\\\tvar array = new Array(len);\\\\n\\\\tfor (var i = 0; i < len; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tvar result = _Json_runHelp(decoder, value[i]);\\\\n\\\\t\\\\tif (!$elm$core$Result$isOk(result))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Index, i, result.a));\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tarray[i] = result.a;\\\\n\\\\t}\\\\n\\\\treturn $elm$core$Result$Ok(toElmValue(array));\\\\n}\\\\n\\\\nfunction _Json_isArray(value)\\\\n{\\\\n\\\\treturn Array.isArray(value) || (typeof FileList !== \\\\\\'undefined\\\\\\' && value instanceof FileList);\\\\n}\\\\n\\\\nfunction _Json_toElmArray(array)\\\\n{\\\\n\\\\treturn A2($elm$core$Array$initialize, array.length, function(i) { return array[i]; });\\\\n}\\\\n\\\\nfunction _Json_expecting(type, value)\\\\n{\\\\n\\\\treturn $elm$core$Result$Err(A2($elm$json$Json$Decode$Failure, \\\\\\'Expecting \\\\\\' + type, _Json_wrap(value)));\\\\n}\\\\n\\\\n\\\\n// EQUALITY\\\\n\\\\nfunction _Json_equality(x, y)\\\\n{\\\\n\\\\tif (x === y)\\\\n\\\\t{\\\\n\\\\t\\\\treturn true;\\\\n\\\\t}\\\\n\\\\n\\\\tif (x.$ !== y.$)\\\\n\\\\t{\\\\n\\\\t\\\\treturn false;\\\\n\\\\t}\\\\n\\\\n\\\\tswitch (x.$)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\treturn x.a === y.a;\\\\n\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\treturn x.b === y.b;\\\\n\\\\n\\\\t\\\\tcase 5:\\\\n\\\\t\\\\t\\\\treturn x.c === y.c;\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\tcase 4:\\\\n\\\\t\\\\tcase 8:\\\\n\\\\t\\\\t\\\\treturn _Json_equality(x.b, y.b);\\\\n\\\\n\\\\t\\\\tcase 6:\\\\n\\\\t\\\\t\\\\treturn x.d === y.d && _Json_equality(x.b, y.b);\\\\n\\\\n\\\\t\\\\tcase 7:\\\\n\\\\t\\\\t\\\\treturn x.e === y.e && _Json_equality(x.b, y.b);\\\\n\\\\n\\\\t\\\\tcase 9:\\\\n\\\\t\\\\t\\\\treturn x.f === y.f && _Json_listEquality(x.g, y.g);\\\\n\\\\n\\\\t\\\\tcase 10:\\\\n\\\\t\\\\t\\\\treturn x.h === y.h && _Json_equality(x.b, y.b);\\\\n\\\\n\\\\t\\\\tcase 11:\\\\n\\\\t\\\\t\\\\treturn _Json_listEquality(x.g, y.g);\\\\n\\\\t}\\\\n}\\\\n\\\\nfunction _Json_listEquality(aDecoders, bDecoders)\\\\n{\\\\n\\\\tvar len = aDecoders.length;\\\\n\\\\tif (len !== bDecoders.length)\\\\n\\\\t{\\\\n\\\\t\\\\treturn false;\\\\n\\\\t}\\\\n\\\\tfor (var i = 0; i < len; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tif (!_Json_equality(aDecoders[i], bDecoders[i]))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn true;\\\\n}\\\\n\\\\n\\\\n// ENCODE\\\\n\\\\nvar _Json_encode = F2(function(indentLevel, value)\\\\n{\\\\n\\\\treturn JSON.stringify(_Json_unwrap(value), null, indentLevel) + \\\\\\'\\\\\\';\\\\n});\\\\n\\\\nfunction _Json_wrap_UNUSED(value) { return { $: 0, a: value }; }\\\\nfunction _Json_unwrap_UNUSED(value) { return value.a; }\\\\n\\\\nfunction _Json_wrap(value) { return value; }\\\\nfunction _Json_unwrap(value) { return value; }\\\\n\\\\nfunction _Json_emptyArray() { return []; }\\\\nfunction _Json_emptyObject() { return {}; }\\\\n\\\\nvar _Json_addField = F3(function(key, value, object)\\\\n{\\\\n\\\\tobject[key] = _Json_unwrap(value);\\\\n\\\\treturn object;\\\\n});\\\\n\\\\nfunction _Json_addEntry(func)\\\\n{\\\\n\\\\treturn F2(function(entry, array)\\\\n\\\\t{\\\\n\\\\t\\\\tarray.push(_Json_unwrap(func(entry)));\\\\n\\\\t\\\\treturn array;\\\\n\\\\t});\\\\n}\\\\n\\\\nvar _Json_encodeNull = _Json_wrap(null);\\\\n\\\\n\\\\n\\\\n// TASKS\\\\n\\\\nfunction _Scheduler_succeed(value)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 0,\\\\n\\\\t\\\\ta: value\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Scheduler_fail(error)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 1,\\\\n\\\\t\\\\ta: error\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Scheduler_binding(callback)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 2,\\\\n\\\\t\\\\tb: callback,\\\\n\\\\t\\\\tc: null\\\\n\\\\t};\\\\n}\\\\n\\\\nvar _Scheduler_andThen = F2(function(callback, task)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 3,\\\\n\\\\t\\\\tb: callback,\\\\n\\\\t\\\\td: task\\\\n\\\\t};\\\\n});\\\\n\\\\nvar _Scheduler_onError = F2(function(callback, task)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 4,\\\\n\\\\t\\\\tb: callback,\\\\n\\\\t\\\\td: task\\\\n\\\\t};\\\\n});\\\\n\\\\nfunction _Scheduler_receive(callback)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 5,\\\\n\\\\t\\\\tb: callback\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n// PROCESSES\\\\n\\\\nvar _Scheduler_guid = 0;\\\\n\\\\nfunction _Scheduler_rawSpawn(task)\\\\n{\\\\n\\\\tvar proc = {\\\\n\\\\t\\\\t$: 0,\\\\n\\\\t\\\\te: _Scheduler_guid++,\\\\n\\\\t\\\\tf: task,\\\\n\\\\t\\\\tg: null,\\\\n\\\\t\\\\th: []\\\\n\\\\t};\\\\n\\\\n\\\\t_Scheduler_enqueue(proc);\\\\n\\\\n\\\\treturn proc;\\\\n}\\\\n\\\\nfunction _Scheduler_spawn(task)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback) {\\\\n\\\\t\\\\tcallback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));\\\\n\\\\t});\\\\n}\\\\n\\\\nfunction _Scheduler_rawSend(proc, msg)\\\\n{\\\\n\\\\tproc.h.push(msg);\\\\n\\\\t_Scheduler_enqueue(proc);\\\\n}\\\\n\\\\nvar _Scheduler_send = F2(function(proc, msg)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback) {\\\\n\\\\t\\\\t_Scheduler_rawSend(proc, msg);\\\\n\\\\t\\\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\\\n\\\\t});\\\\n});\\\\n\\\\nfunction _Scheduler_kill(proc)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback) {\\\\n\\\\t\\\\tvar task = proc.f;\\\\n\\\\t\\\\tif (task.$ === 2 && task.c)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ttask.c();\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tproc.f = null;\\\\n\\\\n\\\\t\\\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\n/* STEP PROCESSES\\\\n\\\\ntype alias Process =\\\\n  { $ : tag\\\\n  , id : unique_id\\\\n  , root : Task\\\\n  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }\\\\n  , mailbox : [msg]\\\\n  }\\\\n\\\\n*/\\\\n\\\\n\\\\nvar _Scheduler_working = false;\\\\nvar _Scheduler_queue = [];\\\\n\\\\n\\\\nfunction _Scheduler_enqueue(proc)\\\\n{\\\\n\\\\t_Scheduler_queue.push(proc);\\\\n\\\\tif (_Scheduler_working)\\\\n\\\\t{\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\t_Scheduler_working = true;\\\\n\\\\twhile (proc = _Scheduler_queue.shift())\\\\n\\\\t{\\\\n\\\\t\\\\t_Scheduler_step(proc);\\\\n\\\\t}\\\\n\\\\t_Scheduler_working = false;\\\\n}\\\\n\\\\n\\\\nfunction _Scheduler_step(proc)\\\\n{\\\\n\\\\twhile (proc.f)\\\\n\\\\t{\\\\n\\\\t\\\\tvar rootTag = proc.f.$;\\\\n\\\\t\\\\tif (rootTag === 0 || rootTag === 1)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\twhile (proc.g && proc.g.$ !== rootTag)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tproc.g = proc.g.i;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tif (!proc.g)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tproc.f = proc.g.b(proc.f.a);\\\\n\\\\t\\\\t\\\\tproc.g = proc.g.i;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse if (rootTag === 2)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tproc.f.c = proc.f.b(function(newRoot) {\\\\n\\\\t\\\\t\\\\t\\\\tproc.f = newRoot;\\\\n\\\\t\\\\t\\\\t\\\\t_Scheduler_enqueue(proc);\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse if (rootTag === 5)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tif (proc.h.length === 0)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tproc.f = proc.f.b(proc.h.shift());\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse // if (rootTag === 3 || rootTag === 4)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tproc.g = {\\\\n\\\\t\\\\t\\\\t\\\\t$: rootTag === 3 ? 0 : 1,\\\\n\\\\t\\\\t\\\\t\\\\tb: proc.f.b,\\\\n\\\\t\\\\t\\\\t\\\\ti: proc.g\\\\n\\\\t\\\\t\\\\t};\\\\n\\\\t\\\\t\\\\tproc.f = proc.f.d;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\nfunction _Process_sleep(time)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback) {\\\\n\\\\t\\\\tvar id = setTimeout(function() {\\\\n\\\\t\\\\t\\\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\\\n\\\\t\\\\t}, time);\\\\n\\\\n\\\\t\\\\treturn function() { clearTimeout(id); };\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\n\\\\n\\\\n// PROGRAMS\\\\n\\\\n\\\\nvar _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)\\\\n{\\\\n\\\\treturn _Platform_initialize(\\\\n\\\\t\\\\tflagDecoder,\\\\n\\\\t\\\\targs,\\\\n\\\\t\\\\timpl.aH,\\\\n\\\\t\\\\timpl.aT,\\\\n\\\\t\\\\timpl.aR,\\\\n\\\\t\\\\tfunction() { return function() {} }\\\\n\\\\t);\\\\n});\\\\n\\\\n\\\\n\\\\n// INITIALIZE A PROGRAM\\\\n\\\\n\\\\nfunction _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)\\\\n{\\\\n\\\\tvar result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args[\\\\\\'flags\\\\\\'] : undefined));\\\\n\\\\t$elm$core$Result$isOk(result) || _Debug_crash(2 /**_UNUSED/, _Json_errorToString(result.a) /**/);\\\\n\\\\tvar managers = {};\\\\n\\\\tvar initPair = init(result.a);\\\\n\\\\tvar model = initPair.a;\\\\n\\\\tvar stepper = stepperBuilder(sendToApp, model);\\\\n\\\\tvar ports = _Platform_setupEffects(managers, sendToApp);\\\\n\\\\n\\\\tfunction sendToApp(msg, viewMetadata)\\\\n\\\\t{\\\\n\\\\t\\\\tvar pair = A2(update, msg, model);\\\\n\\\\t\\\\tstepper(model = pair.a, viewMetadata);\\\\n\\\\t\\\\t_Platform_enqueueEffects(managers, pair.b, subscriptions(model));\\\\n\\\\t}\\\\n\\\\n\\\\t_Platform_enqueueEffects(managers, initPair.b, subscriptions(model));\\\\n\\\\n\\\\treturn ports ? { ports: ports } : {};\\\\n}\\\\n\\\\n\\\\n\\\\n// TRACK PRELOADS\\\\n//\\\\n// This is used by code in elm/browser and elm/http\\\\n// to register any HTTP requests that are triggered by init.\\\\n//\\\\n\\\\n\\\\nvar _Platform_preload;\\\\n\\\\n\\\\nfunction _Platform_registerPreload(url)\\\\n{\\\\n\\\\t_Platform_preload.add(url);\\\\n}\\\\n\\\\n\\\\n\\\\n// EFFECT MANAGERS\\\\n\\\\n\\\\nvar _Platform_effectManagers = {};\\\\n\\\\n\\\\nfunction _Platform_setupEffects(managers, sendToApp)\\\\n{\\\\n\\\\tvar ports;\\\\n\\\\n\\\\t// setup all necessary effect managers\\\\n\\\\tfor (var key in _Platform_effectManagers)\\\\n\\\\t{\\\\n\\\\t\\\\tvar manager = _Platform_effectManagers[key];\\\\n\\\\n\\\\t\\\\tif (manager.a)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tports = ports || {};\\\\n\\\\t\\\\t\\\\tports[key] = manager.a(key, sendToApp);\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tmanagers[key] = _Platform_instantiateManager(manager, sendToApp);\\\\n\\\\t}\\\\n\\\\n\\\\treturn ports;\\\\n}\\\\n\\\\n\\\\nfunction _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\tb: init,\\\\n\\\\t\\\\tc: onEffects,\\\\n\\\\t\\\\td: onSelfMsg,\\\\n\\\\t\\\\te: cmdMap,\\\\n\\\\t\\\\tf: subMap\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\nfunction _Platform_instantiateManager(info, sendToApp)\\\\n{\\\\n\\\\tvar router = {\\\\n\\\\t\\\\tg: sendToApp,\\\\n\\\\t\\\\th: undefined\\\\n\\\\t};\\\\n\\\\n\\\\tvar onEffects = info.c;\\\\n\\\\tvar onSelfMsg = info.d;\\\\n\\\\tvar cmdMap = info.e;\\\\n\\\\tvar subMap = info.f;\\\\n\\\\n\\\\tfunction loop(state)\\\\n\\\\t{\\\\n\\\\t\\\\treturn A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar value = msg.a;\\\\n\\\\n\\\\t\\\\t\\\\tif (msg.$ === 0)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn A3(onSelfMsg, router, value, state);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\treturn cmdMap && subMap\\\\n\\\\t\\\\t\\\\t\\\\t? A4(onEffects, router, value.i, value.j, state)\\\\n\\\\t\\\\t\\\\t\\\\t: A3(onEffects, router, cmdMap ? value.i : value.j, state);\\\\n\\\\t\\\\t}));\\\\n\\\\t}\\\\n\\\\n\\\\treturn router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));\\\\n}\\\\n\\\\n\\\\n\\\\n// ROUTING\\\\n\\\\n\\\\nvar _Platform_sendToApp = F2(function(router, msg)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\trouter.g(msg);\\\\n\\\\t\\\\tcallback(_Scheduler_succeed(_Utils_Tuple0));\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\nvar _Platform_sendToSelf = F2(function(router, msg)\\\\n{\\\\n\\\\treturn A2(_Scheduler_send, router.h, {\\\\n\\\\t\\\\t$: 0,\\\\n\\\\t\\\\ta: msg\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\n\\\\n// BAGS\\\\n\\\\n\\\\nfunction _Platform_leaf(home)\\\\n{\\\\n\\\\treturn function(value)\\\\n\\\\t{\\\\n\\\\t\\\\treturn {\\\\n\\\\t\\\\t\\\\t$: 1,\\\\n\\\\t\\\\t\\\\tk: home,\\\\n\\\\t\\\\t\\\\tl: value\\\\n\\\\t\\\\t};\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\nfunction _Platform_batch(list)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 2,\\\\n\\\\t\\\\tm: list\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\nvar _Platform_map = F2(function(tagger, bag)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 3,\\\\n\\\\t\\\\tn: tagger,\\\\n\\\\t\\\\to: bag\\\\n\\\\t}\\\\n});\\\\n\\\\n\\\\n\\\\n// PIPE BAGS INTO EFFECT MANAGERS\\\\n//\\\\n// Effects must be queued!\\\\n//\\\\n// Say your init contains a synchronous command, like Time.now or Time.here\\\\n//\\\\n//   - This will produce a batch of effects (FX_1)\\\\n//   - The synchronous task triggers the subsequent `update` call\\\\n//   - This will produce a batch of effects (FX_2)\\\\n//\\\\n// If we just start dispatching FX_2, subscriptions from FX_2 can be processed\\\\n// before subscriptions from FX_1. No good! Earlier versions of this code had\\\\n// this problem, leading to these reports:\\\\n//\\\\n//   https://github.com/elm/core/issues/980\\\\n//   https://github.com/elm/core/pull/981\\\\n//   https://github.com/elm/compiler/issues/1776\\\\n//\\\\n// The queue is necessary to avoid ordering issues for synchronous commands.\\\\n\\\\n\\\\n// Why use true/false here? Why not just check the length of the queue?\\\\n// The goal is to detect "are we currently dispatching effects?" If we\\\\n// are, we need to bail and let the ongoing while loop handle things.\\\\n//\\\\n// Now say the queue has 1 element. When we dequeue the final element,\\\\n// the queue will be empty, but we are still actively dispatching effects.\\\\n// So you could get queue jumping in a really tricky category of cases.\\\\n//\\\\nvar _Platform_effectsQueue = [];\\\\nvar _Platform_effectsActive = false;\\\\n\\\\n\\\\nfunction _Platform_enqueueEffects(managers, cmdBag, subBag)\\\\n{\\\\n\\\\t_Platform_effectsQueue.push({ p: managers, q: cmdBag, r: subBag });\\\\n\\\\n\\\\tif (_Platform_effectsActive) return;\\\\n\\\\n\\\\t_Platform_effectsActive = true;\\\\n\\\\tfor (var fx; fx = _Platform_effectsQueue.shift(); )\\\\n\\\\t{\\\\n\\\\t\\\\t_Platform_dispatchEffects(fx.p, fx.q, fx.r);\\\\n\\\\t}\\\\n\\\\t_Platform_effectsActive = false;\\\\n}\\\\n\\\\n\\\\nfunction _Platform_dispatchEffects(managers, cmdBag, subBag)\\\\n{\\\\n\\\\tvar effectsDict = {};\\\\n\\\\t_Platform_gatherEffects(true, cmdBag, effectsDict, null);\\\\n\\\\t_Platform_gatherEffects(false, subBag, effectsDict, null);\\\\n\\\\n\\\\tfor (var home in managers)\\\\n\\\\t{\\\\n\\\\t\\\\t_Scheduler_rawSend(managers[home], {\\\\n\\\\t\\\\t\\\\t$: \\\\\\'fx\\\\\\',\\\\n\\\\t\\\\t\\\\ta: effectsDict[home] || { i: _List_Nil, j: _List_Nil }\\\\n\\\\t\\\\t});\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\nfunction _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)\\\\n{\\\\n\\\\tswitch (bag.$)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\tvar home = bag.k;\\\\n\\\\t\\\\t\\\\tvar effect = _Platform_toEffect(isCmd, home, taggers, bag.l);\\\\n\\\\t\\\\t\\\\teffectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\tfor (var list = bag.m; list.b; list = list.b) // WHILE_CONS\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\t\\\\t_Platform_gatherEffects(isCmd, bag.o, effectsDict, {\\\\n\\\\t\\\\t\\\\t\\\\ts: bag.n,\\\\n\\\\t\\\\t\\\\t\\\\tt: taggers\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\nfunction _Platform_toEffect(isCmd, home, taggers, value)\\\\n{\\\\n\\\\tfunction applyTaggers(x)\\\\n\\\\t{\\\\n\\\\t\\\\tfor (var temp = taggers; temp; temp = temp.t)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tx = temp.s(x);\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\treturn x;\\\\n\\\\t}\\\\n\\\\n\\\\tvar map = isCmd\\\\n\\\\t\\\\t? _Platform_effectManagers[home].e\\\\n\\\\t\\\\t: _Platform_effectManagers[home].f;\\\\n\\\\n\\\\treturn A2(map, applyTaggers, value)\\\\n}\\\\n\\\\n\\\\nfunction _Platform_insert(isCmd, newEffect, effects)\\\\n{\\\\n\\\\teffects = effects || { i: _List_Nil, j: _List_Nil };\\\\n\\\\n\\\\tisCmd\\\\n\\\\t\\\\t? (effects.i = _List_Cons(newEffect, effects.i))\\\\n\\\\t\\\\t: (effects.j = _List_Cons(newEffect, effects.j));\\\\n\\\\n\\\\treturn effects;\\\\n}\\\\n\\\\n\\\\n\\\\n// PORTS\\\\n\\\\n\\\\nfunction _Platform_checkPortName(name)\\\\n{\\\\n\\\\tif (_Platform_effectManagers[name])\\\\n\\\\t{\\\\n\\\\t\\\\t_Debug_crash(3, name)\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// OUTGOING PORTS\\\\n\\\\n\\\\nfunction _Platform_outgoingPort(name, converter)\\\\n{\\\\n\\\\t_Platform_checkPortName(name);\\\\n\\\\t_Platform_effectManagers[name] = {\\\\n\\\\t\\\\te: _Platform_outgoingPortMap,\\\\n\\\\t\\\\tu: converter,\\\\n\\\\t\\\\ta: _Platform_setupOutgoingPort\\\\n\\\\t};\\\\n\\\\treturn _Platform_leaf(name);\\\\n}\\\\n\\\\n\\\\nvar _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });\\\\n\\\\n\\\\nfunction _Platform_setupOutgoingPort(name)\\\\n{\\\\n\\\\tvar subs = [];\\\\n\\\\tvar converter = _Platform_effectManagers[name].u;\\\\n\\\\n\\\\t// CREATE MANAGER\\\\n\\\\n\\\\tvar init = _Process_sleep(0);\\\\n\\\\n\\\\t_Platform_effectManagers[name].b = init;\\\\n\\\\t_Platform_effectManagers[name].c = F3(function(router, cmdList, state)\\\\n\\\\t{\\\\n\\\\t\\\\tfor ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t// grab a separate reference to subs in case unsubscribe is called\\\\n\\\\t\\\\t\\\\tvar currentSubs = subs;\\\\n\\\\t\\\\t\\\\tvar value = _Json_unwrap(converter(cmdList.a));\\\\n\\\\t\\\\t\\\\tfor (var i = 0; i < currentSubs.length; i++)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tcurrentSubs[i](value);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\treturn init;\\\\n\\\\t});\\\\n\\\\n\\\\t// PUBLIC API\\\\n\\\\n\\\\tfunction subscribe(callback)\\\\n\\\\t{\\\\n\\\\t\\\\tsubs.push(callback);\\\\n\\\\t}\\\\n\\\\n\\\\tfunction unsubscribe(callback)\\\\n\\\\t{\\\\n\\\\t\\\\t// copy subs into a new array in case unsubscribe is called within a\\\\n\\\\t\\\\t// subscribed callback\\\\n\\\\t\\\\tsubs = subs.slice();\\\\n\\\\t\\\\tvar index = subs.indexOf(callback);\\\\n\\\\t\\\\tif (index >= 0)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tsubs.splice(index, 1);\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\treturn {\\\\n\\\\t\\\\tsubscribe: subscribe,\\\\n\\\\t\\\\tunsubscribe: unsubscribe\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n\\\\n// INCOMING PORTS\\\\n\\\\n\\\\nfunction _Platform_incomingPort(name, converter)\\\\n{\\\\n\\\\t_Platform_checkPortName(name);\\\\n\\\\t_Platform_effectManagers[name] = {\\\\n\\\\t\\\\tf: _Platform_incomingPortMap,\\\\n\\\\t\\\\tu: converter,\\\\n\\\\t\\\\ta: _Platform_setupIncomingPort\\\\n\\\\t};\\\\n\\\\treturn _Platform_leaf(name);\\\\n}\\\\n\\\\n\\\\nvar _Platform_incomingPortMap = F2(function(tagger, finalTagger)\\\\n{\\\\n\\\\treturn function(value)\\\\n\\\\t{\\\\n\\\\t\\\\treturn tagger(finalTagger(value));\\\\n\\\\t};\\\\n});\\\\n\\\\n\\\\nfunction _Platform_setupIncomingPort(name, sendToApp)\\\\n{\\\\n\\\\tvar subs = _List_Nil;\\\\n\\\\tvar converter = _Platform_effectManagers[name].u;\\\\n\\\\n\\\\t// CREATE MANAGER\\\\n\\\\n\\\\tvar init = _Scheduler_succeed(null);\\\\n\\\\n\\\\t_Platform_effectManagers[name].b = init;\\\\n\\\\t_Platform_effectManagers[name].c = F3(function(router, subList, state)\\\\n\\\\t{\\\\n\\\\t\\\\tsubs = subList;\\\\n\\\\t\\\\treturn init;\\\\n\\\\t});\\\\n\\\\n\\\\t// PUBLIC API\\\\n\\\\n\\\\tfunction send(incomingValue)\\\\n\\\\t{\\\\n\\\\t\\\\tvar result = A2(_Json_run, converter, _Json_wrap(incomingValue));\\\\n\\\\n\\\\t\\\\t$elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);\\\\n\\\\n\\\\t\\\\tvar value = result.a;\\\\n\\\\t\\\\tfor (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tsendToApp(temp.a(value));\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\treturn { send: send };\\\\n}\\\\n\\\\n\\\\n\\\\n// EXPORT ELM MODULES\\\\n//\\\\n// Have DEBUG and PROD versions so that we can (1) give nicer errors in\\\\n// debug mode and (2) not pay for the bits needed for that in prod mode.\\\\n//\\\\n\\\\n\\\\nfunction _Platform_export(exports)\\\\n{\\\\n\\\\tscope[\\\\\\'Elm\\\\\\']\\\\n\\\\t\\\\t? _Platform_mergeExportsProd(scope[\\\\\\'Elm\\\\\\'], exports)\\\\n\\\\t\\\\t: scope[\\\\\\'Elm\\\\\\'] = exports;\\\\n}\\\\n\\\\n\\\\nfunction _Platform_mergeExportsProd(obj, exports)\\\\n{\\\\n\\\\tfor (var name in exports)\\\\n\\\\t{\\\\n\\\\t\\\\t(name in obj)\\\\n\\\\t\\\\t\\\\t? (name == \\\\\\'init\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t? _Debug_crash(6)\\\\n\\\\t\\\\t\\\\t\\\\t: _Platform_mergeExportsProd(obj[name], exports[name])\\\\n\\\\t\\\\t\\\\t: (obj[name] = exports[name]);\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\nfunction _Platform_export_UNUSED(exports)\\\\n{\\\\n\\\\tscope[\\\\\\'Elm\\\\\\']\\\\n\\\\t\\\\t? _Platform_mergeExportsDebug(\\\\\\'Elm\\\\\\', scope[\\\\\\'Elm\\\\\\'], exports)\\\\n\\\\t\\\\t: scope[\\\\\\'Elm\\\\\\'] = exports;\\\\n}\\\\n\\\\n\\\\nfunction _Platform_mergeExportsDebug(moduleName, obj, exports)\\\\n{\\\\n\\\\tfor (var name in exports)\\\\n\\\\t{\\\\n\\\\t\\\\t(name in obj)\\\\n\\\\t\\\\t\\\\t? (name == \\\\\\'init\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t? _Debug_crash(6, moduleName)\\\\n\\\\t\\\\t\\\\t\\\\t: _Platform_mergeExportsDebug(moduleName + \\\\\\'.\\\\\\' + name, obj[name], exports[name])\\\\n\\\\t\\\\t\\\\t: (obj[name] = exports[name]);\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n\\\\n// HELPERS\\\\n\\\\n\\\\nvar _VirtualDom_divertHrefToApp;\\\\n\\\\nvar _VirtualDom_doc = typeof document !== \\\\\\'undefined\\\\\\' ? document : {};\\\\n\\\\n\\\\nfunction _VirtualDom_appendChild(parent, child)\\\\n{\\\\n\\\\tparent.appendChild(child);\\\\n}\\\\n\\\\nvar _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)\\\\n{\\\\n\\\\t// NOTE: this function needs _Platform_export available to work\\\\n\\\\n\\\\t/**/\\\\n\\\\tvar node = args[\\\\\\'node\\\\\\'];\\\\n\\\\t//*/\\\\n\\\\t/**_UNUSED/\\\\n\\\\tvar node = args && args[\\\\\\'node\\\\\\'] ? args[\\\\\\'node\\\\\\'] : _Debug_crash(0);\\\\n\\\\t//*/\\\\n\\\\n\\\\tnode.parentNode.replaceChild(\\\\n\\\\t\\\\t_VirtualDom_render(virtualNode, function() {}),\\\\n\\\\t\\\\tnode\\\\n\\\\t);\\\\n\\\\n\\\\treturn {};\\\\n});\\\\n\\\\n\\\\n\\\\n// TEXT\\\\n\\\\n\\\\nfunction _VirtualDom_text(string)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 0,\\\\n\\\\t\\\\ta: string\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n\\\\n// NODE\\\\n\\\\n\\\\nvar _VirtualDom_nodeNS = F2(function(namespace, tag)\\\\n{\\\\n\\\\treturn F2(function(factList, kidList)\\\\n\\\\t{\\\\n\\\\t\\\\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar kid = kidList.a;\\\\n\\\\t\\\\t\\\\tdescendantsCount += (kid.b || 0);\\\\n\\\\t\\\\t\\\\tkids.push(kid);\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tdescendantsCount += kids.length;\\\\n\\\\n\\\\t\\\\treturn {\\\\n\\\\t\\\\t\\\\t$: 1,\\\\n\\\\t\\\\t\\\\tc: tag,\\\\n\\\\t\\\\t\\\\td: _VirtualDom_organizeFacts(factList),\\\\n\\\\t\\\\t\\\\te: kids,\\\\n\\\\t\\\\t\\\\tf: namespace,\\\\n\\\\t\\\\t\\\\tb: descendantsCount\\\\n\\\\t\\\\t};\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\nvar _VirtualDom_node = _VirtualDom_nodeNS(undefined);\\\\n\\\\n\\\\n\\\\n// KEYED NODE\\\\n\\\\n\\\\nvar _VirtualDom_keyedNodeNS = F2(function(namespace, tag)\\\\n{\\\\n\\\\treturn F2(function(factList, kidList)\\\\n\\\\t{\\\\n\\\\t\\\\tfor (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar kid = kidList.a;\\\\n\\\\t\\\\t\\\\tdescendantsCount += (kid.b.b || 0);\\\\n\\\\t\\\\t\\\\tkids.push(kid);\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tdescendantsCount += kids.length;\\\\n\\\\n\\\\t\\\\treturn {\\\\n\\\\t\\\\t\\\\t$: 2,\\\\n\\\\t\\\\t\\\\tc: tag,\\\\n\\\\t\\\\t\\\\td: _VirtualDom_organizeFacts(factList),\\\\n\\\\t\\\\t\\\\te: kids,\\\\n\\\\t\\\\t\\\\tf: namespace,\\\\n\\\\t\\\\t\\\\tb: descendantsCount\\\\n\\\\t\\\\t};\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\nvar _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);\\\\n\\\\n\\\\n\\\\n// CUSTOM\\\\n\\\\n\\\\nfunction _VirtualDom_custom(factList, model, render, diff)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 3,\\\\n\\\\t\\\\td: _VirtualDom_organizeFacts(factList),\\\\n\\\\t\\\\tg: model,\\\\n\\\\t\\\\th: render,\\\\n\\\\t\\\\ti: diff\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n\\\\n// MAP\\\\n\\\\n\\\\nvar _VirtualDom_map = F2(function(tagger, node)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 4,\\\\n\\\\t\\\\tj: tagger,\\\\n\\\\t\\\\tk: node,\\\\n\\\\t\\\\tb: 1 + (node.b || 0)\\\\n\\\\t};\\\\n});\\\\n\\\\n\\\\n\\\\n// LAZY\\\\n\\\\n\\\\nfunction _VirtualDom_thunk(refs, thunk)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 5,\\\\n\\\\t\\\\tl: refs,\\\\n\\\\t\\\\tm: thunk,\\\\n\\\\t\\\\tk: undefined\\\\n\\\\t};\\\\n}\\\\n\\\\nvar _VirtualDom_lazy = F2(function(func, a)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a], function() {\\\\n\\\\t\\\\treturn func(a);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy2 = F3(function(func, a, b)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b], function() {\\\\n\\\\t\\\\treturn A2(func, a, b);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy3 = F4(function(func, a, b, c)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c], function() {\\\\n\\\\t\\\\treturn A3(func, a, b, c);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy4 = F5(function(func, a, b, c, d)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c, d], function() {\\\\n\\\\t\\\\treturn A4(func, a, b, c, d);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c, d, e], function() {\\\\n\\\\t\\\\treturn A5(func, a, b, c, d, e);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f], function() {\\\\n\\\\t\\\\treturn A6(func, a, b, c, d, e, f);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {\\\\n\\\\t\\\\treturn A7(func, a, b, c, d, e, f, g);\\\\n\\\\t});\\\\n});\\\\n\\\\nvar _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)\\\\n{\\\\n\\\\treturn _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {\\\\n\\\\t\\\\treturn A8(func, a, b, c, d, e, f, g, h);\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\n\\\\n// FACTS\\\\n\\\\n\\\\nvar _VirtualDom_on = F2(function(key, handler)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: \\\\\\'a0\\\\\\',\\\\n\\\\t\\\\tn: key,\\\\n\\\\t\\\\to: handler\\\\n\\\\t};\\\\n});\\\\nvar _VirtualDom_style = F2(function(key, value)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: \\\\\\'a1\\\\\\',\\\\n\\\\t\\\\tn: key,\\\\n\\\\t\\\\to: value\\\\n\\\\t};\\\\n});\\\\nvar _VirtualDom_property = F2(function(key, value)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: \\\\\\'a2\\\\\\',\\\\n\\\\t\\\\tn: key,\\\\n\\\\t\\\\to: value\\\\n\\\\t};\\\\n});\\\\nvar _VirtualDom_attribute = F2(function(key, value)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: \\\\\\'a3\\\\\\',\\\\n\\\\t\\\\tn: key,\\\\n\\\\t\\\\to: value\\\\n\\\\t};\\\\n});\\\\nvar _VirtualDom_attributeNS = F3(function(namespace, key, value)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: \\\\\\'a4\\\\\\',\\\\n\\\\t\\\\tn: key,\\\\n\\\\t\\\\to: { f: namespace, o: value }\\\\n\\\\t};\\\\n});\\\\n\\\\n\\\\n\\\\n// XSS ATTACK VECTOR CHECKS\\\\n\\\\n\\\\nfunction _VirtualDom_noScript(tag)\\\\n{\\\\n\\\\treturn tag == \\\\\\'script\\\\\\' ? \\\\\\'p\\\\\\' : tag;\\\\n}\\\\n\\\\nfunction _VirtualDom_noOnOrFormAction(key)\\\\n{\\\\n\\\\treturn /^(on|formAction$)/i.test(key) ? \\\\\\'data-\\\\\\' + key : key;\\\\n}\\\\n\\\\nfunction _VirtualDom_noInnerHtmlOrFormAction(key)\\\\n{\\\\n\\\\treturn key == \\\\\\'innerHTML\\\\\\' || key == \\\\\\'formAction\\\\\\' ? \\\\\\'data-\\\\\\' + key : key;\\\\n}\\\\n\\\\nfunction _VirtualDom_noJavaScriptUri(value)\\\\n{\\\\n\\\\treturn /^javascript:/i.test(value.replace(/\\\\\\\\s/g,\\\\\\'\\\\\\')) ? \\\\\\'\\\\\\' : value;\\\\n}\\\\n\\\\nfunction _VirtualDom_noJavaScriptUri_UNUSED(value)\\\\n{\\\\n\\\\treturn /^javascript:/i.test(value.replace(/\\\\\\\\s/g,\\\\\\'\\\\\\'))\\\\n\\\\t\\\\t? \\\\\\'javascript:alert("This is an XSS vector. Please use ports or web components instead.")\\\\\\'\\\\n\\\\t\\\\t: value;\\\\n}\\\\n\\\\nfunction _VirtualDom_noJavaScriptOrHtmlUri(value)\\\\n{\\\\n\\\\treturn /^\\\\\\\\s*(javascript:|data:text\\\\\\\\/html)/i.test(value) ? \\\\\\'\\\\\\' : value;\\\\n}\\\\n\\\\nfunction _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)\\\\n{\\\\n\\\\treturn /^\\\\\\\\s*(javascript:|data:text\\\\\\\\/html)/i.test(value)\\\\n\\\\t\\\\t? \\\\\\'javascript:alert("This is an XSS vector. Please use ports or web components instead.")\\\\\\'\\\\n\\\\t\\\\t: value;\\\\n}\\\\n\\\\n\\\\n\\\\n// MAP FACTS\\\\n\\\\n\\\\nvar _VirtualDom_mapAttribute = F2(function(func, attr)\\\\n{\\\\n\\\\treturn (attr.$ === \\\\\\'a0\\\\\\')\\\\n\\\\t\\\\t? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))\\\\n\\\\t\\\\t: attr;\\\\n});\\\\n\\\\nfunction _VirtualDom_mapHandler(func, handler)\\\\n{\\\\n\\\\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);\\\\n\\\\n\\\\t// 0 = Normal\\\\n\\\\t// 1 = MayStopPropagation\\\\n\\\\t// 2 = MayPreventDefault\\\\n\\\\t// 3 = Custom\\\\n\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: handler.$,\\\\n\\\\t\\\\ta:\\\\n\\\\t\\\\t\\\\t!tag\\\\n\\\\t\\\\t\\\\t\\\\t? A2($elm$json$Json$Decode$map, func, handler.a)\\\\n\\\\t\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t\\\\tA3($elm$json$Json$Decode$map2,\\\\n\\\\t\\\\t\\\\t\\\\ttag < 3\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? _VirtualDom_mapEventTuple\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t: _VirtualDom_mapEventRecord,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$json$Json$Decode$succeed(func),\\\\n\\\\t\\\\t\\\\t\\\\thandler.a\\\\n\\\\t\\\\t\\\\t)\\\\n\\\\t};\\\\n}\\\\n\\\\nvar _VirtualDom_mapEventTuple = F2(function(func, tuple)\\\\n{\\\\n\\\\treturn _Utils_Tuple2(func(tuple.a), tuple.b);\\\\n});\\\\n\\\\nvar _VirtualDom_mapEventRecord = F2(function(func, record)\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\tw: func(record.w),\\\\n\\\\t\\\\tV: record.V,\\\\n\\\\t\\\\tR: record.R\\\\n\\\\t}\\\\n});\\\\n\\\\n\\\\n\\\\n// ORGANIZE FACTS\\\\n\\\\n\\\\nfunction _VirtualDom_organizeFacts(factList)\\\\n{\\\\n\\\\tfor (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS\\\\n\\\\t{\\\\n\\\\t\\\\tvar entry = factList.a;\\\\n\\\\n\\\\t\\\\tvar tag = entry.$;\\\\n\\\\t\\\\tvar key = entry.n;\\\\n\\\\t\\\\tvar value = entry.o;\\\\n\\\\n\\\\t\\\\tif (tag === \\\\\\'a2\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t(key === \\\\\\'className\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t? _VirtualDom_addClass(facts, key, _Json_unwrap(value))\\\\n\\\\t\\\\t\\\\t\\\\t: facts[key] = _Json_unwrap(value);\\\\n\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tvar subFacts = facts[tag] || (facts[tag] = {});\\\\n\\\\t\\\\t(tag === \\\\\\'a3\\\\\\' && key === \\\\\\'class\\\\\\')\\\\n\\\\t\\\\t\\\\t? _VirtualDom_addClass(subFacts, key, value)\\\\n\\\\t\\\\t\\\\t: subFacts[key] = value;\\\\n\\\\t}\\\\n\\\\n\\\\treturn facts;\\\\n}\\\\n\\\\nfunction _VirtualDom_addClass(object, key, newClass)\\\\n{\\\\n\\\\tvar classes = object[key];\\\\n\\\\tobject[key] = classes ? classes + \\\\\\' \\\\\\' + newClass : newClass;\\\\n}\\\\n\\\\n\\\\n\\\\n// RENDER\\\\n\\\\n\\\\nfunction _VirtualDom_render(vNode, eventNode)\\\\n{\\\\n\\\\tvar tag = vNode.$;\\\\n\\\\n\\\\tif (tag === 5)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);\\\\n\\\\t}\\\\n\\\\n\\\\tif (tag === 0)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _VirtualDom_doc.createTextNode(vNode.a);\\\\n\\\\t}\\\\n\\\\n\\\\tif (tag === 4)\\\\n\\\\t{\\\\n\\\\t\\\\tvar subNode = vNode.k;\\\\n\\\\t\\\\tvar tagger = vNode.j;\\\\n\\\\n\\\\t\\\\twhile (subNode.$ === 4)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ttypeof tagger !== \\\\\\'object\\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t? tagger = [tagger, subNode.j]\\\\n\\\\t\\\\t\\\\t\\\\t: tagger.push(subNode.j);\\\\n\\\\n\\\\t\\\\t\\\\tsubNode = subNode.k;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tvar subEventRoot = { j: tagger, p: eventNode };\\\\n\\\\t\\\\tvar domNode = _VirtualDom_render(subNode, subEventRoot);\\\\n\\\\t\\\\tdomNode.elm_event_node_ref = subEventRoot;\\\\n\\\\t\\\\treturn domNode;\\\\n\\\\t}\\\\n\\\\n\\\\tif (tag === 3)\\\\n\\\\t{\\\\n\\\\t\\\\tvar domNode = vNode.h(vNode.g);\\\\n\\\\t\\\\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);\\\\n\\\\t\\\\treturn domNode;\\\\n\\\\t}\\\\n\\\\n\\\\t// at this point `tag` must be 1 or 2\\\\n\\\\n\\\\tvar domNode = vNode.f\\\\n\\\\t\\\\t? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)\\\\n\\\\t\\\\t: _VirtualDom_doc.createElement(vNode.c);\\\\n\\\\n\\\\tif (_VirtualDom_divertHrefToApp && vNode.c == \\\\\\'a\\\\\\')\\\\n\\\\t{\\\\n\\\\t\\\\tdomNode.addEventListener(\\\\\\'click\\\\\\', _VirtualDom_divertHrefToApp(domNode));\\\\n\\\\t}\\\\n\\\\n\\\\t_VirtualDom_applyFacts(domNode, eventNode, vNode.d);\\\\n\\\\n\\\\tfor (var kids = vNode.e, i = 0; i < kids.length; i++)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));\\\\n\\\\t}\\\\n\\\\n\\\\treturn domNode;\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY FACTS\\\\n\\\\n\\\\nfunction _VirtualDom_applyFacts(domNode, eventNode, facts)\\\\n{\\\\n\\\\tfor (var key in facts)\\\\n\\\\t{\\\\n\\\\t\\\\tvar value = facts[key];\\\\n\\\\n\\\\t\\\\tkey === \\\\\\'a1\\\\\\'\\\\n\\\\t\\\\t\\\\t? _VirtualDom_applyStyles(domNode, value)\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\tkey === \\\\\\'a0\\\\\\'\\\\n\\\\t\\\\t\\\\t? _VirtualDom_applyEvents(domNode, eventNode, value)\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\tkey === \\\\\\'a3\\\\\\'\\\\n\\\\t\\\\t\\\\t? _VirtualDom_applyAttrs(domNode, value)\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\tkey === \\\\\\'a4\\\\\\'\\\\n\\\\t\\\\t\\\\t? _VirtualDom_applyAttrsNS(domNode, value)\\\\n\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t((key !== \\\\\\'value\\\\\\' && key !== \\\\\\'checked\\\\\\') || domNode[key] !== value) && (domNode[key] = value);\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY STYLES\\\\n\\\\n\\\\nfunction _VirtualDom_applyStyles(domNode, styles)\\\\n{\\\\n\\\\tvar domNodeStyle = domNode.style;\\\\n\\\\n\\\\tfor (var key in styles)\\\\n\\\\t{\\\\n\\\\t\\\\tdomNodeStyle[key] = styles[key];\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY ATTRS\\\\n\\\\n\\\\nfunction _VirtualDom_applyAttrs(domNode, attrs)\\\\n{\\\\n\\\\tfor (var key in attrs)\\\\n\\\\t{\\\\n\\\\t\\\\tvar value = attrs[key];\\\\n\\\\t\\\\ttypeof value !== \\\\\\'undefined\\\\\\'\\\\n\\\\t\\\\t\\\\t? domNode.setAttribute(key, value)\\\\n\\\\t\\\\t\\\\t: domNode.removeAttribute(key);\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY NAMESPACED ATTRS\\\\n\\\\n\\\\nfunction _VirtualDom_applyAttrsNS(domNode, nsAttrs)\\\\n{\\\\n\\\\tfor (var key in nsAttrs)\\\\n\\\\t{\\\\n\\\\t\\\\tvar pair = nsAttrs[key];\\\\n\\\\t\\\\tvar namespace = pair.f;\\\\n\\\\t\\\\tvar value = pair.o;\\\\n\\\\n\\\\t\\\\ttypeof value !== \\\\\\'undefined\\\\\\'\\\\n\\\\t\\\\t\\\\t? domNode.setAttributeNS(namespace, key, value)\\\\n\\\\t\\\\t\\\\t: domNode.removeAttributeNS(namespace, key);\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY EVENTS\\\\n\\\\n\\\\nfunction _VirtualDom_applyEvents(domNode, eventNode, events)\\\\n{\\\\n\\\\tvar allCallbacks = domNode.elmFs || (domNode.elmFs = {});\\\\n\\\\n\\\\tfor (var key in events)\\\\n\\\\t{\\\\n\\\\t\\\\tvar newHandler = events[key];\\\\n\\\\t\\\\tvar oldCallback = allCallbacks[key];\\\\n\\\\n\\\\t\\\\tif (!newHandler)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tdomNode.removeEventListener(key, oldCallback);\\\\n\\\\t\\\\t\\\\tallCallbacks[key] = undefined;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (oldCallback)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar oldHandler = oldCallback.q;\\\\n\\\\t\\\\t\\\\tif (oldHandler.$ === newHandler.$)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\toldCallback.q = newHandler;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tdomNode.removeEventListener(key, oldCallback);\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\toldCallback = _VirtualDom_makeCallback(eventNode, newHandler);\\\\n\\\\t\\\\tdomNode.addEventListener(key, oldCallback,\\\\n\\\\t\\\\t\\\\t_VirtualDom_passiveSupported\\\\n\\\\t\\\\t\\\\t&& { passive: $elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }\\\\n\\\\t\\\\t);\\\\n\\\\t\\\\tallCallbacks[key] = oldCallback;\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// PASSIVE EVENTS\\\\n\\\\n\\\\nvar _VirtualDom_passiveSupported;\\\\n\\\\ntry\\\\n{\\\\n\\\\twindow.addEventListener(\\\\\\'t\\\\\\', null, Object.defineProperty({}, \\\\\\'passive\\\\\\', {\\\\n\\\\t\\\\tget: function() { _VirtualDom_passiveSupported = true; }\\\\n\\\\t}));\\\\n}\\\\ncatch(e) {}\\\\n\\\\n\\\\n\\\\n// EVENT HANDLERS\\\\n\\\\n\\\\nfunction _VirtualDom_makeCallback(eventNode, initialHandler)\\\\n{\\\\n\\\\tfunction callback(event)\\\\n\\\\t{\\\\n\\\\t\\\\tvar handler = callback.q;\\\\n\\\\t\\\\tvar result = _Json_runHelp(handler.a, event);\\\\n\\\\n\\\\t\\\\tif (!$elm$core$Result$isOk(result))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tvar tag = $elm$virtual_dom$VirtualDom$toHandlerInt(handler);\\\\n\\\\n\\\\t\\\\t// 0 = Normal\\\\n\\\\t\\\\t// 1 = MayStopPropagation\\\\n\\\\t\\\\t// 2 = MayPreventDefault\\\\n\\\\t\\\\t// 3 = Custom\\\\n\\\\n\\\\t\\\\tvar value = result.a;\\\\n\\\\t\\\\tvar message = !tag ? value : tag < 3 ? value.a : value.w;\\\\n\\\\t\\\\tvar stopPropagation = tag == 1 ? value.b : tag == 3 && value.V;\\\\n\\\\t\\\\tvar currentEventNode = (\\\\n\\\\t\\\\t\\\\tstopPropagation && event.stopPropagation(),\\\\n\\\\t\\\\t\\\\t(tag == 2 ? value.b : tag == 3 && value.R) && event.preventDefault(),\\\\n\\\\t\\\\t\\\\teventNode\\\\n\\\\t\\\\t);\\\\n\\\\t\\\\tvar tagger;\\\\n\\\\t\\\\tvar i;\\\\n\\\\t\\\\twhile (tagger = currentEventNode.j)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tif (typeof tagger == \\\\\\'function\\\\\\')\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tmessage = tagger(message);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\telse\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tfor (var i = tagger.length; i--; )\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tmessage = tagger[i](message);\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tcurrentEventNode = currentEventNode.p;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tcurrentEventNode(message, stopPropagation); // stopPropagation implies isSync\\\\n\\\\t}\\\\n\\\\n\\\\tcallback.q = initialHandler;\\\\n\\\\n\\\\treturn callback;\\\\n}\\\\n\\\\nfunction _VirtualDom_equalEvents(x, y)\\\\n{\\\\n\\\\treturn x.$ == y.$ && _Json_equality(x.a, y.a);\\\\n}\\\\n\\\\n\\\\n\\\\n// DIFF\\\\n\\\\n\\\\n// TODO: Should we do patches like in iOS?\\\\n//\\\\n// type Patch\\\\n//   = At Int Patch\\\\n//   | Batch (List Patch)\\\\n//   | Change ...\\\\n//\\\\n// How could it not be better?\\\\n//\\\\nfunction _VirtualDom_diff(x, y)\\\\n{\\\\n\\\\tvar patches = [];\\\\n\\\\t_VirtualDom_diffHelp(x, y, patches, 0);\\\\n\\\\treturn patches;\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_pushPatch(patches, type, index, data)\\\\n{\\\\n\\\\tvar patch = {\\\\n\\\\t\\\\t$: type,\\\\n\\\\t\\\\tr: index,\\\\n\\\\t\\\\ts: data,\\\\n\\\\t\\\\tt: undefined,\\\\n\\\\t\\\\tu: undefined\\\\n\\\\t};\\\\n\\\\tpatches.push(patch);\\\\n\\\\treturn patch;\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_diffHelp(x, y, patches, index)\\\\n{\\\\n\\\\tif (x === y)\\\\n\\\\t{\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\tvar xType = x.$;\\\\n\\\\tvar yType = y.$;\\\\n\\\\n\\\\t// Bail if you run into different types of nodes. Implies that the\\\\n\\\\t// structure has changed significantly and it\\\\\\'s not worth a diff.\\\\n\\\\tif (xType !== yType)\\\\n\\\\t{\\\\n\\\\t\\\\tif (xType === 1 && yType === 2)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ty = _VirtualDom_dekey(y);\\\\n\\\\t\\\\t\\\\tyType = 1;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t_VirtualDom_pushPatch(patches, 0, index, y);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\t// Now we know that both nodes are the same $.\\\\n\\\\tswitch (yType)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 5:\\\\n\\\\t\\\\t\\\\tvar xRefs = x.l;\\\\n\\\\t\\\\t\\\\tvar yRefs = y.l;\\\\n\\\\t\\\\t\\\\tvar i = xRefs.length;\\\\n\\\\t\\\\t\\\\tvar same = i === yRefs.length;\\\\n\\\\t\\\\t\\\\twhile (same && i--)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tsame = xRefs[i] === yRefs[i];\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tif (same)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\ty.k = x.k;\\\\n\\\\t\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\ty.k = y.m();\\\\n\\\\t\\\\t\\\\tvar subPatches = [];\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);\\\\n\\\\t\\\\t\\\\tsubPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 4:\\\\n\\\\t\\\\t\\\\t// gather nested taggers\\\\n\\\\t\\\\t\\\\tvar xTaggers = x.j;\\\\n\\\\t\\\\t\\\\tvar yTaggers = y.j;\\\\n\\\\t\\\\t\\\\tvar nesting = false;\\\\n\\\\n\\\\t\\\\t\\\\tvar xSubNode = x.k;\\\\n\\\\t\\\\t\\\\twhile (xSubNode.$ === 4)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tnesting = true;\\\\n\\\\n\\\\t\\\\t\\\\t\\\\ttypeof xTaggers !== \\\\\\'object\\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? xTaggers = [xTaggers, xSubNode.j]\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t: xTaggers.push(xSubNode.j);\\\\n\\\\n\\\\t\\\\t\\\\t\\\\txSubNode = xSubNode.k;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\tvar ySubNode = y.k;\\\\n\\\\t\\\\t\\\\twhile (ySubNode.$ === 4)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tnesting = true;\\\\n\\\\n\\\\t\\\\t\\\\t\\\\ttypeof yTaggers !== \\\\\\'object\\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? yTaggers = [yTaggers, ySubNode.j]\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t: yTaggers.push(ySubNode.j);\\\\n\\\\n\\\\t\\\\t\\\\t\\\\tySubNode = ySubNode.k;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\t// Just bail if different numbers of taggers. This implies the\\\\n\\\\t\\\\t\\\\t// structure of the virtual DOM has changed.\\\\n\\\\t\\\\t\\\\tif (nesting && xTaggers.length !== yTaggers.length)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_pushPatch(patches, 0, index, y);\\\\n\\\\t\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\t// check if taggers are "the same"\\\\n\\\\t\\\\t\\\\tif (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_pushPatch(patches, 2, index, yTaggers);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\t// diff everything below the taggers\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\tif (x.a !== y.a)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_pushPatch(patches, 3, index, y.a);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\t\\\\tif (x.h !== y.h)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_pushPatch(patches, 0, index, y);\\\\n\\\\t\\\\t\\\\t\\\\treturn;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t\\\\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);\\\\n\\\\t\\\\t\\\\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);\\\\n\\\\n\\\\t\\\\t\\\\tvar patch = y.i(x.g, y.g);\\\\n\\\\t\\\\t\\\\tpatch && _VirtualDom_pushPatch(patches, 5, index, patch);\\\\n\\\\n\\\\t\\\\t\\\\treturn;\\\\n\\\\t}\\\\n}\\\\n\\\\n// assumes the incoming arrays are the same length\\\\nfunction _VirtualDom_pairwiseRefEqual(as, bs)\\\\n{\\\\n\\\\tfor (var i = 0; i < as.length; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tif (as[i] !== bs[i])\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\treturn true;\\\\n}\\\\n\\\\nfunction _VirtualDom_diffNodes(x, y, patches, index, diffKids)\\\\n{\\\\n\\\\t// Bail if obvious indicators have changed. Implies more serious\\\\n\\\\t// structural changes such that it\\\\\\'s not worth it to diff.\\\\n\\\\tif (x.c !== y.c || x.f !== y.f)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_pushPatch(patches, 0, index, y);\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\tvar factsDiff = _VirtualDom_diffFacts(x.d, y.d);\\\\n\\\\tfactsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);\\\\n\\\\n\\\\tdiffKids(x, y, patches, index);\\\\n}\\\\n\\\\n\\\\n\\\\n// DIFF FACTS\\\\n\\\\n\\\\n// TODO Instead of creating a new diff object, it\\\\\\'s possible to just test if\\\\n// there *is* a diff. During the actual patch, do the diff again and make the\\\\n// modifications directly. This way, there\\\\\\'s no new allocations. Worth it?\\\\nfunction _VirtualDom_diffFacts(x, y, category)\\\\n{\\\\n\\\\tvar diff;\\\\n\\\\n\\\\t// look for changes and removals\\\\n\\\\tfor (var xKey in x)\\\\n\\\\t{\\\\n\\\\t\\\\tif (xKey === \\\\\\'a1\\\\\\' || xKey === \\\\\\'a0\\\\\\' || xKey === \\\\\\'a3\\\\\\' || xKey === \\\\\\'a4\\\\\\')\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);\\\\n\\\\t\\\\t\\\\tif (subDiff)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdiff = diff || {};\\\\n\\\\t\\\\t\\\\t\\\\tdiff[xKey] = subDiff;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t// remove if not in the new facts\\\\n\\\\t\\\\tif (!(xKey in y))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tdiff = diff || {};\\\\n\\\\t\\\\t\\\\tdiff[xKey] =\\\\n\\\\t\\\\t\\\\t\\\\t!category\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? (typeof x[xKey] === \\\\\\'string\\\\\\' ? \\\\\\'\\\\\\' : null)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t\\\\t\\\\t(category === \\\\\\'a1\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? \\\\\\'\\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t\\\\t\\\\t(category === \\\\\\'a0\\\\\\' || category === \\\\\\'a3\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t? undefined\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t:\\\\n\\\\t\\\\t\\\\t\\\\t{ f: x[xKey].f, o: undefined };\\\\n\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tvar xValue = x[xKey];\\\\n\\\\t\\\\tvar yValue = y[xKey];\\\\n\\\\n\\\\t\\\\t// reference equal, so don\\\\\\'t worry about it\\\\n\\\\t\\\\tif (xValue === yValue && xKey !== \\\\\\'value\\\\\\' && xKey !== \\\\\\'checked\\\\\\'\\\\n\\\\t\\\\t\\\\t|| category === \\\\\\'a0\\\\\\' && _VirtualDom_equalEvents(xValue, yValue))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tdiff = diff || {};\\\\n\\\\t\\\\tdiff[xKey] = yValue;\\\\n\\\\t}\\\\n\\\\n\\\\t// add new stuff\\\\n\\\\tfor (var yKey in y)\\\\n\\\\t{\\\\n\\\\t\\\\tif (!(yKey in x))\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tdiff = diff || {};\\\\n\\\\t\\\\t\\\\tdiff[yKey] = y[yKey];\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\treturn diff;\\\\n}\\\\n\\\\n\\\\n\\\\n// DIFF KIDS\\\\n\\\\n\\\\nfunction _VirtualDom_diffKids(xParent, yParent, patches, index)\\\\n{\\\\n\\\\tvar xKids = xParent.e;\\\\n\\\\tvar yKids = yParent.e;\\\\n\\\\n\\\\tvar xLen = xKids.length;\\\\n\\\\tvar yLen = yKids.length;\\\\n\\\\n\\\\t// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS\\\\n\\\\n\\\\tif (xLen > yLen)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_pushPatch(patches, 6, index, {\\\\n\\\\t\\\\t\\\\tv: yLen,\\\\n\\\\t\\\\t\\\\ti: xLen - yLen\\\\n\\\\t\\\\t});\\\\n\\\\t}\\\\n\\\\telse if (xLen < yLen)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_pushPatch(patches, 7, index, {\\\\n\\\\t\\\\t\\\\tv: xLen,\\\\n\\\\t\\\\t\\\\te: yKids\\\\n\\\\t\\\\t});\\\\n\\\\t}\\\\n\\\\n\\\\t// PAIRWISE DIFF EVERYTHING ELSE\\\\n\\\\n\\\\tfor (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tvar xKid = xKids[i];\\\\n\\\\t\\\\t_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);\\\\n\\\\t\\\\tindex += xKid.b || 0;\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// KEYED DIFF\\\\n\\\\n\\\\nfunction _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)\\\\n{\\\\n\\\\tvar localPatches = [];\\\\n\\\\n\\\\tvar changes = {}; // Dict String Entry\\\\n\\\\tvar inserts = []; // Array { index : Int, entry : Entry }\\\\n\\\\t// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }\\\\n\\\\n\\\\tvar xKids = xParent.e;\\\\n\\\\tvar yKids = yParent.e;\\\\n\\\\tvar xLen = xKids.length;\\\\n\\\\tvar yLen = yKids.length;\\\\n\\\\tvar xIndex = 0;\\\\n\\\\tvar yIndex = 0;\\\\n\\\\n\\\\tvar index = rootIndex;\\\\n\\\\n\\\\twhile (xIndex < xLen && yIndex < yLen)\\\\n\\\\t{\\\\n\\\\t\\\\tvar x = xKids[xIndex];\\\\n\\\\t\\\\tvar y = yKids[yIndex];\\\\n\\\\n\\\\t\\\\tvar xKey = x.a;\\\\n\\\\t\\\\tvar yKey = y.a;\\\\n\\\\t\\\\tvar xNode = x.b;\\\\n\\\\t\\\\tvar yNode = y.b;\\\\n\\\\n\\\\t\\\\tvar newMatch = undefined;\\\\n\\\\t\\\\tvar oldMatch = undefined;\\\\n\\\\n\\\\t\\\\t// check if keys match\\\\n\\\\n\\\\t\\\\tif (xKey === yKey)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xNode, yNode, localPatches, index);\\\\n\\\\t\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\txIndex++;\\\\n\\\\t\\\\t\\\\tyIndex++;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t// look ahead 1 to detect insertions and removals.\\\\n\\\\n\\\\t\\\\tvar xNext = xKids[xIndex + 1];\\\\n\\\\t\\\\tvar yNext = yKids[yIndex + 1];\\\\n\\\\n\\\\t\\\\tif (xNext)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar xNextKey = xNext.a;\\\\n\\\\t\\\\t\\\\tvar xNextNode = xNext.b;\\\\n\\\\t\\\\t\\\\toldMatch = yKey === xNextKey;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tif (yNext)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tvar yNextKey = yNext.a;\\\\n\\\\t\\\\t\\\\tvar yNextNode = yNext.b;\\\\n\\\\t\\\\t\\\\tnewMatch = xKey === yNextKey;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\n\\\\t\\\\t// swap x and y\\\\n\\\\t\\\\tif (newMatch && oldMatch)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);\\\\n\\\\t\\\\t\\\\t_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);\\\\n\\\\t\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);\\\\n\\\\t\\\\t\\\\tindex += xNextNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\txIndex += 2;\\\\n\\\\t\\\\t\\\\tyIndex += 2;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t// insert y\\\\n\\\\t\\\\tif (newMatch)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);\\\\n\\\\t\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\txIndex += 1;\\\\n\\\\t\\\\t\\\\tyIndex += 2;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t// remove x\\\\n\\\\t\\\\tif (oldMatch)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);\\\\n\\\\t\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);\\\\n\\\\t\\\\t\\\\tindex += xNextNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\txIndex += 2;\\\\n\\\\t\\\\t\\\\tyIndex += 1;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\t// remove x, insert y\\\\n\\\\t\\\\tif (xNext && xNextKey === yNextKey)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);\\\\n\\\\t\\\\t\\\\t_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);\\\\n\\\\t\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\tindex++;\\\\n\\\\t\\\\t\\\\t_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);\\\\n\\\\t\\\\t\\\\tindex += xNextNode.b || 0;\\\\n\\\\n\\\\t\\\\t\\\\txIndex += 2;\\\\n\\\\t\\\\t\\\\tyIndex += 2;\\\\n\\\\t\\\\t\\\\tcontinue;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\tbreak;\\\\n\\\\t}\\\\n\\\\n\\\\t// eat up any remaining nodes with removeNode and insertNode\\\\n\\\\n\\\\twhile (xIndex < xLen)\\\\n\\\\t{\\\\n\\\\t\\\\tindex++;\\\\n\\\\t\\\\tvar x = xKids[xIndex];\\\\n\\\\t\\\\tvar xNode = x.b;\\\\n\\\\t\\\\t_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);\\\\n\\\\t\\\\tindex += xNode.b || 0;\\\\n\\\\t\\\\txIndex++;\\\\n\\\\t}\\\\n\\\\n\\\\twhile (yIndex < yLen)\\\\n\\\\t{\\\\n\\\\t\\\\tvar endInserts = endInserts || [];\\\\n\\\\t\\\\tvar y = yKids[yIndex];\\\\n\\\\t\\\\t_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);\\\\n\\\\t\\\\tyIndex++;\\\\n\\\\t}\\\\n\\\\n\\\\tif (localPatches.length > 0 || inserts.length > 0 || endInserts)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_pushPatch(patches, 8, rootIndex, {\\\\n\\\\t\\\\t\\\\tw: localPatches,\\\\n\\\\t\\\\t\\\\tx: inserts,\\\\n\\\\t\\\\t\\\\ty: endInserts\\\\n\\\\t\\\\t});\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\n\\\\n// CHANGES FROM KEYED DIFF\\\\n\\\\n\\\\nvar _VirtualDom_POSTFIX = \\\\\\'_elmW6BL\\\\\\';\\\\n\\\\n\\\\nfunction _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)\\\\n{\\\\n\\\\tvar entry = changes[key];\\\\n\\\\n\\\\t// never seen this key before\\\\n\\\\tif (!entry)\\\\n\\\\t{\\\\n\\\\t\\\\tentry = {\\\\n\\\\t\\\\t\\\\tc: 0,\\\\n\\\\t\\\\t\\\\tz: vnode,\\\\n\\\\t\\\\t\\\\tr: yIndex,\\\\n\\\\t\\\\t\\\\ts: undefined\\\\n\\\\t\\\\t};\\\\n\\\\n\\\\t\\\\tinserts.push({ r: yIndex, A: entry });\\\\n\\\\t\\\\tchanges[key] = entry;\\\\n\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\t// this key was removed earlier, a match!\\\\n\\\\tif (entry.c === 1)\\\\n\\\\t{\\\\n\\\\t\\\\tinserts.push({ r: yIndex, A: entry });\\\\n\\\\n\\\\t\\\\tentry.c = 2;\\\\n\\\\t\\\\tvar subPatches = [];\\\\n\\\\t\\\\t_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);\\\\n\\\\t\\\\tentry.r = yIndex;\\\\n\\\\t\\\\tentry.s.s = {\\\\n\\\\t\\\\t\\\\tw: subPatches,\\\\n\\\\t\\\\t\\\\tA: entry\\\\n\\\\t\\\\t};\\\\n\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\t// this key has already been inserted or moved, a duplicate!\\\\n\\\\t_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_removeNode(changes, localPatches, key, vnode, index)\\\\n{\\\\n\\\\tvar entry = changes[key];\\\\n\\\\n\\\\t// never seen this key before\\\\n\\\\tif (!entry)\\\\n\\\\t{\\\\n\\\\t\\\\tvar patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);\\\\n\\\\n\\\\t\\\\tchanges[key] = {\\\\n\\\\t\\\\t\\\\tc: 1,\\\\n\\\\t\\\\t\\\\tz: vnode,\\\\n\\\\t\\\\t\\\\tr: index,\\\\n\\\\t\\\\t\\\\ts: patch\\\\n\\\\t\\\\t};\\\\n\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\t// this key was inserted earlier, a match!\\\\n\\\\tif (entry.c === 0)\\\\n\\\\t{\\\\n\\\\t\\\\tentry.c = 2;\\\\n\\\\t\\\\tvar subPatches = [];\\\\n\\\\t\\\\t_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);\\\\n\\\\n\\\\t\\\\t_VirtualDom_pushPatch(localPatches, 9, index, {\\\\n\\\\t\\\\t\\\\tw: subPatches,\\\\n\\\\t\\\\t\\\\tA: entry\\\\n\\\\t\\\\t});\\\\n\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\t// this key has already been removed or moved, a duplicate!\\\\n\\\\t_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);\\\\n}\\\\n\\\\n\\\\n\\\\n// ADD DOM NODES\\\\n//\\\\n// Each DOM node has an "index" assigned in order of traversal. It is important\\\\n// to minimize our crawl over the actual DOM, so these indexes (along with the\\\\n// descendantsCount of virtual nodes) let us skip touching entire subtrees of\\\\n// the DOM if we know there are no patches there.\\\\n\\\\n\\\\nfunction _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)\\\\n{\\\\n\\\\t_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);\\\\n}\\\\n\\\\n\\\\n// assumes `patches` is non-empty and indexes increase monotonically.\\\\nfunction _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)\\\\n{\\\\n\\\\tvar patch = patches[i];\\\\n\\\\tvar index = patch.r;\\\\n\\\\n\\\\twhile (index === low)\\\\n\\\\t{\\\\n\\\\t\\\\tvar patchType = patch.$;\\\\n\\\\n\\\\t\\\\tif (patchType === 1)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse if (patchType === 8)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tpatch.t = domNode;\\\\n\\\\t\\\\t\\\\tpatch.u = eventNode;\\\\n\\\\n\\\\t\\\\t\\\\tvar subPatches = patch.s.w;\\\\n\\\\t\\\\t\\\\tif (subPatches.length > 0)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse if (patchType === 9)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tpatch.t = domNode;\\\\n\\\\t\\\\t\\\\tpatch.u = eventNode;\\\\n\\\\n\\\\t\\\\t\\\\tvar data = patch.s;\\\\n\\\\t\\\\t\\\\tif (data)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdata.A.s = domNode;\\\\n\\\\t\\\\t\\\\t\\\\tvar subPatches = data.w;\\\\n\\\\t\\\\t\\\\t\\\\tif (subPatches.length > 0)\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\telse\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tpatch.t = domNode;\\\\n\\\\t\\\\t\\\\tpatch.u = eventNode;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\ti++;\\\\n\\\\n\\\\t\\\\tif (!(patch = patches[i]) || (index = patch.r) > high)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn i;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\n\\\\tvar tag = vNode.$;\\\\n\\\\n\\\\tif (tag === 4)\\\\n\\\\t{\\\\n\\\\t\\\\tvar subNode = vNode.k;\\\\n\\\\n\\\\t\\\\twhile (subNode.$ === 4)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tsubNode = subNode.k;\\\\n\\\\t\\\\t}\\\\n\\\\n\\\\t\\\\treturn _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);\\\\n\\\\t}\\\\n\\\\n\\\\t// tag must be 1 or 2 at this point\\\\n\\\\n\\\\tvar vKids = vNode.e;\\\\n\\\\tvar childNodes = domNode.childNodes;\\\\n\\\\tfor (var j = 0; j < vKids.length; j++)\\\\n\\\\t{\\\\n\\\\t\\\\tlow++;\\\\n\\\\t\\\\tvar vKid = tag === 1 ? vKids[j] : vKids[j].b;\\\\n\\\\t\\\\tvar nextLow = low + (vKid.b || 0);\\\\n\\\\t\\\\tif (low <= index && index <= nextLow)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\ti = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);\\\\n\\\\t\\\\t\\\\tif (!(patch = patches[i]) || (index = patch.r) > high)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\treturn i;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tlow = nextLow;\\\\n\\\\t}\\\\n\\\\treturn i;\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLY PATCHES\\\\n\\\\n\\\\nfunction _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)\\\\n{\\\\n\\\\tif (patches.length === 0)\\\\n\\\\t{\\\\n\\\\t\\\\treturn rootDomNode;\\\\n\\\\t}\\\\n\\\\n\\\\t_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);\\\\n\\\\treturn _VirtualDom_applyPatchesHelp(rootDomNode, patches);\\\\n}\\\\n\\\\nfunction _VirtualDom_applyPatchesHelp(rootDomNode, patches)\\\\n{\\\\n\\\\tfor (var i = 0; i < patches.length; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tvar patch = patches[i];\\\\n\\\\t\\\\tvar localDomNode = patch.t\\\\n\\\\t\\\\tvar newNode = _VirtualDom_applyPatch(localDomNode, patch);\\\\n\\\\t\\\\tif (localDomNode === rootDomNode)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\trootDomNode = newNode;\\\\n\\\\t\\\\t}\\\\n\\\\t}\\\\n\\\\treturn rootDomNode;\\\\n}\\\\n\\\\nfunction _VirtualDom_applyPatch(domNode, patch)\\\\n{\\\\n\\\\tswitch (patch.$)\\\\n\\\\t{\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\treturn _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);\\\\n\\\\n\\\\t\\\\tcase 4:\\\\n\\\\t\\\\t\\\\t_VirtualDom_applyFacts(domNode, patch.u, patch.s);\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 3:\\\\n\\\\t\\\\t\\\\tdomNode.replaceData(0, domNode.length, patch.s);\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\treturn _VirtualDom_applyPatchesHelp(domNode, patch.s);\\\\n\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\tif (domNode.elm_event_node_ref)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.elm_event_node_ref.j = patch.s;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\telse\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.elm_event_node_ref = { j: patch.s, p: patch.u };\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 6:\\\\n\\\\t\\\\t\\\\tvar data = patch.s;\\\\n\\\\t\\\\t\\\\tfor (var i = 0; i < data.i; i++)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.removeChild(domNode.childNodes[data.v]);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 7:\\\\n\\\\t\\\\t\\\\tvar data = patch.s;\\\\n\\\\t\\\\t\\\\tvar kids = data.e;\\\\n\\\\t\\\\t\\\\tvar i = data.v;\\\\n\\\\t\\\\t\\\\tvar theEnd = domNode.childNodes[i];\\\\n\\\\t\\\\t\\\\tfor (; i < kids.length; i++)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 9:\\\\n\\\\t\\\\t\\\\tvar data = patch.s;\\\\n\\\\t\\\\t\\\\tif (!data)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.parentNode.removeChild(domNode);\\\\n\\\\t\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tvar entry = data.A;\\\\n\\\\t\\\\t\\\\tif (typeof entry.r !== \\\\\\'undefined\\\\\\')\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tdomNode.parentNode.removeChild(domNode);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\tentry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);\\\\n\\\\t\\\\t\\\\treturn domNode;\\\\n\\\\n\\\\t\\\\tcase 8:\\\\n\\\\t\\\\t\\\\treturn _VirtualDom_applyPatchReorder(domNode, patch);\\\\n\\\\n\\\\t\\\\tcase 5:\\\\n\\\\t\\\\t\\\\treturn patch.s(domNode);\\\\n\\\\n\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t_Debug_crash(10); // \\\\\\'Ran into an unknown patch!\\\\\\'\\\\n\\\\t}\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)\\\\n{\\\\n\\\\tvar parentNode = domNode.parentNode;\\\\n\\\\tvar newNode = _VirtualDom_render(vNode, eventNode);\\\\n\\\\n\\\\tif (!newNode.elm_event_node_ref)\\\\n\\\\t{\\\\n\\\\t\\\\tnewNode.elm_event_node_ref = domNode.elm_event_node_ref;\\\\n\\\\t}\\\\n\\\\n\\\\tif (parentNode && newNode !== domNode)\\\\n\\\\t{\\\\n\\\\t\\\\tparentNode.replaceChild(newNode, domNode);\\\\n\\\\t}\\\\n\\\\treturn newNode;\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_applyPatchReorder(domNode, patch)\\\\n{\\\\n\\\\tvar data = patch.s;\\\\n\\\\n\\\\t// remove end inserts\\\\n\\\\tvar frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);\\\\n\\\\n\\\\t// removals\\\\n\\\\tdomNode = _VirtualDom_applyPatchesHelp(domNode, data.w);\\\\n\\\\n\\\\t// inserts\\\\n\\\\tvar inserts = data.x;\\\\n\\\\tfor (var i = 0; i < inserts.length; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tvar insert = inserts[i];\\\\n\\\\t\\\\tvar entry = insert.A;\\\\n\\\\t\\\\tvar node = entry.c === 2\\\\n\\\\t\\\\t\\\\t? entry.s\\\\n\\\\t\\\\t\\\\t: _VirtualDom_render(entry.z, patch.u);\\\\n\\\\t\\\\tdomNode.insertBefore(node, domNode.childNodes[insert.r]);\\\\n\\\\t}\\\\n\\\\n\\\\t// add end inserts\\\\n\\\\tif (frag)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_appendChild(domNode, frag);\\\\n\\\\t}\\\\n\\\\n\\\\treturn domNode;\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)\\\\n{\\\\n\\\\tif (!endInserts)\\\\n\\\\t{\\\\n\\\\t\\\\treturn;\\\\n\\\\t}\\\\n\\\\n\\\\tvar frag = _VirtualDom_doc.createDocumentFragment();\\\\n\\\\tfor (var i = 0; i < endInserts.length; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tvar insert = endInserts[i];\\\\n\\\\t\\\\tvar entry = insert.A;\\\\n\\\\t\\\\t_VirtualDom_appendChild(frag, entry.c === 2\\\\n\\\\t\\\\t\\\\t? entry.s\\\\n\\\\t\\\\t\\\\t: _VirtualDom_render(entry.z, patch.u)\\\\n\\\\t\\\\t);\\\\n\\\\t}\\\\n\\\\treturn frag;\\\\n}\\\\n\\\\n\\\\nfunction _VirtualDom_virtualize(node)\\\\n{\\\\n\\\\t// TEXT NODES\\\\n\\\\n\\\\tif (node.nodeType === 3)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _VirtualDom_text(node.textContent);\\\\n\\\\t}\\\\n\\\\n\\\\n\\\\t// WEIRD NODES\\\\n\\\\n\\\\tif (node.nodeType !== 1)\\\\n\\\\t{\\\\n\\\\t\\\\treturn _VirtualDom_text(\\\\\\'\\\\\\');\\\\n\\\\t}\\\\n\\\\n\\\\n\\\\t// ELEMENT NODES\\\\n\\\\n\\\\tvar attrList = _List_Nil;\\\\n\\\\tvar attrs = node.attributes;\\\\n\\\\tfor (var i = attrs.length; i--; )\\\\n\\\\t{\\\\n\\\\t\\\\tvar attr = attrs[i];\\\\n\\\\t\\\\tvar name = attr.name;\\\\n\\\\t\\\\tvar value = attr.value;\\\\n\\\\t\\\\tattrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );\\\\n\\\\t}\\\\n\\\\n\\\\tvar tag = node.tagName.toLowerCase();\\\\n\\\\tvar kidList = _List_Nil;\\\\n\\\\tvar kids = node.childNodes;\\\\n\\\\n\\\\tfor (var i = kids.length; i--; )\\\\n\\\\t{\\\\n\\\\t\\\\tkidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);\\\\n\\\\t}\\\\n\\\\treturn A3(_VirtualDom_node, tag, attrList, kidList);\\\\n}\\\\n\\\\nfunction _VirtualDom_dekey(keyedNode)\\\\n{\\\\n\\\\tvar keyedKids = keyedNode.e;\\\\n\\\\tvar len = keyedKids.length;\\\\n\\\\tvar kids = new Array(len);\\\\n\\\\tfor (var i = 0; i < len; i++)\\\\n\\\\t{\\\\n\\\\t\\\\tkids[i] = keyedKids[i].b;\\\\n\\\\t}\\\\n\\\\n\\\\treturn {\\\\n\\\\t\\\\t$: 1,\\\\n\\\\t\\\\tc: keyedNode.c,\\\\n\\\\t\\\\td: keyedNode.d,\\\\n\\\\t\\\\te: kids,\\\\n\\\\t\\\\tf: keyedNode.f,\\\\n\\\\t\\\\tb: keyedNode.b\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n\\\\n\\\\n// ELEMENT\\\\n\\\\n\\\\nvar _Debugger_element;\\\\n\\\\nvar _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)\\\\n{\\\\n\\\\treturn _Platform_initialize(\\\\n\\\\t\\\\tflagDecoder,\\\\n\\\\t\\\\targs,\\\\n\\\\t\\\\timpl.aH,\\\\n\\\\t\\\\timpl.aT,\\\\n\\\\t\\\\timpl.aR,\\\\n\\\\t\\\\tfunction(sendToApp, initialModel) {\\\\n\\\\t\\\\t\\\\tvar view = impl.aU;\\\\n\\\\t\\\\t\\\\t/**/\\\\n\\\\t\\\\t\\\\tvar domNode = args[\\\\\\'node\\\\\\'];\\\\n\\\\t\\\\t\\\\t//*/\\\\n\\\\t\\\\t\\\\t/**_UNUSED/\\\\n\\\\t\\\\t\\\\tvar domNode = args && args[\\\\\\'node\\\\\\'] ? args[\\\\\\'node\\\\\\'] : _Debug_crash(0);\\\\n\\\\t\\\\t\\\\t//*/\\\\n\\\\t\\\\t\\\\tvar currNode = _VirtualDom_virtualize(domNode);\\\\n\\\\n\\\\t\\\\t\\\\treturn _Browser_makeAnimator(initialModel, function(model)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tvar nextNode = view(model);\\\\n\\\\t\\\\t\\\\t\\\\tvar patches = _VirtualDom_diff(currNode, nextNode);\\\\n\\\\t\\\\t\\\\t\\\\tdomNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);\\\\n\\\\t\\\\t\\\\t\\\\tcurrNode = nextNode;\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t}\\\\n\\\\t);\\\\n});\\\\n\\\\n\\\\n\\\\n// DOCUMENT\\\\n\\\\n\\\\nvar _Debugger_document;\\\\n\\\\nvar _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)\\\\n{\\\\n\\\\treturn _Platform_initialize(\\\\n\\\\t\\\\tflagDecoder,\\\\n\\\\t\\\\targs,\\\\n\\\\t\\\\timpl.aH,\\\\n\\\\t\\\\timpl.aT,\\\\n\\\\t\\\\timpl.aR,\\\\n\\\\t\\\\tfunction(sendToApp, initialModel) {\\\\n\\\\t\\\\t\\\\tvar divertHrefToApp = impl.S && impl.S(sendToApp)\\\\n\\\\t\\\\t\\\\tvar view = impl.aU;\\\\n\\\\t\\\\t\\\\tvar title = _VirtualDom_doc.title;\\\\n\\\\t\\\\t\\\\tvar bodyNode = _VirtualDom_doc.body;\\\\n\\\\t\\\\t\\\\tvar currNode = _VirtualDom_virtualize(bodyNode);\\\\n\\\\t\\\\t\\\\treturn _Browser_makeAnimator(initialModel, function(model)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_divertHrefToApp = divertHrefToApp;\\\\n\\\\t\\\\t\\\\t\\\\tvar doc = view(model);\\\\n\\\\t\\\\t\\\\t\\\\tvar nextNode = _VirtualDom_node(\\\\\\'body\\\\\\')(_List_Nil)(doc.ay);\\\\n\\\\t\\\\t\\\\t\\\\tvar patches = _VirtualDom_diff(currNode, nextNode);\\\\n\\\\t\\\\t\\\\t\\\\tbodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);\\\\n\\\\t\\\\t\\\\t\\\\tcurrNode = nextNode;\\\\n\\\\t\\\\t\\\\t\\\\t_VirtualDom_divertHrefToApp = 0;\\\\n\\\\t\\\\t\\\\t\\\\t(title !== doc.aS) && (_VirtualDom_doc.title = title = doc.aS);\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t}\\\\n\\\\t);\\\\n});\\\\n\\\\n\\\\n\\\\n// ANIMATION\\\\n\\\\n\\\\nvar _Browser_cancelAnimationFrame =\\\\n\\\\ttypeof cancelAnimationFrame !== \\\\\\'undefined\\\\\\'\\\\n\\\\t\\\\t? cancelAnimationFrame\\\\n\\\\t\\\\t: function(id) { clearTimeout(id); };\\\\n\\\\nvar _Browser_requestAnimationFrame =\\\\n\\\\ttypeof requestAnimationFrame !== \\\\\\'undefined\\\\\\'\\\\n\\\\t\\\\t? requestAnimationFrame\\\\n\\\\t\\\\t: function(callback) { return setTimeout(callback, 1000 / 60); };\\\\n\\\\n\\\\nfunction _Browser_makeAnimator(model, draw)\\\\n{\\\\n\\\\tdraw(model);\\\\n\\\\n\\\\tvar state = 0;\\\\n\\\\n\\\\tfunction updateIfNeeded()\\\\n\\\\t{\\\\n\\\\t\\\\tstate = state === 1\\\\n\\\\t\\\\t\\\\t? 0\\\\n\\\\t\\\\t\\\\t: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );\\\\n\\\\t}\\\\n\\\\n\\\\treturn function(nextModel, isSync)\\\\n\\\\t{\\\\n\\\\t\\\\tmodel = nextModel;\\\\n\\\\n\\\\t\\\\tisSync\\\\n\\\\t\\\\t\\\\t? ( draw(model),\\\\n\\\\t\\\\t\\\\t\\\\tstate === 2 && (state = 1)\\\\n\\\\t\\\\t\\\\t\\\\t)\\\\n\\\\t\\\\t\\\\t: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),\\\\n\\\\t\\\\t\\\\t\\\\tstate = 2\\\\n\\\\t\\\\t\\\\t\\\\t);\\\\n\\\\t};\\\\n}\\\\n\\\\n\\\\n\\\\n// APPLICATION\\\\n\\\\n\\\\nfunction _Browser_application(impl)\\\\n{\\\\n\\\\tvar onUrlChange = impl.aK;\\\\n\\\\tvar onUrlRequest = impl.aL;\\\\n\\\\tvar key = function() { key.a(onUrlChange(_Browser_getUrl())); };\\\\n\\\\n\\\\treturn _Browser_document({\\\\n\\\\t\\\\tS: function(sendToApp)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\tkey.a = sendToApp;\\\\n\\\\t\\\\t\\\\t_Browser_window.addEventListener(\\\\\\'popstate\\\\\\', key);\\\\n\\\\t\\\\t\\\\t_Browser_window.navigator.userAgent.indexOf(\\\\\\'Trident\\\\\\') < 0 || _Browser_window.addEventListener(\\\\\\'hashchange\\\\\\', key);\\\\n\\\\n\\\\t\\\\t\\\\treturn F2(function(domNode, event)\\\\n\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\tif (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute(\\\\\\'download\\\\\\'))\\\\n\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tevent.preventDefault();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar href = domNode.href;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar curr = _Browser_getUrl();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar next = $elm$url$Url$fromString(href).a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tsendToApp(onUrlRequest(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t(next\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t&& curr.al === next.al\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t&& curr.ac === next.ac\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t&& curr.ai.a === next.ai.a\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t? $elm$browser$Browser$Internal(next)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t: $elm$browser$Browser$External(href)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t));\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t},\\\\n\\\\t\\\\taH: function(flags)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\treturn A3(impl.aH, flags, _Browser_getUrl(), key);\\\\n\\\\t\\\\t},\\\\n\\\\t\\\\taU: impl.aU,\\\\n\\\\t\\\\taT: impl.aT,\\\\n\\\\t\\\\taR: impl.aR\\\\n\\\\t});\\\\n}\\\\n\\\\nfunction _Browser_getUrl()\\\\n{\\\\n\\\\treturn $elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);\\\\n}\\\\n\\\\nvar _Browser_go = F2(function(key, n)\\\\n{\\\\n\\\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\\\n\\\\t\\\\tn && history.go(n);\\\\n\\\\t\\\\tkey();\\\\n\\\\t}));\\\\n});\\\\n\\\\nvar _Browser_pushUrl = F2(function(key, url)\\\\n{\\\\n\\\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\\\n\\\\t\\\\thistory.pushState({}, \\\\\\'\\\\\\', url);\\\\n\\\\t\\\\tkey();\\\\n\\\\t}));\\\\n});\\\\n\\\\nvar _Browser_replaceUrl = F2(function(key, url)\\\\n{\\\\n\\\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function() {\\\\n\\\\t\\\\thistory.replaceState({}, \\\\\\'\\\\\\', url);\\\\n\\\\t\\\\tkey();\\\\n\\\\t}));\\\\n});\\\\n\\\\n\\\\n\\\\n// GLOBAL EVENTS\\\\n\\\\n\\\\nvar _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };\\\\nvar _Browser_doc = typeof document !== \\\\\\'undefined\\\\\\' ? document : _Browser_fakeNode;\\\\nvar _Browser_window = typeof window !== \\\\\\'undefined\\\\\\' ? window : _Browser_fakeNode;\\\\n\\\\nvar _Browser_on = F3(function(node, eventName, sendToSelf)\\\\n{\\\\n\\\\treturn _Scheduler_spawn(_Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\tfunction handler(event)\\\\t{ _Scheduler_rawSpawn(sendToSelf(event)); }\\\\n\\\\t\\\\tnode.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });\\\\n\\\\t\\\\treturn function() { node.removeEventListener(eventName, handler); };\\\\n\\\\t}));\\\\n});\\\\n\\\\nvar _Browser_decodeEvent = F2(function(decoder, event)\\\\n{\\\\n\\\\tvar result = _Json_runHelp(decoder, event);\\\\n\\\\treturn $elm$core$Result$isOk(result) ? $elm$core$Maybe$Just(result.a) : $elm$core$Maybe$Nothing;\\\\n});\\\\n\\\\n\\\\n\\\\n// PAGE VISIBILITY\\\\n\\\\n\\\\nfunction _Browser_visibilityInfo()\\\\n{\\\\n\\\\treturn (typeof _VirtualDom_doc.hidden !== \\\\\\'undefined\\\\\\')\\\\n\\\\t\\\\t? { aF: \\\\\\'hidden\\\\\\', az: \\\\\\'visibilitychange\\\\\\' }\\\\n\\\\t\\\\t:\\\\n\\\\t(typeof _VirtualDom_doc.mozHidden !== \\\\\\'undefined\\\\\\')\\\\n\\\\t\\\\t? { aF: \\\\\\'mozHidden\\\\\\', az: \\\\\\'mozvisibilitychange\\\\\\' }\\\\n\\\\t\\\\t:\\\\n\\\\t(typeof _VirtualDom_doc.msHidden !== \\\\\\'undefined\\\\\\')\\\\n\\\\t\\\\t? { aF: \\\\\\'msHidden\\\\\\', az: \\\\\\'msvisibilitychange\\\\\\' }\\\\n\\\\t\\\\t:\\\\n\\\\t(typeof _VirtualDom_doc.webkitHidden !== \\\\\\'undefined\\\\\\')\\\\n\\\\t\\\\t? { aF: \\\\\\'webkitHidden\\\\\\', az: \\\\\\'webkitvisibilitychange\\\\\\' }\\\\n\\\\t\\\\t: { aF: \\\\\\'hidden\\\\\\', az: \\\\\\'visibilitychange\\\\\\' };\\\\n}\\\\n\\\\n\\\\n\\\\n// ANIMATION FRAMES\\\\n\\\\n\\\\nfunction _Browser_rAF()\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\tvar id = _Browser_requestAnimationFrame(function() {\\\\n\\\\t\\\\t\\\\tcallback(_Scheduler_succeed(Date.now()));\\\\n\\\\t\\\\t});\\\\n\\\\n\\\\t\\\\treturn function() {\\\\n\\\\t\\\\t\\\\t_Browser_cancelAnimationFrame(id);\\\\n\\\\t\\\\t};\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\nfunction _Browser_now()\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\tcallback(_Scheduler_succeed(Date.now()));\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\n\\\\n// DOM STUFF\\\\n\\\\n\\\\nfunction _Browser_withNode(id, doStuff)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\t_Browser_requestAnimationFrame(function() {\\\\n\\\\t\\\\t\\\\tvar node = document.getElementById(id);\\\\n\\\\t\\\\t\\\\tcallback(node\\\\n\\\\t\\\\t\\\\t\\\\t? _Scheduler_succeed(doStuff(node))\\\\n\\\\t\\\\t\\\\t\\\\t: _Scheduler_fail($elm$browser$Browser$Dom$NotFound(id))\\\\n\\\\t\\\\t\\\\t);\\\\n\\\\t\\\\t});\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\nfunction _Browser_withWindow(doStuff)\\\\n{\\\\n\\\\treturn _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\t_Browser_requestAnimationFrame(function() {\\\\n\\\\t\\\\t\\\\tcallback(_Scheduler_succeed(doStuff()));\\\\n\\\\t\\\\t});\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\n// FOCUS and BLUR\\\\n\\\\n\\\\nvar _Browser_call = F2(function(functionName, id)\\\\n{\\\\n\\\\treturn _Browser_withNode(id, function(node) {\\\\n\\\\t\\\\tnode[functionName]();\\\\n\\\\t\\\\treturn _Utils_Tuple0;\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\n\\\\n// WINDOW VIEWPORT\\\\n\\\\n\\\\nfunction _Browser_getViewport()\\\\n{\\\\n\\\\treturn {\\\\n\\\\t\\\\tap: _Browser_getScene(),\\\\n\\\\t\\\\tas: {\\\\n\\\\t\\\\t\\\\tau: _Browser_window.pageXOffset,\\\\n\\\\t\\\\t\\\\tav: _Browser_window.pageYOffset,\\\\n\\\\t\\\\t\\\\tat: _Browser_doc.documentElement.clientWidth,\\\\n\\\\t\\\\t\\\\tab: _Browser_doc.documentElement.clientHeight\\\\n\\\\t\\\\t}\\\\n\\\\t};\\\\n}\\\\n\\\\nfunction _Browser_getScene()\\\\n{\\\\n\\\\tvar body = _Browser_doc.body;\\\\n\\\\tvar elem = _Browser_doc.documentElement;\\\\n\\\\treturn {\\\\n\\\\t\\\\tat: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),\\\\n\\\\t\\\\tab: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)\\\\n\\\\t};\\\\n}\\\\n\\\\nvar _Browser_setViewport = F2(function(x, y)\\\\n{\\\\n\\\\treturn _Browser_withWindow(function()\\\\n\\\\t{\\\\n\\\\t\\\\t_Browser_window.scroll(x, y);\\\\n\\\\t\\\\treturn _Utils_Tuple0;\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\n\\\\n// ELEMENT VIEWPORT\\\\n\\\\n\\\\nfunction _Browser_getViewportOf(id)\\\\n{\\\\n\\\\treturn _Browser_withNode(id, function(node)\\\\n\\\\t{\\\\n\\\\t\\\\treturn {\\\\n\\\\t\\\\t\\\\tap: {\\\\n\\\\t\\\\t\\\\t\\\\tat: node.scrollWidth,\\\\n\\\\t\\\\t\\\\t\\\\tab: node.scrollHeight\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\tas: {\\\\n\\\\t\\\\t\\\\t\\\\tau: node.scrollLeft,\\\\n\\\\t\\\\t\\\\t\\\\tav: node.scrollTop,\\\\n\\\\t\\\\t\\\\t\\\\tat: node.clientWidth,\\\\n\\\\t\\\\t\\\\t\\\\tab: node.clientHeight\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t};\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\nvar _Browser_setViewportOf = F3(function(id, x, y)\\\\n{\\\\n\\\\treturn _Browser_withNode(id, function(node)\\\\n\\\\t{\\\\n\\\\t\\\\tnode.scrollLeft = x;\\\\n\\\\t\\\\tnode.scrollTop = y;\\\\n\\\\t\\\\treturn _Utils_Tuple0;\\\\n\\\\t});\\\\n});\\\\n\\\\n\\\\n\\\\n// ELEMENT\\\\n\\\\n\\\\nfunction _Browser_getElement(id)\\\\n{\\\\n\\\\treturn _Browser_withNode(id, function(node)\\\\n\\\\t{\\\\n\\\\t\\\\tvar rect = node.getBoundingClientRect();\\\\n\\\\t\\\\tvar x = _Browser_window.pageXOffset;\\\\n\\\\t\\\\tvar y = _Browser_window.pageYOffset;\\\\n\\\\t\\\\treturn {\\\\n\\\\t\\\\t\\\\tap: _Browser_getScene(),\\\\n\\\\t\\\\t\\\\tas: {\\\\n\\\\t\\\\t\\\\t\\\\tau: x,\\\\n\\\\t\\\\t\\\\t\\\\tav: y,\\\\n\\\\t\\\\t\\\\t\\\\tat: _Browser_doc.documentElement.clientWidth,\\\\n\\\\t\\\\t\\\\t\\\\tab: _Browser_doc.documentElement.clientHeight\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\taC: {\\\\n\\\\t\\\\t\\\\t\\\\tau: x + rect.left,\\\\n\\\\t\\\\t\\\\t\\\\tav: y + rect.top,\\\\n\\\\t\\\\t\\\\t\\\\tat: rect.width,\\\\n\\\\t\\\\t\\\\t\\\\tab: rect.height\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t};\\\\n\\\\t});\\\\n}\\\\n\\\\n\\\\n\\\\n// LOAD and RELOAD\\\\n\\\\n\\\\nfunction _Browser_reload(skipCache)\\\\n{\\\\n\\\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\t_VirtualDom_doc.location.reload(skipCache);\\\\n\\\\t}));\\\\n}\\\\n\\\\nfunction _Browser_load(url)\\\\n{\\\\n\\\\treturn A2($elm$core$Task$perform, $elm$core$Basics$never, _Scheduler_binding(function(callback)\\\\n\\\\t{\\\\n\\\\t\\\\ttry\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t_Browser_window.location = url;\\\\n\\\\t\\\\t}\\\\n\\\\t\\\\tcatch(err)\\\\n\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.\\\\n\\\\t\\\\t\\\\t// Other browsers reload the page, so let\\\\\\'s be consistent about that.\\\\n\\\\t\\\\t\\\\t_VirtualDom_doc.location.reload(false);\\\\n\\\\t\\\\t}\\\\n\\\\t}));\\\\n}\\\\n\\\\n\\\\n\\\\nvar _Bitwise_and = F2(function(a, b)\\\\n{\\\\n\\\\treturn a & b;\\\\n});\\\\n\\\\nvar _Bitwise_or = F2(function(a, b)\\\\n{\\\\n\\\\treturn a | b;\\\\n});\\\\n\\\\nvar _Bitwise_xor = F2(function(a, b)\\\\n{\\\\n\\\\treturn a ^ b;\\\\n});\\\\n\\\\nfunction _Bitwise_complement(a)\\\\n{\\\\n\\\\treturn ~a;\\\\n};\\\\n\\\\nvar _Bitwise_shiftLeftBy = F2(function(offset, a)\\\\n{\\\\n\\\\treturn a << offset;\\\\n});\\\\n\\\\nvar _Bitwise_shiftRightBy = F2(function(offset, a)\\\\n{\\\\n\\\\treturn a >> offset;\\\\n});\\\\n\\\\nvar _Bitwise_shiftRightZfBy = F2(function(offset, a)\\\\n{\\\\n\\\\treturn a >>> offset;\\\\n});\\\\nvar $elm$core$Basics$EQ = 1;\\\\nvar $elm$core$Basics$GT = 2;\\\\nvar $elm$core$Basics$LT = 0;\\\\nvar $elm$core$List$cons = _List_cons;\\\\nvar $elm$core$Dict$foldr = F3(\\\\n\\\\tfunction (func, acc, t) {\\\\n\\\\t\\\\tfoldr:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tif (t.$ === -2) {\\\\n\\\\t\\\\t\\\\t\\\\treturn acc;\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar key = t.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar value = t.c;\\\\n\\\\t\\\\t\\\\t\\\\tvar left = t.d;\\\\n\\\\t\\\\t\\\\t\\\\tvar right = t.e;\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$func = func,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$acc = A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfunc,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tkey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvalue,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm$core$Dict$foldr, func, acc, right)),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$t = left;\\\\n\\\\t\\\\t\\\\t\\\\tfunc = $temp$func;\\\\n\\\\t\\\\t\\\\t\\\\tacc = $temp$acc;\\\\n\\\\t\\\\t\\\\t\\\\tt = $temp$t;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue foldr;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Dict$toList = function (dict) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$core$Dict$foldr,\\\\n\\\\t\\\\tF3(\\\\n\\\\t\\\\t\\\\tfunction (key, value, list) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$cons,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(key, value),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tlist);\\\\n\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t_List_Nil,\\\\n\\\\t\\\\tdict);\\\\n};\\\\nvar $elm$core$Dict$keys = function (dict) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$core$Dict$foldr,\\\\n\\\\t\\\\tF3(\\\\n\\\\t\\\\t\\\\tfunction (key, value, keyList) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm$core$List$cons, key, keyList);\\\\n\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t_List_Nil,\\\\n\\\\t\\\\tdict);\\\\n};\\\\nvar $elm$core$Set$toList = function (_v0) {\\\\n\\\\tvar dict = _v0;\\\\n\\\\treturn $elm$core$Dict$keys(dict);\\\\n};\\\\nvar $elm$core$Elm$JsArray$foldr = _JsArray_foldr;\\\\nvar $elm$core$Array$foldr = F3(\\\\n\\\\tfunction (func, baseCase, _v0) {\\\\n\\\\t\\\\tvar tree = _v0.c;\\\\n\\\\t\\\\tvar tail = _v0.d;\\\\n\\\\t\\\\tvar helper = F2(\\\\n\\\\t\\\\t\\\\tfunction (node, acc) {\\\\n\\\\t\\\\t\\\\t\\\\tif (!node.$) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar subTree = node.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A3($elm$core$Elm$JsArray$foldr, helper, acc, subTree);\\\\n\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar values = node.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A3($elm$core$Elm$JsArray$foldr, func, acc, values);\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t$elm$core$Elm$JsArray$foldr,\\\\n\\\\t\\\\t\\\\thelper,\\\\n\\\\t\\\\t\\\\tA3($elm$core$Elm$JsArray$foldr, func, baseCase, tail),\\\\n\\\\t\\\\t\\\\ttree);\\\\n\\\\t});\\\\nvar $elm$core$Array$toList = function (array) {\\\\n\\\\treturn A3($elm$core$Array$foldr, $elm$core$List$cons, _List_Nil, array);\\\\n};\\\\nvar $elm$core$Result$Err = function (a) {\\\\n\\\\treturn {$: 1, a: a};\\\\n};\\\\nvar $elm$json$Json$Decode$Failure = F2(\\\\n\\\\tfunction (a, b) {\\\\n\\\\t\\\\treturn {$: 3, a: a, b: b};\\\\n\\\\t});\\\\nvar $elm$json$Json$Decode$Field = F2(\\\\n\\\\tfunction (a, b) {\\\\n\\\\t\\\\treturn {$: 0, a: a, b: b};\\\\n\\\\t});\\\\nvar $elm$json$Json$Decode$Index = F2(\\\\n\\\\tfunction (a, b) {\\\\n\\\\t\\\\treturn {$: 1, a: a, b: b};\\\\n\\\\t});\\\\nvar $elm$core$Result$Ok = function (a) {\\\\n\\\\treturn {$: 0, a: a};\\\\n};\\\\nvar $elm$json$Json$Decode$OneOf = function (a) {\\\\n\\\\treturn {$: 2, a: a};\\\\n};\\\\nvar $elm$core$Basics$False = 1;\\\\nvar $elm$core$Basics$add = _Basics_add;\\\\nvar $elm$core$Maybe$Just = function (a) {\\\\n\\\\treturn {$: 0, a: a};\\\\n};\\\\nvar $elm$core$Maybe$Nothing = {$: 1};\\\\nvar $elm$core$String$all = _String_all;\\\\nvar $elm$core$Basics$and = _Basics_and;\\\\nvar $elm$core$Basics$append = _Utils_append;\\\\nvar $elm$json$Json$Encode$encode = _Json_encode;\\\\nvar $elm$core$String$fromInt = _String_fromNumber;\\\\nvar $elm$core$String$join = F2(\\\\n\\\\tfunction (sep, chunks) {\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t_String_join,\\\\n\\\\t\\\\t\\\\tsep,\\\\n\\\\t\\\\t\\\\t_List_toArray(chunks));\\\\n\\\\t});\\\\nvar $elm$core$String$split = F2(\\\\n\\\\tfunction (sep, string) {\\\\n\\\\t\\\\treturn _List_fromArray(\\\\n\\\\t\\\\t\\\\tA2(_String_split, sep, string));\\\\n\\\\t});\\\\nvar $elm$json$Json$Decode$indent = function (str) {\\\\n\\\\treturn A2(\\\\n\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\\\'\\\\\\\\n    \\\\\\',\\\\n\\\\t\\\\tA2($elm$core$String$split, \\\\\\'\\\\\\\\n\\\\\\', str));\\\\n};\\\\nvar $elm$core$List$foldl = F3(\\\\n\\\\tfunction (func, acc, list) {\\\\n\\\\t\\\\tfoldl:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tif (!list.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn acc;\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar x = list.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar xs = list.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$func = func,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$acc = A2(func, x, acc),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$list = xs;\\\\n\\\\t\\\\t\\\\t\\\\tfunc = $temp$func;\\\\n\\\\t\\\\t\\\\t\\\\tacc = $temp$acc;\\\\n\\\\t\\\\t\\\\t\\\\tlist = $temp$list;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue foldl;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$List$length = function (xs) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$core$List$foldl,\\\\n\\\\t\\\\tF2(\\\\n\\\\t\\\\t\\\\tfunction (_v0, i) {\\\\n\\\\t\\\\t\\\\t\\\\treturn i + 1;\\\\n\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t0,\\\\n\\\\t\\\\txs);\\\\n};\\\\nvar $elm$core$List$map2 = _List_map2;\\\\nvar $elm$core$Basics$le = _Utils_le;\\\\nvar $elm$core$Basics$sub = _Basics_sub;\\\\nvar $elm$core$List$rangeHelp = F3(\\\\n\\\\tfunction (lo, hi, list) {\\\\n\\\\t\\\\trangeHelp:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tif (_Utils_cmp(lo, hi) < 1) {\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$lo = lo,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$hi = hi - 1,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$list = A2($elm$core$List$cons, hi, list);\\\\n\\\\t\\\\t\\\\t\\\\tlo = $temp$lo;\\\\n\\\\t\\\\t\\\\t\\\\thi = $temp$hi;\\\\n\\\\t\\\\t\\\\t\\\\tlist = $temp$list;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue rangeHelp;\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\treturn list;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$List$range = F2(\\\\n\\\\tfunction (lo, hi) {\\\\n\\\\t\\\\treturn A3($elm$core$List$rangeHelp, lo, hi, _List_Nil);\\\\n\\\\t});\\\\nvar $elm$core$List$indexedMap = F2(\\\\n\\\\tfunction (f, xs) {\\\\n\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t$elm$core$List$map2,\\\\n\\\\t\\\\t\\\\tf,\\\\n\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$List$range,\\\\n\\\\t\\\\t\\\\t\\\\t0,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$List$length(xs) - 1),\\\\n\\\\t\\\\t\\\\txs);\\\\n\\\\t});\\\\nvar $elm$core$Char$toCode = _Char_toCode;\\\\nvar $elm$core$Char$isLower = function (_char) {\\\\n\\\\tvar code = $elm$core$Char$toCode(_char);\\\\n\\\\treturn (97 <= code) && (code <= 122);\\\\n};\\\\nvar $elm$core$Char$isUpper = function (_char) {\\\\n\\\\tvar code = $elm$core$Char$toCode(_char);\\\\n\\\\treturn (code <= 90) && (65 <= code);\\\\n};\\\\nvar $elm$core$Basics$or = _Basics_or;\\\\nvar $elm$core$Char$isAlpha = function (_char) {\\\\n\\\\treturn $elm$core$Char$isLower(_char) || $elm$core$Char$isUpper(_char);\\\\n};\\\\nvar $elm$core$Char$isDigit = function (_char) {\\\\n\\\\tvar code = $elm$core$Char$toCode(_char);\\\\n\\\\treturn (code <= 57) && (48 <= code);\\\\n};\\\\nvar $elm$core$Char$isAlphaNum = function (_char) {\\\\n\\\\treturn $elm$core$Char$isLower(_char) || ($elm$core$Char$isUpper(_char) || $elm$core$Char$isDigit(_char));\\\\n};\\\\nvar $elm$core$List$reverse = function (list) {\\\\n\\\\treturn A3($elm$core$List$foldl, $elm$core$List$cons, _List_Nil, list);\\\\n};\\\\nvar $elm$core$String$uncons = _String_uncons;\\\\nvar $elm$json$Json$Decode$errorOneOf = F2(\\\\n\\\\tfunction (i, error) {\\\\n\\\\t\\\\treturn \\\\\\'\\\\\\\\n\\\\\\\\n(\\\\\\' + ($elm$core$String$fromInt(i + 1) + (\\\\\\') \\\\\\' + $elm$json$Json$Decode$indent(\\\\n\\\\t\\\\t\\\\t$elm$json$Json$Decode$errorToString(error))));\\\\n\\\\t});\\\\nvar $elm$json$Json$Decode$errorToString = function (error) {\\\\n\\\\treturn A2($elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);\\\\n};\\\\nvar $elm$json$Json$Decode$errorToStringHelp = F2(\\\\n\\\\tfunction (error, context) {\\\\n\\\\t\\\\terrorToStringHelp:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tswitch (error.$) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar f = error.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar err = error.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar isSimple = function () {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar _v1 = $elm$core$String$uncons(f);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (_v1.$ === 1) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar _v2 = _v1.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar _char = _v2.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar rest = _v2.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Char$isAlpha(_char) && A2($elm$core$String$all, $elm$core$Char$isAlphaNum, rest);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar fieldName = isSimple ? (\\\\\\'.\\\\\\' + f) : (\\\\\\'[\\\\\\\\\\\\\\'\\\\\\' + (f + \\\\\\'\\\\\\\\\\\\\\']\\\\\\'));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$error = err,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$context = A2($elm$core$List$cons, fieldName, context);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\terror = $temp$error;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontext = $temp$context;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontinue errorToStringHelp;\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar i = error.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar err = error.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar indexName = \\\\\\'[\\\\\\' + ($elm$core$String$fromInt(i) + \\\\\\']\\\\\\');\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$error = err,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$context = A2($elm$core$List$cons, indexName, context);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\terror = $temp$error;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontext = $temp$context;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontinue errorToStringHelp;\\\\n\\\\t\\\\t\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar errors = error.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tif (!errors.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'Ran into a Json.Decode.oneOf with no possibilities\\\\\\' + function () {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (!context.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'!\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\' at json\\\\\\' + A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$reverse(context));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (!errors.b.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar err = errors.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$error = err,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$context = context;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\terror = $temp$error;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcontext = $temp$context;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcontinue errorToStringHelp;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar starter = function () {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (!context.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'Json.Decode.oneOf\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'The Json.Decode.oneOf at json\\\\\\' + A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$reverse(context));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar introduction = starter + (\\\\\\' failed in the following \\\\\\' + ($elm$core$String$fromInt(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$length(errors)) + \\\\\\' ways:\\\\\\'));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\\\n\\\\\\\\n\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$cons,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tintroduction,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$List$indexedMap, $elm$json$Json$Decode$errorOneOf, errors)));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar msg = error.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar json = error.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar introduction = function () {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (!context.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'Problem with the given value:\\\\\\\\n\\\\\\\\n\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'Problem with the value at json\\\\\\' + (A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$reverse(context)) + \\\\\\':\\\\\\\\n\\\\\\\\n    \\\\\\');\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}();\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn introduction + ($elm$json$Json$Decode$indent(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$json$Json$Encode$encode, 4, json)) + (\\\\\\'\\\\\\\\n\\\\\\\\n\\\\\\' + msg));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Array$branchFactor = 32;\\\\nvar $elm$core$Array$Array_elm_builtin = F4(\\\\n\\\\tfunction (a, b, c, d) {\\\\n\\\\t\\\\treturn {$: 0, a: a, b: b, c: c, d: d};\\\\n\\\\t});\\\\nvar $elm$core$Elm$JsArray$empty = _JsArray_empty;\\\\nvar $elm$core$Basics$ceiling = _Basics_ceiling;\\\\nvar $elm$core$Basics$fdiv = _Basics_fdiv;\\\\nvar $elm$core$Basics$logBase = F2(\\\\n\\\\tfunction (base, number) {\\\\n\\\\t\\\\treturn _Basics_log(number) / _Basics_log(base);\\\\n\\\\t});\\\\nvar $elm$core$Basics$toFloat = _Basics_toFloat;\\\\nvar $elm$core$Array$shiftStep = $elm$core$Basics$ceiling(\\\\n\\\\tA2($elm$core$Basics$logBase, 2, $elm$core$Array$branchFactor));\\\\nvar $elm$core$Array$empty = A4($elm$core$Array$Array_elm_builtin, 0, $elm$core$Array$shiftStep, $elm$core$Elm$JsArray$empty, $elm$core$Elm$JsArray$empty);\\\\nvar $elm$core$Elm$JsArray$initialize = _JsArray_initialize;\\\\nvar $elm$core$Array$Leaf = function (a) {\\\\n\\\\treturn {$: 1, a: a};\\\\n};\\\\nvar $elm$core$Basics$apL = F2(\\\\n\\\\tfunction (f, x) {\\\\n\\\\t\\\\treturn f(x);\\\\n\\\\t});\\\\nvar $elm$core$Basics$apR = F2(\\\\n\\\\tfunction (x, f) {\\\\n\\\\t\\\\treturn f(x);\\\\n\\\\t});\\\\nvar $elm$core$Basics$eq = _Utils_equal;\\\\nvar $elm$core$Basics$floor = _Basics_floor;\\\\nvar $elm$core$Elm$JsArray$length = _JsArray_length;\\\\nvar $elm$core$Basics$gt = _Utils_gt;\\\\nvar $elm$core$Basics$max = F2(\\\\n\\\\tfunction (x, y) {\\\\n\\\\t\\\\treturn (_Utils_cmp(x, y) > 0) ? x : y;\\\\n\\\\t});\\\\nvar $elm$core$Basics$mul = _Basics_mul;\\\\nvar $elm$core$Array$SubTree = function (a) {\\\\n\\\\treturn {$: 0, a: a};\\\\n};\\\\nvar $elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;\\\\nvar $elm$core$Array$compressNodes = F2(\\\\n\\\\tfunction (nodes, acc) {\\\\n\\\\t\\\\tcompressNodes:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tvar _v0 = A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodes);\\\\n\\\\t\\\\t\\\\tvar node = _v0.a;\\\\n\\\\t\\\\t\\\\tvar remainingNodes = _v0.b;\\\\n\\\\t\\\\t\\\\tvar newAcc = A2(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$List$cons,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Array$SubTree(node),\\\\n\\\\t\\\\t\\\\t\\\\tacc);\\\\n\\\\t\\\\t\\\\tif (!remainingNodes.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn $elm$core$List$reverse(newAcc);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$nodes = remainingNodes,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$acc = newAcc;\\\\n\\\\t\\\\t\\\\t\\\\tnodes = $temp$nodes;\\\\n\\\\t\\\\t\\\\t\\\\tacc = $temp$acc;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue compressNodes;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Tuple$first = function (_v0) {\\\\n\\\\tvar x = _v0.a;\\\\n\\\\treturn x;\\\\n};\\\\nvar $elm$core$Array$treeFromBuilder = F2(\\\\n\\\\tfunction (nodeList, nodeListSize) {\\\\n\\\\t\\\\ttreeFromBuilder:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tvar newNodeSize = $elm$core$Basics$ceiling(nodeListSize / $elm$core$Array$branchFactor);\\\\n\\\\t\\\\t\\\\tif (newNodeSize === 1) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm$core$Elm$JsArray$initializeFromList, $elm$core$Array$branchFactor, nodeList).a;\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$nodeList = A2($elm$core$Array$compressNodes, nodeList, _List_Nil),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$nodeListSize = newNodeSize;\\\\n\\\\t\\\\t\\\\t\\\\tnodeList = $temp$nodeList;\\\\n\\\\t\\\\t\\\\t\\\\tnodeListSize = $temp$nodeListSize;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue treeFromBuilder;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Array$builderToArray = F2(\\\\n\\\\tfunction (reverseNodeList, builder) {\\\\n\\\\t\\\\tif (!builder.f) {\\\\n\\\\t\\\\t\\\\treturn A4(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Array$Array_elm_builtin,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Elm$JsArray$length(builder.h),\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Array$shiftStep,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Elm$JsArray$empty,\\\\n\\\\t\\\\t\\\\t\\\\tbuilder.h);\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar treeLen = builder.f * $elm$core$Array$branchFactor;\\\\n\\\\t\\\\t\\\\tvar depth = $elm$core$Basics$floor(\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$core$Basics$logBase, $elm$core$Array$branchFactor, treeLen - 1));\\\\n\\\\t\\\\t\\\\tvar correctNodeList = reverseNodeList ? $elm$core$List$reverse(builder.i) : builder.i;\\\\n\\\\t\\\\t\\\\tvar tree = A2($elm$core$Array$treeFromBuilder, correctNodeList, builder.f);\\\\n\\\\t\\\\t\\\\treturn A4(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Array$Array_elm_builtin,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Elm$JsArray$length(builder.h) + treeLen,\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$core$Basics$max, 5, depth * $elm$core$Array$shiftStep),\\\\n\\\\t\\\\t\\\\t\\\\ttree,\\\\n\\\\t\\\\t\\\\t\\\\tbuilder.h);\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Basics$idiv = _Basics_idiv;\\\\nvar $elm$core$Basics$lt = _Utils_lt;\\\\nvar $elm$core$Array$initializeHelp = F5(\\\\n\\\\tfunction (fn, fromIndex, len, nodeList, tail) {\\\\n\\\\t\\\\tinitializeHelp:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tif (fromIndex < 0) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Array$builderToArray,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfalse,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t{i: nodeList, f: (len / $elm$core$Array$branchFactor) | 0, h: tail});\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar leaf = $elm$core$Array$Leaf(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm$core$Elm$JsArray$initialize, $elm$core$Array$branchFactor, fromIndex, fn));\\\\n\\\\t\\\\t\\\\t\\\\tvar $temp$fn = fn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$fromIndex = fromIndex - $elm$core$Array$branchFactor,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$len = len,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$nodeList = A2($elm$core$List$cons, leaf, nodeList),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$temp$tail = tail;\\\\n\\\\t\\\\t\\\\t\\\\tfn = $temp$fn;\\\\n\\\\t\\\\t\\\\t\\\\tfromIndex = $temp$fromIndex;\\\\n\\\\t\\\\t\\\\t\\\\tlen = $temp$len;\\\\n\\\\t\\\\t\\\\t\\\\tnodeList = $temp$nodeList;\\\\n\\\\t\\\\t\\\\t\\\\ttail = $temp$tail;\\\\n\\\\t\\\\t\\\\t\\\\tcontinue initializeHelp;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Basics$remainderBy = _Basics_remainderBy;\\\\nvar $elm$core$Array$initialize = F2(\\\\n\\\\tfunction (len, fn) {\\\\n\\\\t\\\\tif (len <= 0) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Array$empty;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar tailLen = len % $elm$core$Array$branchFactor;\\\\n\\\\t\\\\t\\\\tvar tail = A3($elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);\\\\n\\\\t\\\\t\\\\tvar initialFromIndex = (len - tailLen) - $elm$core$Array$branchFactor;\\\\n\\\\t\\\\t\\\\treturn A5($elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Basics$True = 0;\\\\nvar $elm$core$Result$isOk = function (result) {\\\\n\\\\tif (!result.$) {\\\\n\\\\t\\\\treturn true;\\\\n\\\\t} else {\\\\n\\\\t\\\\treturn false;\\\\n\\\\t}\\\\n};\\\\nvar $elm$json$Json$Decode$map = _Json_map1;\\\\nvar $elm$json$Json$Decode$map2 = _Json_map2;\\\\nvar $elm$json$Json$Decode$succeed = _Json_succeed;\\\\nvar $elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {\\\\n\\\\tswitch (handler.$) {\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\treturn 0;\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\treturn 1;\\\\n\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\treturn 2;\\\\n\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\treturn 3;\\\\n\\\\t}\\\\n};\\\\nvar $elm$browser$Browser$External = function (a) {\\\\n\\\\treturn {$: 1, a: a};\\\\n};\\\\nvar $elm$browser$Browser$Internal = function (a) {\\\\n\\\\treturn {$: 0, a: a};\\\\n};\\\\nvar $elm$core$Basics$identity = function (x) {\\\\n\\\\treturn x;\\\\n};\\\\nvar $elm$browser$Browser$Dom$NotFound = $elm$core$Basics$identity;\\\\nvar $elm$url$Url$Http = 0;\\\\nvar $elm$url$Url$Https = 1;\\\\nvar $elm$url$Url$Url = F6(\\\\n\\\\tfunction (protocol, host, port_, path, query, fragment) {\\\\n\\\\t\\\\treturn {aa: fragment, ac: host, ag: path, ai: port_, al: protocol, am: query};\\\\n\\\\t});\\\\nvar $elm$core$String$contains = _String_contains;\\\\nvar $elm$core$String$length = _String_length;\\\\nvar $elm$core$String$slice = _String_slice;\\\\nvar $elm$core$String$dropLeft = F2(\\\\n\\\\tfunction (n, string) {\\\\n\\\\t\\\\treturn (n < 1) ? string : A3(\\\\n\\\\t\\\\t\\\\t$elm$core$String$slice,\\\\n\\\\t\\\\t\\\\tn,\\\\n\\\\t\\\\t\\\\t$elm$core$String$length(string),\\\\n\\\\t\\\\t\\\\tstring);\\\\n\\\\t});\\\\nvar $elm$core$String$indexes = _String_indexes;\\\\nvar $elm$core$String$isEmpty = function (string) {\\\\n\\\\treturn string === \\\\\\'\\\\\\';\\\\n};\\\\nvar $elm$core$String$left = F2(\\\\n\\\\tfunction (n, string) {\\\\n\\\\t\\\\treturn (n < 1) ? \\\\\\'\\\\\\' : A3($elm$core$String$slice, 0, n, string);\\\\n\\\\t});\\\\nvar $elm$core$String$toInt = _String_toInt;\\\\nvar $elm$url$Url$chompBeforePath = F5(\\\\n\\\\tfunction (protocol, path, params, frag, str) {\\\\n\\\\t\\\\tif ($elm$core$String$isEmpty(str) || A2($elm$core$String$contains, \\\\\\'@\\\\\\', str)) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar _v0 = A2($elm$core$String$indexes, \\\\\\':\\\\\\', str);\\\\n\\\\t\\\\t\\\\tif (!_v0.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA6($elm$url$Url$Url, protocol, str, $elm$core$Maybe$Nothing, path, params, frag));\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tif (!_v0.b.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar i = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar _v1 = $elm$core$String$toInt(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$dropLeft, i + 1, str));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tif (_v1.$ === 1) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar port_ = _v1;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA6(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$url$Url$Url,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tprotocol,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$left, i, str),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tport_,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tpath,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tparams,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfrag));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$url$Url$chompBeforeQuery = F4(\\\\n\\\\tfunction (protocol, params, frag, str) {\\\\n\\\\t\\\\tif ($elm$core$String$isEmpty(str)) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar _v0 = A2($elm$core$String$indexes, \\\\\\'/\\\\\\', str);\\\\n\\\\t\\\\t\\\\tif (!_v0.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A5($elm$url$Url$chompBeforePath, protocol, \\\\\\'/\\\\\\', params, frag, str);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar i = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$url$Url$chompBeforePath,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tprotocol,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$dropLeft, i, str),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tparams,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfrag,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$left, i, str));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$url$Url$chompBeforeFragment = F3(\\\\n\\\\tfunction (protocol, frag, str) {\\\\n\\\\t\\\\tif ($elm$core$String$isEmpty(str)) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar _v0 = A2($elm$core$String$indexes, \\\\\\'?\\\\\\', str);\\\\n\\\\t\\\\t\\\\tif (!_v0.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A4($elm$url$Url$chompBeforeQuery, protocol, $elm$core$Maybe$Nothing, frag, str);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar i = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn A4(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$url$Url$chompBeforeQuery,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tprotocol,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$dropLeft, i + 1, str)),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfrag,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$left, i, str));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$url$Url$chompAfterProtocol = F2(\\\\n\\\\tfunction (protocol, str) {\\\\n\\\\t\\\\tif ($elm$core$String$isEmpty(str)) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar _v0 = A2($elm$core$String$indexes, \\\\\\'#\\\\\\', str);\\\\n\\\\t\\\\t\\\\tif (!_v0.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A3($elm$url$Url$chompBeforeFragment, protocol, $elm$core$Maybe$Nothing, str);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar i = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$url$Url$chompBeforeFragment,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tprotocol,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$dropLeft, i + 1, str)),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA2($elm$core$String$left, i, str));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$String$startsWith = _String_startsWith;\\\\nvar $elm$url$Url$fromString = function (str) {\\\\n\\\\treturn A2($elm$core$String$startsWith, \\\\\\'http://\\\\\\', str) ? A2(\\\\n\\\\t\\\\t$elm$url$Url$chompAfterProtocol,\\\\n\\\\t\\\\t0,\\\\n\\\\t\\\\tA2($elm$core$String$dropLeft, 7, str)) : (A2($elm$core$String$startsWith, \\\\\\'https://\\\\\\', str) ? A2(\\\\n\\\\t\\\\t$elm$url$Url$chompAfterProtocol,\\\\n\\\\t\\\\t1,\\\\n\\\\t\\\\tA2($elm$core$String$dropLeft, 8, str)) : $elm$core$Maybe$Nothing);\\\\n};\\\\nvar $elm$core$Basics$never = function (_v0) {\\\\n\\\\tnever:\\\\n\\\\twhile (true) {\\\\n\\\\t\\\\tvar nvr = _v0;\\\\n\\\\t\\\\tvar $temp$_v0 = nvr;\\\\n\\\\t\\\\t_v0 = $temp$_v0;\\\\n\\\\t\\\\tcontinue never;\\\\n\\\\t}\\\\n};\\\\nvar $elm$core$Task$Perform = $elm$core$Basics$identity;\\\\nvar $elm$core$Task$succeed = _Scheduler_succeed;\\\\nvar $elm$core$Task$init = $elm$core$Task$succeed(0);\\\\nvar $elm$core$List$foldrHelper = F4(\\\\n\\\\tfunction (fn, acc, ctr, ls) {\\\\n\\\\t\\\\tif (!ls.b) {\\\\n\\\\t\\\\t\\\\treturn acc;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar a = ls.a;\\\\n\\\\t\\\\t\\\\tvar r1 = ls.b;\\\\n\\\\t\\\\t\\\\tif (!r1.b) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2(fn, a, acc);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\tvar b = r1.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar r2 = r1.b;\\\\n\\\\t\\\\t\\\\t\\\\tif (!r2.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\ta,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(fn, b, acc));\\\\n\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar c = r2.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar r3 = r2.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tif (!r3.b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\ta,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tb,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(fn, c, acc)));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar d = r3.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar r4 = r3.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar res = (ctr > 500) ? A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$foldl,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tacc,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$reverse(r4)) : A4($elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\ta,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tb,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tfn,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tc,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(fn, d, res))));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$List$foldr = F3(\\\\n\\\\tfunction (fn, acc, ls) {\\\\n\\\\t\\\\treturn A4($elm$core$List$foldrHelper, fn, acc, 0, ls);\\\\n\\\\t});\\\\nvar $elm$core$List$map = F2(\\\\n\\\\tfunction (f, xs) {\\\\n\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t$elm$core$List$foldr,\\\\n\\\\t\\\\t\\\\tF2(\\\\n\\\\t\\\\t\\\\t\\\\tfunction (x, acc) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$cons,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tf(x),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tacc);\\\\n\\\\t\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t\\\\t_List_Nil,\\\\n\\\\t\\\\t\\\\txs);\\\\n\\\\t});\\\\nvar $elm$core$Task$andThen = _Scheduler_andThen;\\\\nvar $elm$core$Task$map = F2(\\\\n\\\\tfunction (func, taskA) {\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t$elm$core$Task$andThen,\\\\n\\\\t\\\\t\\\\tfunction (a) {\\\\n\\\\t\\\\t\\\\t\\\\treturn $elm$core$Task$succeed(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfunc(a));\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\ttaskA);\\\\n\\\\t});\\\\nvar $elm$core$Task$map2 = F3(\\\\n\\\\tfunction (func, taskA, taskB) {\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t$elm$core$Task$andThen,\\\\n\\\\t\\\\t\\\\tfunction (a) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Task$andThen,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfunction (b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Task$succeed(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA2(func, a, b));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\t\\\\t\\\\ttaskB);\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\ttaskA);\\\\n\\\\t});\\\\nvar $elm$core$Task$sequence = function (tasks) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$core$List$foldr,\\\\n\\\\t\\\\t$elm$core$Task$map2($elm$core$List$cons),\\\\n\\\\t\\\\t$elm$core$Task$succeed(_List_Nil),\\\\n\\\\t\\\\ttasks);\\\\n};\\\\nvar $elm$core$Platform$sendToApp = _Platform_sendToApp;\\\\nvar $elm$core$Task$spawnCmd = F2(\\\\n\\\\tfunction (router, _v0) {\\\\n\\\\t\\\\tvar task = _v0;\\\\n\\\\t\\\\treturn _Scheduler_spawn(\\\\n\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Task$andThen,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Platform$sendToApp(router),\\\\n\\\\t\\\\t\\\\t\\\\ttask));\\\\n\\\\t});\\\\nvar $elm$core$Task$onEffects = F3(\\\\n\\\\tfunction (router, commands, state) {\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t$elm$core$Task$map,\\\\n\\\\t\\\\t\\\\tfunction (_v0) {\\\\n\\\\t\\\\t\\\\t\\\\treturn 0;\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\t$elm$core$Task$sequence(\\\\n\\\\t\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$List$map,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Task$spawnCmd(router),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcommands)));\\\\n\\\\t});\\\\nvar $elm$core$Task$onSelfMsg = F3(\\\\n\\\\tfunction (_v0, _v1, _v2) {\\\\n\\\\t\\\\treturn $elm$core$Task$succeed(0);\\\\n\\\\t});\\\\nvar $elm$core$Task$cmdMap = F2(\\\\n\\\\tfunction (tagger, _v0) {\\\\n\\\\t\\\\tvar task = _v0;\\\\n\\\\t\\\\treturn A2($elm$core$Task$map, tagger, task);\\\\n\\\\t});\\\\n_Platform_effectManagers[\\\\\\'Task\\\\\\'] = _Platform_createManager($elm$core$Task$init, $elm$core$Task$onEffects, $elm$core$Task$onSelfMsg, $elm$core$Task$cmdMap);\\\\nvar $elm$core$Task$command = _Platform_leaf(\\\\\\'Task\\\\\\');\\\\nvar $elm$core$Task$perform = F2(\\\\n\\\\tfunction (toMessage, task) {\\\\n\\\\t\\\\treturn $elm$core$Task$command(\\\\n\\\\t\\\\t\\\\tA2($elm$core$Task$map, toMessage, task));\\\\n\\\\t});\\\\nvar $elm$browser$Browser$element = _Browser_element;\\\\nvar $author$project$Main$Model = F2(\\\\n\\\\tfunction (property, property2) {\\\\n\\\\t\\\\treturn {aN: property, aO: property2};\\\\n\\\\t});\\\\nvar $elm$core$Platform$Cmd$batch = _Platform_batch;\\\\nvar $elm$core$Platform$Cmd$none = $elm$core$Platform$Cmd$batch(_List_Nil);\\\\nvar $author$project$Main$init = function (flags) {\\\\n\\\\treturn _Utils_Tuple2(\\\\n\\\\t\\\\tA2($author$project$Main$Model, 0, \\\\\\'modelInitialValue2\\\\\\'),\\\\n\\\\t\\\\t$elm$core$Platform$Cmd$none);\\\\n};\\\\nvar $elm$core$Platform$Sub$batch = _Platform_batch;\\\\nvar $elm$core$Platform$Sub$none = $elm$core$Platform$Sub$batch(_List_Nil);\\\\nvar $author$project$Main$subscriptions = function (model) {\\\\n\\\\treturn $elm$core$Platform$Sub$none;\\\\n};\\\\nvar $author$project$Main$update = F2(\\\\n\\\\tfunction (msg, model) {\\\\n\\\\t\\\\tif (!msg) {\\\\n\\\\t\\\\t\\\\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$graph$Graph$DOT$TB = 0;\\\\nvar $elm$virtual_dom$VirtualDom$attribute = F2(\\\\n\\\\tfunction (key, value) {\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t_VirtualDom_attribute,\\\\n\\\\t\\\\t\\\\t_VirtualDom_noOnOrFormAction(key),\\\\n\\\\t\\\\t\\\\t_VirtualDom_noJavaScriptOrHtmlUri(value));\\\\n\\\\t});\\\\nvar $elm$html$Html$Attributes$attribute = $elm$virtual_dom$VirtualDom$attribute;\\\\nvar $elm_community$graph$Graph$Edge = F3(\\\\n\\\\tfunction (from, to, label) {\\\\n\\\\t\\\\treturn {F: from, s: label, H: to};\\\\n\\\\t});\\\\nvar $elm_community$graph$Graph$Node = F2(\\\\n\\\\tfunction (id, label) {\\\\n\\\\t\\\\treturn {n: id, s: label};\\\\n\\\\t});\\\\nvar $elm_community$graph$Graph$Graph = $elm$core$Basics$identity;\\\\nvar $elm_community$graph$Graph$NodeContext = F3(\\\\n\\\\tfunction (node, incoming, outgoing) {\\\\n\\\\t\\\\treturn {e: incoming, aJ: node, d: outgoing};\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$Empty = {$: 0};\\\\nvar $elm_community$intdict$IntDict$empty = $elm_community$intdict$IntDict$Empty;\\\\nvar $elm$core$Basics$always = F2(\\\\n\\\\tfunction (a, _v0) {\\\\n\\\\t\\\\treturn a;\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$Inner = function (a) {\\\\n\\\\treturn {$: 2, a: a};\\\\n};\\\\nvar $elm_community$intdict$IntDict$size = function (dict) {\\\\n\\\\tswitch (dict.$) {\\\\n\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\treturn 0;\\\\n\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\treturn 1;\\\\n\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\tvar i = dict.a;\\\\n\\\\t\\\\t\\\\treturn i.T;\\\\n\\\\t}\\\\n};\\\\nvar $elm_community$intdict$IntDict$inner = F3(\\\\n\\\\tfunction (p, l, r) {\\\\n\\\\t\\\\tvar _v0 = _Utils_Tuple2(l, r);\\\\n\\\\t\\\\tif (!_v0.a.$) {\\\\n\\\\t\\\\t\\\\tvar _v1 = _v0.a;\\\\n\\\\t\\\\t\\\\treturn r;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tif (!_v0.b.$) {\\\\n\\\\t\\\\t\\\\t\\\\tvar _v2 = _v0.b;\\\\n\\\\t\\\\t\\\\t\\\\treturn l;\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\treturn $elm_community$intdict$IntDict$Inner(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\ta: l,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tc: p,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tb: r,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tT: $elm_community$intdict$IntDict$size(l) + $elm_community$intdict$IntDict$size(r)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Bitwise$and = _Bitwise_and;\\\\nvar $elm$core$Basics$composeR = F3(\\\\n\\\\tfunction (f, g, x) {\\\\n\\\\t\\\\treturn g(\\\\n\\\\t\\\\t\\\\tf(x));\\\\n\\\\t});\\\\nvar $elm$core$Basics$neq = _Utils_notEqual;\\\\nvar $elm$core$Bitwise$complement = _Bitwise_complement;\\\\nvar $elm$core$Bitwise$or = _Bitwise_or;\\\\nvar $elm$core$Bitwise$shiftRightZfBy = _Bitwise_shiftRightZfBy;\\\\nvar $elm_community$intdict$IntDict$highestBitSet = function (n) {\\\\n\\\\tvar shiftOr = F2(\\\\n\\\\t\\\\tfunction (i, shift) {\\\\n\\\\t\\\\t\\\\treturn i | (i >>> shift);\\\\n\\\\t\\\\t});\\\\n\\\\tvar n1 = A2(shiftOr, n, 1);\\\\n\\\\tvar n2 = A2(shiftOr, n1, 2);\\\\n\\\\tvar n3 = A2(shiftOr, n2, 4);\\\\n\\\\tvar n4 = A2(shiftOr, n3, 8);\\\\n\\\\tvar n5 = A2(shiftOr, n4, 16);\\\\n\\\\treturn n5 & (~(n5 >>> 1));\\\\n};\\\\nvar $elm$core$Basics$negate = function (n) {\\\\n\\\\treturn -n;\\\\n};\\\\nvar $elm_community$intdict$IntDict$signBit = $elm_community$intdict$IntDict$highestBitSet(-1);\\\\nvar $elm$core$Bitwise$xor = _Bitwise_xor;\\\\nvar $elm_community$intdict$IntDict$isBranchingBitSet = function (p) {\\\\n\\\\treturn A2(\\\\n\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t$elm$core$Bitwise$xor($elm_community$intdict$IntDict$signBit),\\\\n\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t\\\\t$elm$core$Bitwise$and(p.D),\\\\n\\\\t\\\\t\\\\t$elm$core$Basics$neq(0)));\\\\n};\\\\nvar $elm_community$intdict$IntDict$higherBitMask = function (branchingBit) {\\\\n\\\\treturn branchingBit ^ (~(branchingBit - 1));\\\\n};\\\\nvar $elm_community$intdict$IntDict$lcp = F2(\\\\n\\\\tfunction (x, y) {\\\\n\\\\t\\\\tvar branchingBit = $elm_community$intdict$IntDict$highestBitSet(x ^ y);\\\\n\\\\t\\\\tvar mask = $elm_community$intdict$IntDict$higherBitMask(branchingBit);\\\\n\\\\t\\\\tvar prefixBits = x & mask;\\\\n\\\\t\\\\treturn {D: branchingBit, r: prefixBits};\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$Leaf = function (a) {\\\\n\\\\treturn {$: 1, a: a};\\\\n};\\\\nvar $elm_community$intdict$IntDict$leaf = F2(\\\\n\\\\tfunction (k, v) {\\\\n\\\\t\\\\treturn $elm_community$intdict$IntDict$Leaf(\\\\n\\\\t\\\\t\\\\t{ad: k, u: v});\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$prefixMatches = F2(\\\\n\\\\tfunction (p, n) {\\\\n\\\\t\\\\treturn _Utils_eq(\\\\n\\\\t\\\\t\\\\tn & $elm_community$intdict$IntDict$higherBitMask(p.D),\\\\n\\\\t\\\\t\\\\tp.r);\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$update = F3(\\\\n\\\\tfunction (key, alter, dict) {\\\\n\\\\t\\\\tvar join = F2(\\\\n\\\\t\\\\t\\\\tfunction (_v2, _v3) {\\\\n\\\\t\\\\t\\\\t\\\\tvar k1 = _v2.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar l = _v2.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar k2 = _v3.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar r = _v3.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar prefix = A2($elm_community$intdict$IntDict$lcp, k1, k2);\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm_community$intdict$IntDict$isBranchingBitSet, prefix, k2) ? A3($elm_community$intdict$IntDict$inner, prefix, l, r) : A3($elm_community$intdict$IntDict$inner, prefix, r, l);\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\tvar alteredNode = function (mv) {\\\\n\\\\t\\\\t\\\\tvar _v1 = alter(mv);\\\\n\\\\t\\\\t\\\\tif (!_v1.$) {\\\\n\\\\t\\\\t\\\\t\\\\tvar v = _v1.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm_community$intdict$IntDict$leaf, key, v);\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\treturn $elm_community$intdict$IntDict$empty;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t};\\\\n\\\\t\\\\tswitch (dict.$) {\\\\n\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\treturn alteredNode($elm$core$Maybe$Nothing);\\\\n\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\tvar l = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn _Utils_eq(l.ad, key) ? alteredNode(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$Just(l.u)) : A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tjoin,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tkey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\talteredNode($elm$core$Maybe$Nothing)),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(l.ad, dict));\\\\n\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\tvar i = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm_community$intdict$IntDict$prefixMatches, i.c, key) ? (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.c, key) ? A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$inner,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\ti.c,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\ti.a,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm_community$intdict$IntDict$update, key, alter, i.b)) : A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$inner,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\ti.c,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm_community$intdict$IntDict$update, key, alter, i.a),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\ti.b)) : A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tjoin,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tkey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\talteredNode($elm$core$Maybe$Nothing)),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(i.c.r, dict));\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$insert = F3(\\\\n\\\\tfunction (key, value, dict) {\\\\n\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$update,\\\\n\\\\t\\\\t\\\\tkey,\\\\n\\\\t\\\\t\\\\t$elm$core$Basics$always(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$Just(value)),\\\\n\\\\t\\\\t\\\\tdict);\\\\n\\\\t});\\\\nvar $elm$core$Maybe$map = F2(\\\\n\\\\tfunction (f, maybe) {\\\\n\\\\t\\\\tif (!maybe.$) {\\\\n\\\\t\\\\t\\\\tvar value = maybe.a;\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Just(\\\\n\\\\t\\\\t\\\\t\\\\tf(value));\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Basics$not = _Basics_not;\\\\nvar $elm_community$intdict$IntDict$get = F2(\\\\n\\\\tfunction (key, dict) {\\\\n\\\\t\\\\tget:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tswitch (dict.$) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar l = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn _Utils_eq(l.ad, key) ? $elm$core$Maybe$Just(l.u) : $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar i = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tif (!A2($elm_community$intdict$IntDict$prefixMatches, i.c, key)) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$Maybe$Nothing;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tif (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.c, key)) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$key = key,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$dict = i.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tkey = $temp$key;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tdict = $temp$dict;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcontinue get;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$key = key,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$dict = i.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tkey = $temp$key;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tdict = $temp$dict;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcontinue get;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$member = F2(\\\\n\\\\tfunction (key, dict) {\\\\n\\\\t\\\\tvar _v0 = A2($elm_community$intdict$IntDict$get, key, dict);\\\\n\\\\t\\\\tif (!_v0.$) {\\\\n\\\\t\\\\t\\\\treturn true;\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\treturn false;\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$graph$Graph$fromNodesAndEdges = F2(\\\\n\\\\tfunction (nodes_, edges_) {\\\\n\\\\t\\\\tvar nodeRep = A3(\\\\n\\\\t\\\\t\\\\t$elm$core$List$foldl,\\\\n\\\\t\\\\t\\\\tfunction (n) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$insert,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tn.n,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm_community$graph$Graph$NodeContext, n, $elm_community$intdict$IntDict$empty, $elm_community$intdict$IntDict$empty));\\\\n\\\\t\\\\t\\\\t},\\\\n\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$empty,\\\\n\\\\t\\\\t\\\\tnodes_);\\\\n\\\\t\\\\tvar addEdge = F2(\\\\n\\\\t\\\\t\\\\tfunction (edge, rep) {\\\\n\\\\t\\\\t\\\\t\\\\tvar updateOutgoing = function (ctx) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn _Utils_update(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tctx,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\td: A3($elm_community$intdict$IntDict$insert, edge.H, edge.s, ctx.d)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\t\\\\t};\\\\n\\\\t\\\\t\\\\t\\\\tvar updateIncoming = function (ctx) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn _Utils_update(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tctx,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t{\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\te: A3($elm_community$intdict$IntDict$insert, edge.F, edge.s, ctx.e)\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\t\\\\t};\\\\n\\\\t\\\\t\\\\t\\\\treturn A3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$update,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tedge.H,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$map(updateIncoming),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA3(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm_community$intdict$IntDict$update,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tedge.F,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Maybe$map(updateOutgoing),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\trep));\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\tvar addEdgeIfValid = F2(\\\\n\\\\t\\\\t\\\\tfunction (edge, rep) {\\\\n\\\\t\\\\t\\\\t\\\\treturn (A2($elm_community$intdict$IntDict$member, edge.F, rep) && A2($elm_community$intdict$IntDict$member, edge.H, rep)) ? A2(addEdge, edge, rep) : rep;\\\\n\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\treturn A3($elm$core$List$foldl, addEdgeIfValid, nodeRep, edges_);\\\\n\\\\t});\\\\nvar $author$project$Main$dressUp = function () {\\\\n\\\\tvar nodes = _List_fromArray(\\\\n\\\\t\\\\t[\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 0, \\\\\\'Socks\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 1, \\\\\\'Undershirt\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 2, \\\\\\'Pants\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 3, \\\\\\'Shoes\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 4, \\\\\\'Watch\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 5, \\\\\\'Shirt\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 6, \\\\\\'Belt\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 7, \\\\\\'Tie\\\\\\'),\\\\n\\\\t\\\\t\\\\tA2($elm_community$graph$Graph$Node, 8, \\\\\\'Jacket\\\\\\')\\\\n\\\\t\\\\t]);\\\\n\\\\tvar e = F2(\\\\n\\\\t\\\\tfunction (from, to) {\\\\n\\\\t\\\\t\\\\treturn A3($elm_community$graph$Graph$Edge, from, to, 0);\\\\n\\\\t\\\\t});\\\\n\\\\tvar edges = _List_fromArray(\\\\n\\\\t\\\\t[\\\\n\\\\t\\\\t\\\\tA2(e, 0, 3),\\\\n\\\\t\\\\t\\\\tA2(e, 1, 2),\\\\n\\\\t\\\\t\\\\tA2(e, 1, 3),\\\\n\\\\t\\\\t\\\\tA2(e, 2, 3),\\\\n\\\\t\\\\t\\\\tA2(e, 2, 6),\\\\n\\\\t\\\\t\\\\tA2(e, 5, 6),\\\\n\\\\t\\\\t\\\\tA2(e, 5, 7),\\\\n\\\\t\\\\t\\\\tA2(e, 6, 8),\\\\n\\\\t\\\\t\\\\tA2(e, 7, 8)\\\\n\\\\t\\\\t]);\\\\n\\\\treturn A2($elm_community$graph$Graph$fromNodesAndEdges, nodes, edges);\\\\n}();\\\\nvar $elm$core$Dict$RBEmpty_elm_builtin = {$: -2};\\\\nvar $elm$core$Dict$empty = $elm$core$Dict$RBEmpty_elm_builtin;\\\\nvar $elm$core$Dict$Black = 1;\\\\nvar $elm$core$Dict$RBNode_elm_builtin = F5(\\\\n\\\\tfunction (a, b, c, d, e) {\\\\n\\\\t\\\\treturn {$: -1, a: a, b: b, c: c, d: d, e: e};\\\\n\\\\t});\\\\nvar $elm$core$Dict$Red = 0;\\\\nvar $elm$core$Dict$balance = F5(\\\\n\\\\tfunction (color, key, value, left, right) {\\\\n\\\\t\\\\tif ((right.$ === -1) && (!right.a)) {\\\\n\\\\t\\\\t\\\\tvar _v1 = right.a;\\\\n\\\\t\\\\t\\\\tvar rK = right.b;\\\\n\\\\t\\\\t\\\\tvar rV = right.c;\\\\n\\\\t\\\\t\\\\tvar rLeft = right.d;\\\\n\\\\t\\\\t\\\\tvar rRight = right.e;\\\\n\\\\t\\\\t\\\\tif ((left.$ === -1) && (!left.a)) {\\\\n\\\\t\\\\t\\\\t\\\\tvar _v3 = left.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar lK = left.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar lV = left.c;\\\\n\\\\t\\\\t\\\\t\\\\tvar lLeft = left.d;\\\\n\\\\t\\\\t\\\\t\\\\tvar lRight = left.e;\\\\n\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Dict$RBNode_elm_builtin,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t0,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tkey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvalue,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA5($elm$core$Dict$RBNode_elm_builtin, 1, lK, lV, lLeft, lRight),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA5($elm$core$Dict$RBNode_elm_builtin, 1, rK, rV, rLeft, rRight));\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Dict$RBNode_elm_builtin,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcolor,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\trK,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\trV,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA5($elm$core$Dict$RBNode_elm_builtin, 0, key, value, left, rLeft),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\trRight);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tif ((((left.$ === -1) && (!left.a)) && (left.d.$ === -1)) && (!left.d.a)) {\\\\n\\\\t\\\\t\\\\t\\\\tvar _v5 = left.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar lK = left.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar lV = left.c;\\\\n\\\\t\\\\t\\\\t\\\\tvar _v6 = left.d;\\\\n\\\\t\\\\t\\\\t\\\\tvar _v7 = _v6.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar llK = _v6.b;\\\\n\\\\t\\\\t\\\\t\\\\tvar llV = _v6.c;\\\\n\\\\t\\\\t\\\\t\\\\tvar llLeft = _v6.d;\\\\n\\\\t\\\\t\\\\t\\\\tvar llRight = _v6.e;\\\\n\\\\t\\\\t\\\\t\\\\tvar lRight = left.e;\\\\n\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Dict$RBNode_elm_builtin,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t0,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tlK,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tlV,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA5($elm$core$Dict$RBNode_elm_builtin, 1, llK, llV, llLeft, llRight),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tA5($elm$core$Dict$RBNode_elm_builtin, 1, key, value, lRight, right));\\\\n\\\\t\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\t\\\\treturn A5($elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Basics$compare = _Utils_compare;\\\\nvar $elm$core$Dict$insertHelp = F3(\\\\n\\\\tfunction (key, value, dict) {\\\\n\\\\t\\\\tif (dict.$ === -2) {\\\\n\\\\t\\\\t\\\\treturn A5($elm$core$Dict$RBNode_elm_builtin, 0, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar nColor = dict.a;\\\\n\\\\t\\\\t\\\\tvar nKey = dict.b;\\\\n\\\\t\\\\t\\\\tvar nValue = dict.c;\\\\n\\\\t\\\\t\\\\tvar nLeft = dict.d;\\\\n\\\\t\\\\t\\\\tvar nRight = dict.e;\\\\n\\\\t\\\\t\\\\tvar _v1 = A2($elm$core$Basics$compare, key, nKey);\\\\n\\\\t\\\\t\\\\tswitch (_v1) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Dict$balance,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnColor,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnKey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnValue,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm$core$Dict$insertHelp, key, value, nLeft),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnRight);\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A5($elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A5(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$elm$core$Dict$balance,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnColor,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnKey,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnValue,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tnLeft,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tA3($elm$core$Dict$insertHelp, key, value, nRight));\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Dict$insert = F3(\\\\n\\\\tfunction (key, value, dict) {\\\\n\\\\t\\\\tvar _v0 = A3($elm$core$Dict$insertHelp, key, value, dict);\\\\n\\\\t\\\\tif ((_v0.$ === -1) && (!_v0.a)) {\\\\n\\\\t\\\\t\\\\tvar _v1 = _v0.a;\\\\n\\\\t\\\\t\\\\tvar k = _v0.b;\\\\n\\\\t\\\\t\\\\tvar v = _v0.c;\\\\n\\\\t\\\\t\\\\tvar l = _v0.d;\\\\n\\\\t\\\\t\\\\tvar r = _v0.e;\\\\n\\\\t\\\\t\\\\treturn A5($elm$core$Dict$RBNode_elm_builtin, 1, k, v, l, r);\\\\n\\\\t\\\\t} else {\\\\n\\\\t\\\\t\\\\tvar x = _v0;\\\\n\\\\t\\\\t\\\\treturn x;\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm$core$Dict$fromList = function (assocs) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$core$List$foldl,\\\\n\\\\t\\\\tF2(\\\\n\\\\t\\\\t\\\\tfunction (_v0, dict) {\\\\n\\\\t\\\\t\\\\t\\\\tvar key = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\tvar value = _v0.b;\\\\n\\\\t\\\\t\\\\t\\\\treturn A3($elm$core$Dict$insert, key, value, dict);\\\\n\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t$elm$core$Dict$empty,\\\\n\\\\t\\\\tassocs);\\\\n};\\\\nvar $elm$virtual_dom$VirtualDom$node = function (tag) {\\\\n\\\\treturn _VirtualDom_node(\\\\n\\\\t\\\\t_VirtualDom_noScript(tag));\\\\n};\\\\nvar $elm$html$Html$node = $elm$virtual_dom$VirtualDom$node;\\\\nvar $elm_community$intdict$IntDict$foldl = F3(\\\\n\\\\tfunction (f, acc, dict) {\\\\n\\\\t\\\\tfoldl:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tswitch (dict.$) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn acc;\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar l = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A3(f, l.ad, l.u, acc);\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar i = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$f = f,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$acc = A3($elm_community$intdict$IntDict$foldl, f, acc, i.a),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$dict = i.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tf = $temp$f;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tacc = $temp$acc;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tdict = $temp$dict;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontinue foldl;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$graph$Graph$unGraph = function (graph) {\\\\n\\\\tvar rep = graph;\\\\n\\\\treturn rep;\\\\n};\\\\nvar $elm_community$graph$Graph$edges = function (graph) {\\\\n\\\\tvar flippedFoldl = F3(\\\\n\\\\t\\\\tfunction (f, dict, list) {\\\\n\\\\t\\\\t\\\\treturn A3($elm_community$intdict$IntDict$foldl, f, list, dict);\\\\n\\\\t\\\\t});\\\\n\\\\tvar prependEdges = F2(\\\\n\\\\t\\\\tfunction (node1, ctx) {\\\\n\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\tflippedFoldl,\\\\n\\\\t\\\\t\\\\t\\\\tF2(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfunction (node2, e) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn $elm$core$List$cons(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t{F: node1, s: e, H: node2});\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t\\\\t\\\\tctx.d);\\\\n\\\\t\\\\t});\\\\n\\\\treturn A3(\\\\n\\\\t\\\\tflippedFoldl,\\\\n\\\\t\\\\tprependEdges,\\\\n\\\\t\\\\t$elm_community$graph$Graph$unGraph(graph),\\\\n\\\\t\\\\t_List_Nil);\\\\n};\\\\nvar $elm$core$Dict$isEmpty = function (dict) {\\\\n\\\\tif (dict.$ === -2) {\\\\n\\\\t\\\\treturn true;\\\\n\\\\t} else {\\\\n\\\\t\\\\treturn false;\\\\n\\\\t}\\\\n};\\\\nvar $elm_community$intdict$IntDict$foldr = F3(\\\\n\\\\tfunction (f, acc, dict) {\\\\n\\\\t\\\\tfoldr:\\\\n\\\\t\\\\twhile (true) {\\\\n\\\\t\\\\t\\\\tswitch (dict.$) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn acc;\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar l = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn A3(f, l.ad, l.u, acc);\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar i = dict.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar $temp$f = f,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$acc = A3($elm_community$intdict$IntDict$foldr, f, acc, i.b),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t$temp$dict = i.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tf = $temp$f;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tacc = $temp$acc;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tdict = $temp$dict;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tcontinue foldr;\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t}\\\\n\\\\t});\\\\nvar $elm_community$intdict$IntDict$values = function (dict) {\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm_community$intdict$IntDict$foldr,\\\\n\\\\t\\\\tF3(\\\\n\\\\t\\\\t\\\\tfunction (key, value, valueList) {\\\\n\\\\t\\\\t\\\\t\\\\treturn A2($elm$core$List$cons, value, valueList);\\\\n\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t_List_Nil,\\\\n\\\\t\\\\tdict);\\\\n};\\\\nvar $elm_community$graph$Graph$nodes = A2(\\\\n\\\\t$elm$core$Basics$composeR,\\\\n\\\\t$elm_community$graph$Graph$unGraph,\\\\n\\\\tA2(\\\\n\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t$elm_community$intdict$IntDict$values,\\\\n\\\\t\\\\t$elm$core$List$map(\\\\n\\\\t\\\\t\\\\tfunction ($) {\\\\n\\\\t\\\\t\\\\t\\\\treturn $.aJ;\\\\n\\\\t\\\\t\\\\t})));\\\\nvar $elm$core$List$sortWith = _List_sortWith;\\\\nvar $elm$json$Json$Encode$string = _Json_wrap;\\\\nvar $elm_community$graph$Graph$DOT$outputWithStylesAndAttributes = F4(\\\\n\\\\tfunction (styles, nodeAttrs, edgeAttrs, graph) {\\\\n\\\\t\\\\tvar rankDirToString = function (r) {\\\\n\\\\t\\\\t\\\\tswitch (r) {\\\\n\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'TB\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\tcase 1:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'LR\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'BT\\\\\\';\\\\n\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\treturn \\\\\\'RL\\\\\\';\\\\n\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t};\\\\n\\\\t\\\\tvar nodes = $elm_community$graph$Graph$nodes(graph);\\\\n\\\\t\\\\tvar encode = A2(\\\\n\\\\t\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t\\\\t$elm$json$Json$Encode$string,\\\\n\\\\t\\\\t\\\\t$elm$json$Json$Encode$encode(0));\\\\n\\\\t\\\\tvar edges = function () {\\\\n\\\\t\\\\t\\\\tvar compareEdge = F2(\\\\n\\\\t\\\\t\\\\t\\\\tfunction (a, b) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tvar _v1 = A2($elm$core$Basics$compare, a.F, b.F);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tswitch (_v1) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcase 0:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn 0;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tcase 2:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn 2;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tdefault:\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn A2($elm$core$Basics$compare, a.H, b.H);\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}\\\\n\\\\t\\\\t\\\\t\\\\t});\\\\n\\\\t\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$List$sortWith,\\\\n\\\\t\\\\t\\\\t\\\\tcompareEdge,\\\\n\\\\t\\\\t\\\\t\\\\t$elm_community$graph$Graph$edges(graph));\\\\n\\\\t\\\\t}();\\\\n\\\\t\\\\tvar attrAssocs = A2(\\\\n\\\\t\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t\\\\t$elm$core$Dict$toList,\\\\n\\\\t\\\\t\\\\tA2(\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$Basics$composeR,\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$List$map(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tfunction (_v0) {\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar k = _v0.a;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tvar v = _v0.b;\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\treturn k + (\\\\\\'=\\\\\\' + encode(v));\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t}),\\\\n\\\\t\\\\t\\\\t\\\\t$elm$core$String$join(\\\\\\', \\\\\\')));\\\\n\\\\t\\\\tvar makeAttrs = function (d) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Dict$isEmpty(d) ? \\\\\\'\\\\\\' : (\\\\\\' [\\\\\\' + (attrAssocs(d) + \\\\\\']\\\\\\'));\\\\n\\\\t\\\\t};\\\\n\\\\t\\\\tvar edge = function (e) {\\\\n\\\\t\\\\t\\\\treturn \\\\\\'  \\\\\\' + ($elm$core$String$fromInt(e.F) + (\\\\\\' -> \\\\\\' + ($elm$core$String$fromInt(e.H) + makeAttrs(\\\\n\\\\t\\\\t\\\\t\\\\tedgeAttrs(e.s)))));\\\\n\\\\t\\\\t};\\\\n\\\\t\\\\tvar edgesString = A2(\\\\n\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\\\'\\\\\\\\n\\\\\\',\\\\n\\\\t\\\\t\\\\tA2($elm$core$List$map, edge, edges));\\\\n\\\\t\\\\tvar node = function (n) {\\\\n\\\\t\\\\t\\\\treturn \\\\\\'  \\\\\\' + ($elm$core$String$fromInt(n.n) + makeAttrs(\\\\n\\\\t\\\\t\\\\t\\\\tnodeAttrs(n.s)));\\\\n\\\\t\\\\t};\\\\n\\\\t\\\\tvar nodesString = A2(\\\\n\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\\\'\\\\\\\\n\\\\\\',\\\\n\\\\t\\\\t\\\\tA2($elm$core$List$map, node, nodes));\\\\n\\\\t\\\\treturn A2(\\\\n\\\\t\\\\t\\\\t$elm$core$String$join,\\\\n\\\\t\\\\t\\\\t\\\\\\'\\\\\\\\n\\\\\\',\\\\n\\\\t\\\\t\\\\t_List_fromArray(\\\\n\\\\t\\\\t\\\\t\\\\t[\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'digraph G {\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'  rankdir=\\\\\\' + rankDirToString(styles.aP),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'  graph [\\\\\\' + (styles.aE + \\\\\\']\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'  node [\\\\\\' + (styles.aJ + \\\\\\']\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'  edge [\\\\\\' + (styles.aB + \\\\\\']\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tedgesString,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'\\\\\\',\\\\n\\\\t\\\\t\\\\t\\\\t\\\\tnodesString,\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\\\'}\\\\\\'\\\\n\\\\t\\\\t\\\\t\\\\t]));\\\\n\\\\t});\\\\nvar $elm$virtual_dom$VirtualDom$style = _VirtualDom_style;\\\\nvar $elm$html$Html$Attributes$style = $elm$virtual_dom$VirtualDom$style;\\\\nvar $author$project$Main$view = function (model) {\\\\n\\\\tvar dot = A4(\\\\n\\\\t\\\\t$elm_community$graph$Graph$DOT$outputWithStylesAndAttributes,\\\\n\\\\t\\\\t{aB: \\\\\\'fontname=\\\\\\\\"helvetica\\\\\\\\"\\\\\\', aE: \\\\\\'\\\\\\', aJ: \\\\\\'fontname=\\\\\\\\"helvetica\\\\\\\\", shape=box, style=\\\\\\\\"filled\\\\\\\\", colorscheme=\\\\\\\\"pastel19\\\\\\\\"\\\\\\', aP: 0},\\\\n\\\\t\\\\tfunction (graphNode) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Dict$fromList(\\\\n\\\\t\\\\t\\\\t\\\\t_List_fromArray(\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t[\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(\\\\\\'label\\\\\\', graphNode),\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t\\\\t_Utils_Tuple2(\\\\\\'color\\\\\\', \\\\\\'1\\\\\\')\\\\n\\\\t\\\\t\\\\t\\\\t\\\\t]));\\\\n\\\\t\\\\t},\\\\n\\\\t\\\\tfunction (edge) {\\\\n\\\\t\\\\t\\\\treturn $elm$core$Dict$fromList(_List_Nil);\\\\n\\\\t\\\\t},\\\\n\\\\t\\\\t$author$project$Main$dressUp);\\\\n\\\\treturn A3(\\\\n\\\\t\\\\t$elm$html$Html$node,\\\\n\\\\t\\\\t\\\\\\'graphviz-dot\\\\\\',\\\\n\\\\t\\\\t_List_fromArray(\\\\n\\\\t\\\\t\\\\t[\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$attribute, \\\\\\'dot\\\\\\', dot),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'position\\\\\\', \\\\\\'absolute\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'top\\\\\\', \\\\\\'0\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'left\\\\\\', \\\\\\'0\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'width\\\\\\', \\\\\\'100%\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'height\\\\\\', \\\\\\'100%\\\\\\'),\\\\n\\\\t\\\\t\\\\t\\\\tA2($elm$html$Html$Attributes$style, \\\\\\'display\\\\\\', \\\\\\'flex\\\\\\')\\\\n\\\\t\\\\t\\\\t]),\\\\n\\\\t\\\\t_List_Nil);\\\\n};\\\\nvar $author$project$Main$main = $elm$browser$Browser$element(\\\\n\\\\t{aH: $author$project$Main$init, aR: $author$project$Main$subscriptions, aT: $author$project$Main$update, aU: $author$project$Main$view});\\\\n_Platform_export({\\\\\\'Main\\\\\\':{\\\\\\'init\\\\\\':$author$project$Main$main(\\\\n\\\\t$elm$json$Json$Decode$succeed(0))(0)}});}(this));\\\\n\\';\\nvar $elm$core$List$append = F2(\\n\\tfunction (xs, ys) {\\n\\t\\tif (!ys.b) {\\n\\t\\t\\treturn xs;\\n\\t\\t} else {\\n\\t\\t\\treturn A3($elm$core$List$foldr, $elm$core$List$cons, ys, xs);\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$concat = function (lists) {\\n\\treturn A3($elm$core$List$foldr, $elm$core$List$append, _List_Nil, lists);\\n};\\nvar $elm$core$List$concatMap = F2(\\n\\tfunction (f, list) {\\n\\t\\treturn $elm$core$List$concat(\\n\\t\\t\\tA2($elm$core$List$map, f, list));\\n\\t});\\nvar $author$project$Main$maxGraphSize = 1000;\\nvar $elm$core$Dict$sizeHelp = F2(\\n\\tfunction (n, dict) {\\n\\t\\tsizeHelp:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\t\\treturn n;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar left = dict.d;\\n\\t\\t\\t\\tvar right = dict.e;\\n\\t\\t\\t\\tvar $temp$n = A2($elm$core$Dict$sizeHelp, n + 1, right),\\n\\t\\t\\t\\t\\t$temp$dict = left;\\n\\t\\t\\t\\tn = $temp$n;\\n\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\tcontinue sizeHelp;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$size = function (dict) {\\n\\treturn A2($elm$core$Dict$sizeHelp, 0, dict);\\n};\\nvar $author$project$Main$checkGraphSize = function (dict) {\\n\\treturn (_Utils_cmp(\\n\\t\\t$elm$core$Dict$size(dict),\\n\\t\\t$author$project$Main$maxGraphSize) > 0) ? $elm$core$Result$Err(\\n\\t\\t\\'The graph contains \\' + ($elm$core$String$fromInt(\\n\\t\\t\\t$elm$core$Dict$size(dict)) + (\\' nodes. I only display graphs with \\' + ($elm$core$String$fromInt($author$project$Main$maxGraphSize) + \\' nodes or less. Otherwise the graph renderer (Graphviz) tends to hang. Use the text input above to make the graph smaller.\\')))) : $elm$core$Result$Ok(dict);\\n};\\nvar $elm$core$Basics$composeR = F3(\\n\\tfunction (f, g, x) {\\n\\t\\treturn g(\\n\\t\\t\\tf(x));\\n\\t});\\nvar $elm$core$Dict$RBEmpty_elm_builtin = {$: \\'RBEmpty_elm_builtin\\'};\\nvar $elm$core$Dict$empty = $elm$core$Dict$RBEmpty_elm_builtin;\\nvar $elm$core$Dict$foldl = F3(\\n\\tfunction (func, acc, dict) {\\n\\t\\tfoldl:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\t\\treturn acc;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar key = dict.b;\\n\\t\\t\\t\\tvar value = dict.c;\\n\\t\\t\\t\\tvar left = dict.d;\\n\\t\\t\\t\\tvar right = dict.e;\\n\\t\\t\\t\\tvar $temp$func = func,\\n\\t\\t\\t\\t\\t$temp$acc = A3(\\n\\t\\t\\t\\t\\tfunc,\\n\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\tA3($elm$core$Dict$foldl, func, acc, left)),\\n\\t\\t\\t\\t\\t$temp$dict = right;\\n\\t\\t\\t\\tfunc = $temp$func;\\n\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\tcontinue foldl;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$Black = {$: \\'Black\\'};\\nvar $elm$core$Dict$RBNode_elm_builtin = F5(\\n\\tfunction (a, b, c, d, e) {\\n\\t\\treturn {$: \\'RBNode_elm_builtin\\', a: a, b: b, c: c, d: d, e: e};\\n\\t});\\nvar $elm$core$Dict$Red = {$: \\'Red\\'};\\nvar $elm$core$Dict$balance = F5(\\n\\tfunction (color, key, value, left, right) {\\n\\t\\tif ((right.$ === \\'RBNode_elm_builtin\\') && (right.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar _v1 = right.a;\\n\\t\\t\\tvar rK = right.b;\\n\\t\\t\\tvar rV = right.c;\\n\\t\\t\\tvar rLeft = right.d;\\n\\t\\t\\tvar rRight = right.e;\\n\\t\\t\\tif ((left.$ === \\'RBNode_elm_builtin\\') && (left.a.$ === \\'Red\\')) {\\n\\t\\t\\t\\tvar _v3 = left.a;\\n\\t\\t\\t\\tvar lK = left.b;\\n\\t\\t\\t\\tvar lV = left.c;\\n\\t\\t\\t\\tvar lLeft = left.d;\\n\\t\\t\\t\\tvar lRight = left.e;\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Red,\\n\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, rK, rV, rLeft, rRight));\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\trK,\\n\\t\\t\\t\\t\\trV,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, left, rLeft),\\n\\t\\t\\t\\t\\trRight);\\n\\t\\t\\t}\\n\\t\\t} else {\\n\\t\\t\\tif ((((left.$ === \\'RBNode_elm_builtin\\') && (left.a.$ === \\'Red\\')) && (left.d.$ === \\'RBNode_elm_builtin\\')) && (left.d.a.$ === \\'Red\\')) {\\n\\t\\t\\t\\tvar _v5 = left.a;\\n\\t\\t\\t\\tvar lK = left.b;\\n\\t\\t\\t\\tvar lV = left.c;\\n\\t\\t\\t\\tvar _v6 = left.d;\\n\\t\\t\\t\\tvar _v7 = _v6.a;\\n\\t\\t\\t\\tvar llK = _v6.b;\\n\\t\\t\\t\\tvar llV = _v6.c;\\n\\t\\t\\t\\tvar llLeft = _v6.d;\\n\\t\\t\\t\\tvar llRight = _v6.e;\\n\\t\\t\\t\\tvar lRight = left.e;\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Red,\\n\\t\\t\\t\\t\\tlK,\\n\\t\\t\\t\\t\\tlV,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, llK, llV, llLeft, llRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, key, value, lRight, right));\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Basics$compare = _Utils_compare;\\nvar $elm$core$Dict$insertHelp = F3(\\n\\tfunction (key, value, dict) {\\n\\t\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);\\n\\t\\t} else {\\n\\t\\t\\tvar nColor = dict.a;\\n\\t\\t\\tvar nKey = dict.b;\\n\\t\\t\\tvar nValue = dict.c;\\n\\t\\t\\tvar nLeft = dict.d;\\n\\t\\t\\tvar nRight = dict.e;\\n\\t\\t\\tvar _v1 = A2($elm$core$Basics$compare, key, nKey);\\n\\t\\t\\tswitch (_v1.$) {\\n\\t\\t\\t\\tcase \\'LT\\':\\n\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\t\\tnColor,\\n\\t\\t\\t\\t\\t\\tnKey,\\n\\t\\t\\t\\t\\t\\tnValue,\\n\\t\\t\\t\\t\\t\\tA3($elm$core$Dict$insertHelp, key, value, nLeft),\\n\\t\\t\\t\\t\\t\\tnRight);\\n\\t\\t\\t\\tcase \\'EQ\\':\\n\\t\\t\\t\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\t\\tnColor,\\n\\t\\t\\t\\t\\t\\tnKey,\\n\\t\\t\\t\\t\\t\\tnValue,\\n\\t\\t\\t\\t\\t\\tnLeft,\\n\\t\\t\\t\\t\\t\\tA3($elm$core$Dict$insertHelp, key, value, nRight));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$insert = F3(\\n\\tfunction (key, value, dict) {\\n\\t\\tvar _v0 = A3($elm$core$Dict$insertHelp, key, value, dict);\\n\\t\\tif ((_v0.$ === \\'RBNode_elm_builtin\\') && (_v0.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar _v1 = _v0.a;\\n\\t\\t\\tvar k = _v0.b;\\n\\t\\t\\tvar v = _v0.c;\\n\\t\\t\\tvar l = _v0.d;\\n\\t\\t\\tvar r = _v0.e;\\n\\t\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, k, v, l, r);\\n\\t\\t} else {\\n\\t\\t\\tvar x = _v0;\\n\\t\\t\\treturn x;\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$filter = F2(\\n\\tfunction (isGood, dict) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$Dict$foldl,\\n\\t\\t\\tF3(\\n\\t\\t\\t\\tfunction (k, v, d) {\\n\\t\\t\\t\\t\\treturn A2(isGood, k, v) ? A3($elm$core$Dict$insert, k, v, d) : d;\\n\\t\\t\\t\\t}),\\n\\t\\t\\t$elm$core$Dict$empty,\\n\\t\\t\\tdict);\\n\\t});\\nvar $elm$core$List$filter = F2(\\n\\tfunction (isGood, list) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$List$foldr,\\n\\t\\t\\tF2(\\n\\t\\t\\t\\tfunction (x, xs) {\\n\\t\\t\\t\\t\\treturn isGood(x) ? A2($elm$core$List$cons, x, xs) : xs;\\n\\t\\t\\t\\t}),\\n\\t\\t\\t_List_Nil,\\n\\t\\t\\tlist);\\n\\t});\\nvar $elm$core$Set$Set_elm_builtin = function (a) {\\n\\treturn {$: \\'Set_elm_builtin\\', a: a};\\n};\\nvar $elm$core$Set$empty = $elm$core$Set$Set_elm_builtin($elm$core$Dict$empty);\\nvar $elm$core$Set$insert = F2(\\n\\tfunction (key, _v0) {\\n\\t\\tvar dict = _v0.a;\\n\\t\\treturn $elm$core$Set$Set_elm_builtin(\\n\\t\\t\\tA3($elm$core$Dict$insert, key, _Utils_Tuple0, dict));\\n\\t});\\nvar $elm$core$Set$fromList = function (list) {\\n\\treturn A3($elm$core$List$foldl, $elm$core$Set$insert, $elm$core$Set$empty, list);\\n};\\nvar $elm$core$Dict$isEmpty = function (dict) {\\n\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\treturn true;\\n\\t} else {\\n\\t\\treturn false;\\n\\t}\\n};\\nvar $elm$core$List$isEmpty = function (xs) {\\n\\tif (!xs.b) {\\n\\t\\treturn true;\\n\\t} else {\\n\\t\\treturn false;\\n\\t}\\n};\\nvar $elm$core$Set$isEmpty = function (_v0) {\\n\\tvar dict = _v0.a;\\n\\treturn $elm$core$Dict$isEmpty(dict);\\n};\\nvar $author$project$Main$App = function (a) {\\n\\treturn {$: \\'App\\', a: a};\\n};\\nvar $author$project$Main$Package = function (a) {\\n\\treturn {$: \\'Package\\', a: a};\\n};\\nvar $author$project$Main$Unknown = function (a) {\\n\\treturn {$: \\'Unknown\\', a: a};\\n};\\nvar $elm$core$String$replace = F3(\\n\\tfunction (before, after, string) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\tafter,\\n\\t\\t\\tA2($elm$core$String$split, before, string));\\n\\t});\\nvar $author$project$Main$dash = A2($elm$core$String$replace, \\'_\\', \\'-\\');\\nvar $author$project$Main$parseName = function (name) {\\n\\tvar _v0 = A2($elm$core$String$split, \\'$\\', name);\\n\\tif (((_v0.b && (_v0.a === \\'\\')) && _v0.b.b) && _v0.b.b.b) {\\n\\t\\tif ((_v0.b.a === \\'author\\') && (_v0.b.b.a === \\'project\\')) {\\n\\t\\t\\tvar _v1 = _v0.b;\\n\\t\\t\\tvar _v2 = _v1.b;\\n\\t\\t\\tvar rest = _v2.b;\\n\\t\\t\\treturn $author$project$Main$App(\\n\\t\\t\\t\\t{name: rest});\\n\\t\\t} else {\\n\\t\\t\\tvar _v3 = _v0.b;\\n\\t\\t\\tvar author = _v3.a;\\n\\t\\t\\tvar _v4 = _v3.b;\\n\\t\\t\\tvar _package = _v4.a;\\n\\t\\t\\tvar rest = _v4.b;\\n\\t\\t\\treturn $author$project$Main$Package(\\n\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\tauthor: $author$project$Main$dash(author),\\n\\t\\t\\t\\t\\tname: rest,\\n\\t\\t\\t\\t\\t_package: $author$project$Main$dash(_package)\\n\\t\\t\\t\\t});\\n\\t\\t}\\n\\t} else {\\n\\t\\treturn $author$project$Main$Unknown(name);\\n\\t}\\n};\\nvar $author$project$Main$matchValue = F2(\\n\\tfunction (search, valueNameString) {\\n\\t\\tvar valueName = $author$project$Main$parseName(valueNameString);\\n\\t\\tif (search.$ === \\'ByName\\') {\\n\\t\\t\\tvar name = search.a.name;\\n\\t\\t\\tswitch (valueName.$) {\\n\\t\\t\\t\\tcase \\'App\\':\\n\\t\\t\\t\\t\\tvar data = valueName.a;\\n\\t\\t\\t\\t\\treturn _Utils_eq(\\n\\t\\t\\t\\t\\t\\tname,\\n\\t\\t\\t\\t\\t\\tA2($elm$core$String$join, \\'.\\', data.name));\\n\\t\\t\\t\\tcase \\'Package\\':\\n\\t\\t\\t\\t\\tvar data = valueName.a;\\n\\t\\t\\t\\t\\treturn _Utils_eq(\\n\\t\\t\\t\\t\\t\\tname,\\n\\t\\t\\t\\t\\t\\tA2($elm$core$String$join, \\'.\\', data.name));\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\tvar unknownName = valueName.a;\\n\\t\\t\\t\\t\\treturn _Utils_eq(name, unknownName);\\n\\t\\t\\t}\\n\\t\\t} else {\\n\\t\\t\\tvar author = search.a.author;\\n\\t\\t\\tvar _package = search.a._package;\\n\\t\\t\\tswitch (valueName.$) {\\n\\t\\t\\t\\tcase \\'App\\':\\n\\t\\t\\t\\t\\treturn false;\\n\\t\\t\\t\\tcase \\'Package\\':\\n\\t\\t\\t\\t\\tvar data = valueName.a;\\n\\t\\t\\t\\t\\treturn _Utils_eq(author, data.author) && _Utils_eq(_package, data._package);\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\treturn false;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$get = F2(\\n\\tfunction (targetKey, dict) {\\n\\t\\tget:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar key = dict.b;\\n\\t\\t\\t\\tvar value = dict.c;\\n\\t\\t\\t\\tvar left = dict.d;\\n\\t\\t\\t\\tvar right = dict.e;\\n\\t\\t\\t\\tvar _v1 = A2($elm$core$Basics$compare, targetKey, key);\\n\\t\\t\\t\\tswitch (_v1.$) {\\n\\t\\t\\t\\t\\tcase \\'LT\\':\\n\\t\\t\\t\\t\\t\\tvar $temp$targetKey = targetKey,\\n\\t\\t\\t\\t\\t\\t\\t$temp$dict = left;\\n\\t\\t\\t\\t\\t\\ttargetKey = $temp$targetKey;\\n\\t\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\t\\tcontinue get;\\n\\t\\t\\t\\t\\tcase \\'EQ\\':\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Just(value);\\n\\t\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\t\\tvar $temp$targetKey = targetKey,\\n\\t\\t\\t\\t\\t\\t\\t$temp$dict = right;\\n\\t\\t\\t\\t\\t\\ttargetKey = $temp$targetKey;\\n\\t\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\t\\tcontinue get;\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$member = F2(\\n\\tfunction (key, dict) {\\n\\t\\tvar _v0 = A2($elm$core$Dict$get, key, dict);\\n\\t\\tif (_v0.$ === \\'Just\\') {\\n\\t\\t\\treturn true;\\n\\t\\t} else {\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t});\\nvar $elm$core$Set$member = F2(\\n\\tfunction (key, _v0) {\\n\\t\\tvar dict = _v0.a;\\n\\t\\treturn A2($elm$core$Dict$member, key, dict);\\n\\t});\\nvar $author$project$Main$ByName = function (a) {\\n\\treturn {$: \\'ByName\\', a: a};\\n};\\nvar $author$project$Main$ByPackage = function (a) {\\n\\treturn {$: \\'ByPackage\\', a: a};\\n};\\nvar $author$project$Main$parseSearch = function (string) {\\n\\tvar _v0 = A2($elm$core$String$split, \\'/\\', string);\\n\\tif ((_v0.b && _v0.b.b) && (!_v0.b.b.b)) {\\n\\t\\tvar author = _v0.a;\\n\\t\\tvar _v1 = _v0.b;\\n\\t\\tvar _package = _v1.a;\\n\\t\\treturn $author$project$Main$ByPackage(\\n\\t\\t\\t{author: author, _package: _package});\\n\\t} else {\\n\\t\\treturn $author$project$Main$ByName(\\n\\t\\t\\t{name: string});\\n\\t}\\n};\\nvar $author$project$Main$referencingHelper = F3(\\n\\tfunction (inverted, names, acc) {\\n\\t\\treferencingHelper:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (!names.b) {\\n\\t\\t\\t\\treturn acc;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar name = names.a;\\n\\t\\t\\t\\tvar rest = names.b;\\n\\t\\t\\t\\tif (A2($elm$core$Set$member, name, acc)) {\\n\\t\\t\\t\\t\\tvar $temp$inverted = inverted,\\n\\t\\t\\t\\t\\t\\t$temp$names = rest,\\n\\t\\t\\t\\t\\t\\t$temp$acc = acc;\\n\\t\\t\\t\\t\\tinverted = $temp$inverted;\\n\\t\\t\\t\\t\\tnames = $temp$names;\\n\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\tcontinue referencingHelper;\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar _v1 = A2($elm$core$Dict$get, name, inverted);\\n\\t\\t\\t\\t\\tif (_v1.$ === \\'Just\\') {\\n\\t\\t\\t\\t\\t\\tvar set = _v1.a;\\n\\t\\t\\t\\t\\t\\tvar $temp$inverted = inverted,\\n\\t\\t\\t\\t\\t\\t\\t$temp$names = _Utils_ap(\\n\\t\\t\\t\\t\\t\\t\\trest,\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Set$toList(set)),\\n\\t\\t\\t\\t\\t\\t\\t$temp$acc = A2($elm$core$Set$insert, name, acc);\\n\\t\\t\\t\\t\\t\\tinverted = $temp$inverted;\\n\\t\\t\\t\\t\\t\\tnames = $temp$names;\\n\\t\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\t\\tcontinue referencingHelper;\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar $temp$inverted = inverted,\\n\\t\\t\\t\\t\\t\\t\\t$temp$names = rest,\\n\\t\\t\\t\\t\\t\\t\\t$temp$acc = A2($elm$core$Set$insert, name, acc);\\n\\t\\t\\t\\t\\t\\tinverted = $temp$inverted;\\n\\t\\t\\t\\t\\t\\tnames = $temp$names;\\n\\t\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\t\\tcontinue referencingHelper;\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $author$project$Main$referencing = F2(\\n\\tfunction (inverted, name) {\\n\\t\\treturn A3(\\n\\t\\t\\t$author$project$Main$referencingHelper,\\n\\t\\t\\tinverted,\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[name]),\\n\\t\\t\\t$elm$core$Set$empty);\\n\\t});\\nvar $elm$core$Dict$union = F2(\\n\\tfunction (t1, t2) {\\n\\t\\treturn A3($elm$core$Dict$foldl, $elm$core$Dict$insert, t2, t1);\\n\\t});\\nvar $elm$core$Set$union = F2(\\n\\tfunction (_v0, _v1) {\\n\\t\\tvar dict1 = _v0.a;\\n\\t\\tvar dict2 = _v1.a;\\n\\t\\treturn $elm$core$Set$Set_elm_builtin(\\n\\t\\t\\tA2($elm$core$Dict$union, dict1, dict2));\\n\\t});\\nvar $author$project$Main$filterGraph = function (_v0) {\\n\\tvar search = _v0.search;\\n\\tvar pruned = _v0.pruned;\\n\\tvar inverted = _v0.inverted;\\n\\tif ($elm$core$Dict$isEmpty(pruned)) {\\n\\t\\treturn $elm$core$Result$Err(\\'I could not find anything interesting in the stuff you pasted. Did you really paste compiled Elm JavaScript? Or did you find a bug?\\');\\n\\t} else {\\n\\t\\tif ($elm$core$String$isEmpty(search)) {\\n\\t\\t\\treturn $author$project$Main$checkGraphSize(pruned);\\n\\t\\t} else {\\n\\t\\t\\tvar parsedSearch = $author$project$Main$parseSearch(search);\\n\\t\\t\\tvar matches = A2(\\n\\t\\t\\t\\t$elm$core$List$filter,\\n\\t\\t\\t\\t$author$project$Main$matchValue(parsedSearch),\\n\\t\\t\\t\\t$elm$core$Dict$keys(pruned));\\n\\t\\t\\tif ($elm$core$List$isEmpty(matches)) {\\n\\t\\t\\t\\treturn $elm$core$Result$Err(\\'Your search query does not seem to match anything.\\');\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar valuesToKeep = A3(\\n\\t\\t\\t\\t\\t$elm$core$List$foldl,\\n\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$core$Basics$composeR,\\n\\t\\t\\t\\t\\t\\t$author$project$Main$referencing(inverted),\\n\\t\\t\\t\\t\\t\\t$elm$core$Set$union),\\n\\t\\t\\t\\t\\t$elm$core$Set$fromList(matches),\\n\\t\\t\\t\\t\\tmatches);\\n\\t\\t\\t\\tif ($elm$core$Set$isEmpty(valuesToKeep)) {\\n\\t\\t\\t\\t\\treturn $elm$core$Result$Err(\\'I tried to find all everything to keep related to your search query, but that resulted in zero things to keep! Sounds like a bug.\\');\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar filtered = A2(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$filter,\\n\\t\\t\\t\\t\\t\\tF2(\\n\\t\\t\\t\\t\\t\\t\\tfunction (name, _v1) {\\n\\t\\t\\t\\t\\t\\t\\t\\treturn A2($elm$core$Set$member, name, valuesToKeep);\\n\\t\\t\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\t\\t\\tpruned);\\n\\t\\t\\t\\t\\treturn $elm$core$Dict$isEmpty(filtered) ? $elm$core$Result$Err(\\'Filtering the graph using your search query ended up with an empty graph! But I did find matching stuff, so this sounds like a bug.\\') : $author$project$Main$checkGraphSize(filtered);\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t}\\n};\\nvar $elm$core$Set$foldl = F3(\\n\\tfunction (func, initialState, _v0) {\\n\\t\\tvar dict = _v0.a;\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$Dict$foldl,\\n\\t\\t\\tF3(\\n\\t\\t\\t\\tfunction (key, _v1, state) {\\n\\t\\t\\t\\t\\treturn A2(func, key, state);\\n\\t\\t\\t\\t}),\\n\\t\\t\\tinitialState,\\n\\t\\t\\tdict);\\n\\t});\\nvar $elm$core$Dict$singleton = F2(\\n\\tfunction (key, value) {\\n\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);\\n\\t});\\nvar $elm$core$Set$singleton = function (key) {\\n\\treturn $elm$core$Set$Set_elm_builtin(\\n\\t\\tA2($elm$core$Dict$singleton, key, _Utils_Tuple0));\\n};\\nvar $elm$core$Dict$getMin = function (dict) {\\n\\tgetMin:\\n\\twhile (true) {\\n\\t\\tif ((dict.$ === \\'RBNode_elm_builtin\\') && (dict.d.$ === \\'RBNode_elm_builtin\\')) {\\n\\t\\t\\tvar left = dict.d;\\n\\t\\t\\tvar $temp$dict = left;\\n\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\tcontinue getMin;\\n\\t\\t} else {\\n\\t\\t\\treturn dict;\\n\\t\\t}\\n\\t}\\n};\\nvar $elm$core$Dict$moveRedLeft = function (dict) {\\n\\tif (((dict.$ === \\'RBNode_elm_builtin\\') && (dict.d.$ === \\'RBNode_elm_builtin\\')) && (dict.e.$ === \\'RBNode_elm_builtin\\')) {\\n\\t\\tif ((dict.e.d.$ === \\'RBNode_elm_builtin\\') && (dict.e.d.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar clr = dict.a;\\n\\t\\t\\tvar k = dict.b;\\n\\t\\t\\tvar v = dict.c;\\n\\t\\t\\tvar _v1 = dict.d;\\n\\t\\t\\tvar lClr = _v1.a;\\n\\t\\t\\tvar lK = _v1.b;\\n\\t\\t\\tvar lV = _v1.c;\\n\\t\\t\\tvar lLeft = _v1.d;\\n\\t\\t\\tvar lRight = _v1.e;\\n\\t\\t\\tvar _v2 = dict.e;\\n\\t\\t\\tvar rClr = _v2.a;\\n\\t\\t\\tvar rK = _v2.b;\\n\\t\\t\\tvar rV = _v2.c;\\n\\t\\t\\tvar rLeft = _v2.d;\\n\\t\\t\\tvar _v3 = rLeft.a;\\n\\t\\t\\tvar rlK = rLeft.b;\\n\\t\\t\\tvar rlV = rLeft.c;\\n\\t\\t\\tvar rlL = rLeft.d;\\n\\t\\t\\tvar rlR = rLeft.e;\\n\\t\\t\\tvar rRight = _v2.e;\\n\\t\\t\\treturn A5(\\n\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t$elm$core$Dict$Red,\\n\\t\\t\\t\\trlK,\\n\\t\\t\\t\\trlV,\\n\\t\\t\\t\\tA5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\trlL),\\n\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, rK, rV, rlR, rRight));\\n\\t\\t} else {\\n\\t\\t\\tvar clr = dict.a;\\n\\t\\t\\tvar k = dict.b;\\n\\t\\t\\tvar v = dict.c;\\n\\t\\t\\tvar _v4 = dict.d;\\n\\t\\t\\tvar lClr = _v4.a;\\n\\t\\t\\tvar lK = _v4.b;\\n\\t\\t\\tvar lV = _v4.c;\\n\\t\\t\\tvar lLeft = _v4.d;\\n\\t\\t\\tvar lRight = _v4.e;\\n\\t\\t\\tvar _v5 = dict.e;\\n\\t\\t\\tvar rClr = _v5.a;\\n\\t\\t\\tvar rK = _v5.b;\\n\\t\\t\\tvar rV = _v5.c;\\n\\t\\t\\tvar rLeft = _v5.d;\\n\\t\\t\\tvar rRight = _v5.e;\\n\\t\\t\\tif (clr.$ === \\'Black\\') {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t} else {\\n\\t\\treturn dict;\\n\\t}\\n};\\nvar $elm$core$Dict$moveRedRight = function (dict) {\\n\\tif (((dict.$ === \\'RBNode_elm_builtin\\') && (dict.d.$ === \\'RBNode_elm_builtin\\')) && (dict.e.$ === \\'RBNode_elm_builtin\\')) {\\n\\t\\tif ((dict.d.d.$ === \\'RBNode_elm_builtin\\') && (dict.d.d.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar clr = dict.a;\\n\\t\\t\\tvar k = dict.b;\\n\\t\\t\\tvar v = dict.c;\\n\\t\\t\\tvar _v1 = dict.d;\\n\\t\\t\\tvar lClr = _v1.a;\\n\\t\\t\\tvar lK = _v1.b;\\n\\t\\t\\tvar lV = _v1.c;\\n\\t\\t\\tvar _v2 = _v1.d;\\n\\t\\t\\tvar _v3 = _v2.a;\\n\\t\\t\\tvar llK = _v2.b;\\n\\t\\t\\tvar llV = _v2.c;\\n\\t\\t\\tvar llLeft = _v2.d;\\n\\t\\t\\tvar llRight = _v2.e;\\n\\t\\t\\tvar lRight = _v1.e;\\n\\t\\t\\tvar _v4 = dict.e;\\n\\t\\t\\tvar rClr = _v4.a;\\n\\t\\t\\tvar rK = _v4.b;\\n\\t\\t\\tvar rV = _v4.c;\\n\\t\\t\\tvar rLeft = _v4.d;\\n\\t\\t\\tvar rRight = _v4.e;\\n\\t\\t\\treturn A5(\\n\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t$elm$core$Dict$Red,\\n\\t\\t\\t\\tlK,\\n\\t\\t\\t\\tlV,\\n\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, llK, llV, llLeft, llRight),\\n\\t\\t\\t\\tA5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tlRight,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight)));\\n\\t\\t} else {\\n\\t\\t\\tvar clr = dict.a;\\n\\t\\t\\tvar k = dict.b;\\n\\t\\t\\tvar v = dict.c;\\n\\t\\t\\tvar _v5 = dict.d;\\n\\t\\t\\tvar lClr = _v5.a;\\n\\t\\t\\tvar lK = _v5.b;\\n\\t\\t\\tvar lV = _v5.c;\\n\\t\\t\\tvar lLeft = _v5.d;\\n\\t\\t\\tvar lRight = _v5.e;\\n\\t\\t\\tvar _v6 = dict.e;\\n\\t\\t\\tvar rClr = _v6.a;\\n\\t\\t\\tvar rK = _v6.b;\\n\\t\\t\\tvar rV = _v6.c;\\n\\t\\t\\tvar rLeft = _v6.d;\\n\\t\\t\\tvar rRight = _v6.e;\\n\\t\\t\\tif (clr.$ === \\'Black\\') {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t$elm$core$Dict$Black,\\n\\t\\t\\t\\t\\tk,\\n\\t\\t\\t\\t\\tv,\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),\\n\\t\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t} else {\\n\\t\\treturn dict;\\n\\t}\\n};\\nvar $elm$core$Dict$removeHelpPrepEQGT = F7(\\n\\tfunction (targetKey, dict, color, key, value, left, right) {\\n\\t\\tif ((left.$ === \\'RBNode_elm_builtin\\') && (left.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar _v1 = left.a;\\n\\t\\t\\tvar lK = left.b;\\n\\t\\t\\tvar lV = left.c;\\n\\t\\t\\tvar lLeft = left.d;\\n\\t\\t\\tvar lRight = left.e;\\n\\t\\t\\treturn A5(\\n\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\tlK,\\n\\t\\t\\t\\tlV,\\n\\t\\t\\t\\tlLeft,\\n\\t\\t\\t\\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, lRight, right));\\n\\t\\t} else {\\n\\t\\t\\t_v2$2:\\n\\t\\t\\twhile (true) {\\n\\t\\t\\t\\tif ((right.$ === \\'RBNode_elm_builtin\\') && (right.a.$ === \\'Black\\')) {\\n\\t\\t\\t\\t\\tif (right.d.$ === \\'RBNode_elm_builtin\\') {\\n\\t\\t\\t\\t\\t\\tif (right.d.a.$ === \\'Black\\') {\\n\\t\\t\\t\\t\\t\\t\\tvar _v3 = right.a;\\n\\t\\t\\t\\t\\t\\t\\tvar _v4 = right.d;\\n\\t\\t\\t\\t\\t\\t\\tvar _v5 = _v4.a;\\n\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Dict$moveRedRight(dict);\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\tbreak _v2$2;\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar _v6 = right.a;\\n\\t\\t\\t\\t\\t\\tvar _v7 = right.d;\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Dict$moveRedRight(dict);\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tbreak _v2$2;\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t\\treturn dict;\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$removeMin = function (dict) {\\n\\tif ((dict.$ === \\'RBNode_elm_builtin\\') && (dict.d.$ === \\'RBNode_elm_builtin\\')) {\\n\\t\\tvar color = dict.a;\\n\\t\\tvar key = dict.b;\\n\\t\\tvar value = dict.c;\\n\\t\\tvar left = dict.d;\\n\\t\\tvar lColor = left.a;\\n\\t\\tvar lLeft = left.d;\\n\\t\\tvar right = dict.e;\\n\\t\\tif (lColor.$ === \\'Black\\') {\\n\\t\\t\\tif ((lLeft.$ === \\'RBNode_elm_builtin\\') && (lLeft.a.$ === \\'Red\\')) {\\n\\t\\t\\t\\tvar _v3 = lLeft.a;\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\t$elm$core$Dict$removeMin(left),\\n\\t\\t\\t\\t\\tright);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar _v4 = $elm$core$Dict$moveRedLeft(dict);\\n\\t\\t\\t\\tif (_v4.$ === \\'RBNode_elm_builtin\\') {\\n\\t\\t\\t\\t\\tvar nColor = _v4.a;\\n\\t\\t\\t\\t\\tvar nKey = _v4.b;\\n\\t\\t\\t\\t\\tvar nValue = _v4.c;\\n\\t\\t\\t\\t\\tvar nLeft = _v4.d;\\n\\t\\t\\t\\t\\tvar nRight = _v4.e;\\n\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\t\\tnColor,\\n\\t\\t\\t\\t\\t\\tnKey,\\n\\t\\t\\t\\t\\t\\tnValue,\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$removeMin(nLeft),\\n\\t\\t\\t\\t\\t\\tnRight);\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t} else {\\n\\t\\t\\treturn A5(\\n\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\tkey,\\n\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t$elm$core$Dict$removeMin(left),\\n\\t\\t\\t\\tright);\\n\\t\\t}\\n\\t} else {\\n\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t}\\n};\\nvar $elm$core$Dict$removeHelp = F2(\\n\\tfunction (targetKey, dict) {\\n\\t\\tif (dict.$ === \\'RBEmpty_elm_builtin\\') {\\n\\t\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t\\t} else {\\n\\t\\t\\tvar color = dict.a;\\n\\t\\t\\tvar key = dict.b;\\n\\t\\t\\tvar value = dict.c;\\n\\t\\t\\tvar left = dict.d;\\n\\t\\t\\tvar right = dict.e;\\n\\t\\t\\tif (_Utils_cmp(targetKey, key) < 0) {\\n\\t\\t\\t\\tif ((left.$ === \\'RBNode_elm_builtin\\') && (left.a.$ === \\'Black\\')) {\\n\\t\\t\\t\\t\\tvar _v4 = left.a;\\n\\t\\t\\t\\t\\tvar lLeft = left.d;\\n\\t\\t\\t\\t\\tif ((lLeft.$ === \\'RBNode_elm_builtin\\') && (lLeft.a.$ === \\'Red\\')) {\\n\\t\\t\\t\\t\\t\\tvar _v6 = lLeft.a;\\n\\t\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\t\\t\\tA2($elm$core$Dict$removeHelp, targetKey, left),\\n\\t\\t\\t\\t\\t\\t\\tright);\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar _v7 = $elm$core$Dict$moveRedLeft(dict);\\n\\t\\t\\t\\t\\t\\tif (_v7.$ === \\'RBNode_elm_builtin\\') {\\n\\t\\t\\t\\t\\t\\t\\tvar nColor = _v7.a;\\n\\t\\t\\t\\t\\t\\t\\tvar nKey = _v7.b;\\n\\t\\t\\t\\t\\t\\t\\tvar nValue = _v7.c;\\n\\t\\t\\t\\t\\t\\t\\tvar nLeft = _v7.d;\\n\\t\\t\\t\\t\\t\\t\\tvar nRight = _v7.e;\\n\\t\\t\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\t\\t\\t\\tnColor,\\n\\t\\t\\t\\t\\t\\t\\t\\tnKey,\\n\\t\\t\\t\\t\\t\\t\\t\\tnValue,\\n\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$Dict$removeHelp, targetKey, nLeft),\\n\\t\\t\\t\\t\\t\\t\\t\\tnRight);\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$RBNode_elm_builtin,\\n\\t\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\t\\tA2($elm$core$Dict$removeHelp, targetKey, left),\\n\\t\\t\\t\\t\\t\\tright);\\n\\t\\t\\t\\t}\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t$elm$core$Dict$removeHelpEQGT,\\n\\t\\t\\t\\t\\ttargetKey,\\n\\t\\t\\t\\t\\tA7($elm$core$Dict$removeHelpPrepEQGT, targetKey, dict, color, key, value, left, right));\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$removeHelpEQGT = F2(\\n\\tfunction (targetKey, dict) {\\n\\t\\tif (dict.$ === \\'RBNode_elm_builtin\\') {\\n\\t\\t\\tvar color = dict.a;\\n\\t\\t\\tvar key = dict.b;\\n\\t\\t\\tvar value = dict.c;\\n\\t\\t\\tvar left = dict.d;\\n\\t\\t\\tvar right = dict.e;\\n\\t\\t\\tif (_Utils_eq(targetKey, key)) {\\n\\t\\t\\t\\tvar _v1 = $elm$core$Dict$getMin(right);\\n\\t\\t\\t\\tif (_v1.$ === \\'RBNode_elm_builtin\\') {\\n\\t\\t\\t\\t\\tvar minKey = _v1.b;\\n\\t\\t\\t\\t\\tvar minValue = _v1.c;\\n\\t\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\t\\tminKey,\\n\\t\\t\\t\\t\\t\\tminValue,\\n\\t\\t\\t\\t\\t\\tleft,\\n\\t\\t\\t\\t\\t\\t$elm$core$Dict$removeMin(right));\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t\\t\\t\\t}\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn A5(\\n\\t\\t\\t\\t\\t$elm$core$Dict$balance,\\n\\t\\t\\t\\t\\tcolor,\\n\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\tvalue,\\n\\t\\t\\t\\t\\tleft,\\n\\t\\t\\t\\t\\tA2($elm$core$Dict$removeHelp, targetKey, right));\\n\\t\\t\\t}\\n\\t\\t} else {\\n\\t\\t\\treturn $elm$core$Dict$RBEmpty_elm_builtin;\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$remove = F2(\\n\\tfunction (key, dict) {\\n\\t\\tvar _v0 = A2($elm$core$Dict$removeHelp, key, dict);\\n\\t\\tif ((_v0.$ === \\'RBNode_elm_builtin\\') && (_v0.a.$ === \\'Red\\')) {\\n\\t\\t\\tvar _v1 = _v0.a;\\n\\t\\t\\tvar k = _v0.b;\\n\\t\\t\\tvar v = _v0.c;\\n\\t\\t\\tvar l = _v0.d;\\n\\t\\t\\tvar r = _v0.e;\\n\\t\\t\\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, k, v, l, r);\\n\\t\\t} else {\\n\\t\\t\\tvar x = _v0;\\n\\t\\t\\treturn x;\\n\\t\\t}\\n\\t});\\nvar $elm$core$Dict$update = F3(\\n\\tfunction (targetKey, alter, dictionary) {\\n\\t\\tvar _v0 = alter(\\n\\t\\t\\tA2($elm$core$Dict$get, targetKey, dictionary));\\n\\t\\tif (_v0.$ === \\'Just\\') {\\n\\t\\t\\tvar value = _v0.a;\\n\\t\\t\\treturn A3($elm$core$Dict$insert, targetKey, value, dictionary);\\n\\t\\t} else {\\n\\t\\t\\treturn A2($elm$core$Dict$remove, targetKey, dictionary);\\n\\t\\t}\\n\\t});\\nvar $author$project$Main$invert = A2(\\n\\t$elm$core$Dict$foldl,\\n\\tF3(\\n\\t\\tfunction (name, references, acc) {\\n\\t\\t\\treturn A3(\\n\\t\\t\\t\\t$elm$core$Set$foldl,\\n\\t\\t\\t\\tF2(\\n\\t\\t\\t\\t\\tfunction (reference, acc2) {\\n\\t\\t\\t\\t\\t\\treturn A3(\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Dict$update,\\n\\t\\t\\t\\t\\t\\t\\treference,\\n\\t\\t\\t\\t\\t\\t\\tfunction (previous) {\\n\\t\\t\\t\\t\\t\\t\\t\\tif (previous.$ === \\'Just\\') {\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tvar set = previous.a;\\n\\t\\t\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$Set$insert, name, set));\\n\\t\\t\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$core$Set$singleton(name));\\n\\t\\t\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\t\\t\\tacc2);\\n\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\tacc,\\n\\t\\t\\t\\treferences);\\n\\t\\t}),\\n\\t$elm$core$Dict$empty);\\nvar $elm$core$List$maybeCons = F3(\\n\\tfunction (f, mx, xs) {\\n\\t\\tvar _v0 = f(mx);\\n\\t\\tif (_v0.$ === \\'Just\\') {\\n\\t\\t\\tvar x = _v0.a;\\n\\t\\t\\treturn A2($elm$core$List$cons, x, xs);\\n\\t\\t} else {\\n\\t\\t\\treturn xs;\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$filterMap = F2(\\n\\tfunction (f, xs) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm$core$List$foldr,\\n\\t\\t\\t$elm$core$List$maybeCons(f),\\n\\t\\t\\t_List_Nil,\\n\\t\\t\\txs);\\n\\t});\\nvar $elm$regex$Regex$Match = F4(\\n\\tfunction (match, index, number, submatches) {\\n\\t\\treturn {index: index, match: match, number: number, submatches: submatches};\\n\\t});\\nvar $elm$regex$Regex$find = _Regex_findAtMost(_Regex_infinity);\\nvar $elm$core$Dict$fromList = function (assocs) {\\n\\treturn A3(\\n\\t\\t$elm$core$List$foldl,\\n\\t\\tF2(\\n\\t\\t\\tfunction (_v0, dict) {\\n\\t\\t\\t\\tvar key = _v0.a;\\n\\t\\t\\t\\tvar value = _v0.b;\\n\\t\\t\\t\\treturn A3($elm$core$Dict$insert, key, value, dict);\\n\\t\\t\\t}),\\n\\t\\t$elm$core$Dict$empty,\\n\\t\\tassocs);\\n};\\nvar $elm$core$Basics$not = _Basics_not;\\nvar $elm$regex$Regex$fromStringWith = _Regex_fromStringWith;\\nvar $elm$regex$Regex$fromString = function (string) {\\n\\treturn A2(\\n\\t\\t$elm$regex$Regex$fromStringWith,\\n\\t\\t{caseInsensitive: false, multiline: false},\\n\\t\\tstring);\\n};\\nvar $elm$regex$Regex$never = _Regex_never;\\nvar $elm$core$Maybe$withDefault = F2(\\n\\tfunction (_default, maybe) {\\n\\t\\tif (maybe.$ === \\'Just\\') {\\n\\t\\t\\tvar value = maybe.a;\\n\\t\\t\\treturn value;\\n\\t\\t} else {\\n\\t\\t\\treturn _default;\\n\\t\\t}\\n\\t});\\nvar $author$project$Main$referencesRegex = A2(\\n\\t$elm$core$Maybe$withDefault,\\n\\t$elm$regex$Regex$never,\\n\\t$elm$regex$Regex$fromString(\\'([\\\\\\'"])(?:(?!\\\\\\\\1)[^\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\r]|\\\\\\\\\\\\\\\\(?:\\\\\\\\r\\\\\\\\n|[^]))*(\\\\\\\\1)?|\\\\\\\\/\\\\\\\\*(?:[^*]|\\\\\\\\*(?!\\\\\\\\/))*(\\\\\\\\*\\\\\\\\/)?|\\\\\\\\/\\\\\\\\/.*|\\\\\\\\w*\\\\\\\\.?\\\\\\\\$[^\\\\\\\\s!"#%&\\\\\\'()*+,\\\\\\\\-./:;<=>?@\\\\\\\\[\\\\\\\\]^`{|}~]+\\\\\\\\b(?!:)\\'));\\nvar $author$project$Main$parseReferences = function (string) {\\n\\treturn A2(\\n\\t\\t$elm$core$List$filter,\\n\\t\\tfunction (name) {\\n\\t\\t\\treturn A2($elm$core$String$startsWith, \\'$\\', name) && ((!A2($elm$core$String$startsWith, \\'$temp$\\', name)) && (!A2($elm$core$String$startsWith, \\'$elm$\\', name)));\\n\\t\\t},\\n\\t\\tA2(\\n\\t\\t\\t$elm$core$List$map,\\n\\t\\t\\tfunction ($) {\\n\\t\\t\\t\\treturn $.match;\\n\\t\\t\\t},\\n\\t\\t\\tA2($elm$regex$Regex$find, $author$project$Main$referencesRegex, string)));\\n};\\nvar $author$project$Main$valueRegex = A2(\\n\\t$elm$core$Maybe$withDefault,\\n\\t$elm$regex$Regex$never,\\n\\tA2(\\n\\t\\t$elm$regex$Regex$fromStringWith,\\n\\t\\t{caseInsensitive: false, multiline: true},\\n\\t\\t\\'^\\\\\\\\}?(\\\\t?)(?:var|function) (\\\\\\\\$[^\\\\\\\\s()]+)(.*(?:\\\\\\\\r?\\\\\\\\n\\\\\\\\1\\\\\\\\t.*)*)\\'));\\nvar $author$project$Main$parse = function (string) {\\n\\treturn $elm$core$Dict$fromList(\\n\\t\\tA2(\\n\\t\\t\\t$elm$core$List$filterMap,\\n\\t\\t\\tfunction (match) {\\n\\t\\t\\t\\tvar _v0 = match.submatches;\\n\\t\\t\\t\\tif (((((_v0.b && _v0.b.b) && (_v0.b.a.$ === \\'Just\\')) && _v0.b.b.b) && (_v0.b.b.a.$ === \\'Just\\')) && (!_v0.b.b.b.b)) {\\n\\t\\t\\t\\t\\tvar _v1 = _v0.b;\\n\\t\\t\\t\\t\\tvar name = _v1.a.a;\\n\\t\\t\\t\\t\\tvar _v2 = _v1.b;\\n\\t\\t\\t\\t\\tvar body = _v2.a.a;\\n\\t\\t\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\t\\t\\t_Utils_Tuple2(\\n\\t\\t\\t\\t\\t\\t\\tname,\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Set$fromList(\\n\\t\\t\\t\\t\\t\\t\\t\\t$author$project$Main$parseReferences(body))));\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\t}\\n\\t\\t\\t},\\n\\t\\t\\tA2($elm$regex$Regex$find, $author$project$Main$valueRegex, string)));\\n};\\nvar $author$project$Main$entrypointsRegex = A2(\\n\\t$elm$core$Maybe$withDefault,\\n\\t$elm$regex$Regex$never,\\n\\tA2(\\n\\t\\t$elm$regex$Regex$fromStringWith,\\n\\t\\t{caseInsensitive: false, multiline: true},\\n\\t\\t\\'^_Platform_export\\\\\\\\(.*(?:\\\\\\\\r?\\\\\\\\n\\\\\\\\t.*)*\\'));\\nvar $elm$regex$Regex$findAtMost = _Regex_findAtMost;\\nvar $author$project$Main$parseEntrypoints = function (string) {\\n\\tvar _v0 = A3($elm$regex$Regex$findAtMost, 1, $author$project$Main$entrypointsRegex, string);\\n\\tif (_v0.b && (!_v0.b.b)) {\\n\\t\\tvar match = _v0.a;\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$List$filter,\\n\\t\\t\\t$elm$core$String$startsWith(\\'$author$project$\\'),\\n\\t\\t\\t$author$project$Main$parseReferences(match.match));\\n\\t} else {\\n\\t\\treturn _List_Nil;\\n\\t}\\n};\\nvar $author$project$Main$pruneHelper = F3(\\n\\tfunction (names, parsed, acc) {\\n\\t\\tpruneHelper:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (!names.b) {\\n\\t\\t\\t\\treturn acc;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar name = names.a;\\n\\t\\t\\t\\tvar rest = names.b;\\n\\t\\t\\t\\tif (A2($elm$core$Dict$member, name, acc)) {\\n\\t\\t\\t\\t\\tvar $temp$names = rest,\\n\\t\\t\\t\\t\\t\\t$temp$parsed = parsed,\\n\\t\\t\\t\\t\\t\\t$temp$acc = acc;\\n\\t\\t\\t\\t\\tnames = $temp$names;\\n\\t\\t\\t\\t\\tparsed = $temp$parsed;\\n\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\tcontinue pruneHelper;\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar _v1 = A2($elm$core$Dict$get, name, parsed);\\n\\t\\t\\t\\t\\tif (_v1.$ === \\'Just\\') {\\n\\t\\t\\t\\t\\t\\tvar references = _v1.a;\\n\\t\\t\\t\\t\\t\\tvar $temp$names = _Utils_ap(\\n\\t\\t\\t\\t\\t\\t\\trest,\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$Set$toList(references)),\\n\\t\\t\\t\\t\\t\\t\\t$temp$parsed = parsed,\\n\\t\\t\\t\\t\\t\\t\\t$temp$acc = A3($elm$core$Dict$insert, name, references, acc);\\n\\t\\t\\t\\t\\t\\tnames = $temp$names;\\n\\t\\t\\t\\t\\t\\tparsed = $temp$parsed;\\n\\t\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\t\\tcontinue pruneHelper;\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Dict$empty;\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $author$project$Main$prune = F2(\\n\\tfunction (name, parsed) {\\n\\t\\treturn A3(\\n\\t\\t\\t$author$project$Main$pruneHelper,\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[name]),\\n\\t\\t\\tparsed,\\n\\t\\t\\t$elm$core$Dict$empty);\\n\\t});\\nvar $elm$core$List$sortBy = _List_sortBy;\\nvar $elm$core$List$sort = function (xs) {\\n\\treturn A2($elm$core$List$sortBy, $elm$core$Basics$identity, xs);\\n};\\nvar $author$project$Main$enterGraph = function (code) {\\n\\tvar parsed = $author$project$Main$parse(code);\\n\\tvar pruned = A3(\\n\\t\\t$elm$core$List$foldl,\\n\\t\\t$author$project$Main$prune,\\n\\t\\tparsed,\\n\\t\\t$author$project$Main$parseEntrypoints(code));\\n\\tvar suggestions = $elm$core$List$sort(\\n\\t\\t$elm$core$Set$toList(\\n\\t\\t\\t$elm$core$Set$fromList(\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t$elm$core$List$concatMap,\\n\\t\\t\\t\\t\\tfunction (valueName) {\\n\\t\\t\\t\\t\\t\\tvar _v0 = $author$project$Main$parseName(valueName);\\n\\t\\t\\t\\t\\t\\tswitch (_v0.$) {\\n\\t\\t\\t\\t\\t\\t\\tcase \\'App\\':\\n\\t\\t\\t\\t\\t\\t\\t\\tvar name = _v0.a.name;\\n\\t\\t\\t\\t\\t\\t\\t\\treturn _List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$String$join, \\'.\\', name)\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t]);\\n\\t\\t\\t\\t\\t\\t\\tcase \\'Package\\':\\n\\t\\t\\t\\t\\t\\t\\t\\tvar author = _v0.a.author;\\n\\t\\t\\t\\t\\t\\t\\t\\tvar _package = _v0.a._package;\\n\\t\\t\\t\\t\\t\\t\\t\\tvar name = _v0.a.name;\\n\\t\\t\\t\\t\\t\\t\\t\\treturn _List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tauthor + (\\'/\\' + _package),\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\tA2($elm$core$String$join, \\'.\\', name)\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t]);\\n\\t\\t\\t\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\t\\t\\t\\tvar name = _v0.a;\\n\\t\\t\\t\\t\\t\\t\\t\\treturn _List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t[name]);\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\t$elm$core$Dict$keys(pruned)))));\\n\\tvar inverted = $author$project$Main$invert(pruned);\\n\\treturn $author$project$Main$Graph(\\n\\t\\t{\\n\\t\\t\\tfiltered: $author$project$Main$filterGraph(\\n\\t\\t\\t\\t{inverted: inverted, pruned: pruned, search: \\'\\'}),\\n\\t\\t\\tinverted: inverted,\\n\\t\\t\\tpruned: pruned,\\n\\t\\t\\tsearch: \\'\\',\\n\\t\\t\\tsuggestions: suggestions\\n\\t\\t});\\n};\\nvar $elm$core$Platform$Cmd$batch = _Platform_batch;\\nvar $elm$core$Platform$Cmd$none = $elm$core$Platform$Cmd$batch(_List_Nil);\\nvar $elm$core$List$any = F2(\\n\\tfunction (isOkay, list) {\\n\\t\\tany:\\n\\t\\twhile (true) {\\n\\t\\t\\tif (!list.b) {\\n\\t\\t\\t\\treturn false;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\tvar x = list.a;\\n\\t\\t\\t\\tvar xs = list.b;\\n\\t\\t\\t\\tif (isOkay(x)) {\\n\\t\\t\\t\\t\\treturn true;\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar $temp$isOkay = isOkay,\\n\\t\\t\\t\\t\\t\\t$temp$list = xs;\\n\\t\\t\\t\\t\\tisOkay = $temp$isOkay;\\n\\t\\t\\t\\t\\tlist = $temp$list;\\n\\t\\t\\t\\t\\tcontinue any;\\n\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$List$member = F2(\\n\\tfunction (x, xs) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$List$any,\\n\\t\\t\\tfunction (a) {\\n\\t\\t\\t\\treturn _Utils_eq(a, x);\\n\\t\\t\\t},\\n\\t\\t\\txs);\\n\\t});\\nvar $elm$core$String$trim = _String_trim;\\nvar $author$project$Main$setSearch = F2(\\n\\tfunction (text, data) {\\n\\t\\tvar search = $elm$core$String$trim(text);\\n\\t\\treturn ($elm$core$String$isEmpty(search) || A2($elm$core$List$member, search, data.suggestions)) ? _Utils_update(\\n\\t\\t\\tdata,\\n\\t\\t\\t{\\n\\t\\t\\t\\tfiltered: $author$project$Main$filterGraph(\\n\\t\\t\\t\\t\\t{inverted: data.inverted, pruned: data.pruned, search: search}),\\n\\t\\t\\t\\tsearch: search\\n\\t\\t\\t}) : _Utils_update(\\n\\t\\t\\tdata,\\n\\t\\t\\t{search: search});\\n\\t});\\nvar $author$project$Main$update = F2(\\n\\tfunction (msg, model) {\\n\\t\\tswitch (msg.$) {\\n\\t\\t\\tcase \\'TextareaChanged\\':\\n\\t\\t\\t\\tvar code = msg.a;\\n\\t\\t\\t\\treturn _Utils_Tuple2(\\n\\t\\t\\t\\t\\t_Utils_update(\\n\\t\\t\\t\\t\\t\\tmodel,\\n\\t\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\t\\tpage: $author$project$Main$enterGraph(code)\\n\\t\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\t\\t$elm$core$Platform$Cmd$none);\\n\\t\\t\\tcase \\'BackToTextareaPressed\\':\\n\\t\\t\\t\\treturn _Utils_Tuple2(\\n\\t\\t\\t\\t\\t_Utils_update(\\n\\t\\t\\t\\t\\t\\tmodel,\\n\\t\\t\\t\\t\\t\\t{page: $author$project$Main$Textarea}),\\n\\t\\t\\t\\t\\t$author$project$Main$focusTextarea);\\n\\t\\t\\tcase \\'SearchChanged\\':\\n\\t\\t\\t\\tvar text = msg.a;\\n\\t\\t\\t\\tvar _v1 = model.page;\\n\\t\\t\\t\\tif (_v1.$ === \\'Textarea\\') {\\n\\t\\t\\t\\t\\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);\\n\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\tvar data = _v1.a;\\n\\t\\t\\t\\t\\treturn _Utils_Tuple2(\\n\\t\\t\\t\\t\\t\\t_Utils_update(\\n\\t\\t\\t\\t\\t\\t\\tmodel,\\n\\t\\t\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\t\\t\\tpage: $author$project$Main$Graph(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\tA2($author$project$Main$setSearch, text, data))\\n\\t\\t\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\t\\t\\t$elm$core$Platform$Cmd$none);\\n\\t\\t\\t\\t}\\n\\t\\t\\tcase \\'TextareaFocused\\':\\n\\t\\t\\t\\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);\\n\\t\\t\\tcase \\'InfoButtonPressed\\':\\n\\t\\t\\t\\treturn _Utils_Tuple2(\\n\\t\\t\\t\\t\\t_Utils_update(\\n\\t\\t\\t\\t\\t\\tmodel,\\n\\t\\t\\t\\t\\t\\t{infoShown: !model.infoShown}),\\n\\t\\t\\t\\t\\t$elm$core$Platform$Cmd$none);\\n\\t\\t\\tdefault:\\n\\t\\t\\t\\treturn _Utils_Tuple2(\\n\\t\\t\\t\\t\\t_Utils_update(\\n\\t\\t\\t\\t\\t\\tmodel,\\n\\t\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\t\\tpage: $author$project$Main$enterGraph($author$project$Example$code)\\n\\t\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\t\\t$elm$core$Platform$Cmd$none);\\n\\t\\t}\\n\\t});\\nvar $elm$html$Html$p = _VirtualDom_node(\\'p\\');\\nvar $elm$virtual_dom$VirtualDom$text = _VirtualDom_text;\\nvar $elm$html$Html$text = $elm$virtual_dom$VirtualDom$text;\\nvar $elm$json$Json$Encode$string = _Json_wrap;\\nvar $elm$html$Html$Attributes$stringProperty = F2(\\n\\tfunction (key, string) {\\n\\t\\treturn A2(\\n\\t\\t\\t_VirtualDom_property,\\n\\t\\t\\tkey,\\n\\t\\t\\t$elm$json$Json$Encode$string(string));\\n\\t});\\nvar $elm$html$Html$Attributes$class = $elm$html$Html$Attributes$stringProperty(\\'className\\');\\nvar $elm$html$Html$div = _VirtualDom_node(\\'div\\');\\nvar $elm$html$Html$a = _VirtualDom_node(\\'a\\');\\nvar $elm$html$Html$Attributes$href = function (url) {\\n\\treturn A2(\\n\\t\\t$elm$html$Html$Attributes$stringProperty,\\n\\t\\t\\'href\\',\\n\\t\\t_VirtualDom_noJavaScriptUri(url));\\n};\\nvar $author$project$Main$viewInfo = _List_fromArray(\\n\\t[\\n\\t\\tA2(\\n\\t\\t$elm$html$Html$p,\\n\\t\\t_List_Nil,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$text(\\'This app shows you how every function – or any value – in an Elm application depend on each other, as a graph. It lets you answer questions like “why do I depend on this package?”. Think of it as a recursive “Find usages” IDE action.\\')\\n\\t\\t\\t])),\\n\\t\\tA2(\\n\\t\\t$elm$html$Html$p,\\n\\t\\t_List_Nil,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$text(\\'Note: All elm/* packages are excluded because they made the graph too noisy.\\')\\n\\t\\t\\t])),\\n\\t\\tA2(\\n\\t\\t$elm$html$Html$p,\\n\\t\\t_List_Nil,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$text(\\'Warning: This is essentially a quick hack. I run a bunch of regex on the compiled JavaScript output. It seems to work good enough, though.\\')\\n\\t\\t\\t])),\\n\\t\\tA2(\\n\\t\\t$elm$html$Html$p,\\n\\t\\t_List_Nil,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$text(\\'Source code: \\'),\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$a,\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$href(\\'https://github.com/lydell/elm-value-graph\\')\\n\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$text(\\'github.com/lydell/elm-value-graph\\')\\n\\t\\t\\t\\t\\t]))\\n\\t\\t\\t]))\\n\\t]);\\nvar $author$project$Main$viewContainer = function (_v0) {\\n\\tvar toolbar = _v0.toolbar;\\n\\tvar content = _v0.content;\\n\\tvar infoShown = _v0.infoShown;\\n\\treturn A2(\\n\\t\\t$elm$html$Html$div,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'Container AbsoluteFill\\')\\n\\t\\t\\t]),\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$div,\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'Container-toolbar\\')\\n\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\ttoolbar),\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$div,\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'Container-inner\\')\\n\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$div,\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'Container-content\\')\\n\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[content])),\\n\\t\\t\\t\\t\\t\\tinfoShown ? A2(\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$div,\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'Container-info\\')\\n\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\t$author$project$Main$viewInfo) : $elm$html$Html$text(\\'\\')\\n\\t\\t\\t\\t\\t]))\\n\\t\\t\\t]));\\n};\\nvar $author$project$Main$SearchChanged = function (a) {\\n\\treturn {$: \\'SearchChanged\\', a: a};\\n};\\nvar $elm_community$graph$Graph$DOT$TB = {$: \\'TB\\'};\\nvar $elm$virtual_dom$VirtualDom$attribute = F2(\\n\\tfunction (key, value) {\\n\\t\\treturn A2(\\n\\t\\t\\t_VirtualDom_attribute,\\n\\t\\t\\t_VirtualDom_noOnOrFormAction(key),\\n\\t\\t\\t_VirtualDom_noJavaScriptOrHtmlUri(value));\\n\\t});\\nvar $elm$html$Html$Attributes$attribute = $elm$virtual_dom$VirtualDom$attribute;\\nvar $elm$virtual_dom$VirtualDom$Custom = function (a) {\\n\\treturn {$: \\'Custom\\', a: a};\\n};\\nvar $elm$virtual_dom$VirtualDom$on = _VirtualDom_on;\\nvar $elm$html$Html$Events$custom = F2(\\n\\tfunction (event, decoder) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$on,\\n\\t\\t\\tevent,\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$Custom(decoder));\\n\\t});\\nvar $elm$json$Json$Decode$field = _Json_decodeField;\\nvar $elm_community$graph$Graph$Edge = F3(\\n\\tfunction (from, to, label) {\\n\\t\\treturn {from: from, label: label, to: to};\\n\\t});\\nvar $elm_community$graph$Graph$Node = F2(\\n\\tfunction (id, label) {\\n\\t\\treturn {id: id, label: label};\\n\\t});\\nvar $elm_community$graph$Graph$Graph = function (a) {\\n\\treturn {$: \\'Graph\\', a: a};\\n};\\nvar $elm_community$graph$Graph$NodeContext = F3(\\n\\tfunction (node, incoming, outgoing) {\\n\\t\\treturn {incoming: incoming, node: node, outgoing: outgoing};\\n\\t});\\nvar $elm_community$intdict$IntDict$Empty = {$: \\'Empty\\'};\\nvar $elm_community$intdict$IntDict$empty = $elm_community$intdict$IntDict$Empty;\\nvar $elm_community$intdict$IntDict$Inner = function (a) {\\n\\treturn {$: \\'Inner\\', a: a};\\n};\\nvar $elm_community$intdict$IntDict$size = function (dict) {\\n\\tswitch (dict.$) {\\n\\t\\tcase \\'Empty\\':\\n\\t\\t\\treturn 0;\\n\\t\\tcase \\'Leaf\\':\\n\\t\\t\\treturn 1;\\n\\t\\tdefault:\\n\\t\\t\\tvar i = dict.a;\\n\\t\\t\\treturn i.size;\\n\\t}\\n};\\nvar $elm_community$intdict$IntDict$inner = F3(\\n\\tfunction (p, l, r) {\\n\\t\\tvar _v0 = _Utils_Tuple2(l, r);\\n\\t\\tif (_v0.a.$ === \\'Empty\\') {\\n\\t\\t\\tvar _v1 = _v0.a;\\n\\t\\t\\treturn r;\\n\\t\\t} else {\\n\\t\\t\\tif (_v0.b.$ === \\'Empty\\') {\\n\\t\\t\\t\\tvar _v2 = _v0.b;\\n\\t\\t\\t\\treturn l;\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn $elm_community$intdict$IntDict$Inner(\\n\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\tleft: l,\\n\\t\\t\\t\\t\\t\\tprefix: p,\\n\\t\\t\\t\\t\\t\\tright: r,\\n\\t\\t\\t\\t\\t\\tsize: $elm_community$intdict$IntDict$size(l) + $elm_community$intdict$IntDict$size(r)\\n\\t\\t\\t\\t\\t});\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm$core$Bitwise$and = _Bitwise_and;\\nvar $elm$core$Basics$neq = _Utils_notEqual;\\nvar $elm$core$Bitwise$complement = _Bitwise_complement;\\nvar $elm$core$Bitwise$or = _Bitwise_or;\\nvar $elm$core$Bitwise$shiftRightZfBy = _Bitwise_shiftRightZfBy;\\nvar $elm_community$intdict$IntDict$highestBitSet = function (n) {\\n\\tvar shiftOr = F2(\\n\\t\\tfunction (i, shift) {\\n\\t\\t\\treturn i | (i >>> shift);\\n\\t\\t});\\n\\tvar n1 = A2(shiftOr, n, 1);\\n\\tvar n2 = A2(shiftOr, n1, 2);\\n\\tvar n3 = A2(shiftOr, n2, 4);\\n\\tvar n4 = A2(shiftOr, n3, 8);\\n\\tvar n5 = A2(shiftOr, n4, 16);\\n\\treturn n5 & (~(n5 >>> 1));\\n};\\nvar $elm$core$Basics$negate = function (n) {\\n\\treturn -n;\\n};\\nvar $elm_community$intdict$IntDict$signBit = $elm_community$intdict$IntDict$highestBitSet(-1);\\nvar $elm$core$Bitwise$xor = _Bitwise_xor;\\nvar $elm_community$intdict$IntDict$isBranchingBitSet = function (p) {\\n\\treturn A2(\\n\\t\\t$elm$core$Basics$composeR,\\n\\t\\t$elm$core$Bitwise$xor($elm_community$intdict$IntDict$signBit),\\n\\t\\tA2(\\n\\t\\t\\t$elm$core$Basics$composeR,\\n\\t\\t\\t$elm$core$Bitwise$and(p.branchingBit),\\n\\t\\t\\t$elm$core$Basics$neq(0)));\\n};\\nvar $elm_community$intdict$IntDict$higherBitMask = function (branchingBit) {\\n\\treturn branchingBit ^ (~(branchingBit - 1));\\n};\\nvar $elm_community$intdict$IntDict$lcp = F2(\\n\\tfunction (x, y) {\\n\\t\\tvar branchingBit = $elm_community$intdict$IntDict$highestBitSet(x ^ y);\\n\\t\\tvar mask = $elm_community$intdict$IntDict$higherBitMask(branchingBit);\\n\\t\\tvar prefixBits = x & mask;\\n\\t\\treturn {branchingBit: branchingBit, prefixBits: prefixBits};\\n\\t});\\nvar $elm_community$intdict$IntDict$Leaf = function (a) {\\n\\treturn {$: \\'Leaf\\', a: a};\\n};\\nvar $elm_community$intdict$IntDict$leaf = F2(\\n\\tfunction (k, v) {\\n\\t\\treturn $elm_community$intdict$IntDict$Leaf(\\n\\t\\t\\t{key: k, value: v});\\n\\t});\\nvar $elm_community$intdict$IntDict$prefixMatches = F2(\\n\\tfunction (p, n) {\\n\\t\\treturn _Utils_eq(\\n\\t\\t\\tn & $elm_community$intdict$IntDict$higherBitMask(p.branchingBit),\\n\\t\\t\\tp.prefixBits);\\n\\t});\\nvar $elm_community$intdict$IntDict$update = F3(\\n\\tfunction (key, alter, dict) {\\n\\t\\tvar join = F2(\\n\\t\\t\\tfunction (_v2, _v3) {\\n\\t\\t\\t\\tvar k1 = _v2.a;\\n\\t\\t\\t\\tvar l = _v2.b;\\n\\t\\t\\t\\tvar k2 = _v3.a;\\n\\t\\t\\t\\tvar r = _v3.b;\\n\\t\\t\\t\\tvar prefix = A2($elm_community$intdict$IntDict$lcp, k1, k2);\\n\\t\\t\\t\\treturn A2($elm_community$intdict$IntDict$isBranchingBitSet, prefix, k2) ? A3($elm_community$intdict$IntDict$inner, prefix, l, r) : A3($elm_community$intdict$IntDict$inner, prefix, r, l);\\n\\t\\t\\t});\\n\\t\\tvar alteredNode = function (mv) {\\n\\t\\t\\tvar _v1 = alter(mv);\\n\\t\\t\\tif (_v1.$ === \\'Just\\') {\\n\\t\\t\\t\\tvar v = _v1.a;\\n\\t\\t\\t\\treturn A2($elm_community$intdict$IntDict$leaf, key, v);\\n\\t\\t\\t} else {\\n\\t\\t\\t\\treturn $elm_community$intdict$IntDict$empty;\\n\\t\\t\\t}\\n\\t\\t};\\n\\t\\tswitch (dict.$) {\\n\\t\\t\\tcase \\'Empty\\':\\n\\t\\t\\t\\treturn alteredNode($elm$core$Maybe$Nothing);\\n\\t\\t\\tcase \\'Leaf\\':\\n\\t\\t\\t\\tvar l = dict.a;\\n\\t\\t\\t\\treturn _Utils_eq(l.key, key) ? alteredNode(\\n\\t\\t\\t\\t\\t$elm$core$Maybe$Just(l.value)) : A2(\\n\\t\\t\\t\\t\\tjoin,\\n\\t\\t\\t\\t\\t_Utils_Tuple2(\\n\\t\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\t\\talteredNode($elm$core$Maybe$Nothing)),\\n\\t\\t\\t\\t\\t_Utils_Tuple2(l.key, dict));\\n\\t\\t\\tdefault:\\n\\t\\t\\t\\tvar i = dict.a;\\n\\t\\t\\t\\treturn A2($elm_community$intdict$IntDict$prefixMatches, i.prefix, key) ? (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.prefix, key) ? A3(\\n\\t\\t\\t\\t\\t$elm_community$intdict$IntDict$inner,\\n\\t\\t\\t\\t\\ti.prefix,\\n\\t\\t\\t\\t\\ti.left,\\n\\t\\t\\t\\t\\tA3($elm_community$intdict$IntDict$update, key, alter, i.right)) : A3(\\n\\t\\t\\t\\t\\t$elm_community$intdict$IntDict$inner,\\n\\t\\t\\t\\t\\ti.prefix,\\n\\t\\t\\t\\t\\tA3($elm_community$intdict$IntDict$update, key, alter, i.left),\\n\\t\\t\\t\\t\\ti.right)) : A2(\\n\\t\\t\\t\\t\\tjoin,\\n\\t\\t\\t\\t\\t_Utils_Tuple2(\\n\\t\\t\\t\\t\\t\\tkey,\\n\\t\\t\\t\\t\\t\\talteredNode($elm$core$Maybe$Nothing)),\\n\\t\\t\\t\\t\\t_Utils_Tuple2(i.prefix.prefixBits, dict));\\n\\t\\t}\\n\\t});\\nvar $elm_community$intdict$IntDict$insert = F3(\\n\\tfunction (key, value, dict) {\\n\\t\\treturn A3(\\n\\t\\t\\t$elm_community$intdict$IntDict$update,\\n\\t\\t\\tkey,\\n\\t\\t\\t$elm$core$Basics$always(\\n\\t\\t\\t\\t$elm$core$Maybe$Just(value)),\\n\\t\\t\\tdict);\\n\\t});\\nvar $elm$core$Maybe$map = F2(\\n\\tfunction (f, maybe) {\\n\\t\\tif (maybe.$ === \\'Just\\') {\\n\\t\\t\\tvar value = maybe.a;\\n\\t\\t\\treturn $elm$core$Maybe$Just(\\n\\t\\t\\t\\tf(value));\\n\\t\\t} else {\\n\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t}\\n\\t});\\nvar $elm_community$intdict$IntDict$get = F2(\\n\\tfunction (key, dict) {\\n\\t\\tget:\\n\\t\\twhile (true) {\\n\\t\\t\\tswitch (dict.$) {\\n\\t\\t\\t\\tcase \\'Empty\\':\\n\\t\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\tcase \\'Leaf\\':\\n\\t\\t\\t\\t\\tvar l = dict.a;\\n\\t\\t\\t\\t\\treturn _Utils_eq(l.key, key) ? $elm$core$Maybe$Just(l.value) : $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\tvar i = dict.a;\\n\\t\\t\\t\\t\\tif (!A2($elm_community$intdict$IntDict$prefixMatches, i.prefix, key)) {\\n\\t\\t\\t\\t\\t\\treturn $elm$core$Maybe$Nothing;\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tif (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.prefix, key)) {\\n\\t\\t\\t\\t\\t\\t\\tvar $temp$key = key,\\n\\t\\t\\t\\t\\t\\t\\t\\t$temp$dict = i.right;\\n\\t\\t\\t\\t\\t\\t\\tkey = $temp$key;\\n\\t\\t\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\t\\t\\tcontinue get;\\n\\t\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\t\\tvar $temp$key = key,\\n\\t\\t\\t\\t\\t\\t\\t\\t$temp$dict = i.left;\\n\\t\\t\\t\\t\\t\\t\\tkey = $temp$key;\\n\\t\\t\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\t\\t\\tcontinue get;\\n\\t\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm_community$intdict$IntDict$member = F2(\\n\\tfunction (key, dict) {\\n\\t\\tvar _v0 = A2($elm_community$intdict$IntDict$get, key, dict);\\n\\t\\tif (_v0.$ === \\'Just\\') {\\n\\t\\t\\treturn true;\\n\\t\\t} else {\\n\\t\\t\\treturn false;\\n\\t\\t}\\n\\t});\\nvar $elm_community$graph$Graph$fromNodesAndEdges = F2(\\n\\tfunction (nodes_, edges_) {\\n\\t\\tvar nodeRep = A3(\\n\\t\\t\\t$elm$core$List$foldl,\\n\\t\\t\\tfunction (n) {\\n\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t$elm_community$intdict$IntDict$insert,\\n\\t\\t\\t\\t\\tn.id,\\n\\t\\t\\t\\t\\tA3($elm_community$graph$Graph$NodeContext, n, $elm_community$intdict$IntDict$empty, $elm_community$intdict$IntDict$empty));\\n\\t\\t\\t},\\n\\t\\t\\t$elm_community$intdict$IntDict$empty,\\n\\t\\t\\tnodes_);\\n\\t\\tvar addEdge = F2(\\n\\t\\t\\tfunction (edge, rep) {\\n\\t\\t\\t\\tvar updateOutgoing = function (ctx) {\\n\\t\\t\\t\\t\\treturn _Utils_update(\\n\\t\\t\\t\\t\\t\\tctx,\\n\\t\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\t\\toutgoing: A3($elm_community$intdict$IntDict$insert, edge.to, edge.label, ctx.outgoing)\\n\\t\\t\\t\\t\\t\\t});\\n\\t\\t\\t\\t};\\n\\t\\t\\t\\tvar updateIncoming = function (ctx) {\\n\\t\\t\\t\\t\\treturn _Utils_update(\\n\\t\\t\\t\\t\\t\\tctx,\\n\\t\\t\\t\\t\\t\\t{\\n\\t\\t\\t\\t\\t\\t\\tincoming: A3($elm_community$intdict$IntDict$insert, edge.from, edge.label, ctx.incoming)\\n\\t\\t\\t\\t\\t\\t});\\n\\t\\t\\t\\t};\\n\\t\\t\\t\\treturn A3(\\n\\t\\t\\t\\t\\t$elm_community$intdict$IntDict$update,\\n\\t\\t\\t\\t\\tedge.to,\\n\\t\\t\\t\\t\\t$elm$core$Maybe$map(updateIncoming),\\n\\t\\t\\t\\t\\tA3(\\n\\t\\t\\t\\t\\t\\t$elm_community$intdict$IntDict$update,\\n\\t\\t\\t\\t\\t\\tedge.from,\\n\\t\\t\\t\\t\\t\\t$elm$core$Maybe$map(updateOutgoing),\\n\\t\\t\\t\\t\\t\\trep));\\n\\t\\t\\t});\\n\\t\\tvar addEdgeIfValid = F2(\\n\\t\\t\\tfunction (edge, rep) {\\n\\t\\t\\t\\treturn (A2($elm_community$intdict$IntDict$member, edge.from, rep) && A2($elm_community$intdict$IntDict$member, edge.to, rep)) ? A2(addEdge, edge, rep) : rep;\\n\\t\\t\\t});\\n\\t\\treturn $elm_community$graph$Graph$Graph(\\n\\t\\t\\tA3($elm$core$List$foldl, addEdgeIfValid, nodeRep, edges_));\\n\\t});\\nvar $author$project$Main$valueNameToNodeData = function (valueName) {\\n\\tswitch (valueName.$) {\\n\\t\\tcase \\'App\\':\\n\\t\\t\\tvar name = valueName.a.name;\\n\\t\\t\\treturn {\\n\\t\\t\\t\\tcolor: \\'1\\',\\n\\t\\t\\t\\tid: A2($elm$core$String$join, \\'.\\', name),\\n\\t\\t\\t\\tlabel: A2($elm$core$String$join, \\'.\\', name)\\n\\t\\t\\t};\\n\\t\\tcase \\'Package\\':\\n\\t\\t\\tvar author = valueName.a.author;\\n\\t\\t\\tvar _package = valueName.a._package;\\n\\t\\t\\tvar name = valueName.a.name;\\n\\t\\t\\treturn {\\n\\t\\t\\t\\tcolor: \\'2\\',\\n\\t\\t\\t\\tid: A2($elm$core$String$join, \\'.\\', name),\\n\\t\\t\\t\\tlabel: author + (\\'/\\' + (_package + (\\'\\\\n\\' + A2($elm$core$String$join, \\'.\\', name))))\\n\\t\\t\\t};\\n\\t\\tdefault:\\n\\t\\t\\tvar name = valueName.a;\\n\\t\\t\\treturn {color: \\'3\\', id: name, label: name};\\n\\t}\\n};\\nvar $author$project$Main$makeGraph = function (values) {\\n\\tvar valuesWithIds = A2(\\n\\t\\t$elm$core$List$indexedMap,\\n\\t\\tF2(\\n\\t\\t\\tfunction (id, _v3) {\\n\\t\\t\\t\\tvar name = _v3.a;\\n\\t\\t\\t\\tvar references = _v3.b;\\n\\t\\t\\t\\treturn _Utils_Tuple3(id, name, references);\\n\\t\\t\\t}),\\n\\t\\t$elm$core$Dict$toList(values));\\n\\tvar nodes = A2(\\n\\t\\t$elm$core$List$map,\\n\\t\\tfunction (_v2) {\\n\\t\\t\\tvar id = _v2.a;\\n\\t\\t\\tvar name = _v2.b;\\n\\t\\t\\treturn A2(\\n\\t\\t\\t\\t$elm_community$graph$Graph$Node,\\n\\t\\t\\t\\tid,\\n\\t\\t\\t\\t$author$project$Main$valueNameToNodeData(\\n\\t\\t\\t\\t\\t$author$project$Main$parseName(name)));\\n\\t\\t},\\n\\t\\tvaluesWithIds);\\n\\tvar ids = $elm$core$Dict$fromList(\\n\\t\\tA2(\\n\\t\\t\\t$elm$core$List$map,\\n\\t\\t\\tfunction (_v1) {\\n\\t\\t\\t\\tvar id = _v1.a;\\n\\t\\t\\t\\tvar name = _v1.b;\\n\\t\\t\\t\\treturn _Utils_Tuple2(name, id);\\n\\t\\t\\t},\\n\\t\\t\\tvaluesWithIds));\\n\\tvar getId = function (name) {\\n\\t\\treturn A2($elm$core$Dict$get, name, ids);\\n\\t};\\n\\tvar edges = A2(\\n\\t\\t$elm$core$List$concatMap,\\n\\t\\tfunction (_v0) {\\n\\t\\t\\tvar fromId = _v0.a;\\n\\t\\t\\tvar references = _v0.c;\\n\\t\\t\\treturn A2(\\n\\t\\t\\t\\t$elm$core$List$filterMap,\\n\\t\\t\\t\\tfunction (reference) {\\n\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t$elm$core$Maybe$map,\\n\\t\\t\\t\\t\\t\\tfunction (toId) {\\n\\t\\t\\t\\t\\t\\t\\treturn A3($elm_community$graph$Graph$Edge, fromId, toId, _Utils_Tuple0);\\n\\t\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\t\\tgetId(reference));\\n\\t\\t\\t\\t},\\n\\t\\t\\t\\t$elm$core$Set$toList(references));\\n\\t\\t},\\n\\t\\tvaluesWithIds);\\n\\treturn A2($elm_community$graph$Graph$fromNodesAndEdges, nodes, edges);\\n};\\nvar $elm$virtual_dom$VirtualDom$node = function (tag) {\\n\\treturn _VirtualDom_node(\\n\\t\\t_VirtualDom_noScript(tag));\\n};\\nvar $elm$html$Html$node = $elm$virtual_dom$VirtualDom$node;\\nvar $elm_community$intdict$IntDict$foldl = F3(\\n\\tfunction (f, acc, dict) {\\n\\t\\tfoldl:\\n\\t\\twhile (true) {\\n\\t\\t\\tswitch (dict.$) {\\n\\t\\t\\t\\tcase \\'Empty\\':\\n\\t\\t\\t\\t\\treturn acc;\\n\\t\\t\\t\\tcase \\'Leaf\\':\\n\\t\\t\\t\\t\\tvar l = dict.a;\\n\\t\\t\\t\\t\\treturn A3(f, l.key, l.value, acc);\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\tvar i = dict.a;\\n\\t\\t\\t\\t\\tvar $temp$f = f,\\n\\t\\t\\t\\t\\t\\t$temp$acc = A3($elm_community$intdict$IntDict$foldl, f, acc, i.left),\\n\\t\\t\\t\\t\\t\\t$temp$dict = i.right;\\n\\t\\t\\t\\t\\tf = $temp$f;\\n\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\tcontinue foldl;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm_community$graph$Graph$unGraph = function (graph) {\\n\\tvar rep = graph.a;\\n\\treturn rep;\\n};\\nvar $elm_community$graph$Graph$edges = function (graph) {\\n\\tvar flippedFoldl = F3(\\n\\t\\tfunction (f, dict, list) {\\n\\t\\t\\treturn A3($elm_community$intdict$IntDict$foldl, f, list, dict);\\n\\t\\t});\\n\\tvar prependEdges = F2(\\n\\t\\tfunction (node1, ctx) {\\n\\t\\t\\treturn A2(\\n\\t\\t\\t\\tflippedFoldl,\\n\\t\\t\\t\\tF2(\\n\\t\\t\\t\\t\\tfunction (node2, e) {\\n\\t\\t\\t\\t\\t\\treturn $elm$core$List$cons(\\n\\t\\t\\t\\t\\t\\t\\t{from: node1, label: e, to: node2});\\n\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\tctx.outgoing);\\n\\t\\t});\\n\\treturn A3(\\n\\t\\tflippedFoldl,\\n\\t\\tprependEdges,\\n\\t\\t$elm_community$graph$Graph$unGraph(graph),\\n\\t\\t_List_Nil);\\n};\\nvar $elm_community$intdict$IntDict$foldr = F3(\\n\\tfunction (f, acc, dict) {\\n\\t\\tfoldr:\\n\\t\\twhile (true) {\\n\\t\\t\\tswitch (dict.$) {\\n\\t\\t\\t\\tcase \\'Empty\\':\\n\\t\\t\\t\\t\\treturn acc;\\n\\t\\t\\t\\tcase \\'Leaf\\':\\n\\t\\t\\t\\t\\tvar l = dict.a;\\n\\t\\t\\t\\t\\treturn A3(f, l.key, l.value, acc);\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\tvar i = dict.a;\\n\\t\\t\\t\\t\\tvar $temp$f = f,\\n\\t\\t\\t\\t\\t\\t$temp$acc = A3($elm_community$intdict$IntDict$foldr, f, acc, i.right),\\n\\t\\t\\t\\t\\t\\t$temp$dict = i.left;\\n\\t\\t\\t\\t\\tf = $temp$f;\\n\\t\\t\\t\\t\\tacc = $temp$acc;\\n\\t\\t\\t\\t\\tdict = $temp$dict;\\n\\t\\t\\t\\t\\tcontinue foldr;\\n\\t\\t\\t}\\n\\t\\t}\\n\\t});\\nvar $elm_community$intdict$IntDict$values = function (dict) {\\n\\treturn A3(\\n\\t\\t$elm_community$intdict$IntDict$foldr,\\n\\t\\tF3(\\n\\t\\t\\tfunction (key, value, valueList) {\\n\\t\\t\\t\\treturn A2($elm$core$List$cons, value, valueList);\\n\\t\\t\\t}),\\n\\t\\t_List_Nil,\\n\\t\\tdict);\\n};\\nvar $elm_community$graph$Graph$nodes = A2(\\n\\t$elm$core$Basics$composeR,\\n\\t$elm_community$graph$Graph$unGraph,\\n\\tA2(\\n\\t\\t$elm$core$Basics$composeR,\\n\\t\\t$elm_community$intdict$IntDict$values,\\n\\t\\t$elm$core$List$map(\\n\\t\\t\\tfunction ($) {\\n\\t\\t\\t\\treturn $.node;\\n\\t\\t\\t})));\\nvar $elm$core$List$sortWith = _List_sortWith;\\nvar $elm_community$graph$Graph$DOT$outputWithStylesAndAttributes = F4(\\n\\tfunction (styles, nodeAttrs, edgeAttrs, graph) {\\n\\t\\tvar rankDirToString = function (r) {\\n\\t\\t\\tswitch (r.$) {\\n\\t\\t\\t\\tcase \\'TB\\':\\n\\t\\t\\t\\t\\treturn \\'TB\\';\\n\\t\\t\\t\\tcase \\'LR\\':\\n\\t\\t\\t\\t\\treturn \\'LR\\';\\n\\t\\t\\t\\tcase \\'BT\\':\\n\\t\\t\\t\\t\\treturn \\'BT\\';\\n\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\treturn \\'RL\\';\\n\\t\\t\\t}\\n\\t\\t};\\n\\t\\tvar nodes = $elm_community$graph$Graph$nodes(graph);\\n\\t\\tvar encode = A2(\\n\\t\\t\\t$elm$core$Basics$composeR,\\n\\t\\t\\t$elm$json$Json$Encode$string,\\n\\t\\t\\t$elm$json$Json$Encode$encode(0));\\n\\t\\tvar edges = function () {\\n\\t\\t\\tvar compareEdge = F2(\\n\\t\\t\\t\\tfunction (a, b) {\\n\\t\\t\\t\\t\\tvar _v1 = A2($elm$core$Basics$compare, a.from, b.from);\\n\\t\\t\\t\\t\\tswitch (_v1.$) {\\n\\t\\t\\t\\t\\t\\tcase \\'LT\\':\\n\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Basics$LT;\\n\\t\\t\\t\\t\\t\\tcase \\'GT\\':\\n\\t\\t\\t\\t\\t\\t\\treturn $elm$core$Basics$GT;\\n\\t\\t\\t\\t\\t\\tdefault:\\n\\t\\t\\t\\t\\t\\t\\treturn A2($elm$core$Basics$compare, a.to, b.to);\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t});\\n\\t\\t\\treturn A2(\\n\\t\\t\\t\\t$elm$core$List$sortWith,\\n\\t\\t\\t\\tcompareEdge,\\n\\t\\t\\t\\t$elm_community$graph$Graph$edges(graph));\\n\\t\\t}();\\n\\t\\tvar attrAssocs = A2(\\n\\t\\t\\t$elm$core$Basics$composeR,\\n\\t\\t\\t$elm$core$Dict$toList,\\n\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$core$Basics$composeR,\\n\\t\\t\\t\\t$elm$core$List$map(\\n\\t\\t\\t\\t\\tfunction (_v0) {\\n\\t\\t\\t\\t\\t\\tvar k = _v0.a;\\n\\t\\t\\t\\t\\t\\tvar v = _v0.b;\\n\\t\\t\\t\\t\\t\\treturn k + (\\'=\\' + encode(v));\\n\\t\\t\\t\\t\\t}),\\n\\t\\t\\t\\t$elm$core$String$join(\\', \\')));\\n\\t\\tvar makeAttrs = function (d) {\\n\\t\\t\\treturn $elm$core$Dict$isEmpty(d) ? \\'\\' : (\\' [\\' + (attrAssocs(d) + \\']\\'));\\n\\t\\t};\\n\\t\\tvar edge = function (e) {\\n\\t\\t\\treturn \\'  \\' + ($elm$core$String$fromInt(e.from) + (\\' -> \\' + ($elm$core$String$fromInt(e.to) + makeAttrs(\\n\\t\\t\\t\\tedgeAttrs(e.label)))));\\n\\t\\t};\\n\\t\\tvar edgesString = A2(\\n\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\'\\\\n\\',\\n\\t\\t\\tA2($elm$core$List$map, edge, edges));\\n\\t\\tvar node = function (n) {\\n\\t\\t\\treturn \\'  \\' + ($elm$core$String$fromInt(n.id) + makeAttrs(\\n\\t\\t\\t\\tnodeAttrs(n.label)));\\n\\t\\t};\\n\\t\\tvar nodesString = A2(\\n\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\'\\\\n\\',\\n\\t\\t\\tA2($elm$core$List$map, node, nodes));\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$core$String$join,\\n\\t\\t\\t\\'\\\\n\\',\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\'digraph G {\\',\\n\\t\\t\\t\\t\\t\\'  rankdir=\\' + rankDirToString(styles.rankdir),\\n\\t\\t\\t\\t\\t\\'  graph [\\' + (styles.graph + \\']\\'),\\n\\t\\t\\t\\t\\t\\'  node [\\' + (styles.node + \\']\\'),\\n\\t\\t\\t\\t\\t\\'  edge [\\' + (styles.edge + \\']\\'),\\n\\t\\t\\t\\t\\t\\'\\',\\n\\t\\t\\t\\t\\tedgesString,\\n\\t\\t\\t\\t\\t\\'\\',\\n\\t\\t\\t\\t\\tnodesString,\\n\\t\\t\\t\\t\\t\\'}\\'\\n\\t\\t\\t\\t]));\\n\\t});\\nvar $elm$json$Json$Decode$string = _Json_decodeString;\\nvar $author$project$Main$viewGraph = function (values) {\\n\\tvar dot = A4(\\n\\t\\t$elm_community$graph$Graph$DOT$outputWithStylesAndAttributes,\\n\\t\\t{edge: \\'\\', graph: \\'\\', node: \\'fontname=\\\\"inherit\\\\", shape=box, style=\\\\"filled\\\\", colorscheme=\\\\"pastel19\\\\"\\', rankdir: $elm_community$graph$Graph$DOT$TB},\\n\\t\\tfunction (graphNode) {\\n\\t\\t\\treturn $elm$core$Dict$fromList(\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t_Utils_Tuple2(\\'id\\', graphNode.id),\\n\\t\\t\\t\\t\\t\\t_Utils_Tuple2(\\'label\\', graphNode.label),\\n\\t\\t\\t\\t\\t\\t_Utils_Tuple2(\\'color\\', graphNode.color)\\n\\t\\t\\t\\t\\t]));\\n\\t\\t},\\n\\t\\tfunction (_v0) {\\n\\t\\t\\treturn $elm$core$Dict$empty;\\n\\t\\t},\\n\\t\\t$author$project$Main$makeGraph(values));\\n\\treturn A3(\\n\\t\\t$elm$html$Html$node,\\n\\t\\t\\'graphviz-dot\\',\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\tA2($elm$html$Html$Attributes$attribute, \\'dot\\', dot),\\n\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'AbsoluteFill\\'),\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$Events$custom,\\n\\t\\t\\t\\t\\'NodeDoubleClicked\\',\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t$elm$json$Json$Decode$map,\\n\\t\\t\\t\\t\\tfunction (nodeId) {\\n\\t\\t\\t\\t\\t\\treturn {\\n\\t\\t\\t\\t\\t\\t\\tmessage: $author$project$Main$SearchChanged(nodeId),\\n\\t\\t\\t\\t\\t\\t\\tpreventDefault: false,\\n\\t\\t\\t\\t\\t\\t\\tstopPropagation: false\\n\\t\\t\\t\\t\\t\\t};\\n\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\tA2($elm$json$Json$Decode$field, \\'detail\\', $elm$json$Json$Decode$string)))\\n\\t\\t\\t]),\\n\\t\\t_List_Nil);\\n};\\nvar $author$project$Main$BackToTextareaPressed = {$: \\'BackToTextareaPressed\\'};\\nvar $elm$html$Html$button = _VirtualDom_node(\\'button\\');\\nvar $elm$html$Html$datalist = _VirtualDom_node(\\'datalist\\');\\nvar $elm$html$Html$Attributes$id = $elm$html$Html$Attributes$stringProperty(\\'id\\');\\nvar $elm$html$Html$input = _VirtualDom_node(\\'input\\');\\nvar $elm$html$Html$label = _VirtualDom_node(\\'label\\');\\nvar $elm$html$Html$Attributes$list = _VirtualDom_attribute(\\'list\\');\\nvar $elm$virtual_dom$VirtualDom$Normal = function (a) {\\n\\treturn {$: \\'Normal\\', a: a};\\n};\\nvar $elm$html$Html$Events$on = F2(\\n\\tfunction (event, decoder) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$on,\\n\\t\\t\\tevent,\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$Normal(decoder));\\n\\t});\\nvar $elm$html$Html$Events$onClick = function (msg) {\\n\\treturn A2(\\n\\t\\t$elm$html$Html$Events$on,\\n\\t\\t\\'click\\',\\n\\t\\t$elm$json$Json$Decode$succeed(msg));\\n};\\nvar $elm$html$Html$Events$alwaysStop = function (x) {\\n\\treturn _Utils_Tuple2(x, true);\\n};\\nvar $elm$virtual_dom$VirtualDom$MayStopPropagation = function (a) {\\n\\treturn {$: \\'MayStopPropagation\\', a: a};\\n};\\nvar $elm$html$Html$Events$stopPropagationOn = F2(\\n\\tfunction (event, decoder) {\\n\\t\\treturn A2(\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$on,\\n\\t\\t\\tevent,\\n\\t\\t\\t$elm$virtual_dom$VirtualDom$MayStopPropagation(decoder));\\n\\t});\\nvar $elm$json$Json$Decode$at = F2(\\n\\tfunction (fields, decoder) {\\n\\t\\treturn A3($elm$core$List$foldr, $elm$json$Json$Decode$field, decoder, fields);\\n\\t});\\nvar $elm$html$Html$Events$targetValue = A2(\\n\\t$elm$json$Json$Decode$at,\\n\\t_List_fromArray(\\n\\t\\t[\\'target\\', \\'value\\']),\\n\\t$elm$json$Json$Decode$string);\\nvar $elm$html$Html$Events$onInput = function (tagger) {\\n\\treturn A2(\\n\\t\\t$elm$html$Html$Events$stopPropagationOn,\\n\\t\\t\\'input\\',\\n\\t\\tA2(\\n\\t\\t\\t$elm$json$Json$Decode$map,\\n\\t\\t\\t$elm$html$Html$Events$alwaysStop,\\n\\t\\t\\tA2($elm$json$Json$Decode$map, tagger, $elm$html$Html$Events$targetValue)));\\n};\\nvar $elm$html$Html$option = _VirtualDom_node(\\'option\\');\\nvar $elm$html$Html$Attributes$placeholder = $elm$html$Html$Attributes$stringProperty(\\'placeholder\\');\\nvar $author$project$Main$searchFieldId = \\'searchFieldId\\';\\nvar $elm$html$Html$span = _VirtualDom_node(\\'span\\');\\nvar $elm$virtual_dom$VirtualDom$style = _VirtualDom_style;\\nvar $elm$html$Html$Attributes$style = $elm$virtual_dom$VirtualDom$style;\\nvar $elm$html$Html$Attributes$value = $elm$html$Html$Attributes$stringProperty(\\'value\\');\\nvar $author$project$Main$InfoButtonPressed = {$: \\'InfoButtonPressed\\'};\\nvar $author$project$Main$viewInfoButton = function (infoShown) {\\n\\treturn A2(\\n\\t\\t$elm$html$Html$button,\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\tA2($elm$html$Html$Attributes$style, \\'justify-self\\', \\'flex-end\\'),\\n\\t\\t\\t\\t$elm$html$Html$Events$onClick($author$project$Main$InfoButtonPressed)\\n\\t\\t\\t]),\\n\\t\\t_List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$elm$html$Html$text(\\n\\t\\t\\t\\tinfoShown ? \\'Hide info\\' : \\'Info\\')\\n\\t\\t\\t]));\\n};\\nvar $author$project$Main$viewToolbarTitle = $elm$html$Html$text(\\'Why does my Elm app depend on …?\\');\\nvar $author$project$Main$viewGraphToolbar = F3(\\n\\tfunction (infoShown, search, suggestions) {\\n\\t\\treturn _List_fromArray(\\n\\t\\t\\t[\\n\\t\\t\\t\\t$author$project$Main$viewToolbarTitle,\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$label,\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'SearchField\\'),\\n\\t\\t\\t\\t\\t\\tA2($elm$html$Html$Attributes$style, \\'flex\\', \\'1\\'),\\n\\t\\t\\t\\t\\t\\tA2($elm$html$Html$Attributes$style, \\'max-width\\', \\'30em\\')\\n\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$span,\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$class(\\'SearchField-label\\')\\n\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$text(\\'Fully.Qualified.name or author/package\\')\\n\\t\\t\\t\\t\\t\\t\\t])),\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$input,\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$value(search),\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Events$onInput($author$project$Main$SearchChanged),\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$placeholder(\\'For example “Html.Styled.toUnstyled” or “rtfeldman/elm-css”\\'),\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$list($author$project$Main$searchFieldId)\\n\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\t_List_Nil),\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$datalist,\\n\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$id($author$project$Main$searchFieldId)\\n\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t\\t\\t\\t$elm$core$List$map,\\n\\t\\t\\t\\t\\t\\t\\tfunction (suggestion) {\\n\\t\\t\\t\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$option,\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$Attributes$value(suggestion)\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t_List_Nil);\\n\\t\\t\\t\\t\\t\\t\\t},\\n\\t\\t\\t\\t\\t\\t\\tsuggestions))\\n\\t\\t\\t\\t\\t])),\\n\\t\\t\\t\\t($elm$core$String$isEmpty(search) || A2($elm$core$List$member, search, suggestions)) ? $elm$html$Html$text(\\'\\') : $elm$html$Html$text(\\'Pick one of the alternatives in the list\\'),\\n\\t\\t\\t\\tA2(\\n\\t\\t\\t\\t$elm$html$Html$button,\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\tA2($elm$html$Html$Attributes$style, \\'margin-left\\', \\'auto\\'),\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$Events$onClick($author$project$Main$BackToTextareaPressed)\\n\\t\\t\\t\\t\\t]),\\n\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t$elm$html$Html$text(\\'Paste new JS\\')\\n\\t\\t\\t\\t\\t])),\\n\\t\\t\\t\\t$author$project$Main$viewInfoButton(infoShown)\\n\\t\\t\\t]);\\n\\t});\\nvar $author$project$Main$TextareaChanged = function (a) {\\n\\treturn {$: \\'TextareaChanged\\', a: a};\\n};\\nvar $author$project$Main$placeholder = \\'Paste compiled JavaScript from Elm here to analyze.\\\\n\\\\nFor example, the contents of elm.js in `elm make src/Main.elm --output elm.js`.\\\\n\\';\\nvar $elm$html$Html$textarea = _VirtualDom_node(\\'textarea\\');\\nvar $author$project$Main$viewTextarea = A2(\\n\\t$elm$html$Html$textarea,\\n\\t_List_fromArray(\\n\\t\\t[\\n\\t\\t\\t$elm$html$Html$Attributes$class(\\'AbsoluteFill Textarea\\'),\\n\\t\\t\\t$elm$html$Html$Attributes$placeholder($author$project$Main$placeholder),\\n\\t\\t\\t$elm$html$Html$Attributes$value(\\'\\'),\\n\\t\\t\\t$elm$html$Html$Events$onInput($author$project$Main$TextareaChanged),\\n\\t\\t\\t$elm$html$Html$Attributes$id($author$project$Main$textareaId)\\n\\t\\t]),\\n\\t_List_Nil);\\nvar $author$project$Main$PasteExamplePressed = {$: \\'PasteExamplePressed\\'};\\nvar $author$project$Main$viewTextareaToolbar = function (infoShown) {\\n\\treturn _List_fromArray(\\n\\t\\t[\\n\\t\\t\\t$author$project$Main$viewToolbarTitle,\\n\\t\\t\\tA2(\\n\\t\\t\\t$elm$html$Html$button,\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t$elm$html$Html$Events$onClick($author$project$Main$PasteExamplePressed)\\n\\t\\t\\t\\t]),\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t$elm$html$Html$text(\\'Paste example\\')\\n\\t\\t\\t\\t])),\\n\\t\\t\\tA2(\\n\\t\\t\\t$elm$html$Html$div,\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\tA2($elm$html$Html$Attributes$style, \\'margin-left\\', \\'auto\\')\\n\\t\\t\\t\\t]),\\n\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t$author$project$Main$viewInfoButton(infoShown)\\n\\t\\t\\t\\t]))\\n\\t\\t]);\\n};\\nvar $author$project$Main$view = function (model) {\\n\\tvar _v0 = model.page;\\n\\tif (_v0.$ === \\'Textarea\\') {\\n\\t\\treturn $author$project$Main$viewContainer(\\n\\t\\t\\t{\\n\\t\\t\\t\\tcontent: $author$project$Main$viewTextarea,\\n\\t\\t\\t\\tinfoShown: model.infoShown,\\n\\t\\t\\t\\ttoolbar: $author$project$Main$viewTextareaToolbar(model.infoShown)\\n\\t\\t\\t});\\n\\t} else {\\n\\t\\tvar data = _v0.a;\\n\\t\\treturn $author$project$Main$viewContainer(\\n\\t\\t\\t{\\n\\t\\t\\t\\tcontent: function () {\\n\\t\\t\\t\\t\\tvar _v1 = data.filtered;\\n\\t\\t\\t\\t\\tif (_v1.$ === \\'Ok\\') {\\n\\t\\t\\t\\t\\t\\tvar filtered = _v1.a;\\n\\t\\t\\t\\t\\t\\treturn $author$project$Main$viewGraph(filtered);\\n\\t\\t\\t\\t\\t} else {\\n\\t\\t\\t\\t\\t\\tvar message = _v1.a;\\n\\t\\t\\t\\t\\t\\treturn A2(\\n\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$p,\\n\\t\\t\\t\\t\\t\\t\\t_List_Nil,\\n\\t\\t\\t\\t\\t\\t\\t_List_fromArray(\\n\\t\\t\\t\\t\\t\\t\\t\\t[\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t$elm$html$Html$text(message)\\n\\t\\t\\t\\t\\t\\t\\t\\t]));\\n\\t\\t\\t\\t\\t}\\n\\t\\t\\t\\t}(),\\n\\t\\t\\t\\tinfoShown: model.infoShown,\\n\\t\\t\\t\\ttoolbar: A3($author$project$Main$viewGraphToolbar, model.infoShown, data.search, data.suggestions)\\n\\t\\t\\t});\\n\\t}\\n};\\nvar $author$project$Main$main = $elm$browser$Browser$element(\\n\\t{init: $author$project$Main$init, subscriptions: $author$project$Main$subscriptions, update: $author$project$Main$update, view: $author$project$Main$view});\\n_Platform_export({\\'Main\\':{\\'init\\':$author$project$Main$main(\\n\\t$elm$json$Json$Decode$succeed(_Utils_Tuple0))(0)}});}(this));\\n';
var $elm$core$List$append = F2(
\tfunction (xs, ys) {
\t\tif (!ys.b) {
\t\t\treturn xs;
\t\t} else {
\t\t\treturn A3($elm$core$List$foldr, $elm$core$List$cons, ys, xs);
\t\t}
\t});
var $elm$core$List$concat = function (lists) {
\treturn A3($elm$core$List$foldr, $elm$core$List$append, _List_Nil, lists);
};
var $elm$core$List$concatMap = F2(
\tfunction (f, list) {
\t\treturn $elm$core$List$concat(
\t\t\tA2($elm$core$List$map, f, list));
\t});
var $author$project$Main$maxGraphSize = 1000;
var $elm$core$Dict$sizeHelp = F2(
\tfunction (n, dict) {
\t\tsizeHelp:
\t\twhile (true) {
\t\t\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\t\t\treturn n;
\t\t\t} else {
\t\t\t\tvar left = dict.d;
\t\t\t\tvar right = dict.e;
\t\t\t\tvar $temp$n = A2($elm$core$Dict$sizeHelp, n + 1, right),
\t\t\t\t\t$temp$dict = left;
\t\t\t\tn = $temp$n;
\t\t\t\tdict = $temp$dict;
\t\t\t\tcontinue sizeHelp;
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$size = function (dict) {
\treturn A2($elm$core$Dict$sizeHelp, 0, dict);
};
var $author$project$Main$checkGraphSize = function (dict) {
\treturn (_Utils_cmp(
\t\t$elm$core$Dict$size(dict),
\t\t$author$project$Main$maxGraphSize) > 0) ? $elm$core$Result$Err(
\t\t'The graph contains ' + ($elm$core$String$fromInt(
\t\t\t$elm$core$Dict$size(dict)) + (' nodes. I only display graphs with ' + ($elm$core$String$fromInt($author$project$Main$maxGraphSize) + ' nodes or less. Otherwise the graph renderer (Graphviz) tends to hang. Use the text input above to make the graph smaller.')))) : $elm$core$Result$Ok(dict);
};
var $elm$core$Basics$composeR = F3(
\tfunction (f, g, x) {
\t\treturn g(
\t\t\tf(x));
\t});
var $elm$core$Dict$RBEmpty_elm_builtin = {$: 'RBEmpty_elm_builtin'};
var $elm$core$Dict$empty = $elm$core$Dict$RBEmpty_elm_builtin;
var $elm$core$Dict$foldl = F3(
\tfunction (func, acc, dict) {
\t\tfoldl:
\t\twhile (true) {
\t\t\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\t\t\treturn acc;
\t\t\t} else {
\t\t\t\tvar key = dict.b;
\t\t\t\tvar value = dict.c;
\t\t\t\tvar left = dict.d;
\t\t\t\tvar right = dict.e;
\t\t\t\tvar $temp$func = func,
\t\t\t\t\t$temp$acc = A3(
\t\t\t\t\tfunc,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\tA3($elm$core$Dict$foldl, func, acc, left)),
\t\t\t\t\t$temp$dict = right;
\t\t\t\tfunc = $temp$func;
\t\t\t\tacc = $temp$acc;
\t\t\t\tdict = $temp$dict;
\t\t\t\tcontinue foldl;
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$Black = {$: 'Black'};
var $elm$core$Dict$RBNode_elm_builtin = F5(
\tfunction (a, b, c, d, e) {
\t\treturn {$: 'RBNode_elm_builtin', a: a, b: b, c: c, d: d, e: e};
\t});
var $elm$core$Dict$Red = {$: 'Red'};
var $elm$core$Dict$balance = F5(
\tfunction (color, key, value, left, right) {
\t\tif ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Red')) {
\t\t\tvar _v1 = right.a;
\t\t\tvar rK = right.b;
\t\t\tvar rV = right.c;
\t\t\tvar rLeft = right.d;
\t\t\tvar rRight = right.e;
\t\t\tif ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
\t\t\t\tvar _v3 = left.a;
\t\t\t\tvar lK = left.b;
\t\t\t\tvar lV = left.c;
\t\t\t\tvar lLeft = left.d;
\t\t\t\tvar lRight = left.e;
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Red,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, rK, rV, rLeft, rRight));
\t\t\t} else {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\tcolor,
\t\t\t\t\trK,
\t\t\t\t\trV,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, left, rLeft),
\t\t\t\t\trRight);
\t\t\t}
\t\t} else {
\t\t\tif ((((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) && (left.d.$ === 'RBNode_elm_builtin')) && (left.d.a.$ === 'Red')) {
\t\t\t\tvar _v5 = left.a;
\t\t\t\tvar lK = left.b;
\t\t\t\tvar lV = left.c;
\t\t\t\tvar _v6 = left.d;
\t\t\t\tvar _v7 = _v6.a;
\t\t\t\tvar llK = _v6.b;
\t\t\t\tvar llV = _v6.c;
\t\t\t\tvar llLeft = _v6.d;
\t\t\t\tvar llRight = _v6.e;
\t\t\t\tvar lRight = left.e;
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Red,
\t\t\t\t\tlK,
\t\t\t\t\tlV,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, llK, llV, llLeft, llRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, key, value, lRight, right));
\t\t\t} else {
\t\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);
\t\t\t}
\t\t}
\t});
var $elm$core$Basics$compare = _Utils_compare;
var $elm$core$Dict$insertHelp = F3(
\tfunction (key, value, dict) {
\t\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);
\t\t} else {
\t\t\tvar nColor = dict.a;
\t\t\tvar nKey = dict.b;
\t\t\tvar nValue = dict.c;
\t\t\tvar nLeft = dict.d;
\t\t\tvar nRight = dict.e;
\t\t\tvar _v1 = A2($elm$core$Basics$compare, key, nKey);
\t\t\tswitch (_v1.$) {
\t\t\t\tcase 'LT':
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\tnColor,
\t\t\t\t\t\tnKey,
\t\t\t\t\t\tnValue,
\t\t\t\t\t\tA3($elm$core$Dict$insertHelp, key, value, nLeft),
\t\t\t\t\t\tnRight);
\t\t\t\tcase 'EQ':
\t\t\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);
\t\t\t\tdefault:
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\tnColor,
\t\t\t\t\t\tnKey,
\t\t\t\t\t\tnValue,
\t\t\t\t\t\tnLeft,
\t\t\t\t\t\tA3($elm$core$Dict$insertHelp, key, value, nRight));
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$insert = F3(
\tfunction (key, value, dict) {
\t\tvar _v0 = A3($elm$core$Dict$insertHelp, key, value, dict);
\t\tif ((_v0.$ === 'RBNode_elm_builtin') && (_v0.a.$ === 'Red')) {
\t\t\tvar _v1 = _v0.a;
\t\t\tvar k = _v0.b;
\t\t\tvar v = _v0.c;
\t\t\tvar l = _v0.d;
\t\t\tvar r = _v0.e;
\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, k, v, l, r);
\t\t} else {
\t\t\tvar x = _v0;
\t\t\treturn x;
\t\t}
\t});
var $elm$core$Dict$filter = F2(
\tfunction (isGood, dict) {
\t\treturn A3(
\t\t\t$elm$core$Dict$foldl,
\t\t\tF3(
\t\t\t\tfunction (k, v, d) {
\t\t\t\t\treturn A2(isGood, k, v) ? A3($elm$core$Dict$insert, k, v, d) : d;
\t\t\t\t}),
\t\t\t$elm$core$Dict$empty,
\t\t\tdict);
\t});
var $elm$core$List$filter = F2(
\tfunction (isGood, list) {
\t\treturn A3(
\t\t\t$elm$core$List$foldr,
\t\t\tF2(
\t\t\t\tfunction (x, xs) {
\t\t\t\t\treturn isGood(x) ? A2($elm$core$List$cons, x, xs) : xs;
\t\t\t\t}),
\t\t\t_List_Nil,
\t\t\tlist);
\t});
var $elm$core$Set$Set_elm_builtin = function (a) {
\treturn {$: 'Set_elm_builtin', a: a};
};
var $elm$core$Set$empty = $elm$core$Set$Set_elm_builtin($elm$core$Dict$empty);
var $elm$core$Set$insert = F2(
\tfunction (key, _v0) {
\t\tvar dict = _v0.a;
\t\treturn $elm$core$Set$Set_elm_builtin(
\t\t\tA3($elm$core$Dict$insert, key, _Utils_Tuple0, dict));
\t});
var $elm$core$Set$fromList = function (list) {
\treturn A3($elm$core$List$foldl, $elm$core$Set$insert, $elm$core$Set$empty, list);
};
var $elm$core$Dict$isEmpty = function (dict) {
\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\treturn true;
\t} else {
\t\treturn false;
\t}
};
var $elm$core$List$isEmpty = function (xs) {
\tif (!xs.b) {
\t\treturn true;
\t} else {
\t\treturn false;
\t}
};
var $elm$core$Set$isEmpty = function (_v0) {
\tvar dict = _v0.a;
\treturn $elm$core$Dict$isEmpty(dict);
};
var $author$project$Main$App = function (a) {
\treturn {$: 'App', a: a};
};
var $author$project$Main$Package = function (a) {
\treturn {$: 'Package', a: a};
};
var $author$project$Main$Unknown = function (a) {
\treturn {$: 'Unknown', a: a};
};
var $elm$core$String$replace = F3(
\tfunction (before, after, string) {
\t\treturn A2(
\t\t\t$elm$core$String$join,
\t\t\tafter,
\t\t\tA2($elm$core$String$split, before, string));
\t});
var $author$project$Main$dash = A2($elm$core$String$replace, '_', '-');
var $author$project$Main$parseName = function (name) {
\tvar _v0 = A2($elm$core$String$split, '$', name);
\tif (((_v0.b && (_v0.a === '')) && _v0.b.b) && _v0.b.b.b) {
\t\tif ((_v0.b.a === 'author') && (_v0.b.b.a === 'project')) {
\t\t\tvar _v1 = _v0.b;
\t\t\tvar _v2 = _v1.b;
\t\t\tvar rest = _v2.b;
\t\t\treturn $author$project$Main$App(
\t\t\t\t{name: rest});
\t\t} else {
\t\t\tvar _v3 = _v0.b;
\t\t\tvar author = _v3.a;
\t\t\tvar _v4 = _v3.b;
\t\t\tvar _package = _v4.a;
\t\t\tvar rest = _v4.b;
\t\t\treturn $author$project$Main$Package(
\t\t\t\t{
\t\t\t\t\tauthor: $author$project$Main$dash(author),
\t\t\t\t\tname: rest,
\t\t\t\t\t_package: $author$project$Main$dash(_package)
\t\t\t\t});
\t\t}
\t} else {
\t\treturn $author$project$Main$Unknown(name);
\t}
};
var $author$project$Main$matchValue = F2(
\tfunction (search, valueNameString) {
\t\tvar valueName = $author$project$Main$parseName(valueNameString);
\t\tif (search.$ === 'ByName') {
\t\t\tvar name = search.a.name;
\t\t\tswitch (valueName.$) {
\t\t\t\tcase 'App':
\t\t\t\t\tvar data = valueName.a;
\t\t\t\t\treturn _Utils_eq(
\t\t\t\t\t\tname,
\t\t\t\t\t\tA2($elm$core$String$join, '.', data.name));
\t\t\t\tcase 'Package':
\t\t\t\t\tvar data = valueName.a;
\t\t\t\t\treturn _Utils_eq(
\t\t\t\t\t\tname,
\t\t\t\t\t\tA2($elm$core$String$join, '.', data.name));
\t\t\t\tdefault:
\t\t\t\t\tvar unknownName = valueName.a;
\t\t\t\t\treturn _Utils_eq(name, unknownName);
\t\t\t}
\t\t} else {
\t\t\tvar author = search.a.author;
\t\t\tvar _package = search.a._package;
\t\t\tswitch (valueName.$) {
\t\t\t\tcase 'App':
\t\t\t\t\treturn false;
\t\t\t\tcase 'Package':
\t\t\t\t\tvar data = valueName.a;
\t\t\t\t\treturn _Utils_eq(author, data.author) && _Utils_eq(_package, data._package);
\t\t\t\tdefault:
\t\t\t\t\treturn false;
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$get = F2(
\tfunction (targetKey, dict) {
\t\tget:
\t\twhile (true) {
\t\t\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t} else {
\t\t\t\tvar key = dict.b;
\t\t\t\tvar value = dict.c;
\t\t\t\tvar left = dict.d;
\t\t\t\tvar right = dict.e;
\t\t\t\tvar _v1 = A2($elm$core$Basics$compare, targetKey, key);
\t\t\t\tswitch (_v1.$) {
\t\t\t\t\tcase 'LT':
\t\t\t\t\t\tvar $temp$targetKey = targetKey,
\t\t\t\t\t\t\t$temp$dict = left;
\t\t\t\t\t\ttargetKey = $temp$targetKey;
\t\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\t\tcontinue get;
\t\t\t\t\tcase 'EQ':
\t\t\t\t\t\treturn $elm$core$Maybe$Just(value);
\t\t\t\t\tdefault:
\t\t\t\t\t\tvar $temp$targetKey = targetKey,
\t\t\t\t\t\t\t$temp$dict = right;
\t\t\t\t\t\ttargetKey = $temp$targetKey;
\t\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\t\tcontinue get;
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$member = F2(
\tfunction (key, dict) {
\t\tvar _v0 = A2($elm$core$Dict$get, key, dict);
\t\tif (_v0.$ === 'Just') {
\t\t\treturn true;
\t\t} else {
\t\t\treturn false;
\t\t}
\t});
var $elm$core$Set$member = F2(
\tfunction (key, _v0) {
\t\tvar dict = _v0.a;
\t\treturn A2($elm$core$Dict$member, key, dict);
\t});
var $author$project$Main$ByName = function (a) {
\treturn {$: 'ByName', a: a};
};
var $author$project$Main$ByPackage = function (a) {
\treturn {$: 'ByPackage', a: a};
};
var $author$project$Main$parseSearch = function (string) {
\tvar _v0 = A2($elm$core$String$split, '/', string);
\tif ((_v0.b && _v0.b.b) && (!_v0.b.b.b)) {
\t\tvar author = _v0.a;
\t\tvar _v1 = _v0.b;
\t\tvar _package = _v1.a;
\t\treturn $author$project$Main$ByPackage(
\t\t\t{author: author, _package: _package});
\t} else {
\t\treturn $author$project$Main$ByName(
\t\t\t{name: string});
\t}
};
var $author$project$Main$referencingHelper = F3(
\tfunction (inverted, names, acc) {
\t\treferencingHelper:
\t\twhile (true) {
\t\t\tif (!names.b) {
\t\t\t\treturn acc;
\t\t\t} else {
\t\t\t\tvar name = names.a;
\t\t\t\tvar rest = names.b;
\t\t\t\tif (A2($elm$core$Set$member, name, acc)) {
\t\t\t\t\tvar $temp$inverted = inverted,
\t\t\t\t\t\t$temp$names = rest,
\t\t\t\t\t\t$temp$acc = acc;
\t\t\t\t\tinverted = $temp$inverted;
\t\t\t\t\tnames = $temp$names;
\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\tcontinue referencingHelper;
\t\t\t\t} else {
\t\t\t\t\tvar _v1 = A2($elm$core$Dict$get, name, inverted);
\t\t\t\t\tif (_v1.$ === 'Just') {
\t\t\t\t\t\tvar set = _v1.a;
\t\t\t\t\t\tvar $temp$inverted = inverted,
\t\t\t\t\t\t\t$temp$names = _Utils_ap(
\t\t\t\t\t\t\trest,
\t\t\t\t\t\t\t$elm$core$Set$toList(set)),
\t\t\t\t\t\t\t$temp$acc = A2($elm$core$Set$insert, name, acc);
\t\t\t\t\t\tinverted = $temp$inverted;
\t\t\t\t\t\tnames = $temp$names;
\t\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\t\tcontinue referencingHelper;
\t\t\t\t\t} else {
\t\t\t\t\t\tvar $temp$inverted = inverted,
\t\t\t\t\t\t\t$temp$names = rest,
\t\t\t\t\t\t\t$temp$acc = A2($elm$core$Set$insert, name, acc);
\t\t\t\t\t\tinverted = $temp$inverted;
\t\t\t\t\t\tnames = $temp$names;
\t\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\t\tcontinue referencingHelper;
\t\t\t\t\t}
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $author$project$Main$referencing = F2(
\tfunction (inverted, name) {
\t\treturn A3(
\t\t\t$author$project$Main$referencingHelper,
\t\t\tinverted,
\t\t\t_List_fromArray(
\t\t\t\t[name]),
\t\t\t$elm$core$Set$empty);
\t});
var $elm$core$Dict$union = F2(
\tfunction (t1, t2) {
\t\treturn A3($elm$core$Dict$foldl, $elm$core$Dict$insert, t2, t1);
\t});
var $elm$core$Set$union = F2(
\tfunction (_v0, _v1) {
\t\tvar dict1 = _v0.a;
\t\tvar dict2 = _v1.a;
\t\treturn $elm$core$Set$Set_elm_builtin(
\t\t\tA2($elm$core$Dict$union, dict1, dict2));
\t});
var $author$project$Main$filterGraph = function (_v0) {
\tvar search = _v0.search;
\tvar pruned = _v0.pruned;
\tvar inverted = _v0.inverted;
\tif ($elm$core$Dict$isEmpty(pruned)) {
\t\treturn $elm$core$Result$Err('I could not find anything interesting in the stuff you pasted. Did you really paste compiled Elm JavaScript? Or did you find a bug?');
\t} else {
\t\tif ($elm$core$String$isEmpty(search)) {
\t\t\treturn $author$project$Main$checkGraphSize(pruned);
\t\t} else {
\t\t\tvar parsedSearch = $author$project$Main$parseSearch(search);
\t\t\tvar matches = A2(
\t\t\t\t$elm$core$List$filter,
\t\t\t\t$author$project$Main$matchValue(parsedSearch),
\t\t\t\t$elm$core$Dict$keys(pruned));
\t\t\tif ($elm$core$List$isEmpty(matches)) {
\t\t\t\treturn $elm$core$Result$Err('Your search query does not seem to match anything.');
\t\t\t} else {
\t\t\t\tvar valuesToKeep = A3(
\t\t\t\t\t$elm$core$List$foldl,
\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$core$Basics$composeR,
\t\t\t\t\t\t$author$project$Main$referencing(inverted),
\t\t\t\t\t\t$elm$core$Set$union),
\t\t\t\t\t$elm$core$Set$fromList(matches),
\t\t\t\t\tmatches);
\t\t\t\tif ($elm$core$Set$isEmpty(valuesToKeep)) {
\t\t\t\t\treturn $elm$core$Result$Err('I tried to find all everything to keep related to your search query, but that resulted in zero things to keep! Sounds like a bug.');
\t\t\t\t} else {
\t\t\t\t\tvar filtered = A2(
\t\t\t\t\t\t$elm$core$Dict$filter,
\t\t\t\t\t\tF2(
\t\t\t\t\t\t\tfunction (name, _v1) {
\t\t\t\t\t\t\t\treturn A2($elm$core$Set$member, name, valuesToKeep);
\t\t\t\t\t\t\t}),
\t\t\t\t\t\tpruned);
\t\t\t\t\treturn $elm$core$Dict$isEmpty(filtered) ? $elm$core$Result$Err('Filtering the graph using your search query ended up with an empty graph! But I did find matching stuff, so this sounds like a bug.') : $author$project$Main$checkGraphSize(filtered);
\t\t\t\t}
\t\t\t}
\t\t}
\t}
};
var $elm$core$Set$foldl = F3(
\tfunction (func, initialState, _v0) {
\t\tvar dict = _v0.a;
\t\treturn A3(
\t\t\t$elm$core$Dict$foldl,
\t\t\tF3(
\t\t\t\tfunction (key, _v1, state) {
\t\t\t\t\treturn A2(func, key, state);
\t\t\t\t}),
\t\t\tinitialState,
\t\t\tdict);
\t});
var $elm$core$Dict$singleton = F2(
\tfunction (key, value) {
\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);
\t});
var $elm$core$Set$singleton = function (key) {
\treturn $elm$core$Set$Set_elm_builtin(
\t\tA2($elm$core$Dict$singleton, key, _Utils_Tuple0));
};
var $elm$core$Dict$getMin = function (dict) {
\tgetMin:
\twhile (true) {
\t\tif ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
\t\t\tvar left = dict.d;
\t\t\tvar $temp$dict = left;
\t\t\tdict = $temp$dict;
\t\t\tcontinue getMin;
\t\t} else {
\t\t\treturn dict;
\t\t}
\t}
};
var $elm$core$Dict$moveRedLeft = function (dict) {
\tif (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
\t\tif ((dict.e.d.$ === 'RBNode_elm_builtin') && (dict.e.d.a.$ === 'Red')) {
\t\t\tvar clr = dict.a;
\t\t\tvar k = dict.b;
\t\t\tvar v = dict.c;
\t\t\tvar _v1 = dict.d;
\t\t\tvar lClr = _v1.a;
\t\t\tvar lK = _v1.b;
\t\t\tvar lV = _v1.c;
\t\t\tvar lLeft = _v1.d;
\t\t\tvar lRight = _v1.e;
\t\t\tvar _v2 = dict.e;
\t\t\tvar rClr = _v2.a;
\t\t\tvar rK = _v2.b;
\t\t\tvar rV = _v2.c;
\t\t\tvar rLeft = _v2.d;
\t\t\tvar _v3 = rLeft.a;
\t\t\tvar rlK = rLeft.b;
\t\t\tvar rlV = rLeft.c;
\t\t\tvar rlL = rLeft.d;
\t\t\tvar rlR = rLeft.e;
\t\t\tvar rRight = _v2.e;
\t\t\treturn A5(
\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t$elm$core$Dict$Red,
\t\t\t\trlK,
\t\t\t\trlV,
\t\t\t\tA5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),
\t\t\t\t\trlL),
\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, rK, rV, rlR, rRight));
\t\t} else {
\t\t\tvar clr = dict.a;
\t\t\tvar k = dict.b;
\t\t\tvar v = dict.c;
\t\t\tvar _v4 = dict.d;
\t\t\tvar lClr = _v4.a;
\t\t\tvar lK = _v4.b;
\t\t\tvar lV = _v4.c;
\t\t\tvar lLeft = _v4.d;
\t\t\tvar lRight = _v4.e;
\t\t\tvar _v5 = dict.e;
\t\t\tvar rClr = _v5.a;
\t\t\tvar rK = _v5.b;
\t\t\tvar rV = _v5.c;
\t\t\tvar rLeft = _v5.d;
\t\t\tvar rRight = _v5.e;
\t\t\tif (clr.$ === 'Black') {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));
\t\t\t} else {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));
\t\t\t}
\t\t}
\t} else {
\t\treturn dict;
\t}
};
var $elm$core$Dict$moveRedRight = function (dict) {
\tif (((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) && (dict.e.$ === 'RBNode_elm_builtin')) {
\t\tif ((dict.d.d.$ === 'RBNode_elm_builtin') && (dict.d.d.a.$ === 'Red')) {
\t\t\tvar clr = dict.a;
\t\t\tvar k = dict.b;
\t\t\tvar v = dict.c;
\t\t\tvar _v1 = dict.d;
\t\t\tvar lClr = _v1.a;
\t\t\tvar lK = _v1.b;
\t\t\tvar lV = _v1.c;
\t\t\tvar _v2 = _v1.d;
\t\t\tvar _v3 = _v2.a;
\t\t\tvar llK = _v2.b;
\t\t\tvar llV = _v2.c;
\t\t\tvar llLeft = _v2.d;
\t\t\tvar llRight = _v2.e;
\t\t\tvar lRight = _v1.e;
\t\t\tvar _v4 = dict.e;
\t\t\tvar rClr = _v4.a;
\t\t\tvar rK = _v4.b;
\t\t\tvar rV = _v4.c;
\t\t\tvar rLeft = _v4.d;
\t\t\tvar rRight = _v4.e;
\t\t\treturn A5(
\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t$elm$core$Dict$Red,
\t\t\t\tlK,
\t\t\t\tlV,
\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, llK, llV, llLeft, llRight),
\t\t\t\tA5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tlRight,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight)));
\t\t} else {
\t\t\tvar clr = dict.a;
\t\t\tvar k = dict.b;
\t\t\tvar v = dict.c;
\t\t\tvar _v5 = dict.d;
\t\t\tvar lClr = _v5.a;
\t\t\tvar lK = _v5.b;
\t\t\tvar lV = _v5.c;
\t\t\tvar lLeft = _v5.d;
\t\t\tvar lRight = _v5.e;
\t\t\tvar _v6 = dict.e;
\t\t\tvar rClr = _v6.a;
\t\t\tvar rK = _v6.b;
\t\t\tvar rV = _v6.c;
\t\t\tvar rLeft = _v6.d;
\t\t\tvar rRight = _v6.e;
\t\t\tif (clr.$ === 'Black') {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));
\t\t\t} else {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t$elm$core$Dict$Black,
\t\t\t\t\tk,
\t\t\t\t\tv,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, rK, rV, rLeft, rRight));
\t\t\t}
\t\t}
\t} else {
\t\treturn dict;
\t}
};
var $elm$core$Dict$removeHelpPrepEQGT = F7(
\tfunction (targetKey, dict, color, key, value, left, right) {
\t\tif ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Red')) {
\t\t\tvar _v1 = left.a;
\t\t\tvar lK = left.b;
\t\t\tvar lV = left.c;
\t\t\tvar lLeft = left.d;
\t\t\tvar lRight = left.e;
\t\t\treturn A5(
\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\tcolor,
\t\t\t\tlK,
\t\t\t\tlV,
\t\t\t\tlLeft,
\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Red, key, value, lRight, right));
\t\t} else {
\t\t\t_v2$2:
\t\t\twhile (true) {
\t\t\t\tif ((right.$ === 'RBNode_elm_builtin') && (right.a.$ === 'Black')) {
\t\t\t\t\tif (right.d.$ === 'RBNode_elm_builtin') {
\t\t\t\t\t\tif (right.d.a.$ === 'Black') {
\t\t\t\t\t\t\tvar _v3 = right.a;
\t\t\t\t\t\t\tvar _v4 = right.d;
\t\t\t\t\t\t\tvar _v5 = _v4.a;
\t\t\t\t\t\t\treturn $elm$core$Dict$moveRedRight(dict);
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\tbreak _v2$2;
\t\t\t\t\t\t}
\t\t\t\t\t} else {
\t\t\t\t\t\tvar _v6 = right.a;
\t\t\t\t\t\tvar _v7 = right.d;
\t\t\t\t\t\treturn $elm$core$Dict$moveRedRight(dict);
\t\t\t\t\t}
\t\t\t\t} else {
\t\t\t\t\tbreak _v2$2;
\t\t\t\t}
\t\t\t}
\t\t\treturn dict;
\t\t}
\t});
var $elm$core$Dict$removeMin = function (dict) {
\tif ((dict.$ === 'RBNode_elm_builtin') && (dict.d.$ === 'RBNode_elm_builtin')) {
\t\tvar color = dict.a;
\t\tvar key = dict.b;
\t\tvar value = dict.c;
\t\tvar left = dict.d;
\t\tvar lColor = left.a;
\t\tvar lLeft = left.d;
\t\tvar right = dict.e;
\t\tif (lColor.$ === 'Black') {
\t\t\tif ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
\t\t\t\tvar _v3 = lLeft.a;
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\tcolor,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\t$elm$core$Dict$removeMin(left),
\t\t\t\t\tright);
\t\t\t} else {
\t\t\t\tvar _v4 = $elm$core$Dict$moveRedLeft(dict);
\t\t\t\tif (_v4.$ === 'RBNode_elm_builtin') {
\t\t\t\t\tvar nColor = _v4.a;
\t\t\t\t\tvar nKey = _v4.b;
\t\t\t\t\tvar nValue = _v4.c;
\t\t\t\t\tvar nLeft = _v4.d;
\t\t\t\t\tvar nRight = _v4.e;
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\tnColor,
\t\t\t\t\t\tnKey,
\t\t\t\t\t\tnValue,
\t\t\t\t\t\t$elm$core$Dict$removeMin(nLeft),
\t\t\t\t\t\tnRight);
\t\t\t\t} else {
\t\t\t\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t\t\t\t}
\t\t\t}
\t\t} else {
\t\t\treturn A5(
\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\tcolor,
\t\t\t\tkey,
\t\t\t\tvalue,
\t\t\t\t$elm$core$Dict$removeMin(left),
\t\t\t\tright);
\t\t}
\t} else {
\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t}
};
var $elm$core$Dict$removeHelp = F2(
\tfunction (targetKey, dict) {
\t\tif (dict.$ === 'RBEmpty_elm_builtin') {
\t\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t\t} else {
\t\t\tvar color = dict.a;
\t\t\tvar key = dict.b;
\t\t\tvar value = dict.c;
\t\t\tvar left = dict.d;
\t\t\tvar right = dict.e;
\t\t\tif (_Utils_cmp(targetKey, key) < 0) {
\t\t\t\tif ((left.$ === 'RBNode_elm_builtin') && (left.a.$ === 'Black')) {
\t\t\t\t\tvar _v4 = left.a;
\t\t\t\t\tvar lLeft = left.d;
\t\t\t\t\tif ((lLeft.$ === 'RBNode_elm_builtin') && (lLeft.a.$ === 'Red')) {
\t\t\t\t\t\tvar _v6 = lLeft.a;
\t\t\t\t\t\treturn A5(
\t\t\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t\t\tcolor,
\t\t\t\t\t\t\tkey,
\t\t\t\t\t\t\tvalue,
\t\t\t\t\t\t\tA2($elm$core$Dict$removeHelp, targetKey, left),
\t\t\t\t\t\t\tright);
\t\t\t\t\t} else {
\t\t\t\t\t\tvar _v7 = $elm$core$Dict$moveRedLeft(dict);
\t\t\t\t\t\tif (_v7.$ === 'RBNode_elm_builtin') {
\t\t\t\t\t\t\tvar nColor = _v7.a;
\t\t\t\t\t\t\tvar nKey = _v7.b;
\t\t\t\t\t\t\tvar nValue = _v7.c;
\t\t\t\t\t\t\tvar nLeft = _v7.d;
\t\t\t\t\t\t\tvar nRight = _v7.e;
\t\t\t\t\t\t\treturn A5(
\t\t\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\t\t\tnColor,
\t\t\t\t\t\t\t\tnKey,
\t\t\t\t\t\t\t\tnValue,
\t\t\t\t\t\t\t\tA2($elm$core$Dict$removeHelp, targetKey, nLeft),
\t\t\t\t\t\t\t\tnRight);
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t\t\t\t\t\t}
\t\t\t\t\t}
\t\t\t\t} else {
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t\tcolor,
\t\t\t\t\t\tkey,
\t\t\t\t\t\tvalue,
\t\t\t\t\t\tA2($elm$core$Dict$removeHelp, targetKey, left),
\t\t\t\t\t\tright);
\t\t\t\t}
\t\t\t} else {
\t\t\t\treturn A2(
\t\t\t\t\t$elm$core$Dict$removeHelpEQGT,
\t\t\t\t\ttargetKey,
\t\t\t\t\tA7($elm$core$Dict$removeHelpPrepEQGT, targetKey, dict, color, key, value, left, right));
\t\t\t}
\t\t}
\t});
var $elm$core$Dict$removeHelpEQGT = F2(
\tfunction (targetKey, dict) {
\t\tif (dict.$ === 'RBNode_elm_builtin') {
\t\t\tvar color = dict.a;
\t\t\tvar key = dict.b;
\t\t\tvar value = dict.c;
\t\t\tvar left = dict.d;
\t\t\tvar right = dict.e;
\t\t\tif (_Utils_eq(targetKey, key)) {
\t\t\t\tvar _v1 = $elm$core$Dict$getMin(right);
\t\t\t\tif (_v1.$ === 'RBNode_elm_builtin') {
\t\t\t\t\tvar minKey = _v1.b;
\t\t\t\t\tvar minValue = _v1.c;
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\tcolor,
\t\t\t\t\t\tminKey,
\t\t\t\t\t\tminValue,
\t\t\t\t\t\tleft,
\t\t\t\t\t\t$elm$core$Dict$removeMin(right));
\t\t\t\t} else {
\t\t\t\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t\t\t\t}
\t\t\t} else {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\tcolor,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\tleft,
\t\t\t\t\tA2($elm$core$Dict$removeHelp, targetKey, right));
\t\t\t}
\t\t} else {
\t\t\treturn $elm$core$Dict$RBEmpty_elm_builtin;
\t\t}
\t});
var $elm$core$Dict$remove = F2(
\tfunction (key, dict) {
\t\tvar _v0 = A2($elm$core$Dict$removeHelp, key, dict);
\t\tif ((_v0.$ === 'RBNode_elm_builtin') && (_v0.a.$ === 'Red')) {
\t\t\tvar _v1 = _v0.a;
\t\t\tvar k = _v0.b;
\t\t\tvar v = _v0.c;
\t\t\tvar l = _v0.d;
\t\t\tvar r = _v0.e;
\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, $elm$core$Dict$Black, k, v, l, r);
\t\t} else {
\t\t\tvar x = _v0;
\t\t\treturn x;
\t\t}
\t});
var $elm$core$Dict$update = F3(
\tfunction (targetKey, alter, dictionary) {
\t\tvar _v0 = alter(
\t\t\tA2($elm$core$Dict$get, targetKey, dictionary));
\t\tif (_v0.$ === 'Just') {
\t\t\tvar value = _v0.a;
\t\t\treturn A3($elm$core$Dict$insert, targetKey, value, dictionary);
\t\t} else {
\t\t\treturn A2($elm$core$Dict$remove, targetKey, dictionary);
\t\t}
\t});
var $author$project$Main$invert = A2(
\t$elm$core$Dict$foldl,
\tF3(
\t\tfunction (name, references, acc) {
\t\t\treturn A3(
\t\t\t\t$elm$core$Set$foldl,
\t\t\t\tF2(
\t\t\t\t\tfunction (reference, acc2) {
\t\t\t\t\t\treturn A3(
\t\t\t\t\t\t\t$elm$core$Dict$update,
\t\t\t\t\t\t\treference,
\t\t\t\t\t\t\tfunction (previous) {
\t\t\t\t\t\t\t\tif (previous.$ === 'Just') {
\t\t\t\t\t\t\t\t\tvar set = previous.a;
\t\t\t\t\t\t\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\t\t\t\t\t\t\tA2($elm$core$Set$insert, name, set));
\t\t\t\t\t\t\t\t} else {
\t\t\t\t\t\t\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\t\t\t\t\t\t\t$elm$core$Set$singleton(name));
\t\t\t\t\t\t\t\t}
\t\t\t\t\t\t\t},
\t\t\t\t\t\t\tacc2);
\t\t\t\t\t}),
\t\t\t\tacc,
\t\t\t\treferences);
\t\t}),
\t$elm$core$Dict$empty);
var $elm$core$List$maybeCons = F3(
\tfunction (f, mx, xs) {
\t\tvar _v0 = f(mx);
\t\tif (_v0.$ === 'Just') {
\t\t\tvar x = _v0.a;
\t\t\treturn A2($elm$core$List$cons, x, xs);
\t\t} else {
\t\t\treturn xs;
\t\t}
\t});
var $elm$core$List$filterMap = F2(
\tfunction (f, xs) {
\t\treturn A3(
\t\t\t$elm$core$List$foldr,
\t\t\t$elm$core$List$maybeCons(f),
\t\t\t_List_Nil,
\t\t\txs);
\t});
var $elm$regex$Regex$Match = F4(
\tfunction (match, index, number, submatches) {
\t\treturn {index: index, match: match, number: number, submatches: submatches};
\t});
var $elm$regex$Regex$find = _Regex_findAtMost(_Regex_infinity);
var $elm$core$Dict$fromList = function (assocs) {
\treturn A3(
\t\t$elm$core$List$foldl,
\t\tF2(
\t\t\tfunction (_v0, dict) {
\t\t\t\tvar key = _v0.a;
\t\t\t\tvar value = _v0.b;
\t\t\t\treturn A3($elm$core$Dict$insert, key, value, dict);
\t\t\t}),
\t\t$elm$core$Dict$empty,
\t\tassocs);
};
var $elm$core$Basics$not = _Basics_not;
var $elm$regex$Regex$fromStringWith = _Regex_fromStringWith;
var $elm$regex$Regex$fromString = function (string) {
\treturn A2(
\t\t$elm$regex$Regex$fromStringWith,
\t\t{caseInsensitive: false, multiline: false},
\t\tstring);
};
var $elm$regex$Regex$never = _Regex_never;
var $elm$core$Maybe$withDefault = F2(
\tfunction (_default, maybe) {
\t\tif (maybe.$ === 'Just') {
\t\t\tvar value = maybe.a;
\t\t\treturn value;
\t\t} else {
\t\t\treturn _default;
\t\t}
\t});
var $author$project$Main$referencesRegex = A2(
\t$elm$core$Maybe$withDefault,
\t$elm$regex$Regex$never,
\t$elm$regex$Regex$fromString('([\\'"])(?:(?!\\\\1)[^\\\\\\\\\\\\n\\\\r]|\\\\\\\\(?:\\\\r\\\\n|[^]))*(\\\\1)?|\\\\/\\\\*(?:[^*]|\\\\*(?!\\\\/))*(\\\\*\\\\/)?|\\\\/\\\\/.*|\\\\w*\\\\.?\\\\$[^\\\\s!"#%&\\'()*+,\\\\-./:;<=>?@\\\\[\\\\]^`{|}~]+\\\\b(?!:)'));
var $author$project$Main$parseReferences = function (string) {
\treturn A2(
\t\t$elm$core$List$filter,
\t\tfunction (name) {
\t\t\treturn A2($elm$core$String$startsWith, '$', name) && ((!A2($elm$core$String$startsWith, '$temp$', name)) && (!A2($elm$core$String$startsWith, '$elm$', name)));
\t\t},
\t\tA2(
\t\t\t$elm$core$List$map,
\t\t\tfunction ($) {
\t\t\t\treturn $.match;
\t\t\t},
\t\t\tA2($elm$regex$Regex$find, $author$project$Main$referencesRegex, string)));
};
var $author$project$Main$valueRegex = A2(
\t$elm$core$Maybe$withDefault,
\t$elm$regex$Regex$never,
\tA2(
\t\t$elm$regex$Regex$fromStringWith,
\t\t{caseInsensitive: false, multiline: true},
\t\t'^\\\\}?(\\t?)(?:var|function) (\\\\$[^\\\\s()]+)(.*(?:\\\\r?\\\\n\\\\1\\\\t.*)*)'));
var $author$project$Main$parse = function (string) {
\treturn $elm$core$Dict$fromList(
\t\tA2(
\t\t\t$elm$core$List$filterMap,
\t\t\tfunction (match) {
\t\t\t\tvar _v0 = match.submatches;
\t\t\t\tif (((((_v0.b && _v0.b.b) && (_v0.b.a.$ === 'Just')) && _v0.b.b.b) && (_v0.b.b.a.$ === 'Just')) && (!_v0.b.b.b.b)) {
\t\t\t\t\tvar _v1 = _v0.b;
\t\t\t\t\tvar name = _v1.a.a;
\t\t\t\t\tvar _v2 = _v1.b;
\t\t\t\t\tvar body = _v2.a.a;
\t\t\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\t\t\t_Utils_Tuple2(
\t\t\t\t\t\t\tname,
\t\t\t\t\t\t\t$elm$core$Set$fromList(
\t\t\t\t\t\t\t\t$author$project$Main$parseReferences(body))));
\t\t\t\t} else {
\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\t}
\t\t\t},
\t\t\tA2($elm$regex$Regex$find, $author$project$Main$valueRegex, string)));
};
var $author$project$Main$entrypointsRegex = A2(
\t$elm$core$Maybe$withDefault,
\t$elm$regex$Regex$never,
\tA2(
\t\t$elm$regex$Regex$fromStringWith,
\t\t{caseInsensitive: false, multiline: true},
\t\t'^_Platform_export\\\\(.*(?:\\\\r?\\\\n\\\\t.*)*'));
var $elm$regex$Regex$findAtMost = _Regex_findAtMost;
var $author$project$Main$parseEntrypoints = function (string) {
\tvar _v0 = A3($elm$regex$Regex$findAtMost, 1, $author$project$Main$entrypointsRegex, string);
\tif (_v0.b && (!_v0.b.b)) {
\t\tvar match = _v0.a;
\t\treturn A2(
\t\t\t$elm$core$List$filter,
\t\t\t$elm$core$String$startsWith('$author$project$'),
\t\t\t$author$project$Main$parseReferences(match.match));
\t} else {
\t\treturn _List_Nil;
\t}
};
var $author$project$Main$pruneHelper = F3(
\tfunction (names, parsed, acc) {
\t\tpruneHelper:
\t\twhile (true) {
\t\t\tif (!names.b) {
\t\t\t\treturn acc;
\t\t\t} else {
\t\t\t\tvar name = names.a;
\t\t\t\tvar rest = names.b;
\t\t\t\tif (A2($elm$core$Dict$member, name, acc)) {
\t\t\t\t\tvar $temp$names = rest,
\t\t\t\t\t\t$temp$parsed = parsed,
\t\t\t\t\t\t$temp$acc = acc;
\t\t\t\t\tnames = $temp$names;
\t\t\t\t\tparsed = $temp$parsed;
\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\tcontinue pruneHelper;
\t\t\t\t} else {
\t\t\t\t\tvar _v1 = A2($elm$core$Dict$get, name, parsed);
\t\t\t\t\tif (_v1.$ === 'Just') {
\t\t\t\t\t\tvar references = _v1.a;
\t\t\t\t\t\tvar $temp$names = _Utils_ap(
\t\t\t\t\t\t\trest,
\t\t\t\t\t\t\t$elm$core$Set$toList(references)),
\t\t\t\t\t\t\t$temp$parsed = parsed,
\t\t\t\t\t\t\t$temp$acc = A3($elm$core$Dict$insert, name, references, acc);
\t\t\t\t\t\tnames = $temp$names;
\t\t\t\t\t\tparsed = $temp$parsed;
\t\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\t\tcontinue pruneHelper;
\t\t\t\t\t} else {
\t\t\t\t\t\treturn $elm$core$Dict$empty;
\t\t\t\t\t}
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $author$project$Main$prune = F2(
\tfunction (name, parsed) {
\t\treturn A3(
\t\t\t$author$project$Main$pruneHelper,
\t\t\t_List_fromArray(
\t\t\t\t[name]),
\t\t\tparsed,
\t\t\t$elm$core$Dict$empty);
\t});
var $elm$core$List$sortBy = _List_sortBy;
var $elm$core$List$sort = function (xs) {
\treturn A2($elm$core$List$sortBy, $elm$core$Basics$identity, xs);
};
var $author$project$Main$enterGraph = function (code) {
\tvar parsed = $author$project$Main$parse(code);
\tvar pruned = A3(
\t\t$elm$core$List$foldl,
\t\t$author$project$Main$prune,
\t\tparsed,
\t\t$author$project$Main$parseEntrypoints(code));
\tvar suggestions = $elm$core$List$sort(
\t\t$elm$core$Set$toList(
\t\t\t$elm$core$Set$fromList(
\t\t\t\tA2(
\t\t\t\t\t$elm$core$List$concatMap,
\t\t\t\t\tfunction (valueName) {
\t\t\t\t\t\tvar _v0 = $author$project$Main$parseName(valueName);
\t\t\t\t\t\tswitch (_v0.$) {
\t\t\t\t\t\t\tcase 'App':
\t\t\t\t\t\t\t\tvar name = _v0.a.name;
\t\t\t\t\t\t\t\treturn _List_fromArray(
\t\t\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t\t\tA2($elm$core$String$join, '.', name)
\t\t\t\t\t\t\t\t\t]);
\t\t\t\t\t\t\tcase 'Package':
\t\t\t\t\t\t\t\tvar author = _v0.a.author;
\t\t\t\t\t\t\t\tvar _package = _v0.a._package;
\t\t\t\t\t\t\t\tvar name = _v0.a.name;
\t\t\t\t\t\t\t\treturn _List_fromArray(
\t\t\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t\t\tauthor + ('/' + _package),
\t\t\t\t\t\t\t\t\t\tA2($elm$core$String$join, '.', name)
\t\t\t\t\t\t\t\t\t]);
\t\t\t\t\t\t\tdefault:
\t\t\t\t\t\t\t\tvar name = _v0.a;
\t\t\t\t\t\t\t\treturn _List_fromArray(
\t\t\t\t\t\t\t\t\t[name]);
\t\t\t\t\t\t}
\t\t\t\t\t},
\t\t\t\t\t$elm$core$Dict$keys(pruned)))));
\tvar inverted = $author$project$Main$invert(pruned);
\treturn $author$project$Main$Graph(
\t\t{
\t\t\tfiltered: $author$project$Main$filterGraph(
\t\t\t\t{inverted: inverted, pruned: pruned, search: ''}),
\t\t\tinverted: inverted,
\t\t\tpruned: pruned,
\t\t\tsearch: '',
\t\t\tsuggestions: suggestions
\t\t});
};
var $elm$core$Platform$Cmd$batch = _Platform_batch;
var $elm$core$Platform$Cmd$none = $elm$core$Platform$Cmd$batch(_List_Nil);
var $elm$core$List$any = F2(
\tfunction (isOkay, list) {
\t\tany:
\t\twhile (true) {
\t\t\tif (!list.b) {
\t\t\t\treturn false;
\t\t\t} else {
\t\t\t\tvar x = list.a;
\t\t\t\tvar xs = list.b;
\t\t\t\tif (isOkay(x)) {
\t\t\t\t\treturn true;
\t\t\t\t} else {
\t\t\t\t\tvar $temp$isOkay = isOkay,
\t\t\t\t\t\t$temp$list = xs;
\t\t\t\t\tisOkay = $temp$isOkay;
\t\t\t\t\tlist = $temp$list;
\t\t\t\t\tcontinue any;
\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $elm$core$List$member = F2(
\tfunction (x, xs) {
\t\treturn A2(
\t\t\t$elm$core$List$any,
\t\t\tfunction (a) {
\t\t\t\treturn _Utils_eq(a, x);
\t\t\t},
\t\t\txs);
\t});
var $elm$core$String$trim = _String_trim;
var $author$project$Main$setSearch = F2(
\tfunction (text, data) {
\t\tvar search = $elm$core$String$trim(text);
\t\treturn ($elm$core$String$isEmpty(search) || A2($elm$core$List$member, search, data.suggestions)) ? _Utils_update(
\t\t\tdata,
\t\t\t{
\t\t\t\tfiltered: $author$project$Main$filterGraph(
\t\t\t\t\t{inverted: data.inverted, pruned: data.pruned, search: search}),
\t\t\t\tsearch: search
\t\t\t}) : _Utils_update(
\t\t\tdata,
\t\t\t{search: search});
\t});
var $author$project$Main$update = F2(
\tfunction (msg, model) {
\t\tswitch (msg.$) {
\t\t\tcase 'TextareaChanged':
\t\t\t\tvar code = msg.a;
\t\t\t\treturn _Utils_Tuple2(
\t\t\t\t\t_Utils_update(
\t\t\t\t\t\tmodel,
\t\t\t\t\t\t{
\t\t\t\t\t\t\tpage: $author$project$Main$enterGraph(code)
\t\t\t\t\t\t}),
\t\t\t\t\t$elm$core$Platform$Cmd$none);
\t\t\tcase 'BackToTextareaPressed':
\t\t\t\treturn _Utils_Tuple2(
\t\t\t\t\t_Utils_update(
\t\t\t\t\t\tmodel,
\t\t\t\t\t\t{page: $author$project$Main$Textarea}),
\t\t\t\t\t$author$project$Main$focusTextarea);
\t\t\tcase 'SearchChanged':
\t\t\t\tvar text = msg.a;
\t\t\t\tvar _v1 = model.page;
\t\t\t\tif (_v1.$ === 'Textarea') {
\t\t\t\t\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);
\t\t\t\t} else {
\t\t\t\t\tvar data = _v1.a;
\t\t\t\t\treturn _Utils_Tuple2(
\t\t\t\t\t\t_Utils_update(
\t\t\t\t\t\t\tmodel,
\t\t\t\t\t\t\t{
\t\t\t\t\t\t\t\tpage: $author$project$Main$Graph(
\t\t\t\t\t\t\t\t\tA2($author$project$Main$setSearch, text, data))
\t\t\t\t\t\t\t}),
\t\t\t\t\t\t$elm$core$Platform$Cmd$none);
\t\t\t\t}
\t\t\tcase 'TextareaFocused':
\t\t\t\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);
\t\t\tcase 'InfoButtonPressed':
\t\t\t\treturn _Utils_Tuple2(
\t\t\t\t\t_Utils_update(
\t\t\t\t\t\tmodel,
\t\t\t\t\t\t{infoShown: !model.infoShown}),
\t\t\t\t\t$elm$core$Platform$Cmd$none);
\t\t\tdefault:
\t\t\t\treturn _Utils_Tuple2(
\t\t\t\t\t_Utils_update(
\t\t\t\t\t\tmodel,
\t\t\t\t\t\t{
\t\t\t\t\t\t\tpage: $author$project$Main$enterGraph($author$project$Example$code)
\t\t\t\t\t\t}),
\t\t\t\t\t$elm$core$Platform$Cmd$none);
\t\t}
\t});
var $elm$html$Html$p = _VirtualDom_node('p');
var $elm$virtual_dom$VirtualDom$text = _VirtualDom_text;
var $elm$html$Html$text = $elm$virtual_dom$VirtualDom$text;
var $elm$json$Json$Encode$string = _Json_wrap;
var $elm$html$Html$Attributes$stringProperty = F2(
\tfunction (key, string) {
\t\treturn A2(
\t\t\t_VirtualDom_property,
\t\t\tkey,
\t\t\t$elm$json$Json$Encode$string(string));
\t});
var $elm$html$Html$Attributes$class = $elm$html$Html$Attributes$stringProperty('className');
var $elm$html$Html$div = _VirtualDom_node('div');
var $elm$html$Html$a = _VirtualDom_node('a');
var $elm$html$Html$Attributes$href = function (url) {
\treturn A2(
\t\t$elm$html$Html$Attributes$stringProperty,
\t\t'href',
\t\t_VirtualDom_noJavaScriptUri(url));
};
var $author$project$Main$viewInfo = _List_fromArray(
\t[
\t\tA2(
\t\t$elm$html$Html$p,
\t\t_List_Nil,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$text('This app shows you how every function – or any value – in an Elm application depend on each other, as a graph. It lets you answer questions like “why do I depend on this package?”. Think of it as a recursive “Find usages” IDE action.')
\t\t\t])),
\t\tA2(
\t\t$elm$html$Html$p,
\t\t_List_Nil,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$text('Note: All elm/* packages are excluded because they made the graph too noisy.')
\t\t\t])),
\t\tA2(
\t\t$elm$html$Html$p,
\t\t_List_Nil,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$text('Warning: This is essentially a quick hack. I run a bunch of regex on the compiled JavaScript output. It seems to work good enough, though.')
\t\t\t])),
\t\tA2(
\t\t$elm$html$Html$p,
\t\t_List_Nil,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$text('Source code: '),
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$a,
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$Attributes$href('https://github.com/lydell/elm-value-graph')
\t\t\t\t\t]),
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$text('github.com/lydell/elm-value-graph')
\t\t\t\t\t]))
\t\t\t]))
\t]);
var $author$project$Main$viewContainer = function (_v0) {
\tvar toolbar = _v0.toolbar;
\tvar content = _v0.content;
\tvar infoShown = _v0.infoShown;
\treturn A2(
\t\t$elm$html$Html$div,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$Attributes$class('Container AbsoluteFill')
\t\t\t]),
\t\t_List_fromArray(
\t\t\t[
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$div,
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$Attributes$class('Container-toolbar')
\t\t\t\t\t]),
\t\t\t\ttoolbar),
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$div,
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$Attributes$class('Container-inner')
\t\t\t\t\t]),
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$html$Html$div,
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$class('Container-content')
\t\t\t\t\t\t\t]),
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[content])),
\t\t\t\t\t\tinfoShown ? A2(
\t\t\t\t\t\t$elm$html$Html$div,
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$class('Container-info')
\t\t\t\t\t\t\t]),
\t\t\t\t\t\t$author$project$Main$viewInfo) : $elm$html$Html$text('')
\t\t\t\t\t]))
\t\t\t]));
};
var $author$project$Main$SearchChanged = function (a) {
\treturn {$: 'SearchChanged', a: a};
};
var $elm_community$graph$Graph$DOT$TB = {$: 'TB'};
var $elm$virtual_dom$VirtualDom$attribute = F2(
\tfunction (key, value) {
\t\treturn A2(
\t\t\t_VirtualDom_attribute,
\t\t\t_VirtualDom_noOnOrFormAction(key),
\t\t\t_VirtualDom_noJavaScriptOrHtmlUri(value));
\t});
var $elm$html$Html$Attributes$attribute = $elm$virtual_dom$VirtualDom$attribute;
var $elm$virtual_dom$VirtualDom$Custom = function (a) {
\treturn {$: 'Custom', a: a};
};
var $elm$virtual_dom$VirtualDom$on = _VirtualDom_on;
var $elm$html$Html$Events$custom = F2(
\tfunction (event, decoder) {
\t\treturn A2(
\t\t\t$elm$virtual_dom$VirtualDom$on,
\t\t\tevent,
\t\t\t$elm$virtual_dom$VirtualDom$Custom(decoder));
\t});
var $elm$json$Json$Decode$field = _Json_decodeField;
var $elm_community$graph$Graph$Edge = F3(
\tfunction (from, to, label) {
\t\treturn {from: from, label: label, to: to};
\t});
var $elm_community$graph$Graph$Node = F2(
\tfunction (id, label) {
\t\treturn {id: id, label: label};
\t});
var $elm_community$graph$Graph$Graph = function (a) {
\treturn {$: 'Graph', a: a};
};
var $elm_community$graph$Graph$NodeContext = F3(
\tfunction (node, incoming, outgoing) {
\t\treturn {incoming: incoming, node: node, outgoing: outgoing};
\t});
var $elm_community$intdict$IntDict$Empty = {$: 'Empty'};
var $elm_community$intdict$IntDict$empty = $elm_community$intdict$IntDict$Empty;
var $elm_community$intdict$IntDict$Inner = function (a) {
\treturn {$: 'Inner', a: a};
};
var $elm_community$intdict$IntDict$size = function (dict) {
\tswitch (dict.$) {
\t\tcase 'Empty':
\t\t\treturn 0;
\t\tcase 'Leaf':
\t\t\treturn 1;
\t\tdefault:
\t\t\tvar i = dict.a;
\t\t\treturn i.size;
\t}
};
var $elm_community$intdict$IntDict$inner = F3(
\tfunction (p, l, r) {
\t\tvar _v0 = _Utils_Tuple2(l, r);
\t\tif (_v0.a.$ === 'Empty') {
\t\t\tvar _v1 = _v0.a;
\t\t\treturn r;
\t\t} else {
\t\t\tif (_v0.b.$ === 'Empty') {
\t\t\t\tvar _v2 = _v0.b;
\t\t\t\treturn l;
\t\t\t} else {
\t\t\t\treturn $elm_community$intdict$IntDict$Inner(
\t\t\t\t\t{
\t\t\t\t\t\tleft: l,
\t\t\t\t\t\tprefix: p,
\t\t\t\t\t\tright: r,
\t\t\t\t\t\tsize: $elm_community$intdict$IntDict$size(l) + $elm_community$intdict$IntDict$size(r)
\t\t\t\t\t});
\t\t\t}
\t\t}
\t});
var $elm$core$Bitwise$and = _Bitwise_and;
var $elm$core$Basics$neq = _Utils_notEqual;
var $elm$core$Bitwise$complement = _Bitwise_complement;
var $elm$core$Bitwise$or = _Bitwise_or;
var $elm$core$Bitwise$shiftRightZfBy = _Bitwise_shiftRightZfBy;
var $elm_community$intdict$IntDict$highestBitSet = function (n) {
\tvar shiftOr = F2(
\t\tfunction (i, shift) {
\t\t\treturn i | (i >>> shift);
\t\t});
\tvar n1 = A2(shiftOr, n, 1);
\tvar n2 = A2(shiftOr, n1, 2);
\tvar n3 = A2(shiftOr, n2, 4);
\tvar n4 = A2(shiftOr, n3, 8);
\tvar n5 = A2(shiftOr, n4, 16);
\treturn n5 & (~(n5 >>> 1));
};
var $elm$core$Basics$negate = function (n) {
\treturn -n;
};
var $elm_community$intdict$IntDict$signBit = $elm_community$intdict$IntDict$highestBitSet(-1);
var $elm$core$Bitwise$xor = _Bitwise_xor;
var $elm_community$intdict$IntDict$isBranchingBitSet = function (p) {
\treturn A2(
\t\t$elm$core$Basics$composeR,
\t\t$elm$core$Bitwise$xor($elm_community$intdict$IntDict$signBit),
\t\tA2(
\t\t\t$elm$core$Basics$composeR,
\t\t\t$elm$core$Bitwise$and(p.branchingBit),
\t\t\t$elm$core$Basics$neq(0)));
};
var $elm_community$intdict$IntDict$higherBitMask = function (branchingBit) {
\treturn branchingBit ^ (~(branchingBit - 1));
};
var $elm_community$intdict$IntDict$lcp = F2(
\tfunction (x, y) {
\t\tvar branchingBit = $elm_community$intdict$IntDict$highestBitSet(x ^ y);
\t\tvar mask = $elm_community$intdict$IntDict$higherBitMask(branchingBit);
\t\tvar prefixBits = x & mask;
\t\treturn {branchingBit: branchingBit, prefixBits: prefixBits};
\t});
var $elm_community$intdict$IntDict$Leaf = function (a) {
\treturn {$: 'Leaf', a: a};
};
var $elm_community$intdict$IntDict$leaf = F2(
\tfunction (k, v) {
\t\treturn $elm_community$intdict$IntDict$Leaf(
\t\t\t{key: k, value: v});
\t});
var $elm_community$intdict$IntDict$prefixMatches = F2(
\tfunction (p, n) {
\t\treturn _Utils_eq(
\t\t\tn & $elm_community$intdict$IntDict$higherBitMask(p.branchingBit),
\t\t\tp.prefixBits);
\t});
var $elm_community$intdict$IntDict$update = F3(
\tfunction (key, alter, dict) {
\t\tvar join = F2(
\t\t\tfunction (_v2, _v3) {
\t\t\t\tvar k1 = _v2.a;
\t\t\t\tvar l = _v2.b;
\t\t\t\tvar k2 = _v3.a;
\t\t\t\tvar r = _v3.b;
\t\t\t\tvar prefix = A2($elm_community$intdict$IntDict$lcp, k1, k2);
\t\t\t\treturn A2($elm_community$intdict$IntDict$isBranchingBitSet, prefix, k2) ? A3($elm_community$intdict$IntDict$inner, prefix, l, r) : A3($elm_community$intdict$IntDict$inner, prefix, r, l);
\t\t\t});
\t\tvar alteredNode = function (mv) {
\t\t\tvar _v1 = alter(mv);
\t\t\tif (_v1.$ === 'Just') {
\t\t\t\tvar v = _v1.a;
\t\t\t\treturn A2($elm_community$intdict$IntDict$leaf, key, v);
\t\t\t} else {
\t\t\t\treturn $elm_community$intdict$IntDict$empty;
\t\t\t}
\t\t};
\t\tswitch (dict.$) {
\t\t\tcase 'Empty':
\t\t\t\treturn alteredNode($elm$core$Maybe$Nothing);
\t\t\tcase 'Leaf':
\t\t\t\tvar l = dict.a;
\t\t\t\treturn _Utils_eq(l.key, key) ? alteredNode(
\t\t\t\t\t$elm$core$Maybe$Just(l.value)) : A2(
\t\t\t\t\tjoin,
\t\t\t\t\t_Utils_Tuple2(
\t\t\t\t\t\tkey,
\t\t\t\t\t\talteredNode($elm$core$Maybe$Nothing)),
\t\t\t\t\t_Utils_Tuple2(l.key, dict));
\t\t\tdefault:
\t\t\t\tvar i = dict.a;
\t\t\t\treturn A2($elm_community$intdict$IntDict$prefixMatches, i.prefix, key) ? (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.prefix, key) ? A3(
\t\t\t\t\t$elm_community$intdict$IntDict$inner,
\t\t\t\t\ti.prefix,
\t\t\t\t\ti.left,
\t\t\t\t\tA3($elm_community$intdict$IntDict$update, key, alter, i.right)) : A3(
\t\t\t\t\t$elm_community$intdict$IntDict$inner,
\t\t\t\t\ti.prefix,
\t\t\t\t\tA3($elm_community$intdict$IntDict$update, key, alter, i.left),
\t\t\t\t\ti.right)) : A2(
\t\t\t\t\tjoin,
\t\t\t\t\t_Utils_Tuple2(
\t\t\t\t\t\tkey,
\t\t\t\t\t\talteredNode($elm$core$Maybe$Nothing)),
\t\t\t\t\t_Utils_Tuple2(i.prefix.prefixBits, dict));
\t\t}
\t});
var $elm_community$intdict$IntDict$insert = F3(
\tfunction (key, value, dict) {
\t\treturn A3(
\t\t\t$elm_community$intdict$IntDict$update,
\t\t\tkey,
\t\t\t$elm$core$Basics$always(
\t\t\t\t$elm$core$Maybe$Just(value)),
\t\t\tdict);
\t});
var $elm$core$Maybe$map = F2(
\tfunction (f, maybe) {
\t\tif (maybe.$ === 'Just') {
\t\t\tvar value = maybe.a;
\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\tf(value));
\t\t} else {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t}
\t});
var $elm_community$intdict$IntDict$get = F2(
\tfunction (key, dict) {
\t\tget:
\t\twhile (true) {
\t\t\tswitch (dict.$) {
\t\t\t\tcase 'Empty':
\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\tcase 'Leaf':
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn _Utils_eq(l.key, key) ? $elm$core$Maybe$Just(l.value) : $elm$core$Maybe$Nothing;
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tif (!A2($elm_community$intdict$IntDict$prefixMatches, i.prefix, key)) {
\t\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\t\t} else {
\t\t\t\t\t\tif (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.prefix, key)) {
\t\t\t\t\t\t\tvar $temp$key = key,
\t\t\t\t\t\t\t\t$temp$dict = i.right;
\t\t\t\t\t\t\tkey = $temp$key;
\t\t\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\t\t\tcontinue get;
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\tvar $temp$key = key,
\t\t\t\t\t\t\t\t$temp$dict = i.left;
\t\t\t\t\t\t\tkey = $temp$key;
\t\t\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\t\t\tcontinue get;
\t\t\t\t\t\t}
\t\t\t\t\t}
\t\t\t}
\t\t}
\t});
var $elm_community$intdict$IntDict$member = F2(
\tfunction (key, dict) {
\t\tvar _v0 = A2($elm_community$intdict$IntDict$get, key, dict);
\t\tif (_v0.$ === 'Just') {
\t\t\treturn true;
\t\t} else {
\t\t\treturn false;
\t\t}
\t});
var $elm_community$graph$Graph$fromNodesAndEdges = F2(
\tfunction (nodes_, edges_) {
\t\tvar nodeRep = A3(
\t\t\t$elm$core$List$foldl,
\t\t\tfunction (n) {
\t\t\t\treturn A2(
\t\t\t\t\t$elm_community$intdict$IntDict$insert,
\t\t\t\t\tn.id,
\t\t\t\t\tA3($elm_community$graph$Graph$NodeContext, n, $elm_community$intdict$IntDict$empty, $elm_community$intdict$IntDict$empty));
\t\t\t},
\t\t\t$elm_community$intdict$IntDict$empty,
\t\t\tnodes_);
\t\tvar addEdge = F2(
\t\t\tfunction (edge, rep) {
\t\t\t\tvar updateOutgoing = function (ctx) {
\t\t\t\t\treturn _Utils_update(
\t\t\t\t\t\tctx,
\t\t\t\t\t\t{
\t\t\t\t\t\t\toutgoing: A3($elm_community$intdict$IntDict$insert, edge.to, edge.label, ctx.outgoing)
\t\t\t\t\t\t});
\t\t\t\t};
\t\t\t\tvar updateIncoming = function (ctx) {
\t\t\t\t\treturn _Utils_update(
\t\t\t\t\t\tctx,
\t\t\t\t\t\t{
\t\t\t\t\t\t\tincoming: A3($elm_community$intdict$IntDict$insert, edge.from, edge.label, ctx.incoming)
\t\t\t\t\t\t});
\t\t\t\t};
\t\t\t\treturn A3(
\t\t\t\t\t$elm_community$intdict$IntDict$update,
\t\t\t\t\tedge.to,
\t\t\t\t\t$elm$core$Maybe$map(updateIncoming),
\t\t\t\t\tA3(
\t\t\t\t\t\t$elm_community$intdict$IntDict$update,
\t\t\t\t\t\tedge.from,
\t\t\t\t\t\t$elm$core$Maybe$map(updateOutgoing),
\t\t\t\t\t\trep));
\t\t\t});
\t\tvar addEdgeIfValid = F2(
\t\t\tfunction (edge, rep) {
\t\t\t\treturn (A2($elm_community$intdict$IntDict$member, edge.from, rep) && A2($elm_community$intdict$IntDict$member, edge.to, rep)) ? A2(addEdge, edge, rep) : rep;
\t\t\t});
\t\treturn $elm_community$graph$Graph$Graph(
\t\t\tA3($elm$core$List$foldl, addEdgeIfValid, nodeRep, edges_));
\t});
var $author$project$Main$valueNameToNodeData = function (valueName) {
\tswitch (valueName.$) {
\t\tcase 'App':
\t\t\tvar name = valueName.a.name;
\t\t\treturn {
\t\t\t\tcolor: '1',
\t\t\t\tid: A2($elm$core$String$join, '.', name),
\t\t\t\tlabel: A2($elm$core$String$join, '.', name)
\t\t\t};
\t\tcase 'Package':
\t\t\tvar author = valueName.a.author;
\t\t\tvar _package = valueName.a._package;
\t\t\tvar name = valueName.a.name;
\t\t\treturn {
\t\t\t\tcolor: '2',
\t\t\t\tid: A2($elm$core$String$join, '.', name),
\t\t\t\tlabel: author + ('/' + (_package + ('\\n' + A2($elm$core$String$join, '.', name))))
\t\t\t};
\t\tdefault:
\t\t\tvar name = valueName.a;
\t\t\treturn {color: '3', id: name, label: name};
\t}
};
var $author$project$Main$makeGraph = function (values) {
\tvar valuesWithIds = A2(
\t\t$elm$core$List$indexedMap,
\t\tF2(
\t\t\tfunction (id, _v3) {
\t\t\t\tvar name = _v3.a;
\t\t\t\tvar references = _v3.b;
\t\t\t\treturn _Utils_Tuple3(id, name, references);
\t\t\t}),
\t\t$elm$core$Dict$toList(values));
\tvar nodes = A2(
\t\t$elm$core$List$map,
\t\tfunction (_v2) {
\t\t\tvar id = _v2.a;
\t\t\tvar name = _v2.b;
\t\t\treturn A2(
\t\t\t\t$elm_community$graph$Graph$Node,
\t\t\t\tid,
\t\t\t\t$author$project$Main$valueNameToNodeData(
\t\t\t\t\t$author$project$Main$parseName(name)));
\t\t},
\t\tvaluesWithIds);
\tvar ids = $elm$core$Dict$fromList(
\t\tA2(
\t\t\t$elm$core$List$map,
\t\t\tfunction (_v1) {
\t\t\t\tvar id = _v1.a;
\t\t\t\tvar name = _v1.b;
\t\t\t\treturn _Utils_Tuple2(name, id);
\t\t\t},
\t\t\tvaluesWithIds));
\tvar getId = function (name) {
\t\treturn A2($elm$core$Dict$get, name, ids);
\t};
\tvar edges = A2(
\t\t$elm$core$List$concatMap,
\t\tfunction (_v0) {
\t\t\tvar fromId = _v0.a;
\t\t\tvar references = _v0.c;
\t\t\treturn A2(
\t\t\t\t$elm$core$List$filterMap,
\t\t\t\tfunction (reference) {
\t\t\t\t\treturn A2(
\t\t\t\t\t\t$elm$core$Maybe$map,
\t\t\t\t\t\tfunction (toId) {
\t\t\t\t\t\t\treturn A3($elm_community$graph$Graph$Edge, fromId, toId, _Utils_Tuple0);
\t\t\t\t\t\t},
\t\t\t\t\t\tgetId(reference));
\t\t\t\t},
\t\t\t\t$elm$core$Set$toList(references));
\t\t},
\t\tvaluesWithIds);
\treturn A2($elm_community$graph$Graph$fromNodesAndEdges, nodes, edges);
};
var $elm$virtual_dom$VirtualDom$node = function (tag) {
\treturn _VirtualDom_node(
\t\t_VirtualDom_noScript(tag));
};
var $elm$html$Html$node = $elm$virtual_dom$VirtualDom$node;
var $elm_community$intdict$IntDict$foldl = F3(
\tfunction (f, acc, dict) {
\t\tfoldl:
\t\twhile (true) {
\t\t\tswitch (dict.$) {
\t\t\t\tcase 'Empty':
\t\t\t\t\treturn acc;
\t\t\t\tcase 'Leaf':
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn A3(f, l.key, l.value, acc);
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tvar $temp$f = f,
\t\t\t\t\t\t$temp$acc = A3($elm_community$intdict$IntDict$foldl, f, acc, i.left),
\t\t\t\t\t\t$temp$dict = i.right;
\t\t\t\t\tf = $temp$f;
\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\tcontinue foldl;
\t\t\t}
\t\t}
\t});
var $elm_community$graph$Graph$unGraph = function (graph) {
\tvar rep = graph.a;
\treturn rep;
};
var $elm_community$graph$Graph$edges = function (graph) {
\tvar flippedFoldl = F3(
\t\tfunction (f, dict, list) {
\t\t\treturn A3($elm_community$intdict$IntDict$foldl, f, list, dict);
\t\t});
\tvar prependEdges = F2(
\t\tfunction (node1, ctx) {
\t\t\treturn A2(
\t\t\t\tflippedFoldl,
\t\t\t\tF2(
\t\t\t\t\tfunction (node2, e) {
\t\t\t\t\t\treturn $elm$core$List$cons(
\t\t\t\t\t\t\t{from: node1, label: e, to: node2});
\t\t\t\t\t}),
\t\t\t\tctx.outgoing);
\t\t});
\treturn A3(
\t\tflippedFoldl,
\t\tprependEdges,
\t\t$elm_community$graph$Graph$unGraph(graph),
\t\t_List_Nil);
};
var $elm_community$intdict$IntDict$foldr = F3(
\tfunction (f, acc, dict) {
\t\tfoldr:
\t\twhile (true) {
\t\t\tswitch (dict.$) {
\t\t\t\tcase 'Empty':
\t\t\t\t\treturn acc;
\t\t\t\tcase 'Leaf':
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn A3(f, l.key, l.value, acc);
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tvar $temp$f = f,
\t\t\t\t\t\t$temp$acc = A3($elm_community$intdict$IntDict$foldr, f, acc, i.right),
\t\t\t\t\t\t$temp$dict = i.left;
\t\t\t\t\tf = $temp$f;
\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\tcontinue foldr;
\t\t\t}
\t\t}
\t});
var $elm_community$intdict$IntDict$values = function (dict) {
\treturn A3(
\t\t$elm_community$intdict$IntDict$foldr,
\t\tF3(
\t\t\tfunction (key, value, valueList) {
\t\t\t\treturn A2($elm$core$List$cons, value, valueList);
\t\t\t}),
\t\t_List_Nil,
\t\tdict);
};
var $elm_community$graph$Graph$nodes = A2(
\t$elm$core$Basics$composeR,
\t$elm_community$graph$Graph$unGraph,
\tA2(
\t\t$elm$core$Basics$composeR,
\t\t$elm_community$intdict$IntDict$values,
\t\t$elm$core$List$map(
\t\t\tfunction ($) {
\t\t\t\treturn $.node;
\t\t\t})));
var $elm$core$List$sortWith = _List_sortWith;
var $elm_community$graph$Graph$DOT$outputWithStylesAndAttributes = F4(
\tfunction (styles, nodeAttrs, edgeAttrs, graph) {
\t\tvar rankDirToString = function (r) {
\t\t\tswitch (r.$) {
\t\t\t\tcase 'TB':
\t\t\t\t\treturn 'TB';
\t\t\t\tcase 'LR':
\t\t\t\t\treturn 'LR';
\t\t\t\tcase 'BT':
\t\t\t\t\treturn 'BT';
\t\t\t\tdefault:
\t\t\t\t\treturn 'RL';
\t\t\t}
\t\t};
\t\tvar nodes = $elm_community$graph$Graph$nodes(graph);
\t\tvar encode = A2(
\t\t\t$elm$core$Basics$composeR,
\t\t\t$elm$json$Json$Encode$string,
\t\t\t$elm$json$Json$Encode$encode(0));
\t\tvar edges = function () {
\t\t\tvar compareEdge = F2(
\t\t\t\tfunction (a, b) {
\t\t\t\t\tvar _v1 = A2($elm$core$Basics$compare, a.from, b.from);
\t\t\t\t\tswitch (_v1.$) {
\t\t\t\t\t\tcase 'LT':
\t\t\t\t\t\t\treturn $elm$core$Basics$LT;
\t\t\t\t\t\tcase 'GT':
\t\t\t\t\t\t\treturn $elm$core$Basics$GT;
\t\t\t\t\t\tdefault:
\t\t\t\t\t\t\treturn A2($elm$core$Basics$compare, a.to, b.to);
\t\t\t\t\t}
\t\t\t\t});
\t\t\treturn A2(
\t\t\t\t$elm$core$List$sortWith,
\t\t\t\tcompareEdge,
\t\t\t\t$elm_community$graph$Graph$edges(graph));
\t\t}();
\t\tvar attrAssocs = A2(
\t\t\t$elm$core$Basics$composeR,
\t\t\t$elm$core$Dict$toList,
\t\t\tA2(
\t\t\t\t$elm$core$Basics$composeR,
\t\t\t\t$elm$core$List$map(
\t\t\t\t\tfunction (_v0) {
\t\t\t\t\t\tvar k = _v0.a;
\t\t\t\t\t\tvar v = _v0.b;
\t\t\t\t\t\treturn k + ('=' + encode(v));
\t\t\t\t\t}),
\t\t\t\t$elm$core$String$join(', ')));
\t\tvar makeAttrs = function (d) {
\t\t\treturn $elm$core$Dict$isEmpty(d) ? '' : (' [' + (attrAssocs(d) + ']'));
\t\t};
\t\tvar edge = function (e) {
\t\t\treturn '  ' + ($elm$core$String$fromInt(e.from) + (' -> ' + ($elm$core$String$fromInt(e.to) + makeAttrs(
\t\t\t\tedgeAttrs(e.label)))));
\t\t};
\t\tvar edgesString = A2(
\t\t\t$elm$core$String$join,
\t\t\t'\\n',
\t\t\tA2($elm$core$List$map, edge, edges));
\t\tvar node = function (n) {
\t\t\treturn '  ' + ($elm$core$String$fromInt(n.id) + makeAttrs(
\t\t\t\tnodeAttrs(n.label)));
\t\t};
\t\tvar nodesString = A2(
\t\t\t$elm$core$String$join,
\t\t\t'\\n',
\t\t\tA2($elm$core$List$map, node, nodes));
\t\treturn A2(
\t\t\t$elm$core$String$join,
\t\t\t'\\n',
\t\t\t_List_fromArray(
\t\t\t\t[
\t\t\t\t\t'digraph G {',
\t\t\t\t\t'  rankdir=' + rankDirToString(styles.rankdir),
\t\t\t\t\t'  graph [' + (styles.graph + ']'),
\t\t\t\t\t'  node [' + (styles.node + ']'),
\t\t\t\t\t'  edge [' + (styles.edge + ']'),
\t\t\t\t\t'',
\t\t\t\t\tedgesString,
\t\t\t\t\t'',
\t\t\t\t\tnodesString,
\t\t\t\t\t'}'
\t\t\t\t]));
\t});
var $elm$json$Json$Decode$string = _Json_decodeString;
var $author$project$Main$viewGraph = function (values) {
\tvar dot = A4(
\t\t$elm_community$graph$Graph$DOT$outputWithStylesAndAttributes,
\t\t{edge: '', graph: '', node: 'fontname=\\"inherit\\", shape=box, style=\\"filled\\", colorscheme=\\"pastel19\\"', rankdir: $elm_community$graph$Graph$DOT$TB},
\t\tfunction (graphNode) {
\t\t\treturn $elm$core$Dict$fromList(
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t_Utils_Tuple2('id', graphNode.id),
\t\t\t\t\t\t_Utils_Tuple2('label', graphNode.label),
\t\t\t\t\t\t_Utils_Tuple2('color', graphNode.color)
\t\t\t\t\t]));
\t\t},
\t\tfunction (_v0) {
\t\t\treturn $elm$core$Dict$empty;
\t\t},
\t\t$author$project$Main$makeGraph(values));
\treturn A3(
\t\t$elm$html$Html$node,
\t\t'graphviz-dot',
\t\t_List_fromArray(
\t\t\t[
\t\t\t\tA2($elm$html$Html$Attributes$attribute, 'dot', dot),
\t\t\t\t$elm$html$Html$Attributes$class('AbsoluteFill'),
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$Events$custom,
\t\t\t\t'NodeDoubleClicked',
\t\t\t\tA2(
\t\t\t\t\t$elm$json$Json$Decode$map,
\t\t\t\t\tfunction (nodeId) {
\t\t\t\t\t\treturn {
\t\t\t\t\t\t\tmessage: $author$project$Main$SearchChanged(nodeId),
\t\t\t\t\t\t\tpreventDefault: false,
\t\t\t\t\t\t\tstopPropagation: false
\t\t\t\t\t\t};
\t\t\t\t\t},
\t\t\t\t\tA2($elm$json$Json$Decode$field, 'detail', $elm$json$Json$Decode$string)))
\t\t\t]),
\t\t_List_Nil);
};
var $author$project$Main$BackToTextareaPressed = {$: 'BackToTextareaPressed'};
var $elm$html$Html$button = _VirtualDom_node('button');
var $elm$html$Html$datalist = _VirtualDom_node('datalist');
var $elm$html$Html$Attributes$id = $elm$html$Html$Attributes$stringProperty('id');
var $elm$html$Html$input = _VirtualDom_node('input');
var $elm$html$Html$label = _VirtualDom_node('label');
var $elm$html$Html$Attributes$list = _VirtualDom_attribute('list');
var $elm$virtual_dom$VirtualDom$Normal = function (a) {
\treturn {$: 'Normal', a: a};
};
var $elm$html$Html$Events$on = F2(
\tfunction (event, decoder) {
\t\treturn A2(
\t\t\t$elm$virtual_dom$VirtualDom$on,
\t\t\tevent,
\t\t\t$elm$virtual_dom$VirtualDom$Normal(decoder));
\t});
var $elm$html$Html$Events$onClick = function (msg) {
\treturn A2(
\t\t$elm$html$Html$Events$on,
\t\t'click',
\t\t$elm$json$Json$Decode$succeed(msg));
};
var $elm$html$Html$Events$alwaysStop = function (x) {
\treturn _Utils_Tuple2(x, true);
};
var $elm$virtual_dom$VirtualDom$MayStopPropagation = function (a) {
\treturn {$: 'MayStopPropagation', a: a};
};
var $elm$html$Html$Events$stopPropagationOn = F2(
\tfunction (event, decoder) {
\t\treturn A2(
\t\t\t$elm$virtual_dom$VirtualDom$on,
\t\t\tevent,
\t\t\t$elm$virtual_dom$VirtualDom$MayStopPropagation(decoder));
\t});
var $elm$json$Json$Decode$at = F2(
\tfunction (fields, decoder) {
\t\treturn A3($elm$core$List$foldr, $elm$json$Json$Decode$field, decoder, fields);
\t});
var $elm$html$Html$Events$targetValue = A2(
\t$elm$json$Json$Decode$at,
\t_List_fromArray(
\t\t['target', 'value']),
\t$elm$json$Json$Decode$string);
var $elm$html$Html$Events$onInput = function (tagger) {
\treturn A2(
\t\t$elm$html$Html$Events$stopPropagationOn,
\t\t'input',
\t\tA2(
\t\t\t$elm$json$Json$Decode$map,
\t\t\t$elm$html$Html$Events$alwaysStop,
\t\t\tA2($elm$json$Json$Decode$map, tagger, $elm$html$Html$Events$targetValue)));
};
var $elm$html$Html$option = _VirtualDom_node('option');
var $elm$html$Html$Attributes$placeholder = $elm$html$Html$Attributes$stringProperty('placeholder');
var $author$project$Main$searchFieldId = 'searchFieldId';
var $elm$html$Html$span = _VirtualDom_node('span');
var $elm$virtual_dom$VirtualDom$style = _VirtualDom_style;
var $elm$html$Html$Attributes$style = $elm$virtual_dom$VirtualDom$style;
var $elm$html$Html$Attributes$value = $elm$html$Html$Attributes$stringProperty('value');
var $author$project$Main$InfoButtonPressed = {$: 'InfoButtonPressed'};
var $author$project$Main$viewInfoButton = function (infoShown) {
\treturn A2(
\t\t$elm$html$Html$button,
\t\t_List_fromArray(
\t\t\t[
\t\t\t\tA2($elm$html$Html$Attributes$style, 'justify-self', 'flex-end'),
\t\t\t\t$elm$html$Html$Events$onClick($author$project$Main$InfoButtonPressed)
\t\t\t]),
\t\t_List_fromArray(
\t\t\t[
\t\t\t\t$elm$html$Html$text(
\t\t\t\tinfoShown ? 'Hide info' : 'Info')
\t\t\t]));
};
var $author$project$Main$viewToolbarTitle = $elm$html$Html$text('Why does my Elm app depend on …?');
var $author$project$Main$viewGraphToolbar = F3(
\tfunction (infoShown, search, suggestions) {
\t\treturn _List_fromArray(
\t\t\t[
\t\t\t\t$author$project$Main$viewToolbarTitle,
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$label,
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$Attributes$class('SearchField'),
\t\t\t\t\t\tA2($elm$html$Html$Attributes$style, 'flex', '1'),
\t\t\t\t\t\tA2($elm$html$Html$Attributes$style, 'max-width', '30em')
\t\t\t\t\t]),
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$html$Html$span,
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$class('SearchField-label')
\t\t\t\t\t\t\t]),
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$text('Fully.Qualified.name or author/package')
\t\t\t\t\t\t\t])),
\t\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$html$Html$input,
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$value(search),
\t\t\t\t\t\t\t\t$elm$html$Html$Events$onInput($author$project$Main$SearchChanged),
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$placeholder('For example “Html.Styled.toUnstyled” or “rtfeldman/elm-css”'),
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$list($author$project$Main$searchFieldId)
\t\t\t\t\t\t\t]),
\t\t\t\t\t\t_List_Nil),
\t\t\t\t\t\tA2(
\t\t\t\t\t\t$elm$html$Html$datalist,
\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$id($author$project$Main$searchFieldId)
\t\t\t\t\t\t\t]),
\t\t\t\t\t\tA2(
\t\t\t\t\t\t\t$elm$core$List$map,
\t\t\t\t\t\t\tfunction (suggestion) {
\t\t\t\t\t\t\t\treturn A2(
\t\t\t\t\t\t\t\t\t$elm$html$Html$option,
\t\t\t\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t\t\t\t$elm$html$Html$Attributes$value(suggestion)
\t\t\t\t\t\t\t\t\t\t]),
\t\t\t\t\t\t\t\t\t_List_Nil);
\t\t\t\t\t\t\t},
\t\t\t\t\t\t\tsuggestions))
\t\t\t\t\t])),
\t\t\t\t($elm$core$String$isEmpty(search) || A2($elm$core$List$member, search, suggestions)) ? $elm$html$Html$text('') : $elm$html$Html$text('Pick one of the alternatives in the list'),
\t\t\t\tA2(
\t\t\t\t$elm$html$Html$button,
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\tA2($elm$html$Html$Attributes$style, 'margin-left', 'auto'),
\t\t\t\t\t\t$elm$html$Html$Events$onClick($author$project$Main$BackToTextareaPressed)
\t\t\t\t\t]),
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t$elm$html$Html$text('Paste new JS')
\t\t\t\t\t])),
\t\t\t\t$author$project$Main$viewInfoButton(infoShown)
\t\t\t]);
\t});
var $author$project$Main$TextareaChanged = function (a) {
\treturn {$: 'TextareaChanged', a: a};
};
var $author$project$Main$placeholder = 'Paste compiled JavaScript from Elm here to analyze.\\n\\nFor example, the contents of elm.js in `elm make src/Main.elm --output elm.js`.\\n';
var $elm$html$Html$textarea = _VirtualDom_node('textarea');
var $author$project$Main$viewTextarea = A2(
\t$elm$html$Html$textarea,
\t_List_fromArray(
\t\t[
\t\t\t$elm$html$Html$Attributes$class('AbsoluteFill Textarea'),
\t\t\t$elm$html$Html$Attributes$placeholder($author$project$Main$placeholder),
\t\t\t$elm$html$Html$Attributes$value(''),
\t\t\t$elm$html$Html$Events$onInput($author$project$Main$TextareaChanged),
\t\t\t$elm$html$Html$Attributes$id($author$project$Main$textareaId)
\t\t]),
\t_List_Nil);
var $author$project$Main$PasteExamplePressed = {$: 'PasteExamplePressed'};
var $author$project$Main$viewTextareaToolbar = function (infoShown) {
\treturn _List_fromArray(
\t\t[
\t\t\t$author$project$Main$viewToolbarTitle,
\t\t\tA2(
\t\t\t$elm$html$Html$button,
\t\t\t_List_fromArray(
\t\t\t\t[
\t\t\t\t\t$elm$html$Html$Events$onClick($author$project$Main$PasteExamplePressed)
\t\t\t\t]),
\t\t\t_List_fromArray(
\t\t\t\t[
\t\t\t\t\t$elm$html$Html$text('Paste example')
\t\t\t\t])),
\t\t\tA2(
\t\t\t$elm$html$Html$div,
\t\t\t_List_fromArray(
\t\t\t\t[
\t\t\t\t\tA2($elm$html$Html$Attributes$style, 'margin-left', 'auto')
\t\t\t\t]),
\t\t\t_List_fromArray(
\t\t\t\t[
\t\t\t\t\t$author$project$Main$viewInfoButton(infoShown)
\t\t\t\t]))
\t\t]);
};
var $author$project$Main$view = function (model) {
\tvar _v0 = model.page;
\tif (_v0.$ === 'Textarea') {
\t\treturn $author$project$Main$viewContainer(
\t\t\t{
\t\t\t\tcontent: $author$project$Main$viewTextarea,
\t\t\t\tinfoShown: model.infoShown,
\t\t\t\ttoolbar: $author$project$Main$viewTextareaToolbar(model.infoShown)
\t\t\t});
\t} else {
\t\tvar data = _v0.a;
\t\treturn $author$project$Main$viewContainer(
\t\t\t{
\t\t\t\tcontent: function () {
\t\t\t\t\tvar _v1 = data.filtered;
\t\t\t\t\tif (_v1.$ === 'Ok') {
\t\t\t\t\t\tvar filtered = _v1.a;
\t\t\t\t\t\treturn $author$project$Main$viewGraph(filtered);
\t\t\t\t\t} else {
\t\t\t\t\t\tvar message = _v1.a;
\t\t\t\t\t\treturn A2(
\t\t\t\t\t\t\t$elm$html$Html$p,
\t\t\t\t\t\t\t_List_Nil,
\t\t\t\t\t\t\t_List_fromArray(
\t\t\t\t\t\t\t\t[
\t\t\t\t\t\t\t\t\t$elm$html$Html$text(message)
\t\t\t\t\t\t\t\t]));
\t\t\t\t\t}
\t\t\t\t}(),
\t\t\t\tinfoShown: model.infoShown,
\t\t\t\ttoolbar: A3($author$project$Main$viewGraphToolbar, model.infoShown, data.search, data.suggestions)
\t\t\t});
\t}
};
var $author$project$Main$main = $elm$browser$Browser$element(
\t{init: $author$project$Main$init, subscriptions: $author$project$Main$subscriptions, update: $author$project$Main$update, view: $author$project$Main$view});
_Platform_export({'Main':{'init':$author$project$Main$main(
\t$elm$json$Json$Decode$succeed(_Utils_Tuple0))(0)}});}(this));
"""
