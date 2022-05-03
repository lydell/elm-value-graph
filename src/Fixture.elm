module Fixture exposing (fixture)


fixture : String
fixture =
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

\t/**_UNUSED/
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

\t/**/
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

\t/**_UNUSED/
\tif (x instanceof String)
\t{
\t\tvar a = x.valueOf();
\t\tvar b = y.valueOf();
\t\treturn a === b ? 0 : a < b ? -1 : 1;
\t}
\t//*/

\t/**/
\tif (typeof x.$ === 'undefined')
\t//*/
\t/**_UNUSED/
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

var _Utils_Tuple0 = 0;
var _Utils_Tuple0_UNUSED = { $: '#0' };

function _Utils_Tuple2(a, b) { return { a: a, b: b }; }
function _Utils_Tuple2_UNUSED(a, b) { return { $: '#2', a: a, b: b }; }

function _Utils_Tuple3(a, b, c) { return { a: a, b: b, c: c }; }
function _Utils_Tuple3_UNUSED(a, b, c) { return { $: '#3', a: a, b: b, c: c }; }

function _Utils_chr(c) { return c; }
function _Utils_chr_UNUSED(c) { return new String(c); }


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



var _List_Nil = { $: 0 };
var _List_Nil_UNUSED = { $: '[]' };

function _List_Cons(hd, tl) { return { $: 1, a: hd, b: tl }; }
function _List_Cons_UNUSED(hd, tl) { return { $: '::', a: hd, b: tl }; }


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

var _Debug_log = F2(function(tag, value)
{
\treturn value;
});

var _Debug_log_UNUSED = F2(function(tag, value)
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

function _Debug_toString(value)
{
\treturn '<internals>';
}

function _Debug_toString_UNUSED(value)
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


function _Debug_crash(identifier)
{
\tthrow new Error('https://github.com/elm/core/blob/1.0.0/hints/' + identifier + '.md');
}


function _Debug_crash_UNUSED(identifier, fact1, fact2, fact3, fact4)
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
\tif (region.U.K === region.Z.K)
\t{
\t\treturn 'on line ' + region.U.K;
\t}
\treturn 'on lines ' + region.U.K + ' through ' + region.Z.K;
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



/**_UNUSED/
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

function _Json_wrap_UNUSED(value) { return { $: 0, a: value }; }
function _Json_unwrap_UNUSED(value) { return value.a; }

function _Json_wrap(value) { return value; }
function _Json_unwrap(value) { return value; }

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
\t\timpl.aH,
\t\timpl.aT,
\t\timpl.aR,
\t\tfunction() { return function() {} }
\t);
});



// INITIALIZE A PROGRAM


function _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)
{
\tvar result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args['flags'] : undefined));
\t$elm$core$Result$isOk(result) || _Debug_crash(2 /**_UNUSED/, _Json_errorToString(result.a) /**/);
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


function _Platform_export(exports)
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


function _Platform_export_UNUSED(exports)
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

\t/**/
\tvar node = args['node'];
\t//*/
\t/**_UNUSED/
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

function _VirtualDom_noJavaScriptUri(value)
{
\treturn /^javascript:/i.test(value.replace(/\\s/g,'')) ? '' : value;
}

function _VirtualDom_noJavaScriptUri_UNUSED(value)
{
\treturn /^javascript:/i.test(value.replace(/\\s/g,''))
\t\t? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
\t\t: value;
}

function _VirtualDom_noJavaScriptOrHtmlUri(value)
{
\treturn /^\\s*(javascript:|data:text\\/html)/i.test(value) ? '' : value;
}

function _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)
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
\t\tw: func(record.w),
\t\tV: record.V,
\t\tR: record.R
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
\t\tvar message = !tag ? value : tag < 3 ? value.a : value.w;
\t\tvar stopPropagation = tag == 1 ? value.b : tag == 3 && value.V;
\t\tvar currentEventNode = (
\t\t\tstopPropagation && event.stopPropagation(),
\t\t\t(tag == 2 ? value.b : tag == 3 && value.R) && event.preventDefault(),
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
\t\timpl.aH,
\t\timpl.aT,
\t\timpl.aR,
\t\tfunction(sendToApp, initialModel) {
\t\t\tvar view = impl.aU;
\t\t\t/**/
\t\t\tvar domNode = args['node'];
\t\t\t//*/
\t\t\t/**_UNUSED/
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
\t\timpl.aH,
\t\timpl.aT,
\t\timpl.aR,
\t\tfunction(sendToApp, initialModel) {
\t\t\tvar divertHrefToApp = impl.S && impl.S(sendToApp)
\t\t\tvar view = impl.aU;
\t\t\tvar title = _VirtualDom_doc.title;
\t\t\tvar bodyNode = _VirtualDom_doc.body;
\t\t\tvar currNode = _VirtualDom_virtualize(bodyNode);
\t\t\treturn _Browser_makeAnimator(initialModel, function(model)
\t\t\t{
\t\t\t\t_VirtualDom_divertHrefToApp = divertHrefToApp;
\t\t\t\tvar doc = view(model);
\t\t\t\tvar nextNode = _VirtualDom_node('body')(_List_Nil)(doc.ay);
\t\t\t\tvar patches = _VirtualDom_diff(currNode, nextNode);
\t\t\t\tbodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);
\t\t\t\tcurrNode = nextNode;
\t\t\t\t_VirtualDom_divertHrefToApp = 0;
\t\t\t\t(title !== doc.aS) && (_VirtualDom_doc.title = title = doc.aS);
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
\tvar onUrlChange = impl.aK;
\tvar onUrlRequest = impl.aL;
\tvar key = function() { key.a(onUrlChange(_Browser_getUrl())); };

\treturn _Browser_document({
\t\tS: function(sendToApp)
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
\t\t\t\t\t\t\t&& curr.al === next.al
\t\t\t\t\t\t\t&& curr.ac === next.ac
\t\t\t\t\t\t\t&& curr.ai.a === next.ai.a
\t\t\t\t\t\t)
\t\t\t\t\t\t\t? $elm$browser$Browser$Internal(next)
\t\t\t\t\t\t\t: $elm$browser$Browser$External(href)
\t\t\t\t\t));
\t\t\t\t}
\t\t\t});
\t\t},
\t\taH: function(flags)
\t\t{
\t\t\treturn A3(impl.aH, flags, _Browser_getUrl(), key);
\t\t},
\t\taU: impl.aU,
\t\taT: impl.aT,
\t\taR: impl.aR
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
\t\t? { aF: 'hidden', az: 'visibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.mozHidden !== 'undefined')
\t\t? { aF: 'mozHidden', az: 'mozvisibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.msHidden !== 'undefined')
\t\t? { aF: 'msHidden', az: 'msvisibilitychange' }
\t\t:
\t(typeof _VirtualDom_doc.webkitHidden !== 'undefined')
\t\t? { aF: 'webkitHidden', az: 'webkitvisibilitychange' }
\t\t: { aF: 'hidden', az: 'visibilitychange' };
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
\t\tap: _Browser_getScene(),
\t\tas: {
\t\t\tau: _Browser_window.pageXOffset,
\t\t\tav: _Browser_window.pageYOffset,
\t\t\tat: _Browser_doc.documentElement.clientWidth,
\t\t\tab: _Browser_doc.documentElement.clientHeight
\t\t}
\t};
}

function _Browser_getScene()
{
\tvar body = _Browser_doc.body;
\tvar elem = _Browser_doc.documentElement;
\treturn {
\t\tat: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),
\t\tab: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)
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
\t\t\tap: {
\t\t\t\tat: node.scrollWidth,
\t\t\t\tab: node.scrollHeight
\t\t\t},
\t\t\tas: {
\t\t\t\tau: node.scrollLeft,
\t\t\t\tav: node.scrollTop,
\t\t\t\tat: node.clientWidth,
\t\t\t\tab: node.clientHeight
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
\t\t\tap: _Browser_getScene(),
\t\t\tas: {
\t\t\t\tau: x,
\t\t\t\tav: y,
\t\t\t\tat: _Browser_doc.documentElement.clientWidth,
\t\t\t\tab: _Browser_doc.documentElement.clientHeight
\t\t\t},
\t\t\taC: {
\t\t\t\tau: x + rect.left,
\t\t\t\tav: y + rect.top,
\t\t\t\tat: rect.width,
\t\t\t\tab: rect.height
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
var $elm$core$Basics$EQ = 1;
var $elm$core$Basics$GT = 2;
var $elm$core$Basics$LT = 0;
var $elm$core$List$cons = _List_cons;
var $elm$core$Dict$foldr = F3(
\tfunction (func, acc, t) {
\t\tfoldr:
\t\twhile (true) {
\t\t\tif (t.$ === -2) {
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
\tvar dict = _v0;
\treturn $elm$core$Dict$keys(dict);
};
var $elm$core$Elm$JsArray$foldr = _JsArray_foldr;
var $elm$core$Array$foldr = F3(
\tfunction (func, baseCase, _v0) {
\t\tvar tree = _v0.c;
\t\tvar tail = _v0.d;
\t\tvar helper = F2(
\t\t\tfunction (node, acc) {
\t\t\t\tif (!node.$) {
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
\treturn {$: 1, a: a};
};
var $elm$json$Json$Decode$Failure = F2(
\tfunction (a, b) {
\t\treturn {$: 3, a: a, b: b};
\t});
var $elm$json$Json$Decode$Field = F2(
\tfunction (a, b) {
\t\treturn {$: 0, a: a, b: b};
\t});
var $elm$json$Json$Decode$Index = F2(
\tfunction (a, b) {
\t\treturn {$: 1, a: a, b: b};
\t});
var $elm$core$Result$Ok = function (a) {
\treturn {$: 0, a: a};
};
var $elm$json$Json$Decode$OneOf = function (a) {
\treturn {$: 2, a: a};
};
var $elm$core$Basics$False = 1;
var $elm$core$Basics$add = _Basics_add;
var $elm$core$Maybe$Just = function (a) {
\treturn {$: 0, a: a};
};
var $elm$core$Maybe$Nothing = {$: 1};
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
\t\t\t\tcase 0:
\t\t\t\t\tvar f = error.a;
\t\t\t\t\tvar err = error.b;
\t\t\t\t\tvar isSimple = function () {
\t\t\t\t\t\tvar _v1 = $elm$core$String$uncons(f);
\t\t\t\t\t\tif (_v1.$ === 1) {
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
\t\t\t\tcase 1:
\t\t\t\t\tvar i = error.a;
\t\t\t\t\tvar err = error.b;
\t\t\t\t\tvar indexName = '[' + ($elm$core$String$fromInt(i) + ']');
\t\t\t\t\tvar $temp$error = err,
\t\t\t\t\t\t$temp$context = A2($elm$core$List$cons, indexName, context);
\t\t\t\t\terror = $temp$error;
\t\t\t\t\tcontext = $temp$context;
\t\t\t\t\tcontinue errorToStringHelp;
\t\t\t\tcase 2:
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
\t\treturn {$: 0, a: a, b: b, c: c, d: d};
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
\treturn {$: 1, a: a};
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
\treturn {$: 0, a: a};
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
\t\tif (!builder.f) {
\t\t\treturn A4(
\t\t\t\t$elm$core$Array$Array_elm_builtin,
\t\t\t\t$elm$core$Elm$JsArray$length(builder.h),
\t\t\t\t$elm$core$Array$shiftStep,
\t\t\t\t$elm$core$Elm$JsArray$empty,
\t\t\t\tbuilder.h);
\t\t} else {
\t\t\tvar treeLen = builder.f * $elm$core$Array$branchFactor;
\t\t\tvar depth = $elm$core$Basics$floor(
\t\t\t\tA2($elm$core$Basics$logBase, $elm$core$Array$branchFactor, treeLen - 1));
\t\t\tvar correctNodeList = reverseNodeList ? $elm$core$List$reverse(builder.i) : builder.i;
\t\t\tvar tree = A2($elm$core$Array$treeFromBuilder, correctNodeList, builder.f);
\t\t\treturn A4(
\t\t\t\t$elm$core$Array$Array_elm_builtin,
\t\t\t\t$elm$core$Elm$JsArray$length(builder.h) + treeLen,
\t\t\t\tA2($elm$core$Basics$max, 5, depth * $elm$core$Array$shiftStep),
\t\t\t\ttree,
\t\t\t\tbuilder.h);
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
\t\t\t\t\t{i: nodeList, f: (len / $elm$core$Array$branchFactor) | 0, h: tail});
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
var $elm$core$Basics$True = 0;
var $elm$core$Result$isOk = function (result) {
\tif (!result.$) {
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
\t\tcase 0:
\t\t\treturn 0;
\t\tcase 1:
\t\t\treturn 1;
\t\tcase 2:
\t\t\treturn 2;
\t\tdefault:
\t\t\treturn 3;
\t}
};
var $elm$browser$Browser$External = function (a) {
\treturn {$: 1, a: a};
};
var $elm$browser$Browser$Internal = function (a) {
\treturn {$: 0, a: a};
};
var $elm$core$Basics$identity = function (x) {
\treturn x;
};
var $elm$browser$Browser$Dom$NotFound = $elm$core$Basics$identity;
var $elm$url$Url$Http = 0;
var $elm$url$Url$Https = 1;
var $elm$url$Url$Url = F6(
\tfunction (protocol, host, port_, path, query, fragment) {
\t\treturn {aa: fragment, ac: host, ag: path, ai: port_, al: protocol, am: query};
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
\t\t\t\t\tif (_v1.$ === 1) {
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
\t\t0,
\t\tA2($elm$core$String$dropLeft, 7, str)) : (A2($elm$core$String$startsWith, 'https://', str) ? A2(
\t\t$elm$url$Url$chompAfterProtocol,
\t\t1,
\t\tA2($elm$core$String$dropLeft, 8, str)) : $elm$core$Maybe$Nothing);
};
var $elm$core$Basics$never = function (_v0) {
\tnever:
\twhile (true) {
\t\tvar nvr = _v0;
\t\tvar $temp$_v0 = nvr;
\t\t_v0 = $temp$_v0;
\t\tcontinue never;
\t}
};
var $elm$core$Task$Perform = $elm$core$Basics$identity;
var $elm$core$Task$succeed = _Scheduler_succeed;
var $elm$core$Task$init = $elm$core$Task$succeed(0);
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
\t\tvar task = _v0;
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
\t\t\t\treturn 0;
\t\t\t},
\t\t\t$elm$core$Task$sequence(
\t\t\t\tA2(
\t\t\t\t\t$elm$core$List$map,
\t\t\t\t\t$elm$core$Task$spawnCmd(router),
\t\t\t\t\tcommands)));
\t});
var $elm$core$Task$onSelfMsg = F3(
\tfunction (_v0, _v1, _v2) {
\t\treturn $elm$core$Task$succeed(0);
\t});
var $elm$core$Task$cmdMap = F2(
\tfunction (tagger, _v0) {
\t\tvar task = _v0;
\t\treturn A2($elm$core$Task$map, tagger, task);
\t});
_Platform_effectManagers['Task'] = _Platform_createManager($elm$core$Task$init, $elm$core$Task$onEffects, $elm$core$Task$onSelfMsg, $elm$core$Task$cmdMap);
var $elm$core$Task$command = _Platform_leaf('Task');
var $elm$core$Task$perform = F2(
\tfunction (toMessage, task) {
\t\treturn $elm$core$Task$command(
\t\t\tA2($elm$core$Task$map, toMessage, task));
\t});
var $elm$browser$Browser$element = _Browser_element;
var $author$project$Main$Model = F2(
\tfunction (property, property2) {
\t\treturn {aN: property, aO: property2};
\t});
var $elm$core$Platform$Cmd$batch = _Platform_batch;
var $elm$core$Platform$Cmd$none = $elm$core$Platform$Cmd$batch(_List_Nil);
var $author$project$Main$init = function (flags) {
\treturn _Utils_Tuple2(
\t\tA2($author$project$Main$Model, 0, 'modelInitialValue2'),
\t\t$elm$core$Platform$Cmd$none);
};
var $elm$core$Platform$Sub$batch = _Platform_batch;
var $elm$core$Platform$Sub$none = $elm$core$Platform$Sub$batch(_List_Nil);
var $author$project$Main$subscriptions = function (model) {
\treturn $elm$core$Platform$Sub$none;
};
var $author$project$Main$update = F2(
\tfunction (msg, model) {
\t\tif (!msg) {
\t\t\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);
\t\t} else {
\t\t\treturn _Utils_Tuple2(model, $elm$core$Platform$Cmd$none);
\t\t}
\t});
var $elm_community$graph$Graph$DOT$TB = 0;
var $elm$virtual_dom$VirtualDom$attribute = F2(
\tfunction (key, value) {
\t\treturn A2(
\t\t\t_VirtualDom_attribute,
\t\t\t_VirtualDom_noOnOrFormAction(key),
\t\t\t_VirtualDom_noJavaScriptOrHtmlUri(value));
\t});
var $elm$html$Html$Attributes$attribute = $elm$virtual_dom$VirtualDom$attribute;
var $elm_community$graph$Graph$Edge = F3(
\tfunction (from, to, label) {
\t\treturn {F: from, s: label, H: to};
\t});
var $elm_community$graph$Graph$Node = F2(
\tfunction (id, label) {
\t\treturn {n: id, s: label};
\t});
var $elm_community$graph$Graph$Graph = $elm$core$Basics$identity;
var $elm_community$graph$Graph$NodeContext = F3(
\tfunction (node, incoming, outgoing) {
\t\treturn {e: incoming, aJ: node, d: outgoing};
\t});
var $elm_community$intdict$IntDict$Empty = {$: 0};
var $elm_community$intdict$IntDict$empty = $elm_community$intdict$IntDict$Empty;
var $elm$core$Basics$always = F2(
\tfunction (a, _v0) {
\t\treturn a;
\t});
var $elm_community$intdict$IntDict$Inner = function (a) {
\treturn {$: 2, a: a};
};
var $elm_community$intdict$IntDict$size = function (dict) {
\tswitch (dict.$) {
\t\tcase 0:
\t\t\treturn 0;
\t\tcase 1:
\t\t\treturn 1;
\t\tdefault:
\t\t\tvar i = dict.a;
\t\t\treturn i.T;
\t}
};
var $elm_community$intdict$IntDict$inner = F3(
\tfunction (p, l, r) {
\t\tvar _v0 = _Utils_Tuple2(l, r);
\t\tif (!_v0.a.$) {
\t\t\tvar _v1 = _v0.a;
\t\t\treturn r;
\t\t} else {
\t\t\tif (!_v0.b.$) {
\t\t\t\tvar _v2 = _v0.b;
\t\t\t\treturn l;
\t\t\t} else {
\t\t\t\treturn $elm_community$intdict$IntDict$Inner(
\t\t\t\t\t{
\t\t\t\t\t\ta: l,
\t\t\t\t\t\tc: p,
\t\t\t\t\t\tb: r,
\t\t\t\t\t\tT: $elm_community$intdict$IntDict$size(l) + $elm_community$intdict$IntDict$size(r)
\t\t\t\t\t});
\t\t\t}
\t\t}
\t});
var $elm$core$Bitwise$and = _Bitwise_and;
var $elm$core$Basics$composeR = F3(
\tfunction (f, g, x) {
\t\treturn g(
\t\t\tf(x));
\t});
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
\t\t\t$elm$core$Bitwise$and(p.D),
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
\t\treturn {D: branchingBit, r: prefixBits};
\t});
var $elm_community$intdict$IntDict$Leaf = function (a) {
\treturn {$: 1, a: a};
};
var $elm_community$intdict$IntDict$leaf = F2(
\tfunction (k, v) {
\t\treturn $elm_community$intdict$IntDict$Leaf(
\t\t\t{ad: k, u: v});
\t});
var $elm_community$intdict$IntDict$prefixMatches = F2(
\tfunction (p, n) {
\t\treturn _Utils_eq(
\t\t\tn & $elm_community$intdict$IntDict$higherBitMask(p.D),
\t\t\tp.r);
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
\t\t\tif (!_v1.$) {
\t\t\t\tvar v = _v1.a;
\t\t\t\treturn A2($elm_community$intdict$IntDict$leaf, key, v);
\t\t\t} else {
\t\t\t\treturn $elm_community$intdict$IntDict$empty;
\t\t\t}
\t\t};
\t\tswitch (dict.$) {
\t\t\tcase 0:
\t\t\t\treturn alteredNode($elm$core$Maybe$Nothing);
\t\t\tcase 1:
\t\t\t\tvar l = dict.a;
\t\t\t\treturn _Utils_eq(l.ad, key) ? alteredNode(
\t\t\t\t\t$elm$core$Maybe$Just(l.u)) : A2(
\t\t\t\t\tjoin,
\t\t\t\t\t_Utils_Tuple2(
\t\t\t\t\t\tkey,
\t\t\t\t\t\talteredNode($elm$core$Maybe$Nothing)),
\t\t\t\t\t_Utils_Tuple2(l.ad, dict));
\t\t\tdefault:
\t\t\t\tvar i = dict.a;
\t\t\t\treturn A2($elm_community$intdict$IntDict$prefixMatches, i.c, key) ? (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.c, key) ? A3(
\t\t\t\t\t$elm_community$intdict$IntDict$inner,
\t\t\t\t\ti.c,
\t\t\t\t\ti.a,
\t\t\t\t\tA3($elm_community$intdict$IntDict$update, key, alter, i.b)) : A3(
\t\t\t\t\t$elm_community$intdict$IntDict$inner,
\t\t\t\t\ti.c,
\t\t\t\t\tA3($elm_community$intdict$IntDict$update, key, alter, i.a),
\t\t\t\t\ti.b)) : A2(
\t\t\t\t\tjoin,
\t\t\t\t\t_Utils_Tuple2(
\t\t\t\t\t\tkey,
\t\t\t\t\t\talteredNode($elm$core$Maybe$Nothing)),
\t\t\t\t\t_Utils_Tuple2(i.c.r, dict));
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
\t\tif (!maybe.$) {
\t\t\tvar value = maybe.a;
\t\t\treturn $elm$core$Maybe$Just(
\t\t\t\tf(value));
\t\t} else {
\t\t\treturn $elm$core$Maybe$Nothing;
\t\t}
\t});
var $elm$core$Basics$not = _Basics_not;
var $elm_community$intdict$IntDict$get = F2(
\tfunction (key, dict) {
\t\tget:
\t\twhile (true) {
\t\t\tswitch (dict.$) {
\t\t\t\tcase 0:
\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\tcase 1:
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn _Utils_eq(l.ad, key) ? $elm$core$Maybe$Just(l.u) : $elm$core$Maybe$Nothing;
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tif (!A2($elm_community$intdict$IntDict$prefixMatches, i.c, key)) {
\t\t\t\t\t\treturn $elm$core$Maybe$Nothing;
\t\t\t\t\t} else {
\t\t\t\t\t\tif (A2($elm_community$intdict$IntDict$isBranchingBitSet, i.c, key)) {
\t\t\t\t\t\t\tvar $temp$key = key,
\t\t\t\t\t\t\t\t$temp$dict = i.b;
\t\t\t\t\t\t\tkey = $temp$key;
\t\t\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\t\t\tcontinue get;
\t\t\t\t\t\t} else {
\t\t\t\t\t\t\tvar $temp$key = key,
\t\t\t\t\t\t\t\t$temp$dict = i.a;
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
\t\tif (!_v0.$) {
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
\t\t\t\t\tn.n,
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
\t\t\t\t\t\t\td: A3($elm_community$intdict$IntDict$insert, edge.H, edge.s, ctx.d)
\t\t\t\t\t\t});
\t\t\t\t};
\t\t\t\tvar updateIncoming = function (ctx) {
\t\t\t\t\treturn _Utils_update(
\t\t\t\t\t\tctx,
\t\t\t\t\t\t{
\t\t\t\t\t\t\te: A3($elm_community$intdict$IntDict$insert, edge.F, edge.s, ctx.e)
\t\t\t\t\t\t});
\t\t\t\t};
\t\t\t\treturn A3(
\t\t\t\t\t$elm_community$intdict$IntDict$update,
\t\t\t\t\tedge.H,
\t\t\t\t\t$elm$core$Maybe$map(updateIncoming),
\t\t\t\t\tA3(
\t\t\t\t\t\t$elm_community$intdict$IntDict$update,
\t\t\t\t\t\tedge.F,
\t\t\t\t\t\t$elm$core$Maybe$map(updateOutgoing),
\t\t\t\t\t\trep));
\t\t\t});
\t\tvar addEdgeIfValid = F2(
\t\t\tfunction (edge, rep) {
\t\t\t\treturn (A2($elm_community$intdict$IntDict$member, edge.F, rep) && A2($elm_community$intdict$IntDict$member, edge.H, rep)) ? A2(addEdge, edge, rep) : rep;
\t\t\t});
\t\treturn A3($elm$core$List$foldl, addEdgeIfValid, nodeRep, edges_);
\t});
var $author$project$Main$dressUp = function () {
\tvar nodes = _List_fromArray(
\t\t[
\t\t\tA2($elm_community$graph$Graph$Node, 0, 'Socks'),
\t\t\tA2($elm_community$graph$Graph$Node, 1, 'Undershirt'),
\t\t\tA2($elm_community$graph$Graph$Node, 2, 'Pants'),
\t\t\tA2($elm_community$graph$Graph$Node, 3, 'Shoes'),
\t\t\tA2($elm_community$graph$Graph$Node, 4, 'Watch'),
\t\t\tA2($elm_community$graph$Graph$Node, 5, 'Shirt'),
\t\t\tA2($elm_community$graph$Graph$Node, 6, 'Belt'),
\t\t\tA2($elm_community$graph$Graph$Node, 7, 'Tie'),
\t\t\tA2($elm_community$graph$Graph$Node, 8, 'Jacket')
\t\t]);
\tvar e = F2(
\t\tfunction (from, to) {
\t\t\treturn A3($elm_community$graph$Graph$Edge, from, to, 0);
\t\t});
\tvar edges = _List_fromArray(
\t\t[
\t\t\tA2(e, 0, 3),
\t\t\tA2(e, 1, 2),
\t\t\tA2(e, 1, 3),
\t\t\tA2(e, 2, 3),
\t\t\tA2(e, 2, 6),
\t\t\tA2(e, 5, 6),
\t\t\tA2(e, 5, 7),
\t\t\tA2(e, 6, 8),
\t\t\tA2(e, 7, 8)
\t\t]);
\treturn A2($elm_community$graph$Graph$fromNodesAndEdges, nodes, edges);
}();
var $elm$core$Dict$RBEmpty_elm_builtin = {$: -2};
var $elm$core$Dict$empty = $elm$core$Dict$RBEmpty_elm_builtin;
var $elm$core$Dict$Black = 1;
var $elm$core$Dict$RBNode_elm_builtin = F5(
\tfunction (a, b, c, d, e) {
\t\treturn {$: -1, a: a, b: b, c: c, d: d, e: e};
\t});
var $elm$core$Dict$Red = 0;
var $elm$core$Dict$balance = F5(
\tfunction (color, key, value, left, right) {
\t\tif ((right.$ === -1) && (!right.a)) {
\t\t\tvar _v1 = right.a;
\t\t\tvar rK = right.b;
\t\t\tvar rV = right.c;
\t\t\tvar rLeft = right.d;
\t\t\tvar rRight = right.e;
\t\t\tif ((left.$ === -1) && (!left.a)) {
\t\t\t\tvar _v3 = left.a;
\t\t\t\tvar lK = left.b;
\t\t\t\tvar lV = left.c;
\t\t\t\tvar lLeft = left.d;
\t\t\t\tvar lRight = left.e;
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\t0,
\t\t\t\t\tkey,
\t\t\t\t\tvalue,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, 1, lK, lV, lLeft, lRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, 1, rK, rV, rLeft, rRight));
\t\t\t} else {
\t\t\t\treturn A5(
\t\t\t\t\t$elm$core$Dict$RBNode_elm_builtin,
\t\t\t\t\tcolor,
\t\t\t\t\trK,
\t\t\t\t\trV,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, 0, key, value, left, rLeft),
\t\t\t\t\trRight);
\t\t\t}
\t\t} else {
\t\t\tif ((((left.$ === -1) && (!left.a)) && (left.d.$ === -1)) && (!left.d.a)) {
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
\t\t\t\t\t0,
\t\t\t\t\tlK,
\t\t\t\t\tlV,
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, 1, llK, llV, llLeft, llRight),
\t\t\t\t\tA5($elm$core$Dict$RBNode_elm_builtin, 1, key, value, lRight, right));
\t\t\t} else {
\t\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);
\t\t\t}
\t\t}
\t});
var $elm$core$Basics$compare = _Utils_compare;
var $elm$core$Dict$insertHelp = F3(
\tfunction (key, value, dict) {
\t\tif (dict.$ === -2) {
\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, 0, key, value, $elm$core$Dict$RBEmpty_elm_builtin, $elm$core$Dict$RBEmpty_elm_builtin);
\t\t} else {
\t\t\tvar nColor = dict.a;
\t\t\tvar nKey = dict.b;
\t\t\tvar nValue = dict.c;
\t\t\tvar nLeft = dict.d;
\t\t\tvar nRight = dict.e;
\t\t\tvar _v1 = A2($elm$core$Basics$compare, key, nKey);
\t\t\tswitch (_v1) {
\t\t\t\tcase 0:
\t\t\t\t\treturn A5(
\t\t\t\t\t\t$elm$core$Dict$balance,
\t\t\t\t\t\tnColor,
\t\t\t\t\t\tnKey,
\t\t\t\t\t\tnValue,
\t\t\t\t\t\tA3($elm$core$Dict$insertHelp, key, value, nLeft),
\t\t\t\t\t\tnRight);
\t\t\t\tcase 1:
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
\t\tif ((_v0.$ === -1) && (!_v0.a)) {
\t\t\tvar _v1 = _v0.a;
\t\t\tvar k = _v0.b;
\t\t\tvar v = _v0.c;
\t\t\tvar l = _v0.d;
\t\t\tvar r = _v0.e;
\t\t\treturn A5($elm$core$Dict$RBNode_elm_builtin, 1, k, v, l, r);
\t\t} else {
\t\t\tvar x = _v0;
\t\t\treturn x;
\t\t}
\t});
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
\t\t\t\tcase 0:
\t\t\t\t\treturn acc;
\t\t\t\tcase 1:
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn A3(f, l.ad, l.u, acc);
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tvar $temp$f = f,
\t\t\t\t\t\t$temp$acc = A3($elm_community$intdict$IntDict$foldl, f, acc, i.a),
\t\t\t\t\t\t$temp$dict = i.b;
\t\t\t\t\tf = $temp$f;
\t\t\t\t\tacc = $temp$acc;
\t\t\t\t\tdict = $temp$dict;
\t\t\t\t\tcontinue foldl;
\t\t\t}
\t\t}
\t});
var $elm_community$graph$Graph$unGraph = function (graph) {
\tvar rep = graph;
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
\t\t\t\t\t\t\t{F: node1, s: e, H: node2});
\t\t\t\t\t}),
\t\t\t\tctx.d);
\t\t});
\treturn A3(
\t\tflippedFoldl,
\t\tprependEdges,
\t\t$elm_community$graph$Graph$unGraph(graph),
\t\t_List_Nil);
};
var $elm$core$Dict$isEmpty = function (dict) {
\tif (dict.$ === -2) {
\t\treturn true;
\t} else {
\t\treturn false;
\t}
};
var $elm_community$intdict$IntDict$foldr = F3(
\tfunction (f, acc, dict) {
\t\tfoldr:
\t\twhile (true) {
\t\t\tswitch (dict.$) {
\t\t\t\tcase 0:
\t\t\t\t\treturn acc;
\t\t\t\tcase 1:
\t\t\t\t\tvar l = dict.a;
\t\t\t\t\treturn A3(f, l.ad, l.u, acc);
\t\t\t\tdefault:
\t\t\t\t\tvar i = dict.a;
\t\t\t\t\tvar $temp$f = f,
\t\t\t\t\t\t$temp$acc = A3($elm_community$intdict$IntDict$foldr, f, acc, i.b),
\t\t\t\t\t\t$temp$dict = i.a;
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
\t\t\t\treturn $.aJ;
\t\t\t})));
var $elm$core$List$sortWith = _List_sortWith;
var $elm$json$Json$Encode$string = _Json_wrap;
var $elm_community$graph$Graph$DOT$outputWithStylesAndAttributes = F4(
\tfunction (styles, nodeAttrs, edgeAttrs, graph) {
\t\tvar rankDirToString = function (r) {
\t\t\tswitch (r) {
\t\t\t\tcase 0:
\t\t\t\t\treturn 'TB';
\t\t\t\tcase 1:
\t\t\t\t\treturn 'LR';
\t\t\t\tcase 2:
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
\t\t\t\t\tvar _v1 = A2($elm$core$Basics$compare, a.F, b.F);
\t\t\t\t\tswitch (_v1) {
\t\t\t\t\t\tcase 0:
\t\t\t\t\t\t\treturn 0;
\t\t\t\t\t\tcase 2:
\t\t\t\t\t\t\treturn 2;
\t\t\t\t\t\tdefault:
\t\t\t\t\t\t\treturn A2($elm$core$Basics$compare, a.H, b.H);
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
\t\t\treturn '  ' + ($elm$core$String$fromInt(e.F) + (' -> ' + ($elm$core$String$fromInt(e.H) + makeAttrs(
\t\t\t\tedgeAttrs(e.s)))));
\t\t};
\t\tvar edgesString = A2(
\t\t\t$elm$core$String$join,
\t\t\t'\\n',
\t\t\tA2($elm$core$List$map, edge, edges));
\t\tvar node = function (n) {
\t\t\treturn '  ' + ($elm$core$String$fromInt(n.n) + makeAttrs(
\t\t\t\tnodeAttrs(n.s)));
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
\t\t\t\t\t'  rankdir=' + rankDirToString(styles.aP),
\t\t\t\t\t'  graph [' + (styles.aE + ']'),
\t\t\t\t\t'  node [' + (styles.aJ + ']'),
\t\t\t\t\t'  edge [' + (styles.aB + ']'),
\t\t\t\t\t'',
\t\t\t\t\tedgesString,
\t\t\t\t\t'',
\t\t\t\t\tnodesString,
\t\t\t\t\t'}'
\t\t\t\t]));
\t});
var $elm$virtual_dom$VirtualDom$style = _VirtualDom_style;
var $elm$html$Html$Attributes$style = $elm$virtual_dom$VirtualDom$style;
var $author$project$Main$view = function (model) {
\tvar dot = A4(
\t\t$elm_community$graph$Graph$DOT$outputWithStylesAndAttributes,
\t\t{aB: 'fontname=\\"helvetica\\"', aE: '', aJ: 'fontname=\\"helvetica\\", shape=box, style=\\"filled\\", colorscheme=\\"pastel19\\"', aP: 0},
\t\tfunction (graphNode) {
\t\t\treturn $elm$core$Dict$fromList(
\t\t\t\t_List_fromArray(
\t\t\t\t\t[
\t\t\t\t\t\t_Utils_Tuple2('label', graphNode),
\t\t\t\t\t\t_Utils_Tuple2('color', '1')
\t\t\t\t\t]));
\t\t},
\t\tfunction (edge) {
\t\t\treturn $elm$core$Dict$fromList(_List_Nil);
\t\t},
\t\t$author$project$Main$dressUp);
\treturn A3(
\t\t$elm$html$Html$node,
\t\t'graphviz-dot',
\t\t_List_fromArray(
\t\t\t[
\t\t\t\tA2($elm$html$Html$Attributes$attribute, 'dot', dot),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'position', 'absolute'),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'top', '0'),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'left', '0'),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'width', '100%'),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'height', '100%'),
\t\t\t\tA2($elm$html$Html$Attributes$style, 'display', 'flex')
\t\t\t]),
\t\t_List_Nil);
};
var $author$project$Main$main = $elm$browser$Browser$element(
\t{aH: $author$project$Main$init, aR: $author$project$Main$subscriptions, aT: $author$project$Main$update, aU: $author$project$Main$view});
_Platform_export({'Main':{'init':$author$project$Main$main(
\t$elm$json$Json$Decode$succeed(0))(0)}});}(this));
"""
