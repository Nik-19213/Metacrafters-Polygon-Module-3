pragma circom 2.0.0;

template LogicGateCircuit (){  

   // input signals 

      signal input A;
      signal input B;

   // Output siglans from gates
      signal X;
      signal Y;
   
   // Main output signal
    signal output Q;
   
  
   component notGate = NOT();
   component andGate = AND();
   component OrGate = OR();

   // Main logic for output
   andGate.A <== A;
   andGate.B <== B;
   X<== andGate.out;

   notGate.in <== B;
   Y<== notGate.out;

   OrGate.A <== X;
   OrGate.B <== Y;
   Q<== OrGate.out;
}

// templates of gates 

template OR() {
    signal input A;
    signal input B;
    signal output out;

    out <== A + B - A*B;
}

template AND() {
    signal input A;
    signal input B;
    signal output out;

    out <== A*B;
}


template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = LogicGateCircuit();