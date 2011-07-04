// Simple DTMC from Lec 17 of Probabilistic Model Checking

dtmc

module M

s:[0..5];

[] s=0 -> 0.6:(s'=0) + 0.1:(s'=1) + 0.3:(s'=3);
[] s=1 -> 0.2:(s'=3) + 0.3:(s'=4) + 0.5:(s'=2);
[] s=2 -> 1:(s'=5);
[] s=3 -> 1:(s'=4);
[] s=4 -> 1:(s'=3);
[] s=5 -> 0.1:(s'=2) + 0.9:(s'=5);

endmodule

label "a" = s=2 | s=3 | s=5;
label "b" = s=1;

verify
	// RESULT: 1
	P=? [ G F "a" ];
	// RESULT: 0.75
	P=? [ (G !"b")&(G F "a") ];
	// RESULT: 0.125
	P=? [ F G "a" ];
	// RESULT: 1
	P=? [ (G ("b"=>(F (!"b"&"a"))))&(F G !"b") ];
	// RESULT: true (should be satisfied by {1,2,5})
	filter(forall, P>0.2 [ F G "a" ], s=1|s=2|s=5);
	// RESULT: true (should be satisfied by {1,2,5})
	filter(count, P>0.2 [ F G "a" ]) = 3;
endverify
