pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

template LessThan(n) {
    assert(n <= 252);
    signal input in[2];
    signal output out;

    component n2b = Num2Bits(n+1);

    n2b.in <== in[0]+ (1<<n) - in[1];

    out <== 1-n2b.bits[n];
}

template Num2Bits(b) {
    signal input in;
    signal output bits[b];

    for (var i = 0; i < b; i++) {
        bits[i] <-- (in >> i) & 1;
        bits[i] * (1 - bits[i]) === 0;
    }
    var sum_of_bits = 0;
    for (var i = 0; i < b; i++) {
        sum_of_bits += (2 ** i) * bits[i];
    }

    sum_of_bits === in;
}

template Range() {
    // your code here
    signal input a;
    signal input lowerbound;
    signal input upperbound;
    signal output out;

    component lt1 = LessThan(8);
    lt1.in[0] <== a;
    lt1.in[1] <== upperbound; 

    component lt2 = LessThan(8);
    lt2.in[0] <== lowerbound;
    lt2.in[1] <== a;

    out <== lt1.out * lt2.out;
 
}

component main  = Range();


