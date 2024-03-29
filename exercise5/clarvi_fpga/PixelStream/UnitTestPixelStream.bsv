/*-
 * Copyright (c) 2013 Simon W. Moore
 * All rights reserved.
 *
 * This software was developed by SRI International and the University of
 * Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-10-C-0237
 * ("CTSRD"), as part of the DARPA CRASH research programme.
 *
 * @BERI_LICENSE_HEADER_START@
 *
 * Licensed to BERI Open Systems C.I.C. (BERI) under one or more contributor
 * license agreements.  See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.  BERI licenses this
 * file to you under the BERI Hardware-Software License, Version 1.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 *   http://www.beri-open-systems.org/legal/license-1-0.txt
 *
 * Unless required by applicable law or agreed to in writing, Work distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * @BERI_LICENSE_HEADER_END@
 */

import Clocks::*;
import FIFO::*;
import FIFOF::*;
import GetPut::*;
import ClientServer::*;
import Vector::*;
import StmtFSM::*;
import AvalonStreaming::*;
import Avalon2ClientServer::*;
import AvalonBurstMasterWordAddressed::*;
import PixelStream::*;


module mkUnitTestPixelStream(Empty);
  
  Clock local_clk <- exposeCurrentClock;
  PixelStreamIfc dut <- mkPixelStream(local_clk);
  
  // Avalon slave interface to write to registers
  Reg#(UInt#(4)) slave_addr <- mkReg(0);
  Reg#(AvalonWordT) slave_writedata <- mkReg(0);
  Reg#(Bool) slave_write <- mkReg(False);
  Reg#(Bool) slave_read <- mkReg(False);
  
  // Avalon master returned data
  Reg#(Bit#(32)) master_returned_data <- mkReg(0);
  Reg#(Bool) master_readdatavalid <- mkReg(False);
  Reg#(Bit#(32)) master_addr <- mkReg(0);
  Reg#(UInt#(4)) master_burstcount <- mkReg(0);

  Reg#(Bool) hsync_prev <- mkReg(False);
  Reg#(Bool) vsync_prev <- mkReg(False);

  (* no_implicit_conditions *)
  rule forward_to_dut;
    dut.avs.s0(slave_addr, slave_writedata, slave_write, slave_read);
  endrule
  
  (* no_implicit_conditions *)
  rule return_data_burst_master;
    Bool waitreq = master_burstcount>0;
    dut.avm.m0(unpack(master_returned_data), master_readdatavalid, waitreq);
    Bit#(32) addrbits = pack(extend(dut.avm.m0_address())) << 1;
    let bc = dut.avm.m0_burstcount;
    Bool next_master_readdatavalid = False;
    if(master_burstcount>0)
      begin
	Vector#(2,Bit#(16)) pix;
	for(Integer j=0; j<2; j=j+1) begin
	  pix[j] = truncate(master_addr) + fromInteger(j*2);
	  $display("XXX  addr=0x%08x  bc=%1x  j=%d  pix[j]=%08x",master_addr, master_burstcount, j, pix[j]);
	end
	Bit#(32) dataword = {pix[1], pix[0]};
	master_returned_data <= dataword;
	master_addr <= master_addr+4;
	master_burstcount <= master_burstcount-1;
	next_master_readdatavalid = True;
	$display("XXX   returning data 0x%08x", dataword );
      end
    else
      if(dut.avm.m0_read() && (bc>0))
	begin
	  master_burstcount <= zeroExtend(bc);
	  master_addr <= addrbits;
	  $display("%05t: Setting master_burstcount=%1d  address 0x%08x", $time, bc, dut.avm.m0_address());
	end
    master_readdatavalid <= next_master_readdatavalid;
  endrule
  
  rule output_pixel_stream(dut.coe.hdmi_de());
    Bit#(8) r = truncate(pack(dut.coe.hdmi_r() >> 4));
    Bit#(8) g = truncate(pack(dut.coe.hdmi_g() >> 4));
    Bit#(8) b = truncate(pack(dut.coe.hdmi_b() >> 4));
    $display("%05t: pixel=0x%06x r=%04x, g=%04x, b=%04x", $time, {r,g,b}, dut.coe.hdmi_r(), dut.coe.hdmi_g(), dut.coe.hdmi_b());
  endrule

  rule output_hsync;
    hsync_prev <= dut.coe.hdmi_hsd();
    if (dut.coe.hdmi_hsd() && !hsync_prev)
	    $display("%05t: HSync", $time);
  endrule

  rule output_vsync;
    vsync_prev <= dut.coe.hdmi_vsd();
    if (dut.coe.hdmi_vsd() && !vsync_prev)
	    $display("%05t: VSync", $time);
  endrule
/*  
  Stmt init_seq =
  (seq

     slave_addr <= 0;
     slave_writedata <= 480; // X-res
     slave_write <= True;
     slave_write <= False;

     slave_addr <= 4;
     slave_writedata <= 272; // Y-res
     slave_write <= True;
     slave_write <= False;

     slave_addr <= 8;
     slave_writedata <= 0; // base address
     slave_write <= True;
     slave_write <= False;

     slave_write <= False;
     $display("%05t: wrote resolution", $time);

     delay(1000);
   endseq);
  
  mkAutoFSM(init_seq);
 */ 
endmodule
