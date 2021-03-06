        ��  ��                    $   ��
 F I B       0 	        // fib.js
function fib(n) {
    if (n == 0) { return 0; }
    if (n == 1) { return 1; }
    return fib(n-1) + fib(n-2);
}

function test() {
    var res = [];
    for (i = 0; i < 20; i++) {
        res.push(fib(i));
    }
    print(res.join(' '));
}

test();
 s  (   ��
 P R I M E       0 	        // prime.js

// Pure Ecmascript version of low level helper
function primeCheckEcmascript(val, limit) {
    for (var i = 2; i <= limit; i++) {
        if ((val % i) == 0) { return false; }
    }
    return true;
}

// Select available helper at load time
var primeCheckHelper = (this.primeCheckNative || primeCheckEcmascript);

// Check 'val' for primality
function primeCheck(val) {
    if (val == 1 || val == 2) { return true; }
    var limit = Math.ceil(Math.sqrt(val));
    while (limit * limit < val) { limit += 1; }
    return primeCheckHelper(val, limit);
}

// Find primes below one million ending in '9999'.
function primeTest() {
    var res = [];

    print('Have native helper: ' + (primeCheckHelper !== primeCheckEcmascript));
    for (var i = 1; i < 1000000; i++) {
        if (primeCheck(i) && (i % 10000) == 9999) { res.push(i); }
    } 
    print(res.join(' '));
}

 �  ,   ��
 P R O C E S S       0 	        // process.js
function processLine(line) {
    return line.trim()
        .replace(/[<>&"'\u0000-\u001F\u007E-\uFFFF]/g, function(x) {
            // escape HTML characters
            return '&#' + x.charCodeAt(0) + ';'
         })
        .replace(/\*(.*?)\*/g, function(x, m) {
            // automatically bold text between stars
            return '<b>' + m + '</b>';
         });
}
