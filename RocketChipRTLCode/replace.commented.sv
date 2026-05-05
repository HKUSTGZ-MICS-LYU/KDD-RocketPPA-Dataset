//module split_cc_dir_ext_10_17(
//  input  [9:0]  RW0_addr,
//  input         RW0_clk,
//  input  [16:0] RW0_wdata,
//  output [16:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA1024X17M4WBZHOCP memory macro
//  TS1N7HSLVTA1024X17M4WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB({17{~RW0_wmask}}),                     // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(10'b0),
//    .BWEBM(17'b0),
//    .DM(17'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule
//module split_cc_banks_0_ext_14_64(
//  input  [13:0] RW0_addr,
//  input         RW0_clk,
//  input  [63:0] RW0_wdata,
//  output [63:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode
//);
//
//  // An array of wires to hold the output data from each of the 16 memory instances.
//  wire [63:0] q_data_array [0:15];
//  
//  // A 16-bit wire to control the active-low Chip Enable (CEB) for each memory instance.
//  reg [15:0] ceb_n;
//
//  // The single active-low Write Enable (WEB) signal, common to all instances.
//  wire web_n;
//
//  // Register to hold the read address, matching the original module's synchronous read behavior.
//  reg [13:0] read_addr_reg;
//
//  // Logic to drive the common WEB signal.
//  assign web_n = ~RW0_wmode;
//
//  // 4-to-16 decoder for Chip Enable.
//  integer i;
//  always @(*) begin
//    for (i = 0; i < 16; i = i + 1) begin
//      if (RW0_addr[13:10] == i) begin
//        ceb_n[i] = ~RW0_en; // Enable the selected instance (active low)
//      end else begin
//        ceb_n[i] = 1'b1;    // Disable all other instances
//      end
//    end
//  end
//
//  // Register the read address on the rising edge of the clock when a read operation is enabled.
//  always @(posedge RW0_clk) begin
//    if (RW0_en && ~RW0_wmode) begin
//      read_addr_reg <= RW0_addr;
//    end
//  end
//
//  // Wires for the unused outputs. They can be shared as they are unconnected.
//  wire PUDELAY_SD_unused, PUDELAY_DSLP_unused, SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // -------- BEGIN: Manual Instantiation of 16 Memory Macros --------
//
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_0 ( .CLK(RW0_clk), .CEB(ceb_n[0]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[0]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_1 ( .CLK(RW0_clk), .CEB(ceb_n[1]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[1]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_2 ( .CLK(RW0_clk), .CEB(ceb_n[2]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[2]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_3 ( .CLK(RW0_clk), .CEB(ceb_n[3]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[3]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_4 ( .CLK(RW0_clk), .CEB(ceb_n[4]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[4]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_5 ( .CLK(RW0_clk), .CEB(ceb_n[5]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[5]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_6 ( .CLK(RW0_clk), .CEB(ceb_n[6]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[6]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_7 ( .CLK(RW0_clk), .CEB(ceb_n[7]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[7]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_8 ( .CLK(RW0_clk), .CEB(ceb_n[8]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[8]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_9 ( .CLK(RW0_clk), .CEB(ceb_n[9]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[9]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_10( .CLK(RW0_clk), .CEB(ceb_n[10]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[10]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_11( .CLK(RW0_clk), .CEB(ceb_n[11]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[11]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_12( .CLK(RW0_clk), .CEB(ceb_n[12]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[12]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_13( .CLK(RW0_clk), .CEB(ceb_n[13]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[13]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_14( .CLK(RW0_clk), .CEB(ceb_n[14]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[14]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA1024X64M4WBZHOCP instance_15( .CLK(RW0_clk), .CEB(ceb_n[15]), .WEB(web_n), .A(RW0_addr[9:0]), .D(RW0_wdata), .Q(q_data_array[15]), .BWEB(64'b0), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(10'b0), .BWEBM(64'b0), .DM(64'b0), .FADIO(6'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//
//  // -------- END: Manual Instantiation --------
//
//  // 16-to-1 output multiplexer.
//  assign RW0_rdata = q_data_array[read_addr_reg[13:10]];
//
//endmodule

//module split_tag_array_ext_6_22(
//  input  [5:0]  RW0_addr,
//  input         RW0_clk,
//  input  [21:0] RW0_wdata,
//  output [21:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA64X22M2WBZHOCP memory macro
//  TS1N7HSLVTA64X22M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB({22{~RW0_wmask}}),                     // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(6'b0),
//    .BWEBM(22'b0),
//    .DM(22'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_tag_array_0_ext_6_21(
//  input  [5:0]  RW0_addr,
//  input         RW0_clk,
//  input  [20:0] RW0_wdata,
//  output [20:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA64X21M2WBZHOCP memory macro
//  TS1N7HSLVTA64X21M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB(21'b0),                                // Bit Write Enable, active low (all bits always enabled)
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(6'b0),
//    .BWEBM(21'b0),
//    .DM(21'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_data_arrays_0_0_ext_9_32(
//  input  [8:0]  RW0_addr,
//  input         RW0_clk,
//  input  [31:0] RW0_wdata,
//  output [31:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA512X32M2WBZHOCP memory macro
//  TS1N7HSLVTA512X32M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB(32'b0),                                // Bit Write Enable, active low (all bits always enabled)
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(9'b0),
//    .BWEBM(32'b0),
//    .DM(32'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_mem_ext_13_8(
//  input  [12:0] RW0_addr,
//  input         RW0_clk,
//  input  [7:0]  RW0_wdata,
//  output [7:0]  RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // An array of wires to hold the output data from each of the 16 memory instances.
//  wire [7:0] q_data_array [0:15];
//  
//  // A 16-bit wire to control the active-low Chip Enable (CEB) for each memory instance.
//  reg [15:0] ceb_n;
//
//  // The single active-low Write Enable (WEB) signal, common to all instances.
//  wire web_n;
//
//  // Register to hold the read address, matching the original module's synchronous read behavior.
//  reg [12:0] read_addr_reg;
//
//  // Logic to drive the common WEB and BWEB signals.
//  assign web_n = ~RW0_wmode;
//  wire [7:0] bweb_n = {8{~RW0_wmask}}; // Invert and replicate single-bit mask
//
//  // 4-to-16 decoder for Chip Enable.
//  integer i;
//  always @(*) begin
//    for (i = 0; i < 16; i = i + 1) begin
//      if (RW0_addr[12:9] == i) begin
//        ceb_n[i] = ~RW0_en; // Enable the selected instance (active low)
//      end else begin
//        ceb_n[i] = 1'b1;    // Disable all other instances
//      end
//    end
//  end
//
//  // Register the read address on the rising edge of the clock when a read operation is enabled.
//  always @(posedge RW0_clk) begin
//    if (RW0_en && ~RW0_wmode) begin
//      read_addr_reg <= RW0_addr;
//    end
//  end
//
//  // Wires for the unused outputs.
//  wire PUDELAY_SD_unused, PUDELAY_DSLP_unused, SOC_unused;
//  wire [1:0] SOD_unused;
//  
//  // -------- BEGIN: Manual Instantiation of 16 Memory Macros --------
//
//  TS1N7HSLVTA512X8M2WBZHOCP instance_0 ( .CLK(RW0_clk), .CEB(ceb_n[0]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[0]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_1 ( .CLK(RW0_clk), .CEB(ceb_n[1]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[1]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_2 ( .CLK(RW0_clk), .CEB(ceb_n[2]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[2]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_3 ( .CLK(RW0_clk), .CEB(ceb_n[3]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[3]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_4 ( .CLK(RW0_clk), .CEB(ceb_n[4]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[4]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_5 ( .CLK(RW0_clk), .CEB(ceb_n[5]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[5]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_6 ( .CLK(RW0_clk), .CEB(ceb_n[6]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[6]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_7 ( .CLK(RW0_clk), .CEB(ceb_n[7]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[7]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_8 ( .CLK(RW0_clk), .CEB(ceb_n[8]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[8]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_9 ( .CLK(RW0_clk), .CEB(ceb_n[9]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[9]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_10( .CLK(RW0_clk), .CEB(ceb_n[10]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[10]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_11( .CLK(RW0_clk), .CEB(ceb_n[11]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[11]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_12( .CLK(RW0_clk), .CEB(ceb_n[12]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[12]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_13( .CLK(RW0_clk), .CEB(ceb_n[13]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[13]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_14( .CLK(RW0_clk), .CEB(ceb_n[14]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[14]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//  TS1N7HSLVTA512X8M2WBZHOCP instance_15( .CLK(RW0_clk), .CEB(ceb_n[15]), .WEB(web_n), .A(RW0_addr[8:0]), .D(RW0_wdata), .Q(q_data_array[15]), .BWEB(bweb_n), .SD(1'b0), .DSLP(1'b0), .DSLPLV(1'b0), .PUDELAY_SD(PUDELAY_SD_unused), .PUDELAY_DSLP(PUDELAY_DSLP_unused), .BIST(1'b0), .CEBM(1'b0), .WEBM(1'b0), .AM(9'b0), .BWEBM(8'b0), .DM(8'b0), .FADIO(3'b0), .REDENIO(1'b0), .RTSEL(2'b0), .WTSEL(2'b0), .SE(1'b0), .DFTBYP(1'b0), .SIC(1'b0), .SID(2'b0), .SOC(SOC_unused), .SOD(SOD_unused) );
//
//  // -------- END: Manual Instantiation --------
//
//  // 16-to-1 output multiplexer.
//  assign RW0_rdata = q_data_array[read_addr_reg[12:9]];
//
//endmodule



//module split_tag_array_0_ext_6_22(
//  input  [5:0]  RW0_addr,
//  input         RW0_clk,
//  input  [21:0] RW0_wdata,
//  output [21:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA64X22M2WBZHOCP memory macro
//  TS1N7HSLVTA64X22M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB({22{~RW0_wmask}}),                     // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(6'b0),
//    .BWEBM(22'b0),
//    .DM(22'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_tag_array_0_ext_5_22(
//  input  [4:0]  RW0_addr,
//  input         RW0_clk,
//  input  [21:0] RW0_wdata,
//  output [21:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS5N7LVTA32X22M4WBZHOCP memory macro
//  TS5N7LVTA32X22M4WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB(22'b0),                                // Bit Write Enable, active low (all bits always enabled)
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(5'b0),
//    .BWEBM(22'b0),
//    .DM(22'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_data_arrays_0_0_ext_8_32(
//  input  [7:0]  RW0_addr,
//  input         RW0_clk,
//  input  [31:0] RW0_wdata,
//  output [31:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA256X32M2WBZHOCP memory macro
//  TS1N7HSLVTA256X32M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB(32'b0),                                // Bit Write Enable, active low (all bits always enabled)
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(8'b0),
//    .BWEBM(32'b0),
//    .DM(32'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_tag_array_ext_5_23(
//  input  [4:0]  RW0_addr,
//  input         RW0_clk,
//  input  [22:0] RW0_wdata,
//  output [22:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS5N7LVTA32X23M4WBZHOCP memory macro
//  TS5N7LVTA32X23M4WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB({23{~RW0_wmask}}),                     // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(5'b0),
//    .BWEBM(23'b0),
//    .DM(23'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule


//module split_rockettile_icache_tag_array_ext_5_22(
//  input  [4:0]  RW0_addr,
//  input         RW0_clk,
//  input  [21:0] RW0_wdata,
//  output [21:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS5N7LVTA32X22M4WBZHOCP memory macro
//  TS5N7LVTA32X22M4WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(RW0_clk),
//    .A(RW0_addr),
//    .D(RW0_wdata),
//    .Q(RW0_rdata),
//
//    // Control Signals
//    .CEB(~RW0_en),               // Chip Enable, active low
//    .WEB(~RW0_wmode),            // Write Enable, active low
//    .BWEB({22{~RW0_wmask}}),      // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Unused specialty ports are tied to their inactive state (typically 0)
//    // Power Management (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(5'b0),
//    .BWEBM(22'b0),
//    .DM(22'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_data_arrays_0_ext_8_32(
//  input  [7:0]  RW0_addr,
//  input         RW0_clk,
//  input  [31:0] RW0_wdata,
//  output [31:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA256X32M2WBZHOCP memory macro
//  TS1N7HSLVTA256X32M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(RW0_clk),
//    .A(RW0_addr),
//    .D(RW0_wdata),
//    .Q(RW0_rdata),
//
//    // Control Signals
//    .CEB(~RW0_en),               // Chip Enable, active low
//    .WEB(~RW0_wmode),            // Write Enable, active low
//    .BWEB({32{~RW0_wmask}}),      // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Unused specialty ports are tied to their inactive state (typically 0)
//    // Power Management (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(8'b0),
//    .BWEBM(32'b0),
//    .DM(32'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_tag_array_ext_6_21(
//  input  [5:0]  RW0_addr,
//  input         RW0_clk,
//  input  [20:0] RW0_wdata,
//  output [20:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA64X21M2WBZHOCP memory macro
//  TS1N7HSLVTA64X21M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(RW0_clk),
//    .A(RW0_addr),
//    .D(RW0_wdata),
//    .Q(RW0_rdata),
//
//    // Control Signals
//    .CEB(~RW0_en),               // Chip Enable, active low
//    .WEB(~RW0_wmode),            // Write Enable, active low
//    .BWEB({21{~RW0_wmask}}),      // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Unused specialty ports are tied to their inactive state (typically 0)
//    // Power Management (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(6'b0),
//    .BWEBM(21'b0),
//    .DM(21'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_rockettile_icache_data_arrays_0_ext_9_32(
//  input  [8:0]  RW0_addr,
//  input         RW0_clk,
//  input  [31:0] RW0_wdata,
//  output [31:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS1N7HSLVTA512X32M2WBZHOCP memory macro
//  TS1N7HSLVTA512X32M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(RW0_clk),
//    .A(RW0_addr),
//    .D(RW0_wdata),
//    .Q(RW0_rdata),
//
//    // Control Signals
//    .CEB(~RW0_en),               // Chip Enable, active low
//    .WEB(~RW0_wmode),            // Write Enable, active low
//    .BWEB({32{~RW0_wmask}}),      // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Unused specialty ports are tied to their inactive state (typically 0)
//    // Power Management (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(9'b0),
//    .BWEBM(32'b0),
//    .DM(32'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_tag_array_0_ext_5_23(
//  input  [4:0]  RW0_addr,
//  input         RW0_clk,
//  input  [22:0] RW0_wdata,
//  output [22:0] RW0_rdata,
//  input         RW0_en,
//  input         RW0_wmode,
//  input         RW0_wmask
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS5N7LVTA32X23M4WBZHOCP memory macro
//  TS5N7LVTA32X23M4WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins (typically connected at a higher level)
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Control Signals
//    .CLK(RW0_clk),                               // Clock
//    .CEB(~RW0_en),                               // Chip Enable, active low
//    .WEB(~RW0_wmode),                            // Write Enable, active low
//    .SD(1'b0),                                   // Shut down mode (disabled)
//    .DSLP(1'b0),                                 // Deep sleep mode (disabled)
//    .DSLPLV(1'b0),                               // Diode bypass mode (disabled)
//
//    // Data and Address Ports
//    .A(RW0_addr),                                // Address input
//    .D(RW0_wdata),                               // Data input
//    .Q(RW0_rdata),                               // Data output
//    .BWEB({23{~RW0_wmask}}),                     // Bit Write Enable, active low. Replicates the inverted wmask.
//
//    // Power Management Outputs (unused)
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .CEBM(1'b0),
//    .WEBM(1'b0),
//    .AM(5'b0),
//    .BWEBM(23'b0),
//    .DM(23'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(2'b0),
//    .WTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule


//Two Port Sram
//module ram_16x56(
//  input  [3:0]  R0_addr,
//  input         R0_en,
//  input         R0_clk,
//  output [55:0] R0_data,
//  input  [3:0]  W0_addr,
//  input         W0_en,
//  input         W0_clk,
//  input  [55:0] W0_data
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS6N7LVTB16X56M2WBZHOCP 2-Port RAM macro
//  TS6N7LVTB16X56M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(W0_clk),            // Use the write clock as the single clock source
//    .AA(W0_addr),            // Write Address
//    .AB(R0_addr),            // Read Address
//    .D(W0_data),             // Data In
//    .Q(R0_data),             // Data Out
//    
//    // Control Signals
//    .WEB(~W0_en),            // Write Enable, active low
//    .REB(~R0_en),            // Read Enable, active low
//    .BWEB(56'b0),            // Bit Write Enable, active low (all bits enabled)
//
//    // Power Management and Sleep Control (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .WEBM(1'b0),
//    .REBM(1'b0),
//    .AMA(4'b0),
//    .AMB(4'b0),
//    .BWEBM(56'b0),
//    .DM(56'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(3'b0),
//    .WTSEL(3'b0),
//    .MTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module split_array_0_0_0_ext_9_64_2port(
//  input  [8:0]  R0_addr,
//  input         R0_clk,
//  output [63:0] R0_data,
//  input         R0_en,
//  input  [8:0]  W0_addr,
//  input         W0_clk,
//  input  [63:0] W0_data,
//  input         W0_en
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS6N7LVTB512X64M2WBZHOCP 2-Port RAM macro
//  TS6N7LVTB512X64M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(W0_clk),            // Use the write clock as the single clock source
//    .AA(W0_addr),            // Write Address
//    .AB(R0_addr),            // Read Address
//    .D(W0_data),             // Data In
//    .Q(R0_data),             // Data Out
//    
//    // Control Signals
//    .WEB(~W0_en),            // Write Enable, active low
//    .REB(~R0_en),            // Read Enable, active low
//    .BWEB(64'b0),            // Bit Write Enable, active low (all bits enabled)
//
//    // Power Management and Sleep Control (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .WEBM(1'b0),
//    .REBM(1'b0),
//    .AMA(9'b0),
//    .AMB(9'b0),
//    .BWEBM(64'b0),
//    .DM(64'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(3'b0),
//    .WTSEL(3'b0),
//    .MTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule

//module ram_16x63(
//  input  [3:0]  R0_addr,
//  input         R0_en,
//  input         R0_clk,
//  output [62:0] R0_data,
//  input  [3:0]  W0_addr,
//  input         W0_en,
//  input         W0_clk,
//  input  [62:0] W0_data
//);
//
//  // Wire for the full 64-bit output from the macro
//  wire [63:0] q_data_full;
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS6N7LVTB16X64M2WBZHOCP 2-Port RAM macro
//  TS6N7LVTB16X64M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(W0_clk),                         // Use the write clock as the single clock source
//    .AA(W0_addr),                         // Write Address
//    .AB(R0_addr),                         // Read Address
//    .D({1'b0, W0_data}),                  // Pad 63-bit input to 64 bits for the macro
//    .Q(q_data_full),                      // Connect to the full 64-bit output wire
//    
//    // Control Signals
//    .WEB(~W0_en),                         // Write Enable, active low
//    .REB(~R0_en),                         // Read Enable, active low
//    .BWEB(64'h8000000000000000),          // Enable write for bits 62:0, disable for bit 63
//
//    // Power Management and Sleep Control (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .WEBM(1'b0),
//    .REBM(1'b0),
//    .AMA(4'b0),
//    .AMB(4'b0),
//    .BWEBM(64'b0),
//    .DM(64'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(3'b0),
//    .WTSEL(3'b0),
//    .MTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//  // Assign the lower 63 bits of the macro's output to the module's output
//  assign R0_data = q_data_full[62:0];
//
//endmodule
//module split_array_0_0_0_ext_8_64_2port(
//  input  [7:0]  R0_addr,
//  input         R0_clk,
//  output [63:0] R0_data,
//  input         R0_en,
//  input  [7:0]  W0_addr,
//  input         W0_clk,
//  input  [63:0] W0_data,
//  input         W0_en
//);
//
//  // Wires for unconnected outputs of the memory macro
//  wire PUDELAY_SD_unused;
//  wire PUDELAY_DSLP_unused;
//  wire SOC_unused;
//  wire [1:0] SOD_unused;
//
//  // Instantiate the TS6N7LVTB256X64M2WBZHOCP 2-Port RAM macro
//  TS6N7LVTB256X64M2WBZHOCP sram_inst (
//`ifdef TSMC_PWR_AWARE
//    // Power pins
//    .VDD(VDD),
//    .VSS(VSS),
//`endif
//    // Main I/O Ports
//    .CLK(W0_clk),            // Use the write clock as the single clock source
//    .AA(W0_addr),            // Write Address
//    .AB(R0_addr),            // Read Address
//    .D(W0_data),             // Data In
//    .Q(R0_data),             // Data Out
//    
//    // Control Signals
//    .WEB(~W0_en),            // Write Enable, active low
//    .REB(~R0_en),            // Read Enable, active low
//    .BWEB(64'b0),            // Bit Write Enable, active low (all bits enabled)
//
//    // Power Management and Sleep Control (disabled)
//    .SD(1'b0),
//    .DSLP(1'b0),
//    .DSLPLV(1'b0),
//    .PUDELAY_SD(PUDELAY_SD_unused),
//    .PUDELAY_DSLP(PUDELAY_DSLP_unused),
//
//    // BIST (Built-In Self-Test) Pins (disabled)
//    .BIST(1'b0),
//    .WEBM(1'b0),
//    .REBM(1'b0),
//    .AMA(8'b0),
//    .AMB(8'b0),
//    .BWEBM(64'b0),
//    .DM(64'b0),
//    
//    // Repair and Debug Pins (disabled)
//    .FADIO(5'b0),
//    .REDENIO(1'b0),
//    .RTSEL(3'b0),
//    .WTSEL(3'b0),
//    .MTSEL(2'b0),
//
//    // DFT (Design For Test) Pins (disabled)
//    .SE(1'b0),
//    .DFTBYP(1'b0),
//    .SIC(1'b0),
//    .SID(2'b0),
//    .SOC(SOC_unused),
//    .SOD(SOD_unused)
//  );
//
//endmodule