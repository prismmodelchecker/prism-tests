// Simple DTMC from Lec 15 of Probabilistic Model Checking

dtmc

module M

s:[0..5];

[] s=0 -> 0.5:(s'=1) + 0.5:(s'=3);
[] s=1 -> 0.5:(s'=0) + 0.25:(s'=2) + 0.25:(s'=4);
[] s=2 -> 1:(s'=5);
[] s=3 -> 1:(s'=3);
[] s=4 -> 1:(s'=4);
[] s=5 -> 1:(s'=2);

endmodule

properties
	// RESULT: 2/3
	P=? [F s=3 ];
	// RESULT: 1/6
	P=? [F s=4 ];
	// RESULT: 1/6
	P=? [F s=2|s=5 ];
	// RESULT: true
	P>=1 [ G F s=3|s=4|s=5 ];
	// RESULT: false
	P>=1 [ G F s=3|s=4 ];
	// RESULT: true
	filter(first, P>=1 [ G F s=5 ], s=2);
	// RESULT: 5/6 = 0.833333
	P=? [ G F s=3|s=4 ];
endproperties
