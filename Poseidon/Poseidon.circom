pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {

   // Your Code here.. 
   signal input a;
   signal input b;
   signal input c;
   signal input d;
   signal output out;

   component poseidon4 = Poseidon(4);
   poseidon4.inputs[0] <== a;
   poseidon4.inputs[1] <== b;
   poseidon4.inputs[2] <== c;
   poseidon4.inputs[3] <== d;
   out <== poseidon4.out;
}

component main = poseidon();