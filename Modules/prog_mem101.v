module prgmem(inst,prgcntr);

input [31:0]prgcntr;
output reg [31:0]inst;
reg [7:0]mem[0:63];


initial
begin
<<<<<<< HEAD
$readmemb("C:/ProgramMem.txt",mem);
=======
$readmemb("C:/Users/ROFL/Documents/ProgramMem.txt",mem);
>>>>>>> 632ceb9f7bf512e29e342453265ecd9d6de3a69e
end

always@(prgcntr)
begin
inst<={mem[prgcntr],mem[prgcntr+1],mem[prgcntr+2],mem[prgcntr+3]};
end
    
	
endmodule
