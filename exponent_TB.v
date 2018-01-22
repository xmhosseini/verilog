//'timescale 1ns/1ps


module exponent_TB;

reg   [63:0] x0;
wire  [63:0] Y0; 
reg clk;

parallel_exponent U0 (Y0, x0, 1'd0, 1'd0);
                
    initial  begin
		$monitor("Y0 = %d \n", Y0);
		end 
      
    initial begin

     #10  x0=64'd187550000000;   
     #10  x0=64'd095265000000;   
     #10  x0=64'd047633000000;   
     #10  x0=64'd023816000000;   
     #10  x0=64'd011908000000;   
     #10  x0=64'd005954100000;   


     #10  x0=64'd003550600000;    
     #10  x0=64'd002018700000;   
     #10  x0=64'd001060300000;   
     #10  x0=64'd000573510000;   
     #10  x0=64'd000313130000;   
     #10  x0=64'd000171140000;   
     #10  x0=64'd000101860000;   
     #10  x0=64'd000067639000;   
     #10  x0=64'd000033686000;
     #10  x0=64'd000016810000;
     #10  x0=64'd000008396800;
     #10  x0=64'd000004196400;
     #10  x0=64'd000002097700;
     #10  x0=64'd000001048700;
        
//   #20  x7=64'd05; x6=64'd10; x5=64'd05; x4=64'd10; x3=64'd10; x2=64'd05; x1=64'd10; x0=64'd05; 
  end
    //Rest of testbench code after this line 
      
  endmodule