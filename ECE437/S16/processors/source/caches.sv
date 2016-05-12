/*
  Eric Villasenor
  evillase@gmail.com

  this block holds the i and d cache
*/


// interfaces
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// cpu types
`include "cpu_types_pkg.vh"

module caches (
  input logic CLK, nRST,
//<<<<<<< HEAD
  datapath_cache_if dcif,

  caches_if cif
);
  // import types
  import cpu_types_pkg::word_t;

  parameter CPUID = 0;
//=======
//  datapath_cache_if.cache dcif,
//  caches_if cif
//);
//>>>>>>> a7765470a917fdb1f7532931c68a899dbf227793

  //caches_if cif();


  word_t instr;
  word_t daddr;

  // icache
//<<<<<<< HEAD
  icache  ICACHE(CLK, nRST, dcif.icache, cif.icache);
  // dcache
  dcache  DCACHE(CLK, nRST, dcif.dcache, cif.dcache);
//=======
  //icache  ICACHE(dcif, cif);
  // dcache
  //dcache  DCACHE(dcif, cif);
//>>>>>>> a7765470a917fdb1f7532931c68a899dbf227793

  // single cycle instr saver (for memory ops)
  /*always_ff @(posedge CLK)
  begin
    if (!nRST)
    begin
      instr <= '0;
      daddr <= '0;
    end
    else
    if (dcif.ihit)
    begin
      instr <= cif.iload;
      daddr <= dcif.dmemaddr;
    end
  end*/
  // dcache invalidate before halt
  //assign dcif.flushed = dcif.halt;

  //single cycle
  //assign dcif.ihit = (dcif.imemREN) ? ~cif.iwait : 0;
  //assign dcif.dhit = (dcif.dmemREN|dcif.dmemWEN) ? ~cif.dwait : 0;
  //assign dcif.imemload = cif.iload;
  //assign dcif.imemload = (cif.iwait) ? instr : cif.iload;

  //singlecycle
//<<<<<<< HEAD
  /*assign dcif.ihit = (dcif.imemREN) ? ~cif.iwait : 0;
  assign dcif.dhit = (dcif.dmemREN|dcif.dmemWEN) ? ~cif.dwait : 0;
  assign dcif.imemload = cif.iload;*/ 
   //ask Skubic which one ae we supposed to include

  //assign dcif.dmemload = cif.dload;


  //assign cif.iREN = dcif.imemREN;
  //assign cif.dREN = dcif.dmemREN;
  //assign cif.dWEN = dcif.dmemWEN;
  //assign cif.dstore = dcif.dmemstore;
  //assign cif.iaddr = dcif.imemaddr;

  //assign cif.daddr = daddr;

  //assign cif.daddr = dcif.dmemaddr;

//=======
   /*
  assign dcif.ihit = (dcif.imemREN) ? ~cif.iwait : 0;
  assign dcif.dhit = (dcif.dmemREN|dcif.dmemWEN) ? ~cif.dwait : 0;
  assign dcif.imemload = cif.iload;
  assign dcif.dmemload = cif.dload;


  assign cif.iREN = dcif.imemREN;
  assign cif.dREN = dcif.dmemREN;
  assign cif.dWEN = dcif.dmemWEN;
  assign cif.dstore = dcif.dmemstore;
  assign cif.iaddr = dcif.imemaddr;
  assign cif.daddr = dcif.dmemaddr;
    */
//>>>>>>> a7765470a917fdb1f7532931c68a899dbf227793

endmodule