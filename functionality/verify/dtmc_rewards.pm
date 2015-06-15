dtmc

module M

	s : [0..3];
	
	[] s=0 -> (s'=1);
	[] s=1 -> (s'=2);
	[] s=2 -> (s'=3);
	[] s>2 -> true;

endmodule

rewards
	s=0: 2;
	[] s=0: 3;
	s=1: 5;
	[] s=1: 7;
	s=2: 11;
endrewards
