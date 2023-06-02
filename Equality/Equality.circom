pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
   // Your Code Here..
   signal input a[3];

   signal output c;

   signal temp1 <== a[0] - a[1];
   signal temp2 <== a[1] - a[2];
   signal temp3 <== temp1 * temp2;

   signal izero <-- temp3 == 0 ? 1 : 0;
   c <== izero;
}

component main = Equality();