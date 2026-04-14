// Generator : SpinalHDL dev    git head : 4ea15953aa8a888e636e4ae5d7445770f2e0e73c
// Component : VexiiRiscv
// Git hash  : 3039a18a2e763b67794656e45aff4d3d7d87f51e

`timescale 1ns/1ps

module VexiiRiscv (
  output wire          FetchL1Plugin_logic_bus_cmd_valid,
  input  wire          FetchL1Plugin_logic_bus_cmd_ready,
  output wire [31:0]   FetchL1Plugin_logic_bus_cmd_payload_address,
  output wire          FetchL1Plugin_logic_bus_cmd_payload_io,
  input  wire          FetchL1Plugin_logic_bus_rsp_valid,
  output wire          FetchL1Plugin_logic_bus_rsp_ready,
  input  wire [255:0]  FetchL1Plugin_logic_bus_rsp_payload_data,
  input  wire          FetchL1Plugin_logic_bus_rsp_payload_error,
  input  wire [63:0]   PrivilegedPlugin_logic_rdtime,
  input  wire          PrivilegedPlugin_logic_harts_0_int_m_timer /* verilator public */ ,
  input  wire          PrivilegedPlugin_logic_harts_0_int_m_software /* verilator public */ ,
  input  wire          PrivilegedPlugin_logic_harts_0_int_m_external /* verilator public */ ,
  output wire          LsuCachelessPlugin_logic_bus_cmd_valid,
  input  wire          LsuCachelessPlugin_logic_bus_cmd_ready,
  output wire [0:0]    LsuCachelessPlugin_logic_bus_cmd_payload_id,
  output wire          LsuCachelessPlugin_logic_bus_cmd_payload_write,
  output wire [31:0]   LsuCachelessPlugin_logic_bus_cmd_payload_address,
  output wire [63:0]   LsuCachelessPlugin_logic_bus_cmd_payload_data,
  output wire [1:0]    LsuCachelessPlugin_logic_bus_cmd_payload_size,
  output wire [7:0]    LsuCachelessPlugin_logic_bus_cmd_payload_mask,
  output wire          LsuCachelessPlugin_logic_bus_cmd_payload_io,
  output wire          LsuCachelessPlugin_logic_bus_cmd_payload_fromHart,
  output wire [15:0]   LsuCachelessPlugin_logic_bus_cmd_payload_uopId,
  input  wire          LsuCachelessPlugin_logic_bus_rsp_valid,
  input  wire [0:0]    LsuCachelessPlugin_logic_bus_rsp_payload_id,
  input  wire          LsuCachelessPlugin_logic_bus_rsp_payload_error,
  input  wire [63:0]   LsuCachelessPlugin_logic_bus_rsp_payload_data,
  input  wire          clk,
  input  wire          reset
);
  localparam IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam IntAluPlugin_AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam IntAluPlugin_AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam IntAluPlugin_AluBitwiseCtrlEnum_ZERO = 2'd3;
  localparam BranchPlugin_BranchCtrlEnum_B = 2'd0;
  localparam BranchPlugin_BranchCtrlEnum_JAL = 2'd1;
  localparam BranchPlugin_BranchCtrlEnum_JALR = 2'd2;
  localparam EnvPluginOp_ECALL = 3'd0;
  localparam EnvPluginOp_EBREAK = 3'd1;
  localparam EnvPluginOp_PRIV_RET = 3'd2;
  localparam EnvPluginOp_FENCE_I = 3'd3;
  localparam EnvPluginOp_SFENCE_VMA = 3'd4;
  localparam EnvPluginOp_WFI = 3'd5;
  localparam TrapPlugin_logic_harts_0_trap_fsm_RESET = 4'd0;
  localparam TrapPlugin_logic_harts_0_trap_fsm_RUNNING = 4'd1;
  localparam TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 = 4'd2;
  localparam TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC = 4'd3;
  localparam TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL = 4'd4;
  localparam TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC = 4'd5;
  localparam TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY = 4'd6;
  localparam TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC = 4'd7;
  localparam TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY = 4'd8;
  localparam TrapPlugin_logic_harts_0_trap_fsm_JUMP = 4'd9;
  localparam TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH = 4'd10;
  localparam CsrAccessPlugin_logic_fsm_IDLE = 2'd0;
  localparam CsrAccessPlugin_logic_fsm_READ = 2'd1;
  localparam CsrAccessPlugin_logic_fsm_WRITE = 2'd2;
  localparam CsrAccessPlugin_logic_fsm_COMPLETION = 2'd3;

  reg                 integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_valid;
  reg        [4:0]    integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_address;
  reg        [63:0]   integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_data;
  wire       [29:0]   BtbPlugin_logic_ras_mem_stack_spinal_port0;
  reg        [63:0]   FetchL1Plugin_logic_banks_0_mem_spinal_port1;
  reg        [63:0]   FetchL1Plugin_logic_banks_1_mem_spinal_port1;
  reg        [63:0]   FetchL1Plugin_logic_banks_2_mem_spinal_port1;
  reg        [63:0]   FetchL1Plugin_logic_banks_3_mem_spinal_port1;
  reg        [25:0]   FetchL1Plugin_logic_ways_0_mem_spinal_port1;
  reg        [25:0]   FetchL1Plugin_logic_ways_1_mem_spinal_port1;
  reg        [25:0]   FetchL1Plugin_logic_ways_2_mem_spinal_port1;
  reg        [25:0]   FetchL1Plugin_logic_ways_3_mem_spinal_port1;
  reg        [2:0]    FetchL1Plugin_logic_plru_mem_spinal_port1;
  reg        [41:0]   BtbPlugin_logic_mem_spinal_port1;
  reg        [63:0]   CsrRamPlugin_logic_mem_spinal_port1;
  wire                streamArbiter_1_io_inputs_0_ready;
  wire                streamArbiter_1_io_output_valid;
  wire       [31:0]   streamArbiter_1_io_output_payload_pcOnLastSlice;
  wire       [31:0]   streamArbiter_1_io_output_payload_pcTarget;
  wire                streamArbiter_1_io_output_payload_taken;
  wire                streamArbiter_1_io_output_payload_isBranch;
  wire                streamArbiter_1_io_output_payload_isPush;
  wire                streamArbiter_1_io_output_payload_isPop;
  wire                streamArbiter_1_io_output_payload_wasWrong;
  wire                streamArbiter_1_io_output_payload_badPredictedTarget;
  wire       [15:0]   streamArbiter_1_io_output_payload_uopId;
  wire       [0:0]    streamArbiter_1_io_chosenOH;
  wire       [63:0]   integer_RegFilePlugin_logic_regfile_fpga_io_reads_0_data;
  wire       [63:0]   integer_RegFilePlugin_logic_regfile_fpga_io_reads_1_data;
  wire       [63:0]   _zz_early0_IntAluPlugin_logic_alu_result;
  wire       [63:0]   _zz_early0_IntAluPlugin_logic_alu_result_1;
  wire       [63:0]   _zz_early0_IntAluPlugin_logic_alu_result_2;
  wire       [63:0]   _zz_early0_IntAluPlugin_logic_alu_result_3;
  wire       [63:0]   _zz_early0_IntAluPlugin_logic_alu_result_4;
  wire       [0:0]    _zz_early0_IntAluPlugin_logic_alu_result_5;
  wire       [5:0]    _zz_early0_IterativeShifterPlugin_logic_shift_shamt;
  wire       [4:0]    _zz__zz_early0_IterativeShifterPlugin_logic_shift_selector_2;
  reg        [63:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6;
  wire       [2:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_7;
  wire       [63:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_8;
  wire       [63:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_9;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_10;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_11;
  wire       [54:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_12;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_13;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_14;
  wire       [43:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_15;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_16;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_17;
  wire       [32:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_18;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_19;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_20;
  wire       [21:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_21;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_22;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_23;
  wire       [10:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_24;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_25;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_26;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_27;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_28;
  wire       [23:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_29;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_30;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_31;
  wire       [12:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed_32;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_33;
  wire       [0:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_34;
  wire       [1:0]    _zz_early0_IterativeShifterPlugin_logic_shift_muxed_35;
  reg        [5:0]    _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3;
  wire       [1:0]    _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4;
  wire       [5:0]    _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5;
  wire       [5:0]    _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6;
  wire       [63:0]   _zz_late0_IntAluPlugin_logic_alu_result;
  wire       [63:0]   _zz_late0_IntAluPlugin_logic_alu_result_1;
  wire       [63:0]   _zz_late0_IntAluPlugin_logic_alu_result_2;
  wire       [63:0]   _zz_late0_IntAluPlugin_logic_alu_result_3;
  wire       [63:0]   _zz_late0_IntAluPlugin_logic_alu_result_4;
  wire       [0:0]    _zz_late0_IntAluPlugin_logic_alu_result_5;
  wire       [5:0]    _zz_late0_IterativeShifterPlugin_logic_shift_shamt;
  wire       [4:0]    _zz__zz_late0_IterativeShifterPlugin_logic_shift_selector_2;
  reg        [63:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6;
  wire       [2:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_7;
  wire       [63:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_8;
  wire       [63:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_9;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_10;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_11;
  wire       [54:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_12;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_13;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_14;
  wire       [43:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_15;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_16;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_17;
  wire       [32:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_18;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_19;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_20;
  wire       [21:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_21;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_22;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_23;
  wire       [10:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_24;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_25;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_26;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_27;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_28;
  wire       [23:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_29;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_30;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_31;
  wire       [12:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed_32;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_33;
  wire       [0:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_34;
  wire       [1:0]    _zz_late0_IterativeShifterPlugin_logic_shift_muxed_35;
  reg        [5:0]    _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3;
  wire       [1:0]    _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4;
  wire       [5:0]    _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5;
  wire       [5:0]    _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6;
  wire       [20:0]   _zz_early0_BranchPlugin_pcCalc_target_b;
  wire       [11:0]   _zz_early0_BranchPlugin_pcCalc_target_b_1;
  wire       [12:0]   _zz_early0_BranchPlugin_pcCalc_target_b_2;
  wire       [1:0]    _zz_early0_BranchPlugin_pcCalc_slices;
  wire       [0:0]    _zz_early0_BranchPlugin_pcCalc_slices_1;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_1;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_2;
  wire       [31:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  wire       [3:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0_1;
  wire       [31:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  wire       [1:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0_1;
  wire       [0:0]    _zz_AlignerPlugin_logic_extractors_0_redo_2;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_0_mem_port;
  wire                _zz_FetchL1Plugin_logic_ways_0_mem_port_1;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_1_mem_port;
  wire                _zz_FetchL1Plugin_logic_ways_1_mem_port_1;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_2_mem_port;
  wire                _zz_FetchL1Plugin_logic_ways_2_mem_port_1;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_3_mem_port;
  wire                _zz_FetchL1Plugin_logic_ways_3_mem_port_1;
  wire       [2:0]    _zz_FetchL1Plugin_logic_plru_mem_port;
  wire                _zz_when;
  wire       [1:0]    _zz__zz_FetchL1Plugin_logic_banks_0_write_payload_address;
  reg        [63:0]   _zz_FetchL1Plugin_logic_banks_0_write_payload_data;
  wire       [1:0]    _zz__zz_FetchL1Plugin_logic_banks_1_write_payload_address;
  reg        [63:0]   _zz_FetchL1Plugin_logic_banks_1_write_payload_data;
  wire       [1:0]    _zz__zz_FetchL1Plugin_logic_banks_2_write_payload_address;
  reg        [63:0]   _zz_FetchL1Plugin_logic_banks_2_write_payload_data;
  wire       [1:0]    _zz__zz_FetchL1Plugin_logic_banks_3_write_payload_address;
  reg        [63:0]   _zz_FetchL1Plugin_logic_banks_3_write_payload_data;
  reg        [31:0]   _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0;
  wire       [0:0]    _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0_1;
  reg        [31:0]   _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1;
  wire       [0:0]    _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1_1;
  reg        [31:0]   _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2;
  wire       [0:0]    _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2_1;
  reg        [31:0]   _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3;
  wire       [0:0]    _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3_1;
  wire       [1:0]    _zz_FetchL1Plugin_logic_bankMux_reduced_bankId;
  reg        [31:0]   _zz_fetch_logic_ctrls_2_down_Fetch_WORD;
  wire       [0:0]    _zz_FetchL1Plugin_logic_ctrl_dataAccessFault;
  wire       [63:0]   _zz_LsuCachelessPlugin_logic_trapPort_payload_tval;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_push;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_push_1;
  wire       [0:0]    _zz_BtbPlugin_logic_ras_ptr_push_2;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_push_3;
  wire       [0:0]    _zz_BtbPlugin_logic_ras_ptr_push_4;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_1;
  wire       [0:0]    _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_2;
  wire       [1:0]    _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_3;
  wire       [0:0]    _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_4;
  wire       [29:0]   _zz_BtbPlugin_logic_ras_mem_stack_port;
  wire       [63:0]   _zz_WhiteboxerPlugin_logic_decodes_0_pc;
  wire       [31:0]   _zz__zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2;
  wire       [0:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3;
  wire       [25:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6;
  wire       [0:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7;
  wire       [17:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10;
  wire       [0:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11;
  wire       [9:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13;
  wire                _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14;
  wire       [0:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15;
  wire       [1:0]    _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16;
  wire       [63:0]   _zz_early0_BranchPlugin_logic_wb_payload;
  wire       [0:0]    _zz_FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit;
  wire       [0:0]    _zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_io;
  wire       [31:0]   _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0;
  wire       [11:0]   _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_1;
  wire       [11:0]   _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_2;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_1;
  wire       [63:0]   _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_2;
  wire       [0:0]    _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_3;
  wire       [31:0]   _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0;
  wire       [11:0]   _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0_1;
  wire       [63:0]   _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0;
  wire       [63:0]   _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_1;
  wire       [63:0]   _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_2;
  wire       [0:0]    _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_3;
  wire       [31:0]   _zz__zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2;
  wire       [0:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3;
  wire       [25:0]   _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6;
  wire       [0:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7;
  wire       [17:0]   _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10;
  wire       [0:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11;
  wire       [9:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13;
  wire                _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14;
  wire       [0:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15;
  wire       [1:0]    _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16;
  wire       [63:0]   _zz_late0_BranchPlugin_logic_wb_payload;
  wire       [3:0]    _zz_early0_EnvPlugin_logic_trapPort_payload_code;
  wire       [0:0]    _zz_decode_ctrls_2_down_RS1_ENABLE_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_RS2_ENABLE_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_RD_ENABLE_0;
  wire       [31:0]   _zz_decode_ctrls_2_down_RD_ENABLE_0_1;
  wire       [31:0]   _zz_decode_ctrls_2_down_RD_ENABLE_0_2;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_1;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_2;
  wire                _zz_decode_ctrls_2_down_Decode_LEGAL_0_3;
  wire       [0:0]    _zz_decode_ctrls_2_down_Decode_LEGAL_0_4;
  wire       [14:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_5;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_6;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_7;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_8;
  wire                _zz_decode_ctrls_2_down_Decode_LEGAL_0_9;
  wire       [0:0]    _zz_decode_ctrls_2_down_Decode_LEGAL_0_10;
  wire       [8:0]    _zz_decode_ctrls_2_down_Decode_LEGAL_0_11;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_12;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_13;
  wire       [31:0]   _zz_decode_ctrls_2_down_Decode_LEGAL_0_14;
  wire                _zz_decode_ctrls_2_down_Decode_LEGAL_0_15;
  wire       [0:0]    _zz_decode_ctrls_2_down_Decode_LEGAL_0_16;
  wire       [2:0]    _zz_decode_ctrls_2_down_Decode_LEGAL_0_17;
  wire       [0:0]    _zz_DecoderPlugin_logic_laneLogic_0_fixer_isJb;
  wire       [31:0]   _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice;
  wire       [1:0]    _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice_1;
  wire       [41:0]   _zz_BtbPlugin_logic_mem_port;
  wire       [29:0]   _zz_BtbPlugin_logic_onLearn_port_payload_address;
  wire       [2:0]    _zz_LsuCachelessPlugin_logic_trapPort_payload_code;
  reg                 _zz_LsuCachelessPlugin_logic_onJoin_readerValid;
  reg                 _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_error;
  reg        [63:0]   _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_data;
  reg        [7:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted;
  wire       [2:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_1;
  wire       [2:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_2;
  reg        [7:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3;
  wire       [1:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_4;
  wire       [1:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_5;
  reg        [7:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_6;
  wire       [0:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_7;
  wire       [0:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_8;
  reg        [7:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_9;
  wire       [0:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_10;
  wire       [0:0]    _zz_LsuCachelessPlugin_logic_onWb_rspShifted_11;
  wire       [0:0]    _zz_LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit;
  wire       [0:0]    _zz_LsuCachelessPlugin_logic_onPma_port_rsp_io;
  wire       [0:0]    _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_2;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_3;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_2;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_3;
  wire       [0:0]    _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_4;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_1;
  wire       [0:0]    _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_2;
  wire       [29:0]   _zz_BtbPlugin_logic_onLearn_port_payload_address_1;
  wire       [29:0]   _zz_BtbPlugin_logic_readPort_cmd_payload;
  wire       [31:0]   _zz_BtbPlugin_logic_ras_write_payload_data;
  wire                _zz_decode_logic_flushes_2_onLanes_0_doIt;
  wire                _zz_decode_logic_flushes_2_onLanes_0_doIt_1;
  wire                _zz_decode_logic_flushes_2_onLanes_0_doIt_2;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_2;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_3;
  wire       [0:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_4;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_5;
  wire       [0:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_6;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_7;
  wire       [0:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_8;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_9;
  wire       [1:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_10;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_11;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_12;
  wire       [0:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_13;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_14;
  wire       [1:0]    _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_15;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_16;
  wire                _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_17;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_1;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_2;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_3;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_4;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_1;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_2;
  wire       [32:0]   _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_3;
  wire       [31:0]   _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget;
  wire       [2:0]    _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget_1;
  wire       [31:0]   _zz_PcPlugin_logic_harts_0_self_pc;
  wire       [2:0]    _zz_PcPlugin_logic_harts_0_self_pc_1;
  wire       [0:0]    _zz_PcPlugin_logic_harts_0_aggregator_fault;
  wire       [0:0]    _zz_CsrAccessPlugin_logic_fsm_inject_implemented;
  wire       [4:0]    _zz_CsrAccessPlugin_logic_fsm_inject_implemented_1;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_5;
  wire       [5:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_6;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_7;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_8;
  wire       [7:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_9;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_10;
  wire       [3:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_11;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_12;
  wire       [12:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_13;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_14;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_15;
  wire       [17:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_16;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_17;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_18;
  wire       [3:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_19;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_20;
  wire       [11:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_21;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_22;
  wire       [7:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_23;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_24;
  wire       [3:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_25;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_26;
  wire       [11:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_27;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_28;
  wire       [7:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_29;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_30;
  wire       [3:0]    _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_31;
  wire       [63:0]   _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask;
  wire       [4:0]    _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask_1;
  wire                _zz_fetch_logic_flushes_0_doIt;
  wire                _zz_fetch_logic_flushes_0_doIt_1;
  wire                _zz_fetch_logic_flushes_1_doIt;
  wire                _zz_fetch_logic_flushes_1_doIt_1;
  wire                _zz_fetch_logic_flushes_1_doIt_2;
  wire       [2:0]    _zz_CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked;
  wire       [1:0]    _zz_CsrRamPlugin_logic_readLogic_hits_ohFirst_masked;
  reg        [1:0]    _zz_CsrRamPlugin_logic_readLogic_port_cmd_payload;
  wire       [2:0]    _zz_CsrRamPlugin_logic_flush_counter;
  wire       [0:0]    _zz_CsrRamPlugin_logic_flush_counter_1;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_SEL_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_2;
  wire       [32:0]   _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_3;
  wire       [32:0]   _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_4;
  wire       [32:0]   _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_5;
  wire                _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_6;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_3;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_3;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_4;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_3;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_3;
  wire       [0:0]    _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_4;
  wire       [0:0]    _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_STORE_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_STORE_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0;
  wire       [0:0]    _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_2;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_1;
  wire       [0:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_2;
  wire                _zz_when_ExecuteLanePlugin_l300_1;
  wire                _zz_when_ExecuteLanePlugin_l300_1_1;
  wire                _zz_when_ExecuteLanePlugin_l300_1_2;
  wire                _zz_when_ExecuteLanePlugin_l300_1_3;
  wire                _zz_when_ExecuteLanePlugin_l300_1_4;
  wire                _zz_when_ExecuteLanePlugin_l300_1_5;
  wire                _zz_when_ExecuteLanePlugin_l300_1_6;
  wire                _zz_when_ExecuteLanePlugin_l300_1_7;
  wire       [31:0]   _zz_WhiteboxerPlugin_logic_csr_access_payload_address;
  reg        [0:0]    _zz_WhiteboxerPlugin_logic_perf_candidatesCount;
  wire       [0:0]    _zz_WhiteboxerPlugin_logic_perf_candidatesCount_1;
  reg        [0:0]    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount;
  wire       [0:0]    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1_1;
  wire       [59:0]   _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1;
  wire       [0:0]    _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1_1;
  wire       [63:0]   _zz_TrapPlugin_logic_harts_0_crsPorts_write_data;
  wire       [63:0]   _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_1;
  wire       [31:0]   _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_2;
  wire       [63:0]   _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_3;
  wire       [63:0]   _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc;
  wire       [63:0]   _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc_1;
  wire                decode_ctrls_0_up_isValid;
  wire                fetch_logic_ctrls_0_up_isReady;
  wire                fetch_logic_ctrls_0_up_isValid;
  reg                 execute_ctrl4_up_COMMIT_lane0;
  wire                execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  wire                execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  wire       [31:0]   execute_ctrl2_down_MMU_TRANSLATED_lane0;
  wire       [31:0]   execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  wire       [31:0]   execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  wire       [31:0]   execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  wire       [63:0]   execute_ctrl2_down_early0_SrcPlugin_ADD_SUB_lane0;
  wire       [1:0]    execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                execute_ctrl2_down_late0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl2_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire                execute_ctrl2_down_AguPlugin_FLOAT_lane0;
  wire                execute_ctrl2_down_AguPlugin_ATOMIC_lane0;
  wire                execute_ctrl2_down_AguPlugin_LOAD_lane0;
  wire       [1:0]    execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0;
  wire                execute_ctrl2_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  wire                execute_ctrl2_down_IterativeShifterPlugin_IS_W_lane0;
  wire                execute_ctrl2_down_IterativeShifterPlugin_ARITHMETIC_lane0;
  wire                execute_ctrl2_down_IterativeShifterPlugin_LEFT_lane0;
  wire                execute_ctrl2_down_SrcStageables_UNSIGNED_lane0;
  wire                execute_ctrl2_down_SrcStageables_ZERO_lane0;
  wire                execute_ctrl2_down_SrcStageables_REVERT_lane0;
  wire                execute_ctrl2_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  wire                execute_ctrl2_down_COMPLETION_AT_3_lane0;
  wire                execute_ctrl2_down_lane0_integer_WriteBackPlugin_SEL_lane0;
  wire                execute_ctrl2_down_late0_BranchPlugin_SEL_lane0;
  wire                execute_ctrl2_down_late0_IterativeShifterPlugin_SEL_lane0;
  wire                execute_ctrl2_down_late0_IntAluPlugin_SEL_lane0;
  wire                execute_ctrl2_down_early0_BranchPlugin_SEL_lane0;
  wire       [1:0]    execute_ctrl2_down_AguPlugin_SIZE_lane0;
  wire       [31:0]   execute_ctrl2_down_Prediction_ALIGNED_JUMPED_PC_lane0;
  wire                execute_ctrl2_down_Prediction_ALIGNED_JUMPED_lane0;
  reg        [63:0]   execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0;
  reg                 execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
  reg        [63:0]   execute_ctrl3_up_late0_SrcPlugin_SRC2_lane0;
  reg        [63:0]   execute_ctrl3_up_late0_SrcPlugin_SRC1_lane0;
  reg                 execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  reg                 execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  reg        [31:0]   execute_ctrl3_up_MMU_TRANSLATED_lane0;
  reg        [31:0]   execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  reg        [31:0]   execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  reg        [31:0]   execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  reg        [63:0]   execute_ctrl3_up_early0_SrcPlugin_ADD_SUB_lane0;
  reg        [1:0]    execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  reg                 execute_ctrl3_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  reg                 execute_ctrl3_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  reg                 execute_ctrl3_up_AguPlugin_FLOAT_lane0;
  reg                 execute_ctrl3_up_AguPlugin_ATOMIC_lane0;
  reg                 execute_ctrl3_up_AguPlugin_LOAD_lane0;
  reg        [1:0]    execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0;
  reg                 execute_ctrl3_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  reg                 execute_ctrl3_up_IterativeShifterPlugin_IS_W_lane0;
  reg                 execute_ctrl3_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  reg                 execute_ctrl3_up_IterativeShifterPlugin_LEFT_lane0;
  reg                 execute_ctrl3_up_SrcStageables_UNSIGNED_lane0;
  reg        [1:0]    execute_ctrl3_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  reg                 execute_ctrl3_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  reg                 execute_ctrl3_up_SrcStageables_ZERO_lane0;
  reg                 execute_ctrl3_up_SrcStageables_REVERT_lane0;
  reg                 execute_ctrl3_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  reg                 execute_ctrl3_up_COMPLETION_AT_3_lane0;
  reg                 execute_ctrl3_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_AguPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_late0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_late0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_late0_IntAluPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_early0_BranchPlugin_SEL_lane0;
  reg        [1:0]    execute_ctrl3_up_AguPlugin_SIZE_lane0;
  reg        [4:0]    execute_ctrl3_up_RD_PHYS_lane0;
  reg        [15:0]   execute_ctrl3_up_Decode_UOP_ID_lane0;
  reg        [31:0]   execute_ctrl3_up_PC_lane0;
  reg        [31:0]   execute_ctrl3_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  reg                 execute_ctrl3_up_Prediction_ALIGNED_JUMPED_lane0;
  reg        [31:0]   execute_ctrl3_up_Decode_UOP_lane0;
  wire       [1:0]    execute_ctrl1_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  wire       [0:0]    execute_ctrl1_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  wire       [1:0]    execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                execute_ctrl1_down_late0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl1_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire                execute_ctrl1_down_AguPlugin_FLOAT_lane0;
  wire                execute_ctrl1_down_BYPASSED_AT_2_lane0;
  wire                execute_ctrl1_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  wire                execute_ctrl1_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  wire                execute_ctrl1_down_COMPLETION_AT_3_lane0;
  wire                execute_ctrl1_down_COMPLETION_AT_2_lane0;
  wire                execute_ctrl1_down_lane0_integer_WriteBackPlugin_SEL_lane0;
  wire                execute_ctrl1_down_late0_BranchPlugin_SEL_lane0;
  wire                execute_ctrl1_down_late0_IterativeShifterPlugin_SEL_lane0;
  wire                execute_ctrl1_down_late0_IntAluPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  reg                 execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  reg        [31:0]   execute_ctrl2_up_MMU_TRANSLATED_lane0;
  reg        [31:0]   execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  reg        [31:0]   execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  reg        [31:0]   execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  reg        [63:0]   execute_ctrl2_up_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  reg        [63:0]   execute_ctrl2_up_early0_SrcPlugin_ADD_SUB_lane0;
  reg                 execute_ctrl2_up_COMMIT_lane0;
  reg        [1:0]    execute_ctrl2_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  reg        [0:0]    execute_ctrl2_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  reg        [1:0]    execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  reg                 execute_ctrl2_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  reg                 execute_ctrl2_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  reg                 execute_ctrl2_up_AguPlugin_FLOAT_lane0;
  reg                 execute_ctrl2_up_AguPlugin_ATOMIC_lane0;
  reg                 execute_ctrl2_up_AguPlugin_STORE_lane0;
  reg                 execute_ctrl2_up_AguPlugin_LOAD_lane0;
  reg        [1:0]    execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0;
  reg                 execute_ctrl2_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  reg                 execute_ctrl2_up_IterativeShifterPlugin_IS_W_lane0;
  reg                 execute_ctrl2_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  reg                 execute_ctrl2_up_IterativeShifterPlugin_LEFT_lane0;
  reg                 execute_ctrl2_up_SrcStageables_UNSIGNED_lane0;
  reg                 execute_ctrl2_up_MAY_FLUSH_PRECISE_2_lane0;
  reg                 execute_ctrl2_up_BYPASSED_AT_2_lane0;
  reg        [1:0]    execute_ctrl2_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  reg                 execute_ctrl2_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  reg                 execute_ctrl2_up_SrcStageables_ZERO_lane0;
  reg                 execute_ctrl2_up_SrcStageables_REVERT_lane0;
  reg                 execute_ctrl2_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  reg                 execute_ctrl2_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  reg                 execute_ctrl2_up_COMPLETION_AT_3_lane0;
  reg                 execute_ctrl2_up_COMPLETION_AT_2_lane0;
  reg                 execute_ctrl2_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_AguPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_CsrAccessPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_late0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_late0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_late0_IntAluPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_early0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl2_up_early0_IterativeShifterPlugin_SEL_lane0;
  reg        [1:0]    execute_ctrl2_up_AguPlugin_SIZE_lane0;
  reg        [4:0]    execute_ctrl2_up_RS2_PHYS_lane0;
  reg        [4:0]    execute_ctrl2_up_RS1_PHYS_lane0;
  reg        [15:0]   execute_ctrl2_up_Decode_UOP_ID_lane0;
  reg        [31:0]   execute_ctrl2_up_PC_lane0;
  reg        [31:0]   execute_ctrl2_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  reg                 execute_ctrl2_up_Prediction_ALIGNED_JUMPED_lane0;
  reg        [31:0]   execute_ctrl2_up_Decode_UOP_lane0;
  wire                execute_ctrl0_down_COMPLETED_lane0;
  wire       [4:0]    execute_ctrl0_down_RD_PHYS_lane0;
  wire       [31:0]   execute_ctrl0_down_Prediction_ALIGNED_JUMPED_PC_lane0;
  wire                execute_ctrl0_down_Prediction_ALIGNED_JUMPED_lane0;
  reg        [1:0]    execute_ctrl1_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  reg        [0:0]    execute_ctrl1_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  reg        [1:0]    execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  reg                 execute_ctrl1_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  reg                 execute_ctrl1_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  reg        [2:0]    execute_ctrl1_up_early0_EnvPlugin_OP_lane0;
  reg                 execute_ctrl1_up_AguPlugin_FLOAT_lane0;
  reg                 execute_ctrl1_up_AguPlugin_ATOMIC_lane0;
  reg                 execute_ctrl1_up_AguPlugin_STORE_lane0;
  reg                 execute_ctrl1_up_AguPlugin_LOAD_lane0;
  reg                 execute_ctrl1_up_CsrAccessPlugin_CSR_CLEAR_lane0;
  reg                 execute_ctrl1_up_CsrAccessPlugin_CSR_MASK_lane0;
  reg                 execute_ctrl1_up_CsrAccessPlugin_CSR_IMM_lane0;
  reg        [1:0]    execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0;
  reg                 execute_ctrl1_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  reg                 execute_ctrl1_up_IterativeShifterPlugin_IS_W_lane0;
  reg                 execute_ctrl1_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  reg                 execute_ctrl1_up_IterativeShifterPlugin_LEFT_lane0;
  reg                 execute_ctrl1_up_SrcStageables_UNSIGNED_lane0;
  reg                 execute_ctrl1_up_MAY_FLUSH_PRECISE_3_lane0;
  reg                 execute_ctrl1_up_MAY_FLUSH_PRECISE_2_lane0;
  reg                 execute_ctrl1_up_BYPASSED_AT_2_lane0;
  reg                 execute_ctrl1_up_BYPASSED_AT_1_lane0;
  reg        [1:0]    execute_ctrl1_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  reg                 execute_ctrl1_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  reg                 execute_ctrl1_up_SrcStageables_ZERO_lane0;
  reg                 execute_ctrl1_up_SrcStageables_REVERT_lane0;
  reg        [1:0]    execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  reg                 execute_ctrl1_up_early0_IntAluPlugin_ALU_SLTX_lane0;
  reg                 execute_ctrl1_up_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
  reg                 execute_ctrl1_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  reg                 execute_ctrl1_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  reg                 execute_ctrl1_up_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
  reg                 execute_ctrl1_up_COMPLETION_AT_3_lane0;
  reg                 execute_ctrl1_up_COMPLETION_AT_2_lane0;
  reg                 execute_ctrl1_up_COMPLETION_AT_1_lane0;
  reg                 execute_ctrl1_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_LsuCachelessPlugin_FENCE_lane0;
  reg                 execute_ctrl1_up_AguPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_CsrAccessPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_late0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_late0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_late0_IntAluPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_early0_EnvPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_early0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_early0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_early0_IntAluPlugin_SEL_lane0;
  reg        [63:0]   execute_ctrl1_up_early0_SrcPlugin_SRC2_lane0;
  reg        [63:0]   execute_ctrl1_up_early0_SrcPlugin_SRC1_lane0;
  reg        [1:0]    execute_ctrl1_up_AguPlugin_SIZE_lane0;
  reg        [4:0]    execute_ctrl1_up_RS2_PHYS_lane0;
  reg        [4:0]    execute_ctrl1_up_RS1_PHYS_lane0;
  reg        [15:0]   execute_ctrl1_up_Decode_UOP_ID_lane0;
  reg        [31:0]   execute_ctrl1_up_PC_lane0;
  reg        [31:0]   execute_ctrl1_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  reg                 execute_ctrl1_up_Prediction_ALIGNED_JUMPED_lane0;
  reg        [31:0]   execute_ctrl1_up_Decode_UOP_lane0;
  wire                decode_ctrls_2_down_isReady;
  wire                decode_ctrls_1_down_Prediction_ALIGN_REDO_0;
  wire       [0:0]    decode_ctrls_1_down_Prediction_ALIGNED_SLICES_TAKEN_0;
  wire       [0:0]    decode_ctrls_1_down_Prediction_ALIGNED_SLICES_BRANCH_0;
  wire       [31:0]   decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_PC_0;
  wire                decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_0;
  wire       [9:0]    decode_ctrls_1_down_Decode_DOP_ID_0;
  wire       [31:0]   decode_ctrls_1_down_PC_0;
  wire       [31:0]   decode_ctrls_1_down_Decode_INSTRUCTION_RAW_0;
  wire                decode_ctrls_1_down_Decode_DECOMPRESSION_FAULT_0;
  wire       [31:0]   decode_ctrls_1_down_Decode_INSTRUCTION_0;
  wire                decode_ctrls_1_down_isValid;
  wire                decode_ctrls_1_down_isReady;
  reg                 decode_ctrls_2_up_Prediction_ALIGN_REDO_0;
  reg        [0:0]    decode_ctrls_2_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  reg        [0:0]    decode_ctrls_2_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  reg        [31:0]   decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_PC_0;
  reg                 decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_0;
  reg        [9:0]    decode_ctrls_2_up_Decode_DOP_ID_0;
  reg        [31:0]   decode_ctrls_2_up_PC_0;
  reg        [31:0]   decode_ctrls_2_up_Decode_INSTRUCTION_RAW_0;
  reg                 decode_ctrls_2_up_Decode_DECOMPRESSION_FAULT_0;
  reg        [31:0]   decode_ctrls_2_up_Decode_INSTRUCTION_0;
  wire                decode_ctrls_1_up_isReady;
  wire                decode_ctrls_1_up_isValid;
  wire                decode_ctrls_0_down_Prediction_ALIGN_REDO_0;
  wire       [0:0]    decode_ctrls_0_down_Prediction_ALIGNED_SLICES_TAKEN_0;
  wire       [0:0]    decode_ctrls_0_down_Prediction_ALIGNED_SLICES_BRANCH_0;
  wire       [31:0]   decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_PC_0;
  wire                decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_0;
  wire       [31:0]   decode_ctrls_0_down_Decode_INSTRUCTION_RAW_0;
  wire                decode_ctrls_0_down_Decode_DECOMPRESSION_FAULT_0;
  wire       [31:0]   decode_ctrls_0_down_Decode_INSTRUCTION_0;
  wire                decode_ctrls_0_down_isValid;
  wire                decode_ctrls_0_down_isReady;
  reg                 decode_ctrls_1_up_Prediction_ALIGN_REDO_0;
  reg        [0:0]    decode_ctrls_1_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  reg        [0:0]    decode_ctrls_1_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  reg        [31:0]   decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_PC_0;
  reg                 decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_0;
  reg                 decode_ctrls_1_up_TRAP_0;
  reg        [9:0]    decode_ctrls_1_up_Decode_DOP_ID_0;
  reg        [31:0]   decode_ctrls_1_up_PC_0;
  reg        [31:0]   decode_ctrls_1_up_Decode_INSTRUCTION_RAW_0;
  reg                 decode_ctrls_1_up_Decode_DECOMPRESSION_FAULT_0;
  reg        [31:0]   decode_ctrls_1_up_Decode_INSTRUCTION_0;
  wire       [9:0]    fetch_logic_ctrls_1_down_Fetch_ID;
  wire                fetch_logic_ctrls_1_down_Fetch_PC_FAULT;
  wire                fetch_logic_ctrls_1_down_isValid;
  reg                 fetch_logic_ctrls_2_up_MMU_BYPASS_TRANSLATION;
  reg                 fetch_logic_ctrls_2_up_MMU_ACCESS_FAULT;
  reg                 fetch_logic_ctrls_2_up_MMU_PAGE_FAULT;
  reg                 fetch_logic_ctrls_2_up_MMU_ALLOW_EXECUTE;
  reg                 fetch_logic_ctrls_2_up_MMU_HAZARD;
  reg                 fetch_logic_ctrls_2_up_MMU_REFILL;
  reg                 fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT;
  reg        [7:0]    fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash;
  reg        [29:0]   fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget;
  reg                 fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch;
  reg                 fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush;
  reg                 fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop;
  reg                 fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HIT;
  reg        [31:0]   fetch_logic_ctrls_2_up_MMU_TRANSLATED;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_0;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_1;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_2;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_3;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_HAZARD;
  reg        [31:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_0;
  reg        [31:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_1;
  reg        [31:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_2;
  reg        [31:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_3;
  reg        [0:0]    fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_0;
  reg        [1:0]    fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_1;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_loaded;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_error;
  reg        [23:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_address;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_loaded;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_error;
  reg        [23:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_address;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_loaded;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_error;
  reg        [23:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_address;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_loaded;
  reg                 fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_error;
  reg        [23:0]   fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_address;
  reg        [9:0]    fetch_logic_ctrls_2_up_Fetch_ID;
  reg                 fetch_logic_ctrls_2_up_Fetch_PC_FAULT;
  reg        [31:0]   fetch_logic_ctrls_2_up_Fetch_WORD_PC;
  wire                fetch_logic_ctrls_0_down_Fetch_PC_FAULT;
  wire                fetch_logic_ctrls_0_down_isValid;
  reg        [0:0]    fetch_logic_ctrls_1_up_BtbPlugin_logic_readCmd_HAZARDS;
  reg        [1:0]    fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS;
  reg                 fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE;
  reg        [0:0]    fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
  reg        [1:0]    fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
  reg                 fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID;
  reg        [9:0]    fetch_logic_ctrls_1_up_Fetch_ID;
  reg                 fetch_logic_ctrls_1_up_Fetch_PC_FAULT;
  reg        [31:0]   fetch_logic_ctrls_1_up_Fetch_WORD_PC;
  wire                decode_ctrls_2_down_valid;
  reg                 fetch_logic_ctrls_2_up_valid;
  wire                decode_ctrls_1_down_valid;
  reg                 fetch_logic_ctrls_1_down_valid;
  reg                 decode_ctrls_1_up_valid;
  wire                decode_ctrls_0_down_valid;
  reg                 fetch_logic_ctrls_0_down_valid;
  wire                execute_ctrl0_up_ready;
  wire                execute_ctrl0_down_ready;
  wire                execute_ctrl1_up_ready;
  wire                execute_ctrl1_down_ready;
  wire                execute_ctrl2_up_ready;
  wire                decode_ctrls_0_up_ready;
  wire                execute_ctrl2_down_ready;
  reg                 decode_ctrls_0_down_ready;
  wire                fetch_logic_ctrls_0_down_ready;
  wire                execute_ctrl3_up_ready;
  wire                decode_ctrls_1_up_ready;
  wire                fetch_logic_ctrls_1_up_cancel;
  wire                execute_ctrl3_down_ready;
  reg                 decode_ctrls_1_down_ready;
  wire                fetch_logic_ctrls_1_down_ready;
  wire                execute_ctrl4_up_ready;
  wire                fetch_logic_ctrls_2_up_ready;
  wire                fetch_logic_ctrls_2_up_cancel;
  wire                execute_ctrl4_down_ready;
  wire                execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
  wire                execute_ctrl3_down_AguPlugin_ATOMIC_lane0;
  wire       [31:0]   execute_ctrl3_down_MMU_TRANSLATED_lane0;
  wire       [1:0]    execute_ctrl3_down_AguPlugin_SIZE_lane0;
  wire                execute_ctrl3_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  wire                execute_ctrl3_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  wire                execute_ctrl3_down_AguPlugin_LOAD_lane0;
  reg                 execute_ctrl4_up_LANE_SEL_lane0;
  wire                execute_ctrl3_down_RD_ENABLE_lane0;
  reg                 execute_ctrl3_RD_ENABLE_lane0_bypass;
  reg                 execute_ctrl3_LANE_SEL_lane0_bypass;
  wire                execute_ctrl2_down_RD_ENABLE_lane0;
  reg                 execute_ctrl2_RD_ENABLE_lane0_bypass;
  reg                 execute_ctrl2_LANE_SEL_lane0_bypass;
  wire                execute_ctrl1_down_RD_ENABLE_lane0;
  reg                 execute_ctrl1_RD_ENABLE_lane0_bypass;
  reg                 execute_ctrl1_LANE_SEL_lane0_bypass;
  wire                execute_ctrl0_down_RD_ENABLE_lane0;
  reg                 execute_ctrl0_RD_ENABLE_lane0_bypass;
  reg                 execute_ctrl0_LANE_SEL_lane0_bypass;
  wire                execute_ctrl0_down_TRAP_lane0;
  wire       [1:0]    execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  wire       [0:0]    execute_ctrl0_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  wire       [1:0]    execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire       [2:0]    execute_ctrl0_down_early0_EnvPlugin_OP_lane0;
  wire                execute_ctrl0_down_AguPlugin_FLOAT_lane0;
  wire                execute_ctrl0_down_AguPlugin_ATOMIC_lane0;
  wire                execute_ctrl0_down_AguPlugin_STORE_lane0;
  wire                execute_ctrl0_down_AguPlugin_LOAD_lane0;
  wire                execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0;
  wire                execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0;
  wire                execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0;
  wire       [1:0]    execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0;
  wire                execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  wire                execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0;
  wire                execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0;
  wire                execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0;
  wire                execute_ctrl0_down_SrcStageables_UNSIGNED_lane0;
  wire                execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0;
  wire                execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0;
  wire                execute_ctrl0_down_BYPASSED_AT_2_lane0;
  wire                execute_ctrl0_down_BYPASSED_AT_1_lane0;
  wire       [1:0]    execute_ctrl0_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  wire                execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  wire                execute_ctrl0_down_SrcStageables_ZERO_lane0;
  wire                execute_ctrl0_down_SrcStageables_REVERT_lane0;
  wire       [1:0]    execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
  reg                 execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  reg                 execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  reg                 execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
  reg                 execute_ctrl0_down_COMPLETION_AT_3_lane0;
  reg                 execute_ctrl0_down_COMPLETION_AT_2_lane0;
  reg                 execute_ctrl0_down_COMPLETION_AT_1_lane0;
  reg                 execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0;
  reg                 execute_ctrl0_down_AguPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_CsrAccessPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_late0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_early0_EnvPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_early0_BranchPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0;
  wire       [0:0]    execute_ctrl0_down_lane0_LAYER_SEL_lane0;
  wire                execute_ctrl3_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  wire                execute_ctrl2_down_TRAP_lane0;
  wire                execute_ctrl2_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  wire                execute_ctrl1_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
  reg        [63:0]   execute_ctrl2_up_integer_RS2_lane0;
  wire       [63:0]   execute_ctrl2_integer_RS2_lane0_bypass;
  wire       [4:0]    execute_ctrl2_down_RS2_PHYS_lane0;
  wire       [63:0]   execute_ctrl1_down_integer_RS2_lane0;
  wire       [63:0]   execute_ctrl1_integer_RS2_lane0_bypass;
  wire       [4:0]    execute_ctrl1_down_RS2_PHYS_lane0;
  wire       [4:0]    execute_ctrl0_down_RS2_PHYS_lane0;
  reg        [63:0]   execute_ctrl2_up_integer_RS1_lane0;
  wire       [63:0]   execute_ctrl2_integer_RS1_lane0_bypass;
  wire       [4:0]    execute_ctrl2_down_RS1_PHYS_lane0;
  wire       [63:0]   execute_ctrl1_down_integer_RS1_lane0;
  wire       [63:0]   execute_ctrl1_integer_RS1_lane0_bypass;
  wire       [4:0]    execute_ctrl1_down_RS1_PHYS_lane0;
  wire       [4:0]    execute_ctrl2_down_RD_PHYS_lane0;
  wire       [4:0]    execute_ctrl0_down_RS1_PHYS_lane0;
  reg                 _zz_1;
  wire                execute_ctrl1_down_MMU_BYPASS_TRANSLATION_lane0;
  wire                execute_ctrl1_down_MMU_ALLOW_EXECUTE_lane0;
  wire                fetch_logic_ctrls_1_down_MMU_BYPASS_TRANSLATION;
  wire                fetch_logic_ctrls_1_down_MMU_ACCESS_FAULT;
  wire                fetch_logic_ctrls_1_down_MMU_PAGE_FAULT;
  wire                fetch_logic_ctrls_1_down_MMU_ALLOW_WRITE;
  wire                fetch_logic_ctrls_1_down_MMU_ALLOW_READ;
  wire                fetch_logic_ctrls_1_down_MMU_ALLOW_EXECUTE;
  wire                fetch_logic_ctrls_1_down_MMU_HAZARD;
  wire                fetch_logic_ctrls_1_down_MMU_REFILL;
  wire                execute_ctrl2_down_CsrAccessPlugin_SEL_lane0;
  wire       [4:0]    execute_ctrl1_down_RD_PHYS_lane0;
  wire                execute_ctrl1_down_CsrAccessPlugin_CSR_CLEAR_lane0;
  wire                execute_ctrl1_down_CsrAccessPlugin_CSR_MASK_lane0;
  wire                execute_ctrl1_down_CsrAccessPlugin_CSR_IMM_lane0;
  wire                execute_ctrl1_down_CsrAccessPlugin_SEL_lane0;
  wire                fetch_logic_ctrls_0_up_isFiring;
  reg        [9:0]    fetch_logic_ctrls_0_up_Fetch_ID;
  wire                fetch_logic_ctrls_0_up_Fetch_PC_FAULT;
  wire       [31:0]   fetch_logic_ctrls_0_up_Fetch_WORD_PC;
  reg                 fetch_logic_ctrls_0_up_ready;
  wire                fetch_logic_ctrls_0_up_valid;
  wire       [31:0]   execute_ctrl3_down_PC_lane0;
  wire                execute_ctrl4_down_COMMIT_lane0;
  wire                execute_ctrl4_down_isReady;
  wire                execute_ctrl4_down_LANE_SEL_lane0;
  wire                decode_ctrls_1_down_TRAP_0;
  wire                decode_ctrls_0_down_TRAP_0;
  wire                decode_ctrls_2_down_LANE_SEL_0;
  reg                 decode_ctrls_2_LANE_SEL_0_bypass;
  wire                decode_ctrls_1_down_LANE_SEL_0;
  reg                 decode_ctrls_1_LANE_SEL_0_bypass;
  reg                 decode_ctrls_1_up_LANE_SEL_0;
  wire                decode_ctrls_1_lane0_upIsCancel;
  wire                decode_ctrls_1_lane0_downIsCancel;
  wire                decode_ctrls_0_down_LANE_SEL_0;
  reg                 decode_ctrls_0_LANE_SEL_0_bypass;
  wire                decode_ctrls_0_up_isMoving;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT;
  wire                fetch_logic_ctrls_1_down_isReady;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_predict_TAKEN;
  wire       [7:0]    fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash;
  wire       [29:0]   fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop;
  wire                fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken;
  wire       [0:0]    fetch_logic_ctrls_1_down_BtbPlugin_logic_readCmd_HAZARDS;
  wire                fetch_logic_ctrls_1_up_isValid;
  wire                fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT;
  (* keep , syn_keep *) wire       [7:0]    fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [29:0]   fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken /* synthesis syn_keep = 1 */ ;
  wire       [0:0]    fetch_logic_ctrls_0_down_BtbPlugin_logic_readCmd_HAZARDS;
  wire                fetch_logic_ctrls_0_down_isReady;
  wire       [15:0]   execute_ctrl0_down_Decode_UOP_ID_lane0;
  wire                execute_ctrl0_down_isReady;
  wire                execute_ctrl0_down_LANE_SEL_lane0;
  wire       [9:0]    decode_ctrls_2_down_Decode_DOP_ID_0;
  wire                decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0;
  wire                decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_pmpPort_logic_NEED_HIT_lane0;
  wire                fetch_logic_ctrls_0_down_FetchL1Plugin_logic_pmpPort_logic_NEED_HIT;
  wire       [4:0]    execute_ctrl3_down_RD_PHYS_lane0;
  wire                execute_ctrl3_down_lane0_integer_WriteBackPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_RD_ENABLE_lane0;
  wire                execute_ctrl3_down_LANE_SEL_lane0;
  wire       [63:0]   execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  wire       [63:0]   execute_ctrl3_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  reg        [63:0]   execute_ctrl3_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  wire       [15:0]   execute_ctrl2_down_Decode_UOP_ID_lane0;
  wire                execute_ctrl2_down_COMMIT_lane0;
  wire                execute_ctrl2_down_isReady;
  wire                execute_ctrl2_down_LANE_SEL_lane0;
  wire       [63:0]   execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  wire       [63:0]   execute_ctrl2_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  reg        [63:0]   execute_ctrl2_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  wire                execute_ctrl1_down_LANE_SEL_lane0;
  wire       [63:0]   execute_ctrl1_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  wire       [63:0]   execute_ctrl1_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  wire       [0:0]    execute_ctrl0_up_lane0_LAYER_SEL_lane0;
  wire                execute_ctrl0_up_COMPLETED_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_lane0;
  wire       [4:0]    execute_ctrl0_up_RD_PHYS_lane0;
  reg                 execute_ctrl0_up_RD_ENABLE_lane0;
  wire       [4:0]    execute_ctrl0_up_RS2_PHYS_lane0;
  wire                execute_ctrl0_up_RS2_ENABLE_lane0;
  wire       [4:0]    execute_ctrl0_up_RS1_PHYS_lane0;
  wire                execute_ctrl0_up_RS1_ENABLE_lane0;
  wire       [15:0]   execute_ctrl0_up_Decode_UOP_ID_lane0;
  wire                execute_ctrl0_up_TRAP_lane0;
  wire       [31:0]   execute_ctrl0_up_PC_lane0;
  wire                execute_ctrl0_up_DONT_FLUSH_PRECISE_3_lane0;
  wire                execute_ctrl0_up_DONT_FLUSH_PRECISE_2_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_DONT_FLUSH_FROM_LANES_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_DONT_FLUSH_lane0;
  reg                 execute_ctrl0_up_DispatchPlugin_MAY_FLUSH_lane0;
  wire                execute_ctrl0_up_DispatchPlugin_FENCE_OLDER_lane0;
  wire       [0:0]    execute_ctrl0_up_Prediction_ALIGNED_SLICES_BRANCH_lane0;
  wire       [0:0]    execute_ctrl0_up_Prediction_ALIGNED_SLICES_TAKEN_lane0;
  wire       [31:0]   execute_ctrl0_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  wire                execute_ctrl0_up_Prediction_ALIGNED_JUMPED_lane0;
  wire       [31:0]   execute_ctrl0_up_Decode_UOP_lane0;
  wire                execute_ctrl0_up_LANE_SEL_lane0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0;
  wire                decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0;
  wire                decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0;
  wire                decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0;
  wire                decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0;
  wire                decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0;
  wire                decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0;
  wire       [0:0]    decode_ctrls_2_down_Prediction_ALIGNED_SLICES_BRANCH_0;
  wire       [0:0]    decode_ctrls_2_down_Prediction_ALIGNED_SLICES_TAKEN_0;
  wire       [31:0]   decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_PC_0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0;
  wire                decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0;
  wire                decode_ctrls_2_up_isValid;
  reg                 decode_ctrls_2_down_ready;
  wire                execute_ctrl2_down_MAY_FLUSH_PRECISE_2_lane0;
  wire                execute_ctrl1_down_MAY_FLUSH_PRECISE_3_lane0;
  wire                execute_ctrl1_down_MAY_FLUSH_PRECISE_2_lane0;
  wire                execute_ctrl2_down_BYPASSED_AT_2_lane0;
  reg        [4:0]    execute_ctrl2_up_RD_PHYS_lane0;
  reg                 execute_ctrl2_up_RD_ENABLE_lane0;
  wire                execute_ctrl1_down_BYPASSED_AT_1_lane0;
  reg        [4:0]    execute_ctrl1_up_RD_PHYS_lane0;
  reg                 execute_ctrl1_up_RD_ENABLE_lane0;
  wire                execute_ctrl3_down_AguPlugin_FLOAT_lane0;
  wire                execute_ctrl3_down_AguPlugin_SEL_lane0;
  wire       [63:0]   execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0;
  wire       [63:0]   execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0;
  wire                execute_ctrl2_up_LsuCachelessPlugin_WITH_ACCESS_lane0;
  reg                 execute_ctrl2_up_LsuCachelessPlugin_WITH_RSP_lane0;
  reg                 execute_ctrl2_up_TRAP_lane0;
  wire                execute_ctrl2_down_AguPlugin_STORE_lane0;
  wire                execute_ctrl2_down_AguPlugin_SEL_lane0;
  wire       [63:0]   execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0;
  wire                execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
  wire                execute_ctrl2_down_LsuCachelessPlugin_WITH_RSP_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_WITH_RSP_lane0;
  wire                execute_ctrl1_down_MMU_HAZARD_lane0;
  wire                execute_ctrl1_down_MMU_REFILL_lane0;
  wire                execute_ctrl1_down_MMU_ALLOW_READ_lane0;
  wire                execute_ctrl1_down_MMU_ALLOW_WRITE_lane0;
  wire                execute_ctrl1_down_MMU_PAGE_FAULT_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_pmpPort_ACCESS_FAULT_lane0;
  wire                execute_ctrl1_down_MMU_ACCESS_FAULT_lane0;
  wire                execute_ctrl3_down_COMPLETION_AT_3_lane0;
  reg                 execute_ctrl3_up_COMPLETED_lane0;
  wire                execute_ctrl3_down_COMPLETED_lane0;
  wire                execute_ctrl3_COMPLETED_lane0_bypass;
  wire                execute_ctrl2_down_COMPLETION_AT_2_lane0;
  reg                 execute_ctrl2_up_COMPLETED_lane0;
  wire                execute_ctrl2_down_COMPLETED_lane0;
  wire                execute_ctrl2_COMPLETED_lane0_bypass;
  wire                execute_ctrl1_down_COMPLETION_AT_1_lane0;
  reg                 execute_ctrl1_up_COMPLETED_lane0;
  wire                execute_ctrl1_down_COMPLETED_lane0;
  wire                execute_ctrl1_COMPLETED_lane0_bypass;
  wire       [31:0]   decode_ctrls_2_down_Decode_UOP_0;
  reg                 decode_ctrls_2_up_TRAP_0;
  reg                 decode_ctrls_2_TRAP_0_bypass;
  wire       [15:0]   decode_ctrls_2_down_Decode_UOP_ID_0;
  wire                decode_ctrls_2_up_isReady;
  wire                decode_ctrls_2_down_TRAP_0;
  wire       [31:0]   decode_ctrls_2_down_PC_0;
  wire                decode_ctrls_2_down_Prediction_ALIGN_REDO_0;
  wire                decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_0;
  reg                 decode_ctrls_2_up_LANE_SEL_0;
  wire       [31:0]   decode_ctrls_2_down_Decode_INSTRUCTION_RAW_0;
  wire                decode_ctrls_2_down_Decode_DECOMPRESSION_FAULT_0;
  wire                decode_ctrls_2_down_Decode_LEGAL_0;
  wire       [4:0]    decode_ctrls_2_down_RD_PHYS_0;
  reg                 decode_ctrls_2_down_RD_ENABLE_0;
  wire       [4:0]    decode_ctrls_2_down_RS2_PHYS_0;
  wire                decode_ctrls_2_down_RS2_ENABLE_0;
  wire       [4:0]    decode_ctrls_2_down_RS1_PHYS_0;
  wire       [31:0]   decode_ctrls_2_down_Decode_INSTRUCTION_0;
  wire                decode_ctrls_2_down_RS1_ENABLE_0;
  wire                decode_ctrls_2_up_isCanceling;
  wire                decode_ctrls_2_up_ready;
  reg                 decode_ctrls_2_up_valid;
  wire                decode_ctrls_2_up_isMoving;
  wire                execute_ctrl1_down_early0_EnvPlugin_SEL_lane0;
  wire       [31:0]   execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  wire                execute_ctrl3_down_early0_BranchPlugin_SEL_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JAL_lane0;
  reg                 execute_ctrl3_up_COMMIT_lane0;
  wire                execute_ctrl3_down_COMMIT_lane0;
  reg                 execute_ctrl3_COMMIT_lane0_bypass;
  reg                 execute_ctrl3_up_TRAP_lane0;
  wire                execute_ctrl3_down_TRAP_lane0;
  reg                 execute_ctrl3_TRAP_lane0_bypass;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0;
  wire       [15:0]   execute_ctrl3_down_Decode_UOP_ID_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_SEL_lane0;
  wire                execute_ctrl3_down_Prediction_ALIGNED_JUMPED_lane0;
  wire       [31:0]   execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0;
  wire       [31:0]   execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0;
  wire       [31:0]   execute_ctrl3_down_Decode_UOP_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire       [1:0]    execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0;
  wire       [31:0]   execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  wire       [31:0]   execute_ctrl3_down_Prediction_ALIGNED_JUMPED_PC_lane0;
  wire                execute_ctrl3_down_late0_BranchPlugin_logic_alu_EQ_lane0;
  wire                execute_ctrl3_down_SrcStageables_UNSIGNED_lane0;
  wire                execute_ctrl3_down_SrcStageables_ZERO_lane0;
  wire                execute_ctrl3_down_SrcStageables_REVERT_lane0;
  wire       [31:0]   execute_ctrl2_down_PC_lane0;
  wire       [63:0]   execute_ctrl2_down_integer_RS2_lane0;
  wire       [1:0]    execute_ctrl2_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  wire       [63:0]   execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   execute_ctrl2_down_integer_RS1_lane0;
  wire       [0:0]    execute_ctrl2_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  wire       [63:0]   execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0;
  wire       [31:0]   execute_ctrl2_down_Decode_UOP_lane0;
  wire       [1:0]    execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  wire                execute_ctrl3_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  wire       [1:0]    execute_ctrl2_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  wire                execute_ctrl2_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  reg                 execute_ctrl2_up_LANE_SEL_lane0;
  wire       [1:0]    execute_ctrl1_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  wire                execute_ctrl1_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  wire                execute_ctrl1_down_SrcStageables_UNSIGNED_lane0;
  wire                execute_ctrl1_down_SrcStageables_ZERO_lane0;
  wire                execute_ctrl1_down_SrcStageables_REVERT_lane0;
  wire       [31:0]   execute_ctrl0_down_PC_lane0;
  wire       [63:0]   execute_ctrl0_down_integer_RS2_lane0;
  wire       [1:0]    execute_ctrl0_down_early0_SrcPlugin_logic_SRC2_CTRL_lane0;
  wire       [63:0]   execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   execute_ctrl0_down_integer_RS1_lane0;
  wire       [0:0]    execute_ctrl0_down_early0_SrcPlugin_logic_SRC1_CTRL_lane0;
  wire       [63:0]   execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0;
  wire       [2:0]    execute_ctrl1_down_early0_EnvPlugin_OP_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_IS_JAL_lane0;
  wire                execute_ctrl1_up_COMMIT_lane0;
  wire                execute_ctrl1_down_COMMIT_lane0;
  reg                 execute_ctrl1_COMMIT_lane0_bypass;
  reg                 execute_ctrl1_up_TRAP_lane0;
  wire                execute_ctrl1_down_TRAP_lane0;
  reg                 execute_ctrl1_TRAP_lane0_bypass;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_SEL_lane0;
  wire                execute_ctrl1_down_Prediction_ALIGNED_JUMPED_lane0;
  wire       [31:0]   execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0;
  wire       [31:0]   execute_ctrl1_down_Prediction_ALIGNED_JUMPED_PC_lane0;
  wire                execute_ctrl1_down_early0_BranchPlugin_logic_alu_EQ_lane0;
  wire                decode_ctrls_2_lane0_upIsCancel;
  wire                decode_ctrls_2_lane0_downIsCancel;
  wire       [9:0]    decode_ctrls_0_down_Fetch_ID_0;
  wire       [31:0]   decode_ctrls_0_down_PC_0;
  wire       [9:0]    fetch_logic_ctrls_0_down_Fetch_ID;
  reg                 _zz_2;
  reg        [1:0]    BtbPlugin_logic_ras_ptr_pop_aheadValue;
  wire       [15:0]   execute_ctrl1_down_Decode_UOP_ID_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_FENCE_lane0;
  wire                execute_ctrl1_down_AguPlugin_ATOMIC_lane0;
  wire                execute_ctrl1_down_AguPlugin_SEL_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_onTrigger_HIT_lane0;
  wire                execute_ctrl1_down_AguPlugin_LOAD_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  wire                execute_ctrl1_down_AguPlugin_STORE_lane0;
  wire       [31:0]   execute_ctrl1_down_MMU_TRANSLATED_lane0;
  wire                execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0;
  wire       [1:0]    execute_ctrl1_down_AguPlugin_SIZE_lane0;
  wire       [63:0]   execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0;
  reg        [63:0]   execute_ctrl1_up_integer_RS2_lane0;
  reg        [63:0]   execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0;
  wire       [31:0]   execute_ctrl0_down_Decode_UOP_lane0;
  wire       [1:0]    execute_ctrl0_down_AguPlugin_SIZE_lane0;
  wire                fetch_logic_ctrls_2_up_isCanceling;
  wire                fetch_logic_ctrls_2_down_MMU_BYPASS_TRANSLATION;
  wire                fetch_logic_ctrls_2_down_Fetch_PC_FAULT;
  wire                fetch_logic_ctrls_2_down_MMU_HAZARD;
  wire                fetch_logic_ctrls_2_down_MMU_REFILL;
  wire                fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT;
  wire                fetch_logic_ctrls_2_down_MMU_ALLOW_EXECUTE;
  wire                fetch_logic_ctrls_2_down_MMU_PAGE_FAULT;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_pmpPort_ACCESS_FAULT;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HIT;
  wire                fetch_logic_ctrls_2_up_isCancel;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_HAZARD;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_error;
  wire       [23:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_address;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_error;
  wire       [23:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_address;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_error;
  wire       [23:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_address;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_error;
  wire       [23:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_address;
  wire                fetch_logic_ctrls_2_up_isReady;
  wire       [0:0]    fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_0;
  wire       [1:0]    fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_1;
  wire       [31:0]   fetch_logic_ctrls_2_down_MMU_TRANSLATED;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HIT;
  wire       [31:0]   fetch_logic_ctrls_1_down_MMU_TRANSLATED;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_0;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_1;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_2;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_3;
  wire       [1:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_HAZARD;
  wire       [31:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_0;
  wire       [31:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_1;
  wire       [31:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_2;
  wire       [31:0]   fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_3;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_0;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_1;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_2;
  wire                fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_3;
  wire       [31:0]   fetch_logic_ctrls_1_down_Fetch_WORD_PC;
  wire       [31:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0;
  wire       [31:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1;
  wire       [31:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2;
  wire       [31:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3;
  wire       [0:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
  wire       [1:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID;
  reg        [0:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_0;
  reg        [1:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_1;
  wire       [1:0]    fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS;
  wire                fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE;
  wire       [0:0]    fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
  wire       [1:0]    fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
  wire                fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID;
  reg                 fetch_logic_ctrls_1_up_valid;
  wire                fetch_logic_ctrls_1_up_ready;
  wire       [31:0]   fetch_logic_ctrls_0_down_Fetch_WORD_PC;
  reg                 _zz_fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235;
  wire       [0:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_0;
  wire       [1:0]    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_1;
  reg                 _zz_3;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_error;
  wire       [23:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_address;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_error;
  wire       [23:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_address;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_error;
  wire       [23:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_address;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded;
  wire                fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_error;
  wire       [23:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_address;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  wire       [63:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_0;
  wire       [63:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_1;
  wire       [63:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_2;
  wire       [63:0]   fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_3;
  reg                 _zz_7;
  wire       [31:0]   fetch_logic_ctrls_2_down_Prediction_WORD_JUMP_PC;
  wire       [0:0]    fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_TAKEN;
  wire       [0:0]    fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_BRANCH;
  wire       [9:0]    fetch_logic_ctrls_2_down_Fetch_ID;
  wire                fetch_logic_ctrls_2_down_TRAP;
  wire                fetch_logic_ctrls_2_down_isCancel;
  wire                fetch_logic_ctrls_2_down_isReady;
  wire                fetch_logic_ctrls_2_down_isValid;
  wire                fetch_logic_ctrls_2_down_ready;
  wire                decode_ctrls_0_up_isCancel;
  wire                decode_ctrls_0_up_isReady;
  wire                fetch_logic_ctrls_2_down_valid;
  wire       [31:0]   fetch_logic_ctrls_2_down_Fetch_WORD;
  wire                decode_ctrls_0_up_valid;
  wire                decode_ctrls_0_up_Prediction_ALIGN_REDO_0;
  wire       [0:0]    decode_ctrls_0_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  wire       [0:0]    decode_ctrls_0_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  wire       [31:0]   decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_PC_0;
  wire                decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_0;
  wire                decode_ctrls_0_up_TRAP_0;
  wire                decode_ctrls_0_up_Prediction_WORD_JUMPED_0;
  wire       [31:0]   decode_ctrls_0_up_Prediction_WORD_JUMP_PC_0;
  wire       [0:0]    decode_ctrls_0_up_Prediction_WORD_SLICES_TAKEN_0;
  wire       [0:0]    decode_ctrls_0_up_Prediction_WORD_SLICES_BRANCH_0;
  wire       [9:0]    decode_ctrls_0_up_Fetch_ID_0;
  wire       [9:0]    decode_ctrls_0_up_Decode_DOP_ID_0;
  wire       [31:0]   decode_ctrls_0_up_PC_0;
  reg        [31:0]   decode_ctrls_0_up_Decode_INSTRUCTION_RAW_0;
  wire                decode_ctrls_0_up_Decode_DECOMPRESSION_FAULT_0;
  wire       [31:0]   decode_ctrls_0_up_Decode_INSTRUCTION_0;
  wire                decode_ctrls_0_up_LANE_SEL_0;
  wire       [9:0]    decode_ctrls_0_down_Decode_DOP_ID_0;
  wire                decode_ctrls_0_lane0_upIsCancel;
  wire                decode_ctrls_0_lane0_downIsCancel;
  wire                decode_ctrls_0_up_isFiring;
  wire                fetch_logic_ctrls_2_up_isValid;
  wire       [0:0]    fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_LAST;
  wire                fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED;
  wire       [31:0]   fetch_logic_ctrls_2_down_Fetch_WORD_PC;
  wire       [0:0]    fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_MASK;
  (* keep , syn_keep *) wire       [31:0]   execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [31:0]   execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) reg        [31:0]   execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_ctrl1_down_PC_lane0;
  wire       [1:0]    execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0;
  wire       [31:0]   execute_ctrl1_down_Decode_UOP_lane0;
  wire                fetch_logic_ctrls_0_down_isFiring;
  wire       [63:0]   execute_ctrl3_down_late0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  wire                execute_ctrl3_down_IterativeShifterPlugin_LEFT_lane0;
  wire                execute_ctrl3_down_IterativeShifterPlugin_ARITHMETIC_lane0;
  wire                execute_ctrl3_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  wire                execute_ctrl3_down_IterativeShifterPlugin_IS_W_lane0;
  reg        [63:0]   execute_ctrl3_up_integer_RS1_lane0;
  wire                execute_ctrl3_down_late0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl3_up_LANE_SEL_lane0;
  wire                execute_ctrl3_down_isReady;
  wire                execute_ctrl3_down_late0_IntAluPlugin_SEL_lane0;
  wire       [63:0]   execute_ctrl3_down_late0_IntAluPlugin_ALU_RESULT_lane0;
  wire                execute_ctrl3_down_late0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl3_down_late0_SrcPlugin_LESS_lane0;
  wire                execute_ctrl3_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire       [63:0]   execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0;
  wire       [63:0]   execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0;
  wire       [1:0]    execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire       [63:0]   execute_ctrl2_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  wire                execute_ctrl2_down_early0_IterativeShifterPlugin_SEL_lane0;
  wire       [63:0]   execute_ctrl1_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  wire                execute_ctrl1_down_IterativeShifterPlugin_LEFT_lane0;
  wire                execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0;
  wire                execute_ctrl1_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  wire                execute_ctrl1_down_IterativeShifterPlugin_IS_W_lane0;
  reg        [63:0]   execute_ctrl1_up_integer_RS1_lane0;
  wire                execute_ctrl1_down_early0_IterativeShifterPlugin_SEL_lane0;
  reg                 execute_ctrl1_up_LANE_SEL_lane0;
  wire                execute_ctrl1_down_isReady;
  wire                execute_ctrl1_down_early0_IntAluPlugin_SEL_lane0;
  wire       [63:0]   execute_ctrl1_down_early0_IntAluPlugin_ALU_RESULT_lane0;
  wire                execute_ctrl1_down_early0_IntAluPlugin_ALU_SLTX_lane0;
  wire                execute_ctrl1_down_early0_SrcPlugin_LESS_lane0;
  wire                execute_ctrl1_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire       [63:0]   execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0;
  wire       [63:0]   execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0;
  wire       [63:0]   execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0;
  wire       [1:0]    execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                AlignerPlugin_api_singleFetch;
  wire                AlignerPlugin_api_downMoving;
  wire                AlignerPlugin_api_haltIt;
  wire                DispatchPlugin_api_haltDispatch;
  wire                execute_freeze_valid;
  wire       [0:0]    execute_lane0_api_hartsInflight;
  wire                execute_lane0_ctrls_1_upIsCancel;
  wire                execute_lane0_ctrls_1_downIsCancel;
  wire                CsrRamPlugin_api_holdRead;
  wire                CsrRamPlugin_api_holdWrite;
  reg                 CsrAccessPlugin_bus_decode_exception;
  wire                CsrAccessPlugin_bus_decode_read;
  wire                CsrAccessPlugin_bus_decode_write;
  wire       [11:0]   CsrAccessPlugin_bus_decode_address;
  reg                 CsrAccessPlugin_bus_decode_trap;
  wire                PrivilegedPlugin_api_lsuTriggerBus_load;
  wire                PrivilegedPlugin_api_lsuTriggerBus_store;
  wire       [31:0]   PrivilegedPlugin_api_lsuTriggerBus_virtual;
  wire       [1:0]    PrivilegedPlugin_api_lsuTriggerBus_size;
  wire                PrivilegedPlugin_api_harts_0_allowInterrupts;
  wire                PrivilegedPlugin_api_harts_0_allowException;
  wire                PrivilegedPlugin_api_harts_0_allowEbreakException;
  wire                PrivilegedPlugin_api_harts_0_fpuEnable;
  reg                 TrapPlugin_api_harts_0_redo;
  reg                 TrapPlugin_api_harts_0_askWake;
  reg                 TrapPlugin_api_harts_0_rvTrap;
  wire                TrapPlugin_api_harts_0_fsmBusy;
  wire                BtbPlugin_logic_pcPort_valid;
  wire                BtbPlugin_logic_pcPort_payload_fault;
  wire       [31:0]   BtbPlugin_logic_pcPort_payload_pc;
  wire                PcPlugin_logic_harts_0_aggregator_sortedByPriority_3_laneValid;
  wire                BtbPlugin_logic_flushPort_valid;
  wire                BtbPlugin_logic_flushPort_payload_self;
  reg                 FetchL1Plugin_logic_trapPort_valid;
  reg                 FetchL1Plugin_logic_trapPort_payload_exception;
  wire       [31:0]   FetchL1Plugin_logic_trapPort_payload_tval;
  wire       [0:0]    decode_logic_trapPending;
  reg                 DecoderPlugin_logic_forgetPort_valid;
  reg        [31:0]   DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice;
  wire       [0:0]    DispatchPlugin_logic_trapPendings;
  wire       [0:0]    execute_lane0_logic_trapPending;
  wire                early0_IntAluPlugin_logic_wb_valid;
  wire       [63:0]   early0_IntAluPlugin_logic_wb_payload;
  (* keep , syn_keep *) reg        [63:0]   early0_IntAluPlugin_logic_alu_bitwise /* synthesis syn_keep = 1 */ ;
  wire       [63:0]   early0_IntAluPlugin_logic_alu_result;
  wire                early0_IterativeShifterPlugin_logic_wb_valid;
  wire       [63:0]   early0_IterativeShifterPlugin_logic_wb_payload;
  reg                 early0_IterativeShifterPlugin_logic_shift_unscheduleRequest;
  wire                early0_IterativeShifterPlugin_logic_shift_selected;
  reg        [5:0]    early0_IterativeShifterPlugin_logic_shift_shamt;
  wire       [63:0]   early0_IterativeShifterPlugin_logic_shift_rs1;
  reg                 early0_IterativeShifterPlugin_logic_shift_busy;
  reg                 early0_IterativeShifterPlugin_logic_shift_flipped;
  reg        [5:0]    early0_IterativeShifterPlugin_logic_shift_amplitude;
  reg        [63:0]   early0_IterativeShifterPlugin_logic_shift_shiftReg;
  reg        [63:0]   early0_IterativeShifterPlugin_logic_shift_dataIn;
  wire                early0_IterativeShifterPlugin_logic_shift_done;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip_1;
  wire       [31:0]   _zz_early0_IterativeShifterPlugin_logic_shift_muxed;
  wire       [4:0]    _zz_early0_IterativeShifterPlugin_logic_shift_selector;
  reg        [4:0]    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1;
  wire       [4:0]    early0_IterativeShifterPlugin_logic_shift_selector;
  wire       [4:0]    _zz_early0_IterativeShifterPlugin_logic_shift_selector_2;
  reg        [4:0]    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_1;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_2;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_3;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_4;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_muxed_5;
  wire       [63:0]   early0_IterativeShifterPlugin_logic_shift_muxed;
  wire       [2:0]    _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1;
  wire                _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2;
  wire       [5:0]    early0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
  wire                early0_IterativeShifterPlugin_logic_shift_anyFlip;
  wire                when_IterativeShiftPlugin_l179;
  wire                when_IterativeShiftPlugin_l184;
  wire                when_IterativeShiftPlugin_l189;
  wire                early0_IterativeShifterPlugin_logic_shift_freezeIt;
  wire                execute_lane0_ctrls_2_upIsCancel;
  wire                execute_lane0_ctrls_2_downIsCancel;
  wire                early0_BranchPlugin_logic_wb_valid;
  wire       [63:0]   early0_BranchPlugin_logic_wb_payload;
  wire                early0_BranchPlugin_logic_pcPort_valid;
  wire                early0_BranchPlugin_logic_pcPort_payload_fault;
  wire       [31:0]   early0_BranchPlugin_logic_pcPort_payload_pc;
  wire                PcPlugin_logic_harts_0_aggregator_sortedByPriority_2_laneValid;
  wire                early0_BranchPlugin_logic_flushPort_valid;
  reg                 LsuCachelessPlugin_logic_trapPort_valid;
  reg                 LsuCachelessPlugin_logic_trapPort_payload_exception;
  wire       [31:0]   LsuCachelessPlugin_logic_trapPort_payload_tval;
  wire                CsrAccessPlugin_logic_wbWi_valid;
  wire       [63:0]   CsrAccessPlugin_logic_wbWi_payload;
  reg                 CsrAccessPlugin_logic_flushPort_valid;
  reg                 PrivilegedPlugin_logic_harts_0_xretAwayFromMachine;
  wire       [0:0]    PrivilegedPlugin_logic_harts_0_commitMask;
  reg                 PrivilegedPlugin_logic_harts_0_int_pending;
  reg        [1:0]    PrivilegedPlugin_logic_harts_0_privilege;
  wire                PrivilegedPlugin_logic_harts_0_withMachinePrivilege;
  wire                PrivilegedPlugin_logic_harts_0_withSupervisorPrivilege;
  wire                PrivilegedPlugin_logic_harts_0_hartRunning;
  wire                PrivilegedPlugin_logic_harts_0_debugMode;
  wire                _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue;
  reg                 PrivilegedPlugin_logic_harts_0_m_status_mie;
  reg                 PrivilegedPlugin_logic_harts_0_m_status_mpie;
  wire       [1:0]    PrivilegedPlugin_logic_harts_0_m_status_mpp;
  wire                PrivilegedPlugin_logic_harts_0_m_status_sd;
  wire                PrivilegedPlugin_logic_harts_0_m_status_tw;
  reg                 PrivilegedPlugin_logic_harts_0_m_status_mprv;
  wire                _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1;
  reg                 PrivilegedPlugin_logic_harts_0_m_cause_interrupt;
  reg        [3:0]    PrivilegedPlugin_logic_harts_0_m_cause_code;
  wire                _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_2;
  reg                 PrivilegedPlugin_logic_harts_0_m_ip_meip;
  reg                 PrivilegedPlugin_logic_harts_0_m_ip_mtip;
  reg                 PrivilegedPlugin_logic_harts_0_m_ip_msip;
  wire                _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_3;
  reg                 PrivilegedPlugin_logic_harts_0_m_ie_meie;
  reg                 PrivilegedPlugin_logic_harts_0_m_ie_mtie;
  reg                 PrivilegedPlugin_logic_harts_0_m_ie_msie;
  wire                _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_4;
  wire                _zz_when_TrapPlugin_l195;
  wire                _zz_when_TrapPlugin_l195_1;
  wire                _zz_when_TrapPlugin_l195_2;
  reg                 TrapPlugin_logic_fetchL1Invalidate_0_cmd_valid;
  reg                 TrapPlugin_logic_fetchL1Invalidate_0_cmd_ready;
  reg                 early0_EnvPlugin_logic_trapPort_valid;
  reg                 early0_EnvPlugin_logic_trapPort_payload_exception;
  wire       [31:0]   early0_EnvPlugin_logic_trapPort_payload_tval;
  reg        [3:0]    early0_EnvPlugin_logic_trapPort_payload_code;
  reg        [1:0]    early0_EnvPlugin_logic_trapPort_payload_arg;
  reg                 early0_EnvPlugin_logic_flushPort_valid;
  wire                late0_IntAluPlugin_logic_wb_valid;
  wire       [63:0]   late0_IntAluPlugin_logic_wb_payload;
  wire                execute_lane0_ctrls_3_upIsCancel;
  wire                execute_lane0_ctrls_3_downIsCancel;
  (* keep , syn_keep *) reg        [63:0]   late0_IntAluPlugin_logic_alu_bitwise /* synthesis syn_keep = 1 */ ;
  wire       [63:0]   late0_IntAluPlugin_logic_alu_result;
  wire                late0_IterativeShifterPlugin_logic_wb_valid;
  wire       [63:0]   late0_IterativeShifterPlugin_logic_wb_payload;
  reg                 late0_IterativeShifterPlugin_logic_shift_unscheduleRequest;
  wire                late0_IterativeShifterPlugin_logic_shift_selected;
  reg        [5:0]    late0_IterativeShifterPlugin_logic_shift_shamt;
  wire       [63:0]   late0_IterativeShifterPlugin_logic_shift_rs1;
  reg                 late0_IterativeShifterPlugin_logic_shift_busy;
  reg                 late0_IterativeShifterPlugin_logic_shift_flipped;
  reg        [5:0]    late0_IterativeShifterPlugin_logic_shift_amplitude;
  reg        [63:0]   late0_IterativeShifterPlugin_logic_shift_shiftReg;
  reg        [63:0]   late0_IterativeShifterPlugin_logic_shift_dataIn;
  wire                late0_IterativeShifterPlugin_logic_shift_done;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip_1;
  wire       [31:0]   _zz_late0_IterativeShifterPlugin_logic_shift_muxed;
  wire       [4:0]    _zz_late0_IterativeShifterPlugin_logic_shift_selector;
  reg        [4:0]    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1;
  wire       [4:0]    late0_IterativeShifterPlugin_logic_shift_selector;
  wire       [4:0]    _zz_late0_IterativeShifterPlugin_logic_shift_selector_2;
  reg        [4:0]    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_1;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_2;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_3;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_4;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_muxed_5;
  wire       [63:0]   late0_IterativeShifterPlugin_logic_shift_muxed;
  wire       [2:0]    _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1;
  wire                _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2;
  wire       [5:0]    late0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
  wire                late0_IterativeShifterPlugin_logic_shift_anyFlip;
  wire                when_IterativeShiftPlugin_l179_1;
  wire                when_IterativeShiftPlugin_l184_1;
  wire                when_IterativeShiftPlugin_l189_1;
  wire                late0_IterativeShifterPlugin_logic_shift_freezeIt;
  wire                late0_BranchPlugin_logic_wb_valid;
  wire       [63:0]   late0_BranchPlugin_logic_wb_payload;
  wire                late0_BranchPlugin_logic_pcPort_valid;
  wire                late0_BranchPlugin_logic_pcPort_payload_fault;
  wire       [31:0]   late0_BranchPlugin_logic_pcPort_payload_pc;
  wire                PcPlugin_logic_harts_0_aggregator_sortedByPriority_1_laneValid;
  wire                late0_BranchPlugin_logic_flushPort_valid;
  wire                WhiteboxerPlugin_logic_fetch_fire;
  reg        [31:0]   early0_BranchPlugin_pcCalc_target_a;
  reg        [63:0]   early0_BranchPlugin_pcCalc_target_b;
  wire       [1:0]    early0_BranchPlugin_pcCalc_slices;
  wire       [0:0]    AlignerPlugin_logic_maskGen_frontMasks_0;
  wire       [0:0]    AlignerPlugin_logic_maskGen_backMasks_0;
  wire       [31:0]   AlignerPlugin_logic_slices_data_0;
  wire       [31:0]   AlignerPlugin_logic_slices_data_1;
  wire       [1:0]    AlignerPlugin_logic_slices_mask;
  wire       [1:0]    AlignerPlugin_logic_slices_last;
  wire       [31:0]   AlignerPlugin_logic_slicesInstructions_0;
  wire       [31:0]   AlignerPlugin_logic_slicesInstructions_1;
  reg        [1:0]    AlignerPlugin_logic_scanners_0_usageMask;
  wire                AlignerPlugin_logic_scanners_0_checker_0_required;
  wire                AlignerPlugin_logic_scanners_0_checker_0_last;
  wire                AlignerPlugin_logic_scanners_0_checker_0_redo;
  wire                AlignerPlugin_logic_scanners_0_checker_0_present;
  wire                AlignerPlugin_logic_scanners_0_checker_0_valid;
  wire                AlignerPlugin_logic_scanners_0_redo;
  wire                AlignerPlugin_logic_scanners_0_valid;
  reg        [1:0]    AlignerPlugin_logic_scanners_1_usageMask;
  wire                AlignerPlugin_logic_scanners_1_checker_0_required;
  wire                AlignerPlugin_logic_scanners_1_checker_0_last;
  wire                AlignerPlugin_logic_scanners_1_checker_0_redo;
  wire                AlignerPlugin_logic_scanners_1_checker_0_present;
  wire                AlignerPlugin_logic_scanners_1_checker_0_valid;
  wire                AlignerPlugin_logic_scanners_1_redo;
  wire                AlignerPlugin_logic_scanners_1_valid;
  wire       [1:0]    AlignerPlugin_logic_usedMask_0;
  wire       [1:0]    AlignerPlugin_logic_usedMask_1;
  wire                AlignerPlugin_logic_extractors_0_first;
  wire       [1:0]    AlignerPlugin_logic_extractors_0_usableMask;
  wire       [1:0]    _zz_AlignerPlugin_logic_extractors_0_usableMask_bools_0;
  wire                AlignerPlugin_logic_extractors_0_usableMask_bools_0;
  wire                AlignerPlugin_logic_extractors_0_usableMask_bools_1;
  reg        [1:0]    _zz_AlignerPlugin_logic_extractors_0_slicesOh;
  wire       [1:0]    AlignerPlugin_logic_extractors_0_slicesOh;
  wire                _zz_AlignerPlugin_logic_extractors_0_redo;
  wire                _zz_AlignerPlugin_logic_extractors_0_redo_1;
  reg                 AlignerPlugin_logic_extractors_0_redo;
  wire       [0:0]    AlignerPlugin_logic_extractors_0_localMask;
  wire       [1:0]    AlignerPlugin_logic_extractors_0_usageMask;
  reg                 AlignerPlugin_logic_extractors_0_valid;
  wire       [31:0]   AlignerPlugin_logic_extractors_0_ctx_pc;
  wire       [31:0]   AlignerPlugin_logic_extractors_0_ctx_instruction;
  wire       [9:0]    AlignerPlugin_logic_extractors_0_ctx_hm_Fetch_ID;
  wire       [0:0]    AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_BRANCH;
  wire       [0:0]    AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_TAKEN;
  wire       [31:0]   AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMP_PC;
  wire                AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMPED;
  wire                AlignerPlugin_logic_extractors_0_ctx_trap;
  wire                when_AlignerPlugin_l163;
  reg        [9:0]    AlignerPlugin_logic_feeder_harts_0_dopId;
  wire                when_AlignerPlugin_l173;
  wire                AlignerPlugin_logic_feeder_lanes_0_valid;
  wire                AlignerPlugin_logic_feeder_lanes_0_isRvc;
  wire                AlignerPlugin_logic_feeder_lanes_0_onBtb_didPrediction;
  reg        [31:0]   AlignerPlugin_logic_buffer_data;
  reg        [0:0]    AlignerPlugin_logic_buffer_mask;
  reg        [0:0]    AlignerPlugin_logic_buffer_last;
  reg        [31:0]   AlignerPlugin_logic_buffer_pc;
  reg                 AlignerPlugin_logic_buffer_trap;
  reg        [9:0]    AlignerPlugin_logic_buffer_hm_Fetch_ID;
  reg        [0:0]    AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_BRANCH;
  reg        [0:0]    AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_TAKEN;
  reg        [31:0]   AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMP_PC;
  reg                 AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMPED;
  wire       [63:0]   _zz_AlignerPlugin_logic_slices_data_0;
  wire                when_AlignerPlugin_l243;
  wire                when_AlignerPlugin_l244;
  wire                AlignerPlugin_logic_buffer_downFire;
  wire       [1:0]    AlignerPlugin_logic_buffer_usedMask;
  wire                AlignerPlugin_logic_buffer_haltUp;
  wire                when_AlignerPlugin_l259;
  reg        [3:0]    CsrAccessPlugin_bus_decode_trapCode;
  wire                CsrAccessPlugin_bus_read_valid;
  wire                CsrAccessPlugin_bus_read_moving;
  wire       [11:0]   CsrAccessPlugin_bus_read_address;
  reg                 CsrAccessPlugin_bus_read_halt;
  wire       [63:0]   CsrAccessPlugin_bus_read_toWriteBits;
  wire       [63:0]   CsrAccessPlugin_bus_read_data;
  wire                CsrAccessPlugin_bus_write_valid;
  wire                CsrAccessPlugin_bus_write_moving;
  reg                 CsrAccessPlugin_bus_write_halt;
  reg        [63:0]   CsrAccessPlugin_bus_write_bits;
  wire       [11:0]   CsrAccessPlugin_bus_write_address;
  reg        [3:0]    FetchL1Plugin_logic_trapPort_payload_code;
  reg        [1:0]    FetchL1Plugin_logic_trapPort_payload_arg;
  wire                FetchL1Plugin_logic_banks_0_write_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_0_write_payload_address;
  wire       [63:0]   FetchL1Plugin_logic_banks_0_write_payload_data;
  wire                FetchL1Plugin_logic_banks_0_read_cmd_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_0_read_cmd_payload;
  (* keep , syn_keep *) wire       [63:0]   FetchL1Plugin_logic_banks_0_read_rsp /* synthesis syn_keep = 1 */ ;
  wire                FetchL1Plugin_logic_banks_1_write_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_1_write_payload_address;
  wire       [63:0]   FetchL1Plugin_logic_banks_1_write_payload_data;
  wire                FetchL1Plugin_logic_banks_1_read_cmd_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_1_read_cmd_payload;
  (* keep , syn_keep *) wire       [63:0]   FetchL1Plugin_logic_banks_1_read_rsp /* synthesis syn_keep = 1 */ ;
  wire                FetchL1Plugin_logic_banks_2_write_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_2_write_payload_address;
  wire       [63:0]   FetchL1Plugin_logic_banks_2_write_payload_data;
  wire                FetchL1Plugin_logic_banks_2_read_cmd_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_2_read_cmd_payload;
  (* keep , syn_keep *) wire       [63:0]   FetchL1Plugin_logic_banks_2_read_rsp /* synthesis syn_keep = 1 */ ;
  wire                FetchL1Plugin_logic_banks_3_write_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_3_write_payload_address;
  wire       [63:0]   FetchL1Plugin_logic_banks_3_write_payload_data;
  wire                FetchL1Plugin_logic_banks_3_read_cmd_valid;
  wire       [4:0]    FetchL1Plugin_logic_banks_3_read_cmd_payload;
  (* keep , syn_keep *) wire       [63:0]   FetchL1Plugin_logic_banks_3_read_rsp /* synthesis syn_keep = 1 */ ;
  reg        [3:0]    FetchL1Plugin_logic_waysWrite_mask;
  reg        [1:0]    FetchL1Plugin_logic_waysWrite_address;
  reg                 FetchL1Plugin_logic_waysWrite_tag_loaded;
  reg                 FetchL1Plugin_logic_waysWrite_tag_error;
  reg        [23:0]   FetchL1Plugin_logic_waysWrite_tag_address;
  wire                FetchL1Plugin_logic_ways_0_read_cmd_valid;
  wire       [1:0]    FetchL1Plugin_logic_ways_0_read_cmd_payload;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_0_read_rsp_loaded /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_0_read_rsp_error /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [23:0]   FetchL1Plugin_logic_ways_0_read_rsp_address /* synthesis syn_keep = 1 */ ;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_0_read_rsp_loaded;
  wire                FetchL1Plugin_logic_ways_1_read_cmd_valid;
  wire       [1:0]    FetchL1Plugin_logic_ways_1_read_cmd_payload;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_1_read_rsp_loaded /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_1_read_rsp_error /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [23:0]   FetchL1Plugin_logic_ways_1_read_rsp_address /* synthesis syn_keep = 1 */ ;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_1_read_rsp_loaded;
  wire                FetchL1Plugin_logic_ways_2_read_cmd_valid;
  wire       [1:0]    FetchL1Plugin_logic_ways_2_read_cmd_payload;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_2_read_rsp_loaded /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_2_read_rsp_error /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [23:0]   FetchL1Plugin_logic_ways_2_read_rsp_address /* synthesis syn_keep = 1 */ ;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_2_read_rsp_loaded;
  wire                FetchL1Plugin_logic_ways_3_read_cmd_valid;
  wire       [1:0]    FetchL1Plugin_logic_ways_3_read_cmd_payload;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_3_read_rsp_loaded /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire                FetchL1Plugin_logic_ways_3_read_rsp_error /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [23:0]   FetchL1Plugin_logic_ways_3_read_rsp_address /* synthesis syn_keep = 1 */ ;
  wire       [25:0]   _zz_FetchL1Plugin_logic_ways_3_read_rsp_loaded;
  reg                 FetchL1Plugin_logic_plru_write_valid;
  reg        [1:0]    FetchL1Plugin_logic_plru_write_payload_address;
  reg        [0:0]    FetchL1Plugin_logic_plru_write_payload_data_0;
  reg        [1:0]    FetchL1Plugin_logic_plru_write_payload_data_1;
  wire                FetchL1Plugin_logic_plru_read_cmd_valid;
  wire       [1:0]    FetchL1Plugin_logic_plru_read_cmd_payload;
  (* keep , syn_keep *) wire       [0:0]    FetchL1Plugin_logic_plru_read_rsp_0 /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [1:0]    FetchL1Plugin_logic_plru_read_rsp_1 /* synthesis syn_keep = 1 */ ;
  wire       [2:0]    _zz_FetchL1Plugin_logic_plru_read_rsp_0;
  wire                FetchL1Plugin_logic_invalidate_cmd_valid;
  wire                FetchL1Plugin_logic_invalidate_cmd_ready;
  reg                 FetchL1Plugin_logic_invalidate_canStart;
  reg        [2:0]    FetchL1Plugin_logic_invalidate_counter;
  wire       [2:0]    FetchL1Plugin_logic_invalidate_counterIncr;
  wire                FetchL1Plugin_logic_invalidate_done;
  wire                FetchL1Plugin_logic_invalidate_last;
  reg                 FetchL1Plugin_logic_invalidate_firstEver;
  wire                when_FetchL1Plugin_l222;
  wire                when_FetchL1Plugin_l229;
  wire                when_FetchL1Plugin_l234;
  wire                fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235;
  reg                 FetchL1Plugin_logic_refill_start_valid;
  wire       [31:0]   FetchL1Plugin_logic_refill_start_address;
  wire       [1:0]    FetchL1Plugin_logic_refill_start_wayToAllocate;
  wire                FetchL1Plugin_logic_refill_start_isIo;
  reg                 FetchL1Plugin_logic_refill_slots_0_valid;
  reg                 FetchL1Plugin_logic_refill_slots_0_cmdSent;
  (* keep , syn_keep *) reg        [31:0]   FetchL1Plugin_logic_refill_slots_0_address /* synthesis syn_keep = 1 */ ;
  reg                 FetchL1Plugin_logic_refill_slots_0_isIo;
  reg        [1:0]    FetchL1Plugin_logic_refill_slots_0_wayToAllocate;
  reg        [0:0]    FetchL1Plugin_logic_refill_slots_0_priority;
  wire                FetchL1Plugin_logic_refill_slots_0_askCmd;
  reg        [31:0]   FetchL1Plugin_logic_refill_pushCounter;
  wire                FetchL1Plugin_logic_refill_hazard;
  wire                when_FetchL1Plugin_l273;
  wire                when_FetchL1Plugin_l295;
  wire       [0:0]    FetchL1Plugin_logic_refill_onCmd_oh;
  (* keep , syn_keep *) reg        [0:0]    FetchL1Plugin_logic_refill_onRsp_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                FetchL1Plugin_logic_refill_onRsp_holdHarts;
  wire                fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l319;
  reg                 FetchL1Plugin_logic_refill_onRsp_firstCycle;
  wire                FetchL1Plugin_logic_bus_rsp_fire;
  wire       [1:0]    FetchL1Plugin_logic_refill_onRsp_wayToAllocate;
  wire       [31:0]   FetchL1Plugin_logic_refill_onRsp_address;
  wire                when_FetchL1Plugin_l326;
  wire       [1:0]    _zz_FetchL1Plugin_logic_banks_0_write_payload_address;
  wire       [1:0]    _zz_FetchL1Plugin_logic_banks_1_write_payload_address;
  wire       [1:0]    _zz_FetchL1Plugin_logic_banks_2_write_payload_address;
  wire       [1:0]    _zz_FetchL1Plugin_logic_banks_3_write_payload_address;
  wire                when_FetchL1Plugin_l352;
  wire                FetchL1Plugin_logic_cmd_doIt;
  wire                _zz_FetchL1Plugin_logic_bankMux_reduced_wayId;
  wire                _zz_FetchL1Plugin_logic_bankMux_reduced_wayId_1;
  wire       [1:0]    FetchL1Plugin_logic_bankMux_reduced_wayId;
  wire       [1:0]    FetchL1Plugin_logic_bankMux_reduced_bankId;
  wire       [31:0]   FetchL1Plugin_logic_ctrl_pmaPort_cmd_address;
  wire                FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault;
  wire                FetchL1Plugin_logic_ctrl_pmaPort_rsp_io;
  wire       [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_0;
  wire       [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_1;
  wire       [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_evict_id;
  wire       [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_id;
  wire       [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_0;
  reg        [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_1;
  wire                FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_0;
  wire                FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_1;
  wire                FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_0_state;
  wire       [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_stateSel;
  wire                FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_state;
  wire       [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_core_update_logic_1_sel;
  wire                FetchL1Plugin_logic_ctrl_plruLogic_buffer_valid;
  wire       [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_address;
  wire       [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_0;
  wire       [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_1;
  reg                 FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_valid;
  reg        [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_address;
  reg        [0:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_0;
  reg        [1:0]    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_1;
  wire                FetchL1Plugin_logic_ctrl_dataAccessFault;
  reg                 FetchL1Plugin_logic_ctrl_trapSent;
  reg                 FetchL1Plugin_logic_ctrl_allowRefill;
  wire                when_FetchL1Plugin_l496;
  wire                when_FetchL1Plugin_l502;
  wire                when_FetchL1Plugin_l509;
  wire                when_FetchL1Plugin_l542;
  wire                when_FetchL1Plugin_l555;
  wire                when_FetchL1Plugin_l559;
  reg                 FetchL1Plugin_logic_ctrl_firstCycle;
  wire                when_FetchL1Plugin_l563;
  wire                when_FetchL1Plugin_l580;
  wire       [2:0]    _zz_FetchL1Plugin_logic_plru_write_payload_data_0;
  reg        [3:0]    LsuCachelessPlugin_logic_trapPort_payload_code;
  reg        [1:0]    LsuCachelessPlugin_logic_trapPort_payload_arg;
  reg                 LsuCachelessPlugin_logic_flushPort_valid;
  wire       [15:0]   LsuCachelessPlugin_logic_flushPort_payload_uopId;
  wire                LsuCachelessPlugin_logic_flushPort_payload_self;
  wire                LsuCachelessPlugin_logic_iwb_valid;
  wire       [63:0]   LsuCachelessPlugin_logic_iwb_payload;
  wire                execute_lane0_ctrls_0_upIsCancel;
  wire                execute_lane0_ctrls_0_downIsCancel;
  wire       [31:0]   LsuCachelessPlugin_logic_onPma_port_cmd_address;
  wire       [1:0]    LsuCachelessPlugin_logic_onPma_port_cmd_size;
  wire       [0:0]    LsuCachelessPlugin_logic_onPma_port_cmd_op;
  wire                LsuCachelessPlugin_logic_onPma_port_rsp_fault;
  wire                LsuCachelessPlugin_logic_onPma_port_rsp_io;
  wire                LsuCachelessPlugin_logic_cmdInflights;
  reg                 LsuCachelessPlugin_logic_onFork_skip;
  wire                when_LsuCachelessPlugin_l198;
  reg                 LsuCachelessPlugin_logic_onFork_askFenceReg;
  wire                LsuCachelessPlugin_logic_onFork_askFence;
  wire                LsuCachelessPlugin_logic_onFork_doFence;
  wire                LsuCachelessPlugin_logic_bus_cmd_fire;
  reg                 LsuCachelessPlugin_logic_onFork_cmdCounter_willIncrement;
  wire                LsuCachelessPlugin_logic_onFork_cmdCounter_willClear;
  reg        [0:0]    LsuCachelessPlugin_logic_onFork_cmdCounter_valueNext;
  reg        [0:0]    LsuCachelessPlugin_logic_onFork_cmdCounter_value;
  wire                LsuCachelessPlugin_logic_onFork_cmdCounter_willOverflowIfInc;
  wire                LsuCachelessPlugin_logic_onFork_cmdCounter_willOverflow;
  reg                 LsuCachelessPlugin_logic_onFork_cmdSent;
  wire                when_LsuCachelessPlugin_l203;
  reg                 LsuCachelessPlugin_logic_bus_cmd_valid_regNext;
  reg                 LsuCachelessPlugin_logic_bus_cmd_ready_regNext;
  wire                LsuCachelessPlugin_logic_bus_cmd_isStall;
  reg                 LsuCachelessPlugin_logic_bus_cmd_isStall_regNext;
  reg        [0:0]    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_id;
  reg                 LsuCachelessPlugin_logic_bus_cmd_payload_regNext_write;
  reg        [31:0]   LsuCachelessPlugin_logic_bus_cmd_payload_regNext_address;
  reg        [63:0]   LsuCachelessPlugin_logic_bus_cmd_payload_regNext_data;
  reg        [1:0]    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_size;
  reg        [7:0]    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_mask;
  reg                 LsuCachelessPlugin_logic_bus_cmd_payload_regNext_io;
  reg                 LsuCachelessPlugin_logic_bus_cmd_payload_regNext_fromHart;
  reg        [15:0]   LsuCachelessPlugin_logic_bus_cmd_payload_regNext_uopId;
  wire       [63:0]   LsuCachelessPlugin_logic_onFork_mapping_0_1;
  wire       [63:0]   LsuCachelessPlugin_logic_onFork_mapping_1_1;
  wire       [63:0]   LsuCachelessPlugin_logic_onFork_mapping_2_1;
  wire       [63:0]   LsuCachelessPlugin_logic_onFork_mapping_3_1;
  reg        [63:0]   _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data;
  reg        [7:0]    _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask;
  wire                LsuCachelessPlugin_logic_onFork_freezeIt;
  reg        [1:0]    BtbPlugin_logic_ras_ptr_push;
  reg        [1:0]    BtbPlugin_logic_ras_ptr_pop;
  reg                 BtbPlugin_logic_ras_ptr_pushIt;
  reg                 BtbPlugin_logic_ras_ptr_popIt;
  wire                BtbPlugin_logic_ras_readIt;
  reg        [29:0]   BtbPlugin_logic_ras_read;
  wire                BtbPlugin_logic_ras_write_valid;
  wire       [1:0]    BtbPlugin_logic_ras_write_payload_address;
  reg        [29:0]   BtbPlugin_logic_ras_write_payload_data;
  wire       [9:0]    WhiteboxerPlugin_logic_fetch_fetchId;
  wire                WhiteboxerPlugin_logic_decodes_0_fire;
  reg                 decode_ctrls_0_up_LANE_SEL_0_regNext;
  wire                when_CtrlLaneApi_l46;
  wire                WhiteboxerPlugin_logic_decodes_0_spawn;
  wire       [63:0]   WhiteboxerPlugin_logic_decodes_0_pc;
  wire       [9:0]    WhiteboxerPlugin_logic_decodes_0_fetchId;
  wire       [9:0]    WhiteboxerPlugin_logic_decodes_0_decodeId;
  wire       [15:0]   early0_BranchPlugin_logic_flushPort_payload_uopId;
  wire                early0_BranchPlugin_logic_flushPort_payload_self;
  reg                 early0_BranchPlugin_logic_trapPort_valid;
  wire                early0_BranchPlugin_logic_trapPort_payload_exception;
  wire       [31:0]   early0_BranchPlugin_logic_trapPort_payload_tval;
  wire       [3:0]    early0_BranchPlugin_logic_trapPort_payload_code;
  wire       [1:0]    early0_BranchPlugin_logic_trapPort_payload_arg;
  wire                early0_BranchPlugin_logic_alu_expectedMsb;
  wire       [31:0]   _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire       [2:0]    switch_Misc_l241;
  reg                 _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0;
  reg                 _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0_1;
  wire                early0_BranchPlugin_logic_jumpLogic_wrongCond;
  wire                early0_BranchPlugin_logic_jumpLogic_needFix;
  wire                early0_BranchPlugin_logic_jumpLogic_doIt;
  wire                when_BranchPlugin_l244;
  wire                early0_BranchPlugin_logic_jumpLogic_rdLink;
  wire                early0_BranchPlugin_logic_jumpLogic_rs1Link;
  wire                early0_BranchPlugin_logic_jumpLogic_rdEquRs1;
  wire       [15:0]   CsrAccessPlugin_logic_flushPort_payload_uopId;
  wire                CsrAccessPlugin_logic_flushPort_payload_self;
  reg                 CsrAccessPlugin_logic_trapPort_valid;
  reg                 CsrAccessPlugin_logic_trapPort_payload_exception;
  wire       [31:0]   CsrAccessPlugin_logic_trapPort_payload_tval;
  reg        [3:0]    CsrAccessPlugin_logic_trapPort_payload_code;
  wire       [1:0]    CsrAccessPlugin_logic_trapPort_payload_arg;
  wire       [15:0]   early0_EnvPlugin_logic_flushPort_payload_uopId;
  wire                early0_EnvPlugin_logic_flushPort_payload_self;
  wire       [15:0]   late0_BranchPlugin_logic_flushPort_payload_uopId;
  wire                late0_BranchPlugin_logic_flushPort_payload_self;
  reg                 late0_BranchPlugin_logic_trapPort_valid;
  wire                late0_BranchPlugin_logic_trapPort_payload_exception;
  wire       [31:0]   late0_BranchPlugin_logic_trapPort_payload_tval;
  wire       [3:0]    late0_BranchPlugin_logic_trapPort_payload_code;
  wire       [1:0]    late0_BranchPlugin_logic_trapPort_payload_arg;
  wire       [1:0]    PrivilegedPlugin_logic_defaultTrap_csrPrivilege;
  wire                PrivilegedPlugin_logic_defaultTrap_csrReadOnly;
  wire                when_PrivilegedPlugin_l681;
  wire       [31:0]   FetchL1Plugin_pmaBuilder_addressBits;
  wire                FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit;
  wire                FetchL1Plugin_pmaBuilder_onTransfers_0_argsHit;
  wire                FetchL1Plugin_pmaBuilder_onTransfers_0_hit;
  wire                _zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault;
  reg        [63:0]   _zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0;
  reg        [63:0]   _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0;
  reg        [63:0]   early0_SrcPlugin_logic_addsub_combined_rs2Patched;
  wire                lane0_IntFormatPlugin_logic_stages_0_wb_valid;
  reg        [63:0]   lane0_IntFormatPlugin_logic_stages_0_wb_payload;
  wire       [0:0]    lane0_IntFormatPlugin_logic_stages_0_hits;
  wire       [63:0]   lane0_IntFormatPlugin_logic_stages_0_raw;
  wire                lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_sels_0;
  reg                 _zz_lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_0_segments_0_doIt;
  wire                lane0_IntFormatPlugin_logic_stages_1_wb_valid;
  reg        [63:0]   lane0_IntFormatPlugin_logic_stages_1_wb_payload;
  wire       [1:0]    lane0_IntFormatPlugin_logic_stages_1_hits;
  wire       [63:0]   lane0_IntFormatPlugin_logic_stages_1_raw;
  wire                lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_sels_0;
  reg                 _zz_lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_1_segments_0_doIt;
  wire                lane0_IntFormatPlugin_logic_stages_2_wb_valid;
  reg        [63:0]   lane0_IntFormatPlugin_logic_stages_2_wb_payload;
  wire       [2:0]    lane0_IntFormatPlugin_logic_stages_2_hits;
  wire       [63:0]   lane0_IntFormatPlugin_logic_stages_2_raw;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_sels_0;
  reg                 _zz_lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_0_doIt;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_0;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_1;
  reg                 _zz_lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_1_doIt;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_0;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_1;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_2;
  reg                 _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value;
  wire                lane0_IntFormatPlugin_logic_stages_2_segments_2_doIt;
  reg        [63:0]   _zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0;
  reg        [63:0]   _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0;
  reg        [63:0]   late0_SrcPlugin_logic_addsub_combined_rs2Patched;
  wire                late0_BranchPlugin_logic_alu_expectedMsb;
  wire       [31:0]   _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  wire       [2:0]    switch_Misc_l241_1;
  reg                 _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0;
  reg                 _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0_1;
  wire                late0_BranchPlugin_logic_jumpLogic_wrongCond;
  wire                late0_BranchPlugin_logic_jumpLogic_needFix;
  wire                late0_BranchPlugin_logic_jumpLogic_doIt;
  wire                when_BranchPlugin_l244_1;
  wire                late0_BranchPlugin_logic_jumpLogic_rdLink;
  wire                late0_BranchPlugin_logic_jumpLogic_rs1Link;
  wire                late0_BranchPlugin_logic_jumpLogic_rdEquRs1;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_valid;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_ready;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_payload_pcOnLastSlice;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_payload_pcTarget;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_taken;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_isBranch;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_isPush;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_isPop;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_wasWrong;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_payload_badPredictedTarget;
  wire       [15:0]   late0_BranchPlugin_logic_jumpLogic_learn_payload_uopId;
  wire       [1:0]    early0_EnvPlugin_logic_exe_privilege;
  wire       [1:0]    early0_EnvPlugin_logic_exe_xretPriv;
  reg                 early0_EnvPlugin_logic_exe_commit;
  wire                early0_EnvPlugin_logic_exe_retKo;
  wire                early0_EnvPlugin_logic_exe_vmaKo;
  wire                when_EnvPlugin_l83;
  wire                when_EnvPlugin_l92;
  wire                when_EnvPlugin_l116;
  wire                when_EnvPlugin_l120;
  wire                LearnPlugin_logic_learn_valid;
  wire       [31:0]   LearnPlugin_logic_learn_payload_pcOnLastSlice;
  wire       [31:0]   LearnPlugin_logic_learn_payload_pcTarget;
  wire                LearnPlugin_logic_learn_payload_taken;
  wire                LearnPlugin_logic_learn_payload_isBranch;
  wire                LearnPlugin_logic_learn_payload_isPush;
  wire                LearnPlugin_logic_learn_payload_isPop;
  wire                LearnPlugin_logic_learn_payload_wasWrong;
  wire                LearnPlugin_logic_learn_payload_badPredictedTarget;
  wire       [15:0]   LearnPlugin_logic_learn_payload_uopId;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_valid;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_ready;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcOnLastSlice;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcTarget;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_taken;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isBranch;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPush;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPop;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_wasWrong;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_badPredictedTarget;
  wire       [15:0]   late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_uopId;
  wire                io_output_combStage_valid;
  wire                io_output_combStage_ready;
  wire       [31:0]   io_output_combStage_payload_pcOnLastSlice;
  wire       [31:0]   io_output_combStage_payload_pcTarget;
  wire                io_output_combStage_payload_taken;
  wire                io_output_combStage_payload_isBranch;
  wire                io_output_combStage_payload_isPush;
  wire                io_output_combStage_payload_isPop;
  wire                io_output_combStage_payload_wasWrong;
  wire                io_output_combStage_payload_badPredictedTarget;
  wire       [15:0]   io_output_combStage_payload_uopId;
  wire                io_output_combStage_toFlow_valid;
  wire       [31:0]   io_output_combStage_toFlow_payload_pcOnLastSlice;
  wire       [31:0]   io_output_combStage_toFlow_payload_pcTarget;
  wire                io_output_combStage_toFlow_payload_taken;
  wire                io_output_combStage_toFlow_payload_isBranch;
  wire                io_output_combStage_toFlow_payload_isPush;
  wire                io_output_combStage_toFlow_payload_isPop;
  wire                io_output_combStage_toFlow_payload_wasWrong;
  wire                io_output_combStage_toFlow_payload_badPredictedTarget;
  wire       [15:0]   io_output_combStage_toFlow_payload_uopId;
  wire                CsrRamPlugin_setup_initPort_valid;
  wire                CsrRamPlugin_setup_initPort_ready;
  wire       [1:0]    CsrRamPlugin_setup_initPort_address;
  wire       [63:0]   CsrRamPlugin_setup_initPort_data;
  reg        [15:0]   DecoderPlugin_logic_harts_0_uopId;
  wire                when_DecoderPlugin_l138;
  wire       [0:0]    DecoderPlugin_logic_interrupt_async;
  wire                when_DecoderPlugin_l146;
  reg        [0:0]    DecoderPlugin_logic_interrupt_buffered;
  wire                _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0;
  wire                _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0;
  wire                _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_1;
  wire                DecoderPlugin_logic_laneLogic_0_interruptPending;
  reg                 DecoderPlugin_logic_laneLogic_0_trapPort_valid;
  reg                 DecoderPlugin_logic_laneLogic_0_trapPort_payload_exception;
  wire       [31:0]   DecoderPlugin_logic_laneLogic_0_trapPort_payload_tval;
  reg        [3:0]    DecoderPlugin_logic_laneLogic_0_trapPort_payload_code;
  wire       [1:0]    DecoderPlugin_logic_laneLogic_0_trapPort_payload_arg;
  wire       [0:0]    DecoderPlugin_logic_laneLogic_0_trapPort_payload_laneAge;
  wire                DecoderPlugin_logic_laneLogic_0_fixer_isJb;
  wire                DecoderPlugin_logic_laneLogic_0_fixer_doIt;
  wire                DecoderPlugin_logic_laneLogic_0_completionPort_valid;
  wire       [15:0]   DecoderPlugin_logic_laneLogic_0_completionPort_payload_uopId;
  wire                DecoderPlugin_logic_laneLogic_0_completionPort_payload_trap;
  wire                DecoderPlugin_logic_laneLogic_0_completionPort_payload_commit;
  reg                 decode_ctrls_2_up_LANE_SEL_0_regNext;
  wire                when_CtrlLaneApi_l46_1;
  wire                when_DecoderPlugin_l222;
  wire                DecoderPlugin_logic_laneLogic_0_flushPort_valid;
  wire       [15:0]   DecoderPlugin_logic_laneLogic_0_flushPort_payload_uopId;
  wire                DecoderPlugin_logic_laneLogic_0_flushPort_payload_self;
  wire                when_DecoderPlugin_l240;
  wire       [15:0]   DecoderPlugin_logic_laneLogic_0_uopIdBase;
  wire       [7:0]    BtbPlugin_logic_onLearn_hash;
  reg                 BtbPlugin_logic_onLearn_port_valid;
  reg        [6:0]    BtbPlugin_logic_onLearn_port_payload_address;
  reg        [7:0]    BtbPlugin_logic_onLearn_port_payload_data_0_hash;
  wire       [29:0]   BtbPlugin_logic_onLearn_port_payload_data_0_pcTarget;
  reg                 BtbPlugin_logic_onLearn_port_payload_data_0_isBranch;
  reg                 BtbPlugin_logic_onLearn_port_payload_data_0_isPush;
  reg                 BtbPlugin_logic_onLearn_port_payload_data_0_isPop;
  reg                 BtbPlugin_logic_onLearn_port_payload_data_0_taken;
  reg        [0:0]    BtbPlugin_logic_onLearn_port_payload_mask;
  wire                CsrRamPlugin_csrMapper_read_valid;
  wire                CsrRamPlugin_csrMapper_read_ready;
  wire       [1:0]    CsrRamPlugin_csrMapper_read_address;
  wire       [63:0]   CsrRamPlugin_csrMapper_read_data;
  wire                CsrRamPlugin_csrMapper_write_valid;
  wire                CsrRamPlugin_csrMapper_write_ready;
  wire       [1:0]    CsrRamPlugin_csrMapper_write_address;
  wire       [63:0]   CsrRamPlugin_csrMapper_write_data;
  wire                when_LsuCachelessPlugin_l244;
  wire                when_LsuCachelessPlugin_l250;
  wire                when_LsuCachelessPlugin_l257;
  wire                when_LsuCachelessPlugin_l298;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_0_valid;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_0_inflight;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_0_payload_error;
  reg        [63:0]   LsuCachelessPlugin_logic_onJoin_buffers_0_payload_data;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_1_valid;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_1_inflight;
  reg                 LsuCachelessPlugin_logic_onJoin_buffers_1_payload_error;
  reg        [63:0]   LsuCachelessPlugin_logic_onJoin_buffers_1_payload_data;
  wire                LsuCachelessPlugin_logic_onJoin_busRspWithoutId_error;
  wire       [63:0]   LsuCachelessPlugin_logic_onJoin_busRspWithoutId_data;
  wire                LsuCachelessPlugin_logic_onJoin_pop;
  reg                 LsuCachelessPlugin_logic_onJoin_rspCounter_willIncrement;
  wire                LsuCachelessPlugin_logic_onJoin_rspCounter_willClear;
  reg        [0:0]    LsuCachelessPlugin_logic_onJoin_rspCounter_valueNext;
  reg        [0:0]    LsuCachelessPlugin_logic_onJoin_rspCounter_value;
  wire                LsuCachelessPlugin_logic_onJoin_rspCounter_willOverflowIfInc;
  wire                LsuCachelessPlugin_logic_onJoin_rspCounter_willOverflow;
  wire                LsuCachelessPlugin_logic_onJoin_readerValid;
  wire                LsuCachelessPlugin_logic_onJoin_busRspHit;
  wire                LsuCachelessPlugin_logic_onJoin_rspValid;
  wire                LsuCachelessPlugin_logic_onJoin_rspPayload_error;
  wire       [63:0]   LsuCachelessPlugin_logic_onJoin_rspPayload_data;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_0;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_1;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_2;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_3;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_4;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_5;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_6;
  wire       [7:0]    LsuCachelessPlugin_logic_onWb_rspSplits_7;
  reg        [63:0]   LsuCachelessPlugin_logic_onWb_rspShifted;
  wire                DispatchPlugin_logic_candidates_0_ctx_valid;
  reg        [1:0]    DispatchPlugin_logic_candidates_0_ctx_laneLayerHits;
  wire       [31:0]   DispatchPlugin_logic_candidates_0_ctx_uop;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED;
  wire       [31:0]   DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED_PC;
  wire       [0:0]    DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_TAKEN;
  wire       [0:0]    DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_BRANCH;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_FENCE_OLDER;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_MAY_FLUSH;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH_FROM_LANES;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_2;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_3;
  wire       [31:0]   DispatchPlugin_logic_candidates_0_ctx_hm_PC;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_TRAP;
  wire       [15:0]   DispatchPlugin_logic_candidates_0_ctx_hm_Decode_UOP_ID;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_RS1_ENABLE;
  wire       [4:0]    DispatchPlugin_logic_candidates_0_ctx_hm_RS1_PHYS;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_RS2_ENABLE;
  wire       [4:0]    DispatchPlugin_logic_candidates_0_ctx_hm_RS2_PHYS;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_RD_ENABLE;
  wire       [4:0]    DispatchPlugin_logic_candidates_0_ctx_hm_RD_PHYS;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0;
  wire                DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0;
  wire                DispatchPlugin_logic_candidates_0_fire;
  wire                DispatchPlugin_logic_candidates_0_cancel;
  reg        [1:0]    DispatchPlugin_logic_candidates_0_rsHazards;
  reg        [1:0]    DispatchPlugin_logic_candidates_0_reservationHazards;
  wire                DispatchPlugin_logic_candidates_0_flushHazards;
  wire                DispatchPlugin_logic_candidates_0_fenceOlderHazards;
  wire                DispatchPlugin_logic_candidates_0_moving;
  wire                DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_0_hazard;
  wire                DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_1_hazard;
  wire                DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_0_hazard;
  wire                DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_1_hazard;
  wire                DispatchPlugin_logic_reservationChecker_0_onLl_0_hit;
  wire                DispatchPlugin_logic_reservationChecker_0_onLl_1_hit;
  wire                DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_0;
  wire                DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_1;
  wire                DispatchPlugin_logic_flushChecker_0_oldersHazard;
  wire       [0:0]    DispatchPlugin_logic_fenceChecker_olderInflights;
  wire                DispatchPlugin_logic_feeds_0_sending;
  reg                 DispatchPlugin_logic_feeds_0_sent;
  wire                when_DispatchPlugin_l358;
  wire       [0:0]    DispatchPlugin_logic_scheduler_eusFree_0;
  wire       [0:0]    DispatchPlugin_logic_scheduler_eusFree_1;
  wire       [0:0]    DispatchPlugin_logic_scheduler_hartFree_0;
  wire       [0:0]    DispatchPlugin_logic_scheduler_hartFree_1;
  wire                DispatchPlugin_logic_scheduler_arbiters_0_candHazard;
  wire       [1:0]    DispatchPlugin_logic_scheduler_arbiters_0_layersHits;
  wire       [1:0]    _zz_DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0;
  wire                DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0;
  wire                DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_1;
  reg        [1:0]    _zz_DispatchPlugin_logic_scheduler_arbiters_0_layerOh;
  wire       [1:0]    DispatchPlugin_logic_scheduler_arbiters_0_layerOh;
  wire       [0:0]    DispatchPlugin_logic_scheduler_arbiters_0_eusOh;
  wire                DispatchPlugin_logic_scheduler_arbiters_0_doIt;
  wire       [0:0]    DispatchPlugin_logic_inserter_0_oh;
  wire                DispatchPlugin_logic_inserter_0_trap;
  wire                when_DispatchPlugin_l427;
  wire       [1:0]    DispatchPlugin_logic_inserter_0_layerOhUnfiltred;
  wire       [0:0]    DispatchPlugin_logic_inserter_0_layer_0_0;
  wire                DispatchPlugin_logic_inserter_0_layer_0_1;
  wire       [0:0]    DispatchPlugin_logic_inserter_0_layer_1_0;
  wire                DispatchPlugin_logic_inserter_0_layer_1_1;
  wire       [1:0]    _zz_execute_ctrl0_up_lane0_LAYER_SEL_lane0;
  wire       [1:0]    lane0_integer_WriteBackPlugin_logic_stages_0_hits;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_0_muxed;
  wire                lane0_integer_WriteBackPlugin_logic_stages_0_write_valid;
  wire       [15:0]   lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_uopId;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_data;
  wire       [0:0]    lane0_integer_WriteBackPlugin_logic_stages_1_hits;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_1_muxed;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_1_merged;
  wire                lane0_integer_WriteBackPlugin_logic_stages_1_write_valid;
  wire       [15:0]   lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_uopId;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_data;
  wire       [1:0]    lane0_integer_WriteBackPlugin_logic_stages_2_hits;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_2_muxed;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_2_merged;
  wire                lane0_integer_WriteBackPlugin_logic_stages_2_write_valid;
  wire       [15:0]   lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_uopId;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_data;
  wire                lane0_integer_WriteBackPlugin_logic_write_port_valid;
  wire       [4:0]    lane0_integer_WriteBackPlugin_logic_write_port_address;
  wire       [63:0]   lane0_integer_WriteBackPlugin_logic_write_port_data;
  wire       [15:0]   lane0_integer_WriteBackPlugin_logic_write_port_uopId;
  wire       [1:0]    CsrRamPlugin_csrMapper_ramAddress;
  wire       [11:0]   _zz_CsrRamPlugin_csrMapper_ramAddress;
  reg                 CsrRamPlugin_csrMapper_withRead;
  wire                when_CsrRamPlugin_l77;
  reg                 CsrRamPlugin_csrMapper_doWrite;
  reg                 CsrRamPlugin_csrMapper_fired;
  wire                when_CsrRamPlugin_l84;
  wire                when_CsrRamPlugin_l88;
  wire                PmpPlugin_logic_isMachine;
  wire                PmpPlugin_logic_checkInstruction;
  wire                PmpPlugin_logic_checkData;
  wire                FetchL1Plugin_logic_pmpPort_logic_portCheckData;
  wire       [19:0]   FetchL1Plugin_logic_pmpPort_logic_torCmpAddress;
  wire                LsuCachelessPlugin_logic_pmpPort_logic_portCheckData;
  wire       [19:0]   LsuCachelessPlugin_logic_pmpPort_logic_torCmpAddress;
  wire       [31:0]   LsuCachelessPlugin_pmaBuilder_addressBits;
  wire       [2:0]    LsuCachelessPlugin_pmaBuilder_argsBits;
  wire                LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit;
  wire                LsuCachelessPlugin_pmaBuilder_onTransfers_0_argsHit;
  wire                LsuCachelessPlugin_pmaBuilder_onTransfers_0_hit;
  wire                _zz_LsuCachelessPlugin_logic_onPma_port_rsp_fault;
  wire                _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0;
  wire                _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0;
  wire                _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1;
  wire                _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2;
  wire                TrapPlugin_logic_initHold;
  reg                 decode_ctrls_2_up_LANE_SEL_0_regNext_1;
  wire                when_CtrlLaneApi_l46_2;
  wire                WhiteboxerPlugin_logic_serializeds_0_fire;
  wire       [9:0]    WhiteboxerPlugin_logic_serializeds_0_decodeId;
  wire       [15:0]   WhiteboxerPlugin_logic_serializeds_0_microOpId;
  wire       [31:0]   WhiteboxerPlugin_logic_serializeds_0_microOp;
  reg                 execute_ctrl0_down_LANE_SEL_lane0_regNext;
  wire                when_CtrlLaneApi_l46_3;
  wire                WhiteboxerPlugin_logic_dispatches_0_fire;
  wire       [15:0]   WhiteboxerPlugin_logic_dispatches_0_microOpId;
  reg                 execute_ctrl1_down_LANE_SEL_lane0_regNext;
  wire                when_CtrlLaneApi_l46_4;
  wire                WhiteboxerPlugin_logic_executes_0_fire;
  wire       [15:0]   WhiteboxerPlugin_logic_executes_0_microOpId;
  wire                WhiteboxerPlugin_logic_csr_access_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_csr_access_payload_uopId;
  wire       [11:0]   WhiteboxerPlugin_logic_csr_access_payload_address;
  wire       [63:0]   WhiteboxerPlugin_logic_csr_access_payload_write;
  wire       [63:0]   WhiteboxerPlugin_logic_csr_access_payload_read;
  wire                WhiteboxerPlugin_logic_csr_access_payload_writeDone;
  wire                WhiteboxerPlugin_logic_csr_access_payload_readDone;
  wire       [7:0]    BtbPlugin_logic_onForget_hash;
  wire                BtbPlugin_logic_readPort_cmd_valid;
  wire       [6:0]    BtbPlugin_logic_readPort_cmd_payload;
  wire       [7:0]    BtbPlugin_logic_readPort_rsp_0_hash;
  wire       [29:0]   BtbPlugin_logic_readPort_rsp_0_pcTarget;
  wire                BtbPlugin_logic_readPort_rsp_0_isBranch;
  wire                BtbPlugin_logic_readPort_rsp_0_isPush;
  wire                BtbPlugin_logic_readPort_rsp_0_isPop;
  wire                BtbPlugin_logic_readPort_rsp_0_taken;
  wire       [41:0]   _zz_BtbPlugin_logic_readPort_rsp_0_hash;
  wire                fetch_logic_ctrls_0_haltRequest_BtbPlugin_l171;
  wire       [0:0]    BtbPlugin_logic_applyIt_chunksMask;
  wire       [0:0]    BtbPlugin_logic_applyIt_chunksTakenOh;
  wire                BtbPlugin_logic_applyIt_needIt;
  reg                 BtbPlugin_logic_applyIt_correctionSent;
  wire                when_BtbPlugin_l205;
  wire                BtbPlugin_logic_applyIt_doIt;
  wire       [7:0]    BtbPlugin_logic_applyIt_entry_hash;
  wire       [29:0]   BtbPlugin_logic_applyIt_entry_pcTarget;
  wire                BtbPlugin_logic_applyIt_entry_isBranch;
  wire                BtbPlugin_logic_applyIt_entry_isPush;
  wire                BtbPlugin_logic_applyIt_entry_isPop;
  wire                BtbPlugin_logic_applyIt_entry_taken;
  reg        [29:0]   BtbPlugin_logic_applyIt_pcTarget;
  wire                BtbPlugin_logic_applyIt_rasLogic_pushValid;
  wire       [31:0]   BtbPlugin_logic_applyIt_rasLogic_pushPc;
  wire                when_BtbPlugin_l218;
  reg                 TrapPlugin_logic_harts_0_crsPorts_read_valid;
  wire                TrapPlugin_logic_harts_0_crsPorts_read_ready;
  reg        [1:0]    TrapPlugin_logic_harts_0_crsPorts_read_address;
  wire       [63:0]   TrapPlugin_logic_harts_0_crsPorts_read_data;
  wire                AlignerPlugin_logic_buffer_flushIt;
  wire                AlignerPlugin_logic_buffer_readers_0_firstFromBuffer;
  wire                AlignerPlugin_logic_buffer_readers_0_lastFromBuffer;
  wire       [1:0]    _zz_AlignerPlugin_logic_extractors_0_ctx_instruction;
  wire                decode_logic_flushes_0_onLanes_0_doIt;
  wire                decode_logic_flushes_1_onLanes_0_doIt;
  wire                decode_logic_flushes_2_onLanes_0_doIt;
  reg                 TrapPlugin_logic_harts_0_crsPorts_write_valid;
  wire                TrapPlugin_logic_harts_0_crsPorts_write_ready;
  reg        [1:0]    TrapPlugin_logic_harts_0_crsPorts_write_address;
  reg        [63:0]   TrapPlugin_logic_harts_0_crsPorts_write_data;
  reg                 TrapPlugin_logic_harts_0_interrupt_valid;
  reg        [3:0]    TrapPlugin_logic_harts_0_interrupt_code;
  reg        [1:0]    TrapPlugin_logic_harts_0_interrupt_targetPrivilege;
  wire                when_TrapPlugin_l189;
  wire                when_TrapPlugin_l195;
  wire                when_TrapPlugin_l195_1;
  wire                when_TrapPlugin_l195_2;
  reg                 TrapPlugin_logic_harts_0_interrupt_validBuffer;
  wire                TrapPlugin_logic_harts_0_interrupt_pendingInterrupt;
  wire                when_TrapPlugin_l214;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_exception;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_arg;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_arg;
  wire       [3:0]    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception;
  wire       [38:0]   _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_exception;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_arg;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_exception;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_arg;
  wire       [3:0]    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_2;
  wire                _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_3;
  reg        [3:0]    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_oh;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_down_valid;
  wire                TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_arg;
  wire       [38:0]   _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception;
  reg                 TrapPlugin_logic_harts_0_trap_pending_state_exception;
  reg        [31:0]   TrapPlugin_logic_harts_0_trap_pending_state_tval;
  reg        [3:0]    TrapPlugin_logic_harts_0_trap_pending_state_code;
  reg        [1:0]    TrapPlugin_logic_harts_0_trap_pending_state_arg;
  reg        [31:0]   TrapPlugin_logic_harts_0_trap_pending_pc;
  reg        [0:0]    TrapPlugin_logic_harts_0_trap_pending_slices;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_xret_sourcePrivilege;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_pending_xret_targetPrivilege;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_exception_exceptionTargetPrivilegeUncapped;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_exception_code;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_exception_targetPrivilege;
  wire                execute_lane0_ctrls_4_upIsCancel;
  wire                execute_lane0_ctrls_4_downIsCancel;
  wire       [0:0]    TrapPlugin_logic_harts_0_trap_trigger_oh;
  wire                TrapPlugin_logic_harts_0_trap_trigger_valid;
  reg                 TrapPlugin_logic_harts_0_trap_whitebox_trap;
  reg                 TrapPlugin_logic_harts_0_trap_whitebox_interrupt;
  reg        [3:0]    TrapPlugin_logic_harts_0_trap_whitebox_code;
  reg                 TrapPlugin_logic_harts_0_trap_pcPort_valid;
  wire                TrapPlugin_logic_harts_0_trap_pcPort_payload_fault;
  reg        [31:0]   TrapPlugin_logic_harts_0_trap_pcPort_payload_pc;
  wire                PcPlugin_logic_harts_0_aggregator_sortedByPriority_0_laneValid;
  wire                TrapPlugin_logic_harts_0_trap_fsm_wantExit;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_wantStart;
  wire                TrapPlugin_logic_harts_0_trap_fsm_wantKill;
  wire                TrapPlugin_logic_harts_0_trap_fsm_inflightTrap;
  wire                TrapPlugin_logic_harts_0_trap_fsm_holdPort;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_wfi;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_buffer_i_valid;
  reg        [3:0]    TrapPlugin_logic_harts_0_trap_fsm_buffer_i_code;
  reg        [1:0]    TrapPlugin_logic_harts_0_trap_fsm_buffer_i_targetPrivilege;
  wire                TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_targetPrivilege;
  wire       [31:0]   TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_tval;
  wire       [3:0]    TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_code;
  wire                TrapPlugin_logic_harts_0_trap_fsm_resetToRunConditions_0;
  reg        [31:0]   TrapPlugin_logic_harts_0_trap_fsm_jumpTarget;
  wire       [0:0]    TrapPlugin_logic_harts_0_trap_fsm_jumpOffset;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_trapEnterDebug;
  wire                TrapPlugin_logic_harts_0_trap_fsm_triggerEbreak;
  reg                 TrapPlugin_logic_harts_0_trap_fsm_triggerEbreakReg;
  wire                when_TrapPlugin_l539;
  reg        [63:0]   TrapPlugin_logic_harts_0_trap_fsm_readed;
  wire       [1:0]    TrapPlugin_logic_harts_0_trap_fsm_xretPrivilege;
  wire                PcPlugin_logic_forcedSpawn;
  reg        [9:0]    PcPlugin_logic_harts_0_self_id;
  wire                PcPlugin_logic_harts_0_self_flow_valid;
  wire                PcPlugin_logic_harts_0_self_flow_payload_fault;
  wire       [31:0]   PcPlugin_logic_harts_0_self_flow_payload_pc;
  wire                PcPlugin_logic_harts_0_aggregator_sortedByPriority_4_laneValid;
  reg                 PcPlugin_logic_harts_0_self_increment;
  reg                 PcPlugin_logic_harts_0_self_fault;
  reg        [31:0]   PcPlugin_logic_harts_0_self_state;
  wire       [31:0]   PcPlugin_logic_harts_0_self_pc;
  wire                PcPlugin_logic_harts_0_aggregator_valids_0;
  wire                PcPlugin_logic_harts_0_aggregator_valids_1;
  wire                PcPlugin_logic_harts_0_aggregator_valids_2;
  wire                PcPlugin_logic_harts_0_aggregator_valids_3;
  wire                PcPlugin_logic_harts_0_aggregator_valids_4;
  wire       [4:0]    _zz_PcPlugin_logic_harts_0_aggregator_oh;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_oh_1;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_oh_2;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_oh_3;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_oh_4;
  reg        [4:0]    _zz_PcPlugin_logic_harts_0_aggregator_oh_5;
  wire       [4:0]    PcPlugin_logic_harts_0_aggregator_oh;
  wire       [31:0]   PcPlugin_logic_harts_0_aggregator_target;
  wire                PcPlugin_logic_harts_0_aggregator_fault;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_target;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_target_1;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_target_2;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_target_3;
  wire                _zz_PcPlugin_logic_harts_0_aggregator_target_4;
  wire                PcPlugin_logic_harts_0_holdComb;
  reg                 PcPlugin_logic_harts_0_holdReg;
  wire                PcPlugin_logic_harts_0_output_valid;
  wire                PcPlugin_logic_harts_0_output_ready;
  reg        [31:0]   PcPlugin_logic_harts_0_output_payload_pc;
  wire                PcPlugin_logic_harts_0_output_payload_fault;
  wire                PcPlugin_logic_harts_0_output_fire;
  wire                PcPlugin_logic_holdHalter_doIt;
  wire                fetch_logic_ctrls_0_haltRequest_PcPlugin_l136;
  wire                CsrAccessPlugin_logic_fsm_wantExit;
  reg                 CsrAccessPlugin_logic_fsm_wantStart;
  wire                CsrAccessPlugin_logic_fsm_wantKill;
  reg                 REG_CSR_1952;
  reg                 REG_CSR_1953;
  reg                 REG_CSR_1954;
  reg                 REG_CSR_3857;
  reg                 REG_CSR_3858;
  reg                 REG_CSR_3859;
  reg                 REG_CSR_3860;
  reg                 REG_CSR_769;
  reg                 REG_CSR_768;
  reg                 REG_CSR_834;
  reg                 REG_CSR_836;
  reg                 REG_CSR_772;
  reg                 REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter;
  reg                 REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter;
  reg                 REG_CSR_CsrRamPlugin_csrMapper_selFilter;
  reg                 REG_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter;
  reg                 CsrAccessPlugin_logic_fsm_regs_read;
  reg                 CsrAccessPlugin_logic_fsm_regs_write;
  wire       [63:0]   CsrAccessPlugin_logic_fsm_regs_rs1;
  reg        [63:0]   CsrAccessPlugin_logic_fsm_regs_aluInput;
  reg        [63:0]   CsrAccessPlugin_logic_fsm_regs_csrValue;
  reg        [63:0]   CsrAccessPlugin_logic_fsm_regs_onWriteBits;
  wire       [15:0]   CsrAccessPlugin_logic_fsm_regs_uopId;
  wire       [31:0]   CsrAccessPlugin_logic_fsm_regs_uop;
  wire                CsrAccessPlugin_logic_fsm_regs_doImm;
  wire                CsrAccessPlugin_logic_fsm_regs_doMask;
  wire                CsrAccessPlugin_logic_fsm_regs_doClear;
  wire       [4:0]    CsrAccessPlugin_logic_fsm_regs_rdPhys;
  wire                CsrAccessPlugin_logic_fsm_regs_rdEnable;
  reg                 CsrAccessPlugin_logic_fsm_regs_fire;
  wire       [11:0]   CsrAccessPlugin_logic_fsm_inject_csrAddress;
  wire                CsrAccessPlugin_logic_fsm_inject_immZero;
  wire                CsrAccessPlugin_logic_fsm_inject_srcZero;
  wire                CsrAccessPlugin_logic_fsm_inject_csrWrite;
  wire                CsrAccessPlugin_logic_fsm_inject_csrRead;
  wire                COMB_CSR_1952;
  wire                COMB_CSR_1953;
  wire                COMB_CSR_1954;
  wire                COMB_CSR_3857;
  wire                COMB_CSR_3858;
  wire                COMB_CSR_3859;
  wire                COMB_CSR_3860;
  wire                COMB_CSR_769;
  wire                COMB_CSR_768;
  wire                COMB_CSR_834;
  wire                COMB_CSR_836;
  wire                COMB_CSR_772;
  wire                COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter;
  wire                COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter;
  wire                COMB_CSR_CsrRamPlugin_csrMapper_selFilter;
  wire                COMB_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter;
  wire                CsrAccessPlugin_logic_fsm_inject_implemented;
  wire                CsrAccessPlugin_logic_fsm_inject_onDecodeDo;
  wire                when_CsrAccessPlugin_l155;
  wire                CsrAccessPlugin_logic_fsm_inject_trap;
  reg                 CsrAccessPlugin_logic_fsm_inject_unfreeze;
  wire                CsrAccessPlugin_logic_fsm_inject_iLogic_freeze;
  reg                 CsrAccessPlugin_logic_fsm_inject_flushReg;
  wire                when_CsrAccessPlugin_l209;
  reg                 CsrAccessPlugin_logic_fsm_inject_sampled;
  reg                 CsrAccessPlugin_logic_fsm_inject_trapReg;
  reg                 CsrAccessPlugin_logic_fsm_inject_busTrapReg;
  reg        [3:0]    CsrAccessPlugin_logic_fsm_inject_busTrapCodeReg;
  reg                 CsrAccessPlugin_logic_fsm_readLogic_onReadsDo;
  reg                 CsrAccessPlugin_logic_fsm_readLogic_onReadsFireDo;
  wire                when_CsrAccessPlugin_l264;
  wire       [63:0]   CsrAccessPlugin_logic_fsm_readLogic_csrValue;
  wire       [63:0]   CsrAccessPlugin_logic_fsm_writeLogic_alu_mask;
  wire       [63:0]   CsrAccessPlugin_logic_fsm_writeLogic_alu_masked;
  wire       [63:0]   CsrAccessPlugin_logic_fsm_writeLogic_alu_result;
  reg                 CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo;
  reg                 CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo;
  wire                when_CsrAccessPlugin_l359;
  wire                when_CsrAccessPlugin_l359_1;
  wire                when_CsrAccessPlugin_l359_2;
  wire                when_CsrAccessPlugin_l356;
  wire                when_CsrAccessPlugin_l356_1;
  wire                when_CsrAccessPlugin_l356_2;
  reg                 CsrAccessPlugin_logic_fsm_completion_valid;
  wire       [15:0]   CsrAccessPlugin_logic_fsm_completion_payload_uopId;
  wire                CsrAccessPlugin_logic_fsm_completion_payload_trap;
  wire                CsrAccessPlugin_logic_fsm_completion_payload_commit;
  wire                fetch_logic_flushes_0_doIt;
  wire                fetch_logic_ctrls_1_throwWhen_FetchPipelinePlugin_l44;
  wire                fetch_logic_flushes_1_doIt;
  wire                fetch_logic_ctrls_2_forgetsSingleRequest_FetchPipelinePlugin_l46;
  wire       [2:0]    CsrRamPlugin_logic_writeLogic_hits;
  wire                CsrRamPlugin_logic_writeLogic_hit;
  wire       [2:0]    CsrRamPlugin_logic_writeLogic_hits_ohFirst_input;
  wire       [2:0]    CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked;
  wire       [2:0]    CsrRamPlugin_logic_writeLogic_oh;
  wire                CsrRamPlugin_logic_writeLogic_port_valid;
  wire       [1:0]    CsrRamPlugin_logic_writeLogic_port_payload_address;
  wire       [63:0]   CsrRamPlugin_logic_writeLogic_port_payload_data;
  wire                _zz_TrapPlugin_logic_harts_0_crsPorts_write_ready;
  wire                _zz_CsrRamPlugin_csrMapper_write_ready;
  wire                _zz_CsrRamPlugin_setup_initPort_ready;
  wire       [1:0]    CsrRamPlugin_logic_readLogic_hits;
  wire                CsrRamPlugin_logic_readLogic_hit;
  wire       [1:0]    CsrRamPlugin_logic_readLogic_hits_ohFirst_input;
  wire       [1:0]    CsrRamPlugin_logic_readLogic_hits_ohFirst_masked;
  wire       [1:0]    CsrRamPlugin_logic_readLogic_oh;
  wire                _zz_CsrRamPlugin_logic_readLogic_sel;
  wire       [0:0]    CsrRamPlugin_logic_readLogic_sel;
  wire                CsrRamPlugin_logic_readLogic_port_cmd_valid;
  wire       [1:0]    CsrRamPlugin_logic_readLogic_port_cmd_payload;
  wire       [63:0]   CsrRamPlugin_logic_readLogic_port_rsp;
  reg        [1:0]    CsrRamPlugin_logic_readLogic_ohReg;
  reg                 CsrRamPlugin_logic_readLogic_busy;
  reg        [2:0]    CsrRamPlugin_logic_flush_counter;
  wire                CsrRamPlugin_logic_flush_done;
  wire                execute_lane0_bypasser_integer_RS1_port_valid;
  wire       [4:0]    execute_lane0_bypasser_integer_RS1_port_address;
  wire       [63:0]   execute_lane0_bypasser_integer_RS1_port_data;
  reg        [3:0]    execute_lane0_bypasser_integer_RS1_bypassEnables;
  wire       [3:0]    _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_bools_1;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_bools_2;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_bools_3;
  reg        [3:0]    _zz_execute_lane0_bypasser_integer_RS1_sel;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_1;
  wire                execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_2;
  wire       [3:0]    execute_lane0_bypasser_integer_RS1_sel;
  wire       [2:0]    _zz_execute_ctrl0_down_integer_RS1_lane0;
  (* keep , syn_keep *) reg        [63:0]   _zz_execute_ctrl0_down_integer_RS1_lane0_1 /* synthesis syn_keep = 1 */ ;
  wire                when_ExecuteLanePlugin_l190;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_selfHit;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_hit;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_selfHit;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_youngerHits_0;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_hit;
  wire       [1:0]    execute_lane0_bypasser_integer_RS1_along_bypasses_0_hits;
  wire       [2:0]    _zz_execute_ctrl1_integer_RS1_lane0_bypass;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_selfHit;
  wire                execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_hit;
  wire       [0:0]    execute_lane0_bypasser_integer_RS1_along_bypasses_1_hits;
  wire       [1:0]    _zz_execute_ctrl2_integer_RS1_lane0_bypass;
  wire                execute_lane0_bypasser_integer_RS2_port_valid;
  wire       [4:0]    execute_lane0_bypasser_integer_RS2_port_address;
  wire       [63:0]   execute_lane0_bypasser_integer_RS2_port_data;
  reg        [3:0]    execute_lane0_bypasser_integer_RS2_bypassEnables;
  wire       [3:0]    _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_bools_1;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_bools_2;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_bools_3;
  reg        [3:0]    _zz_execute_lane0_bypasser_integer_RS2_sel;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_1;
  wire                execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_2;
  wire       [3:0]    execute_lane0_bypasser_integer_RS2_sel;
  wire       [2:0]    _zz_execute_ctrl0_down_integer_RS2_lane0;
  (* keep , syn_keep *) reg        [63:0]   _zz_execute_ctrl0_down_integer_RS2_lane0_1 /* synthesis syn_keep = 1 */ ;
  wire                when_ExecuteLanePlugin_l190_1;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_selfHit;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_hit;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_selfHit;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_youngerHits_0;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_hit;
  wire       [1:0]    execute_lane0_bypasser_integer_RS2_along_bypasses_0_hits;
  wire       [2:0]    _zz_execute_ctrl1_integer_RS2_lane0_bypass;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_selfHit;
  wire                execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_hit;
  wire       [0:0]    execute_lane0_bypasser_integer_RS2_along_bypasses_1_hits;
  wire       [1:0]    _zz_execute_ctrl2_integer_RS2_lane0_bypass;
  wire                execute_lane0_logic_completions_onCtrl_0_port_valid;
  wire       [15:0]   execute_lane0_logic_completions_onCtrl_0_port_payload_uopId;
  wire                execute_lane0_logic_completions_onCtrl_0_port_payload_trap;
  wire                execute_lane0_logic_completions_onCtrl_0_port_payload_commit;
  wire                execute_lane0_logic_completions_onCtrl_1_port_valid;
  wire       [15:0]   execute_lane0_logic_completions_onCtrl_1_port_payload_uopId;
  wire                execute_lane0_logic_completions_onCtrl_1_port_payload_trap;
  wire                execute_lane0_logic_completions_onCtrl_1_port_payload_commit;
  wire                execute_lane0_logic_completions_onCtrl_2_port_valid;
  wire       [15:0]   execute_lane0_logic_completions_onCtrl_2_port_payload_uopId;
  wire                execute_lane0_logic_completions_onCtrl_2_port_payload_trap;
  wire                execute_lane0_logic_completions_onCtrl_2_port_payload_commit;
  wire       [32:0]   execute_lane0_logic_decoding_decodingBits;
  wire                _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0;
  wire                _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
  wire                _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  wire                _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_1;
  wire                _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_2;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_1;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_2;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  wire                _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_1;
  wire                _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  wire                _zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  wire                _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0;
  wire                _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire                _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0;
  wire                _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0;
  wire       [1:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  wire       [1:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1;
  wire       [1:0]    _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2;
  wire                _zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0_1;
  wire                _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0;
  wire                _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0;
  wire       [1:0]    _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0;
  wire       [1:0]    _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1;
  wire       [1:0]    _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2;
  wire                _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0;
  wire       [2:0]    _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1;
  wire       [2:0]    _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2;
  wire       [2:0]    _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3;
  wire       [1:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1;
  wire       [1:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2;
  wire       [1:0]    _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3;
  wire                when_ExecuteLanePlugin_l300;
  wire                when_ExecuteLanePlugin_l300_1;
  wire                when_ExecuteLanePlugin_l300_2;
  wire                when_ExecuteLanePlugin_l300_3;
  wire                WhiteboxerPlugin_logic_csr_port_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_csr_port_payload_uopId;
  wire       [11:0]   WhiteboxerPlugin_logic_csr_port_payload_address;
  wire       [63:0]   WhiteboxerPlugin_logic_csr_port_payload_write;
  wire       [63:0]   WhiteboxerPlugin_logic_csr_port_payload_read;
  wire                WhiteboxerPlugin_logic_csr_port_payload_writeDone;
  wire                WhiteboxerPlugin_logic_csr_port_payload_readDone;
  wire                WhiteboxerPlugin_logic_rfWrites_ports_0_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_rfWrites_ports_0_payload_uopId;
  wire       [63:0]   WhiteboxerPlugin_logic_rfWrites_ports_0_payload_data;
  wire                WhiteboxerPlugin_logic_rfWrites_ports_1_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_rfWrites_ports_1_payload_uopId;
  wire       [63:0]   WhiteboxerPlugin_logic_rfWrites_ports_1_payload_data;
  wire                WhiteboxerPlugin_logic_rfWrites_ports_2_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_rfWrites_ports_2_payload_uopId;
  wire       [63:0]   WhiteboxerPlugin_logic_rfWrites_ports_2_payload_data;
  wire                WhiteboxerPlugin_logic_completions_ports_0_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_completions_ports_0_payload_uopId;
  wire                WhiteboxerPlugin_logic_completions_ports_0_payload_trap;
  wire                WhiteboxerPlugin_logic_completions_ports_0_payload_commit;
  wire                WhiteboxerPlugin_logic_completions_ports_1_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_completions_ports_1_payload_uopId;
  wire                WhiteboxerPlugin_logic_completions_ports_1_payload_trap;
  wire                WhiteboxerPlugin_logic_completions_ports_1_payload_commit;
  wire                WhiteboxerPlugin_logic_completions_ports_2_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_completions_ports_2_payload_uopId;
  wire                WhiteboxerPlugin_logic_completions_ports_2_payload_trap;
  wire                WhiteboxerPlugin_logic_completions_ports_2_payload_commit;
  wire                WhiteboxerPlugin_logic_completions_ports_3_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_completions_ports_3_payload_uopId;
  wire                WhiteboxerPlugin_logic_completions_ports_3_payload_trap;
  wire                WhiteboxerPlugin_logic_completions_ports_3_payload_commit;
  wire                WhiteboxerPlugin_logic_commits_ports_0_oh_0;
  wire                WhiteboxerPlugin_logic_commits_ports_0_valid;
  wire       [31:0]   WhiteboxerPlugin_logic_commits_ports_0_pc;
  wire       [31:0]   WhiteboxerPlugin_logic_commits_ports_0_uop;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_0_valid;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_0_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_1_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_1_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_1_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_2_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_2_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_2_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_3_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_3_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_3_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_4_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_4_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_4_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_5_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_5_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_5_payload_self;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_6_valid;
  wire       [15:0]   WhiteboxerPlugin_logic_reschedules_flushes_6_payload_uopId;
  wire                WhiteboxerPlugin_logic_reschedules_flushes_6_payload_self;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_valid;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcOnLastSlice;
  wire       [31:0]   late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcTarget;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_taken;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isBranch;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPush;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPop;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_wasWrong;
  wire                late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_badPredictedTarget;
  wire       [15:0]   late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_uopId;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_valid;
  wire       [31:0]   WhiteboxerPlugin_logic_prediction_learns_0_payload_pcOnLastSlice;
  wire       [31:0]   WhiteboxerPlugin_logic_prediction_learns_0_payload_pcTarget;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_taken;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_isBranch;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_isPush;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_isPop;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_wasWrong;
  wire                WhiteboxerPlugin_logic_prediction_learns_0_payload_badPredictedTarget;
  wire       [15:0]   WhiteboxerPlugin_logic_prediction_learns_0_payload_uopId;
  wire                WhiteboxerPlugin_logic_loadExecute_fire;
  wire       [15:0]   WhiteboxerPlugin_logic_loadExecute_uopId;
  wire       [1:0]    WhiteboxerPlugin_logic_loadExecute_size;
  wire       [31:0]   WhiteboxerPlugin_logic_loadExecute_address;
  wire       [63:0]   WhiteboxerPlugin_logic_loadExecute_data;
  wire                WhiteboxerPlugin_logic_storeCommit_fire;
  wire       [15:0]   WhiteboxerPlugin_logic_storeCommit_uopId;
  wire       [11:0]   WhiteboxerPlugin_logic_storeCommit_storeId;
  wire       [1:0]    WhiteboxerPlugin_logic_storeCommit_size;
  wire       [31:0]   WhiteboxerPlugin_logic_storeCommit_address;
  wire       [63:0]   WhiteboxerPlugin_logic_storeCommit_data;
  wire                WhiteboxerPlugin_logic_storeCommit_amo;
  wire                WhiteboxerPlugin_logic_storeConditional_fire;
  wire       [15:0]   WhiteboxerPlugin_logic_storeConditional_uopId;
  wire                WhiteboxerPlugin_logic_storeConditional_miss;
  wire                WhiteboxerPlugin_logic_storeBroadcast_fire;
  wire       [11:0]   WhiteboxerPlugin_logic_storeBroadcast_storeId;
  wire                integer_RegFilePlugin_logic_writeMerges_0_bus_valid;
  wire       [4:0]    integer_RegFilePlugin_logic_writeMerges_0_bus_address;
  wire       [63:0]   integer_RegFilePlugin_logic_writeMerges_0_bus_data;
  wire       [15:0]   integer_RegFilePlugin_logic_writeMerges_0_bus_uopId;
  reg        [5:0]    integer_RegFilePlugin_logic_initalizer_counter;
  wire                integer_RegFilePlugin_logic_initalizer_done;
  wire                when_RegFilePlugin_l127;
  wire                integer_write_0_valid /* verilator public */ ;
  wire       [4:0]    integer_write_0_address /* verilator public */ ;
  wire       [63:0]   integer_write_0_data /* verilator public */ ;
  wire       [15:0]   integer_write_0_uopId /* verilator public */ ;
  wire       [0:0]    WhiteboxerPlugin_logic_wfi;
  wire                WhiteboxerPlugin_logic_perf_executeFreezed;
  wire                WhiteboxerPlugin_logic_perf_dispatchHazards;
  wire       [0:0]    WhiteboxerPlugin_logic_perf_candidatesCount;
  wire       [0:0]    WhiteboxerPlugin_logic_perf_dispatchFeedCount;
  reg                 _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_executeFreezedCounter;
  reg                 _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_dispatchHazardsCounter;
  wire                when_Utils_l586;
  reg                 _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_candidatesCountCounters_0;
  wire                when_Utils_l586_1;
  reg                 _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_candidatesCountCounters_1;
  wire                when_Utils_l586_2;
  reg                 _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0;
  wire                when_Utils_l586_3;
  reg                 _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1;
  reg        [59:0]   _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_2;
  wire       [59:0]   WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1;
  wire                WhiteboxerPlugin_logic_trap_ports_0_valid;
  wire                WhiteboxerPlugin_logic_trap_ports_0_interrupt;
  wire       [3:0]    WhiteboxerPlugin_logic_trap_ports_0_cause;
  wire                fetch_logic_ctrls_2_up_forgetOne;
  wire                fetch_logic_ctrls_1_up_forgetOne;
  wire                when_CtrlLink_l150;
  wire                when_CtrlLink_l157;
  wire                when_StageLink_l67;
  wire                when_DecodePipelinePlugin_l68;
  wire                when_StageLink_l67_1;
  wire                when_DecodePipelinePlugin_l68_1;
  reg        [3:0]    TrapPlugin_logic_harts_0_trap_fsm_stateReg;
  reg        [3:0]    TrapPlugin_logic_harts_0_trap_fsm_stateNext;
  wire                when_TrapPlugin_l393;
  wire                when_TrapPlugin_l637;
  wire       [1:0]    switch_TrapPlugin_l638;
  wire                when_TrapPlugin_l348;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_RESET;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_RUNNING;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_PROCESS_1;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_EPC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_TVAL;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_TVEC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_APPLY;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_XRET_EPC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_XRET_APPLY;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_JUMP;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onExit_FETCH_FLUSH;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_RESET;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_RUNNING;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_PROCESS_1;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_EPC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_TVAL;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_TVEC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_APPLY;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_XRET_EPC;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_XRET_APPLY;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_JUMP;
  wire                TrapPlugin_logic_harts_0_trap_fsm_onEntry_FETCH_FLUSH;
  reg        [1:0]    CsrAccessPlugin_logic_fsm_stateReg;
  reg        [1:0]    CsrAccessPlugin_logic_fsm_stateNext;
  wire                when_CsrAccessPlugin_l308;
  wire                when_CsrAccessPlugin_l338;
  wire                when_CsrAccessPlugin_l224;
  wire                CsrAccessPlugin_logic_fsm_onExit_IDLE;
  wire                CsrAccessPlugin_logic_fsm_onExit_READ;
  wire                CsrAccessPlugin_logic_fsm_onExit_WRITE;
  wire                CsrAccessPlugin_logic_fsm_onExit_COMPLETION;
  wire                CsrAccessPlugin_logic_fsm_onEntry_IDLE;
  wire                CsrAccessPlugin_logic_fsm_onEntry_READ;
  wire                CsrAccessPlugin_logic_fsm_onEntry_WRITE;
  wire                CsrAccessPlugin_logic_fsm_onEntry_COMPLETION;
  `ifndef SYNTHESIS
  reg [39:0] execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [31:0] execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [31:0] execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [39:0] execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [31:0] execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [79:0] execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string;
  reg [31:0] execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [39:0] execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [79:0] execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string;
  reg [31:0] execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [31:0] execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [79:0] execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string;
  reg [31:0] execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [39:0] execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [39:0] execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [39:0] _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string;
  reg [39:0] _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string;
  reg [39:0] _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string;
  reg [31:0] _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string;
  reg [31:0] _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1_string;
  reg [31:0] _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2_string;
  reg [79:0] _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string;
  reg [79:0] _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string;
  reg [79:0] _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string;
  reg [39:0] _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string;
  reg [39:0] _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string;
  reg [39:0] _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string;
  reg [87:0] TrapPlugin_logic_harts_0_trap_fsm_stateReg_string;
  reg [87:0] TrapPlugin_logic_harts_0_trap_fsm_stateNext_string;
  reg [79:0] CsrAccessPlugin_logic_fsm_stateReg_string;
  reg [79:0] CsrAccessPlugin_logic_fsm_stateNext_string;
  `endif

  (* ram_style = "distributed" *) reg [29:0] BtbPlugin_logic_ras_mem_stack [0:3];
  reg [63:0] FetchL1Plugin_logic_banks_0_mem [0:31];
  reg [63:0] FetchL1Plugin_logic_banks_1_mem [0:31];
  reg [63:0] FetchL1Plugin_logic_banks_2_mem [0:31];
  reg [63:0] FetchL1Plugin_logic_banks_3_mem [0:31];
  reg [25:0] FetchL1Plugin_logic_ways_0_mem [0:3];
  reg [25:0] FetchL1Plugin_logic_ways_1_mem [0:3];
  reg [25:0] FetchL1Plugin_logic_ways_2_mem [0:3];
  reg [25:0] FetchL1Plugin_logic_ways_3_mem [0:3];
  reg [2:0] FetchL1Plugin_logic_plru_mem [0:3];
  (* ram_style = "block" *) reg [41:0] BtbPlugin_logic_mem [0:127];
  reg [63:0] CsrRamPlugin_logic_mem [0:3];
  function [1:0] zz_FetchL1Plugin_logic_trapPort_payload_arg(input dummy);
    begin
      zz_FetchL1Plugin_logic_trapPort_payload_arg = 2'b00;
      zz_FetchL1Plugin_logic_trapPort_payload_arg[1 : 0] = 2'b10;
    end
  endfunction
  wire [1:0] _zz_32;

  assign _zz_when = (! FetchL1Plugin_logic_refill_slots_0_valid);
  assign _zz_early0_IntAluPlugin_logic_alu_result = (early0_IntAluPlugin_logic_alu_bitwise | _zz_early0_IntAluPlugin_logic_alu_result_1);
  assign _zz_early0_IntAluPlugin_logic_alu_result_1 = (execute_ctrl1_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0 ? execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0 : 64'h0);
  assign _zz_early0_IntAluPlugin_logic_alu_result_2 = (execute_ctrl1_down_early0_IntAluPlugin_ALU_SLTX_lane0 ? _zz_early0_IntAluPlugin_logic_alu_result_3 : 64'h0);
  assign _zz_early0_IntAluPlugin_logic_alu_result_3 = _zz_early0_IntAluPlugin_logic_alu_result_4;
  assign _zz_early0_IntAluPlugin_logic_alu_result_5 = execute_ctrl1_down_early0_SrcPlugin_LESS_lane0;
  assign _zz_early0_IntAluPlugin_logic_alu_result_4 = {63'd0, _zz_early0_IntAluPlugin_logic_alu_result_5};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_shamt = execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0[5:0];
  assign _zz__zz_early0_IterativeShifterPlugin_logic_shift_selector_2 = (_zz_early0_IterativeShifterPlugin_logic_shift_selector_1 - 5'h01);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_8 = ({{1{(execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0 && execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[63])}},early0_IterativeShifterPlugin_logic_shift_shiftReg} >>> 1'd1);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_9 = ({{8{(execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0 && execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[63])}},early0_IterativeShifterPlugin_logic_shift_shiftReg} >>> 4'd8);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5 = (early0_IterativeShifterPlugin_logic_shift_amplitude - 6'h01);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6 = (early0_IterativeShifterPlugin_logic_shift_amplitude - 6'h08);
  assign _zz_late0_IntAluPlugin_logic_alu_result = (late0_IntAluPlugin_logic_alu_bitwise | _zz_late0_IntAluPlugin_logic_alu_result_1);
  assign _zz_late0_IntAluPlugin_logic_alu_result_1 = (execute_ctrl3_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 ? execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0 : 64'h0);
  assign _zz_late0_IntAluPlugin_logic_alu_result_2 = (execute_ctrl3_down_late0_IntAluPlugin_ALU_SLTX_lane0 ? _zz_late0_IntAluPlugin_logic_alu_result_3 : 64'h0);
  assign _zz_late0_IntAluPlugin_logic_alu_result_3 = _zz_late0_IntAluPlugin_logic_alu_result_4;
  assign _zz_late0_IntAluPlugin_logic_alu_result_5 = execute_ctrl3_down_late0_SrcPlugin_LESS_lane0;
  assign _zz_late0_IntAluPlugin_logic_alu_result_4 = {63'd0, _zz_late0_IntAluPlugin_logic_alu_result_5};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_shamt = execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0[5:0];
  assign _zz__zz_late0_IterativeShifterPlugin_logic_shift_selector_2 = (_zz_late0_IterativeShifterPlugin_logic_shift_selector_1 - 5'h01);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_8 = ({{1{(execute_ctrl3_down_IterativeShifterPlugin_ARITHMETIC_lane0 && execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0[63])}},late0_IterativeShifterPlugin_logic_shift_shiftReg} >>> 1'd1);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_9 = ({{8{(execute_ctrl3_down_IterativeShifterPlugin_ARITHMETIC_lane0 && execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0[63])}},late0_IterativeShifterPlugin_logic_shift_shiftReg} >>> 4'd8);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5 = (late0_IterativeShifterPlugin_logic_shift_amplitude - 6'h01);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6 = (late0_IterativeShifterPlugin_logic_shift_amplitude - 6'h08);
  assign _zz_early0_BranchPlugin_pcCalc_target_b = {{{{execute_ctrl1_down_Decode_UOP_lane0[31],execute_ctrl1_down_Decode_UOP_lane0[19 : 12]},execute_ctrl1_down_Decode_UOP_lane0[20]},execute_ctrl1_down_Decode_UOP_lane0[30 : 21]},1'b0};
  assign _zz_early0_BranchPlugin_pcCalc_target_b_1 = execute_ctrl1_down_Decode_UOP_lane0[31 : 20];
  assign _zz_early0_BranchPlugin_pcCalc_target_b_2 = {{{{execute_ctrl1_down_Decode_UOP_lane0[31],execute_ctrl1_down_Decode_UOP_lane0[7]},execute_ctrl1_down_Decode_UOP_lane0[30 : 25]},execute_ctrl1_down_Decode_UOP_lane0[11 : 8]},1'b0};
  assign _zz_early0_BranchPlugin_pcCalc_slices_1 = 1'b0;
  assign _zz_early0_BranchPlugin_pcCalc_slices = {1'd0, _zz_early0_BranchPlugin_pcCalc_slices_1};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 = _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_1;
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_1 = ($signed(_zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_2) + $signed(early0_BranchPlugin_pcCalc_target_b));
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0_2 = {{32{early0_BranchPlugin_pcCalc_target_a[31]}}, early0_BranchPlugin_pcCalc_target_a};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0_1 = ({2'd0,early0_BranchPlugin_pcCalc_slices} <<< 2'd2);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 = {28'd0, _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0_1};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0_1 = 2'b00;
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 = {30'd0, _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0_1};
  assign _zz_AlignerPlugin_logic_extractors_0_redo_2 = ((_zz_AlignerPlugin_logic_extractors_0_redo ? AlignerPlugin_logic_scanners_0_redo : 1'b0) | (_zz_AlignerPlugin_logic_extractors_0_redo_1 ? AlignerPlugin_logic_scanners_1_redo : 1'b0));
  assign _zz__zz_FetchL1Plugin_logic_banks_0_write_payload_address = (2'b00 - FetchL1Plugin_logic_refill_onRsp_wayToAllocate);
  assign _zz__zz_FetchL1Plugin_logic_banks_1_write_payload_address = (2'b01 - FetchL1Plugin_logic_refill_onRsp_wayToAllocate);
  assign _zz__zz_FetchL1Plugin_logic_banks_2_write_payload_address = (2'b10 - FetchL1Plugin_logic_refill_onRsp_wayToAllocate);
  assign _zz__zz_FetchL1Plugin_logic_banks_3_write_payload_address = (2'b11 - FetchL1Plugin_logic_refill_onRsp_wayToAllocate);
  assign _zz_FetchL1Plugin_logic_bankMux_reduced_bankId = (FetchL1Plugin_logic_bankMux_reduced_wayId + fetch_logic_ctrls_2_down_Fetch_WORD_PC[4 : 3]);
  assign _zz_FetchL1Plugin_logic_ctrl_dataAccessFault = (((fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_0 ? fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_error : 1'b0) | (fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_1 ? fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_error : 1'b0)) | ((fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_2 ? fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_error : 1'b0) | (fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_3 ? fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_error : 1'b0)));
  assign _zz_LsuCachelessPlugin_logic_trapPort_payload_tval = execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0;
  assign _zz_BtbPlugin_logic_ras_ptr_push = (BtbPlugin_logic_ras_ptr_push + _zz_BtbPlugin_logic_ras_ptr_push_1);
  assign _zz_BtbPlugin_logic_ras_ptr_push_2 = BtbPlugin_logic_ras_ptr_pushIt;
  assign _zz_BtbPlugin_logic_ras_ptr_push_1 = {1'd0, _zz_BtbPlugin_logic_ras_ptr_push_2};
  assign _zz_BtbPlugin_logic_ras_ptr_push_4 = BtbPlugin_logic_ras_ptr_popIt;
  assign _zz_BtbPlugin_logic_ras_ptr_push_3 = {1'd0, _zz_BtbPlugin_logic_ras_ptr_push_4};
  assign _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue = (BtbPlugin_logic_ras_ptr_pop + _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_1);
  assign _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_2 = BtbPlugin_logic_ras_ptr_pushIt;
  assign _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_1 = {1'd0, _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_2};
  assign _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_4 = BtbPlugin_logic_ras_ptr_popIt;
  assign _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_3 = {1'd0, _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_4};
  assign _zz_WhiteboxerPlugin_logic_decodes_0_pc = {32'd0, decode_ctrls_0_down_PC_0};
  assign _zz__zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[63 : 32];
  assign _zz_early0_BranchPlugin_logic_wb_payload = {32'd0, execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0};
  assign _zz_FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit = (|((FetchL1Plugin_pmaBuilder_addressBits & 32'h0) == 32'h0));
  assign _zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_io = (|_zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault);
  assign _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0 = {execute_ctrl0_down_Decode_UOP_lane0[31 : 12],12'h0};
  assign _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = execute_ctrl0_down_Decode_UOP_lane0[31 : 20];
  assign _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_1 = {32'd0, execute_ctrl0_down_PC_lane0};
  assign _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_2 = {execute_ctrl0_down_Decode_UOP_lane0[31 : 25],execute_ctrl0_down_Decode_UOP_lane0[11 : 7]};
  assign _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0 = ($signed(execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0) + $signed(early0_SrcPlugin_logic_addsub_combined_rs2Patched));
  assign _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_1 = _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_2;
  assign _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_3 = execute_ctrl1_down_SrcStageables_REVERT_lane0;
  assign _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_2 = {63'd0, _zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_3};
  assign _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0 = {execute_ctrl2_down_Decode_UOP_lane0[31 : 12],12'h0};
  assign _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = execute_ctrl2_down_Decode_UOP_lane0[31 : 20];
  assign _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0_1 = {32'd0, execute_ctrl2_down_PC_lane0};
  assign _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0 = ($signed(execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0) + $signed(late0_SrcPlugin_logic_addsub_combined_rs2Patched));
  assign _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_1 = _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_2;
  assign _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_3 = execute_ctrl3_down_SrcStageables_REVERT_lane0;
  assign _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_2 = {63'd0, _zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_3};
  assign _zz__zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0[63 : 32];
  assign _zz_late0_BranchPlugin_logic_wb_payload = {32'd0, execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0};
  assign _zz_early0_EnvPlugin_logic_trapPort_payload_code = {2'd0, early0_EnvPlugin_logic_exe_privilege};
  assign _zz_decode_ctrls_2_down_RS1_ENABLE_0 = (|{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000044) == 32'h0),{_zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0,{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00006004) == 32'h00002000),((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00005004) == 32'h00001000)}}});
  assign _zz_decode_ctrls_2_down_RS2_ENABLE_0 = (|{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000034) == 32'h00000020),((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000064) == 32'h00000020)});
  assign _zz_decode_ctrls_2_down_RD_ENABLE_0 = (|{_zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_1,{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00001010) == 32'h00001010),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00002010) == 32'h00002010),{_zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0,{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & _zz_decode_ctrls_2_down_RD_ENABLE_0_1) == 32'h00000004),((decode_ctrls_2_down_Decode_INSTRUCTION_0 & _zz_decode_ctrls_2_down_RD_ENABLE_0_2) == 32'h0)}}}}});
  assign _zz_DecoderPlugin_logic_laneLogic_0_fixer_isJb = (|((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000050) == 32'h00000040));
  assign _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice_1 = ((! decode_ctrls_2_down_Prediction_ALIGN_REDO_0) ? 2'b00 : 2'b00);
  assign _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice = {30'd0, _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice_1};
  assign _zz_BtbPlugin_logic_onLearn_port_payload_address = (LearnPlugin_logic_learn_payload_pcOnLastSlice >>> 2'd2);
  assign _zz_LsuCachelessPlugin_logic_trapPort_payload_code = (execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0 ? (execute_ctrl1_down_AguPlugin_STORE_lane0 ? 3'b110 : 3'b100) : 3'b000);
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_2 = execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0[2 : 0];
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_5 = execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0[2 : 1];
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_8 = execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0[2 : 2];
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_11 = execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0[2 : 2];
  assign _zz_LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit = (|((LsuCachelessPlugin_pmaBuilder_addressBits & 32'h0) == 32'h0));
  assign _zz_LsuCachelessPlugin_logic_onPma_port_rsp_io = (|_zz_LsuCachelessPlugin_logic_onPma_port_rsp_fault);
  assign _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0 = _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0_1[0];
  assign _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0_1 = 1'b0;
  assign _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0 = _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0_1[0];
  assign _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0_1 = 1'b0;
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0_1 = (|_zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_2 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_3[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_3 = (|{_zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_1,{_zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0,((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000054) == 32'h00000040)}});
  assign _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_1 = _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_2[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_2 = (|{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000040) == 32'h00000040),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00001010) == 32'h00001000),_zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0}});
  assign _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0 = _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0_1 = (|{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2,{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1,_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0}});
  assign _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0 = _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0_1 = (|{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2,{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1,_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0}});
  assign _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0 = _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0_1 = (|{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2,_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1});
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0 = _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0_1[0];
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0_1 = (|{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2,_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1});
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_3 = _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_4[0];
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_4 = (|{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2,{_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1,_zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0}});
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0_1 = (|_zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0_1 = (|_zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0_1[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0_1 = (|_zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_1 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_2[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_2 = (|_zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0);
  assign _zz_BtbPlugin_logic_onLearn_port_payload_address_1 = (DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice >>> 2'd2);
  assign _zz_BtbPlugin_logic_readPort_cmd_payload = (fetch_logic_ctrls_0_down_Fetch_WORD_PC >>> 2'd2);
  assign _zz_BtbPlugin_logic_ras_write_payload_data = (BtbPlugin_logic_applyIt_rasLogic_pushPc + 32'h00000004);
  assign _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget_1 = ({2'd0,TrapPlugin_logic_harts_0_trap_fsm_jumpOffset} <<< 2'd2);
  assign _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget = {29'd0, _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget_1};
  assign _zz_PcPlugin_logic_harts_0_self_pc_1 = (PcPlugin_logic_harts_0_self_increment ? 3'b100 : 3'b000);
  assign _zz_PcPlugin_logic_harts_0_self_pc = {29'd0, _zz_PcPlugin_logic_harts_0_self_pc_1};
  assign _zz_PcPlugin_logic_harts_0_aggregator_fault = ((((_zz_PcPlugin_logic_harts_0_aggregator_target ? TrapPlugin_logic_harts_0_trap_pcPort_payload_fault : 1'b0) | (_zz_PcPlugin_logic_harts_0_aggregator_target_1 ? late0_BranchPlugin_logic_pcPort_payload_fault : 1'b0)) | ((_zz_PcPlugin_logic_harts_0_aggregator_target_2 ? early0_BranchPlugin_logic_pcPort_payload_fault : 1'b0) | (_zz_PcPlugin_logic_harts_0_aggregator_target_3 ? BtbPlugin_logic_pcPort_payload_fault : 1'b0))) | (_zz_PcPlugin_logic_harts_0_aggregator_target_4 ? PcPlugin_logic_harts_0_self_flow_payload_fault : 1'b0));
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_6 = ((_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_3858) ? 6'h2e : 6'h0);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_5 = {58'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_6};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_9 = ({7'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 ? PrivilegedPlugin_logic_harts_0_m_status_mpie : 1'b0)} <<< 3'd7);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_8 = {56'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_9};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_11 = ({3'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 ? PrivilegedPlugin_logic_harts_0_m_status_mie : 1'b0)} <<< 2'd3);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_10 = {60'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_11};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_13 = ({11'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 ? PrivilegedPlugin_logic_harts_0_m_status_mpp : 2'b00)} <<< 4'd11);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_12 = {51'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_13};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_14 = ({63'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 ? PrivilegedPlugin_logic_harts_0_m_status_sd : 1'b0)} <<< 6'd63);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_16 = ({17'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 ? PrivilegedPlugin_logic_harts_0_m_status_mprv : 1'b0)} <<< 5'd17);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_15 = {46'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_16};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_17 = ({63'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_2 ? PrivilegedPlugin_logic_harts_0_m_cause_interrupt : 1'b0)} <<< 6'd63);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_19 = (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_2 ? PrivilegedPlugin_logic_harts_0_m_cause_code : 4'b0000);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_18 = {60'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_19};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_21 = ({11'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_3 ? PrivilegedPlugin_logic_harts_0_m_ip_meip : 1'b0)} <<< 4'd11);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_20 = {52'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_21};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_23 = ({7'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_3 ? PrivilegedPlugin_logic_harts_0_m_ip_mtip : 1'b0)} <<< 3'd7);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_22 = {56'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_23};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_25 = ({3'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_3 ? PrivilegedPlugin_logic_harts_0_m_ip_msip : 1'b0)} <<< 2'd3);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_24 = {60'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_25};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_27 = ({11'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_4 ? PrivilegedPlugin_logic_harts_0_m_ie_meie : 1'b0)} <<< 4'd11);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_26 = {52'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_27};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_29 = ({7'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_4 ? PrivilegedPlugin_logic_harts_0_m_ie_mtie : 1'b0)} <<< 3'd7);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_28 = {56'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_29};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_31 = ({3'd0,(_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_4 ? PrivilegedPlugin_logic_harts_0_m_ie_msie : 1'b0)} <<< 2'd3);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_30 = {60'd0, _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_31};
  assign _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask_1 = CsrAccessPlugin_logic_fsm_regs_uop[19 : 15];
  assign _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask = {59'd0, _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask_1};
  assign _zz_CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked = (CsrRamPlugin_logic_writeLogic_hits_ohFirst_input - 3'b001);
  assign _zz_CsrRamPlugin_logic_readLogic_hits_ohFirst_masked = (CsrRamPlugin_logic_readLogic_hits_ohFirst_input - 2'b01);
  assign _zz_CsrRamPlugin_logic_flush_counter_1 = (! CsrRamPlugin_logic_flush_done);
  assign _zz_CsrRamPlugin_logic_flush_counter = {2'd0, _zz_CsrRamPlugin_logic_flush_counter_1};
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0_1 = (|{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0,((execute_lane0_logic_decoding_decodingBits & 33'h10000004c) == 33'h100000004)}});
  assign _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h100003054) == 33'h100001010));
  assign _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0_1 = (|_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0);
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h000001058) == 33'h000001008),((execute_lane0_logic_decoding_decodingBits & 33'h000003050) == 33'h000000050)});
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h100000044) == 33'h000000004),{((execute_lane0_logic_decoding_decodingBits & 33'h100002040) == 33'h000002000),((execute_lane0_logic_decoding_decodingBits & 33'h100001040) == 33'h0)}});
  assign _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h100003044) == 33'h000001000));
  assign _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0_1 = (|_zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0);
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h000001050) == 33'h000001050),_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0});
  assign _zz_execute_ctrl0_down_AguPlugin_SEL_lane0 = _zz_execute_ctrl0_down_AguPlugin_SEL_lane0_1[0];
  assign _zz_execute_ctrl0_down_AguPlugin_SEL_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000000058) == 33'h0));
  assign _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0 = _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0_1[0];
  assign _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000001058) == 33'h000000008));
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_1 = _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_2[0];
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_2 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h000000048) == 33'h000000048),{((execute_lane0_logic_decoding_decodingBits & 33'h000001010) == 33'h000001010),{((execute_lane0_logic_decoding_decodingBits & _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_3) == 33'h000002010),{(_zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_4 == _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_5),{_zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0,_zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_6}}}}});
  assign _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0_1[0];
  assign _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0_1 = (|{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_2,{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_1}}}});
  assign _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0_1[0];
  assign _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0_1 = (|{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0,{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_2,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_1}});
  assign _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0_1[0];
  assign _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0_1 = (|{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_1,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0});
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_2 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_3[0];
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_3 = (|{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_2,{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_1}}}});
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_3 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_4[0];
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_4 = (|{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0,{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_2,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_1}});
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_2 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_3[0];
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_3 = (|{_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_1,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0});
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0_1 = (|{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0});
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0_1[0];
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0_1 = (|_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0);
  assign _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0 = _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0_1[0];
  assign _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h000000040) == 33'h000000040),{((execute_lane0_logic_decoding_decodingBits & 33'h000002014) == 33'h000002010),((execute_lane0_logic_decoding_decodingBits & 33'h040000034) == 33'h040000030)}});
  assign _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0 = _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0_1[0];
  assign _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000000024) == 33'h000000024));
  assign _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 = _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0_1[0];
  assign _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0_1 = (|{_zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0,((execute_lane0_logic_decoding_decodingBits & 33'h000004010) == 33'h0)});
  assign _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_3 = _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_4[0];
  assign _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_4 = (|{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_2,{_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1,_zz_execute_ctrl0_down_BYPASSED_AT_1_lane0}});
  assign _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0 = _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0_1[0];
  assign _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h100000040) == 33'h100000040),((execute_lane0_logic_decoding_decodingBits & 33'h100000010) == 33'h100000010)});
  assign _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0 = _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0_1[0];
  assign _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0_1 = (|_zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0);
  assign _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_1 = _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_2[0];
  assign _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_2 = (|_zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0);
  assign _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0 = _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0_1[0];
  assign _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0_1 = (|{((execute_lane0_logic_decoding_decodingBits & 33'h000002010) == 33'h000002000),((execute_lane0_logic_decoding_decodingBits & 33'h000005000) == 33'h000001000)});
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_1 = _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_2[0];
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_2 = (|_zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0);
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0_1[0];
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h040000000) == 33'h040000000));
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_1 = _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_2[0];
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_2 = (|_zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0);
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0_1[0];
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000004008) == 33'h000004008));
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0_1[0];
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000004000) == 33'h000004000));
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_1 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_2[0];
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_2 = (|_zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0);
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_1 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_2[0];
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_2 = (|_zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0);
  assign _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0 = _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0_1[0];
  assign _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000000020) == 33'h0));
  assign _zz_execute_ctrl0_down_AguPlugin_STORE_lane0 = _zz_execute_ctrl0_down_AguPlugin_STORE_lane0_1[0];
  assign _zz_execute_ctrl0_down_AguPlugin_STORE_lane0_1 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000000020) == 33'h000000020));
  assign _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0 = _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0_1[0];
  assign _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0_1 = 1'b0;
  assign _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0 = _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0_1[0];
  assign _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0_1 = 1'b0;
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_1 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_2[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_2 = (|{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0});
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_1 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_2[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_2 = (|_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0);
  assign _zz_WhiteboxerPlugin_logic_csr_access_payload_address = CsrAccessPlugin_logic_fsm_regs_uop;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1_1 = _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1_1};
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1_1 = _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1_1};
  assign _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1_1 = _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1_1};
  assign _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1_1 = _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1_1};
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1_1 = _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1_1};
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1_1 = _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1;
  assign _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1 = {59'd0, _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1_1};
  assign _zz_TrapPlugin_logic_harts_0_crsPorts_write_data = {32'd0, TrapPlugin_logic_harts_0_trap_pending_pc};
  assign _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_2 = TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_tval;
  assign _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_1 = {32'd0, _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_2};
  assign _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_3 = {32'd0, TrapPlugin_logic_harts_0_trap_pending_pc};
  assign _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = TrapPlugin_logic_harts_0_trap_fsm_readed;
  assign _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc_1 = TrapPlugin_logic_harts_0_trap_fsm_readed;
  assign _zz_BtbPlugin_logic_ras_mem_stack_port = BtbPlugin_logic_ras_write_payload_data;
  assign _zz_FetchL1Plugin_logic_ways_0_mem_port = {FetchL1Plugin_logic_waysWrite_tag_address,{FetchL1Plugin_logic_waysWrite_tag_error,FetchL1Plugin_logic_waysWrite_tag_loaded}};
  assign _zz_FetchL1Plugin_logic_ways_0_mem_port_1 = FetchL1Plugin_logic_waysWrite_mask[0];
  assign _zz_FetchL1Plugin_logic_ways_1_mem_port = {FetchL1Plugin_logic_waysWrite_tag_address,{FetchL1Plugin_logic_waysWrite_tag_error,FetchL1Plugin_logic_waysWrite_tag_loaded}};
  assign _zz_FetchL1Plugin_logic_ways_1_mem_port_1 = FetchL1Plugin_logic_waysWrite_mask[1];
  assign _zz_FetchL1Plugin_logic_ways_2_mem_port = {FetchL1Plugin_logic_waysWrite_tag_address,{FetchL1Plugin_logic_waysWrite_tag_error,FetchL1Plugin_logic_waysWrite_tag_loaded}};
  assign _zz_FetchL1Plugin_logic_ways_2_mem_port_1 = FetchL1Plugin_logic_waysWrite_mask[2];
  assign _zz_FetchL1Plugin_logic_ways_3_mem_port = {FetchL1Plugin_logic_waysWrite_tag_address,{FetchL1Plugin_logic_waysWrite_tag_error,FetchL1Plugin_logic_waysWrite_tag_loaded}};
  assign _zz_FetchL1Plugin_logic_ways_3_mem_port_1 = FetchL1Plugin_logic_waysWrite_mask[3];
  assign _zz_FetchL1Plugin_logic_plru_mem_port = {FetchL1Plugin_logic_plru_write_payload_data_1,FetchL1Plugin_logic_plru_write_payload_data_0};
  assign _zz_BtbPlugin_logic_mem_port = {BtbPlugin_logic_onLearn_port_payload_data_0_taken,{BtbPlugin_logic_onLearn_port_payload_data_0_isPop,{BtbPlugin_logic_onLearn_port_payload_data_0_isPush,{BtbPlugin_logic_onLearn_port_payload_data_0_isBranch,{BtbPlugin_logic_onLearn_port_payload_data_0_pcTarget,BtbPlugin_logic_onLearn_port_payload_data_0_hash}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_7 = {_zz_early0_IterativeShifterPlugin_logic_shift_muxed_3,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_5,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_4}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4 = {_zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2,_zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_7 = {_zz_late0_IterativeShifterPlugin_logic_shift_muxed_3,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_5,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_4}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4 = {_zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2,_zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1};
  assign _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0_1 = fetch_logic_ctrls_1_down_Fetch_WORD_PC[2 : 2];
  assign _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1_1 = fetch_logic_ctrls_1_down_Fetch_WORD_PC[2 : 2];
  assign _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2_1 = fetch_logic_ctrls_1_down_Fetch_WORD_PC[2 : 2];
  assign _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3_1 = fetch_logic_ctrls_1_down_Fetch_WORD_PC[2 : 2];
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_1 = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_2;
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_4 = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_5;
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_7 = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_8;
  assign _zz_LsuCachelessPlugin_logic_onWb_rspShifted_10 = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_11;
  assign _zz_WhiteboxerPlugin_logic_perf_candidatesCount_1 = DispatchPlugin_logic_candidates_0_ctx_valid;
  assign _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount_1 = decode_ctrls_2_up_LANE_SEL_0;
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_10 = early0_IterativeShifterPlugin_logic_shift_shiftReg[7];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_11 = early0_IterativeShifterPlugin_logic_shift_shiftReg[8];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_12 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[9],{early0_IterativeShifterPlugin_logic_shift_shiftReg[10],{early0_IterativeShifterPlugin_logic_shift_shiftReg[11],{early0_IterativeShifterPlugin_logic_shift_shiftReg[12],{early0_IterativeShifterPlugin_logic_shift_shiftReg[13],{early0_IterativeShifterPlugin_logic_shift_shiftReg[14],{early0_IterativeShifterPlugin_logic_shift_shiftReg[15],{early0_IterativeShifterPlugin_logic_shift_shiftReg[16],{early0_IterativeShifterPlugin_logic_shift_shiftReg[17],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_13,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_14,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_15}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_13 = early0_IterativeShifterPlugin_logic_shift_shiftReg[18];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_14 = early0_IterativeShifterPlugin_logic_shift_shiftReg[19];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_15 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[20],{early0_IterativeShifterPlugin_logic_shift_shiftReg[21],{early0_IterativeShifterPlugin_logic_shift_shiftReg[22],{early0_IterativeShifterPlugin_logic_shift_shiftReg[23],{early0_IterativeShifterPlugin_logic_shift_shiftReg[24],{early0_IterativeShifterPlugin_logic_shift_shiftReg[25],{early0_IterativeShifterPlugin_logic_shift_shiftReg[26],{early0_IterativeShifterPlugin_logic_shift_shiftReg[27],{early0_IterativeShifterPlugin_logic_shift_shiftReg[28],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_16,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_17,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_18}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_16 = early0_IterativeShifterPlugin_logic_shift_shiftReg[29];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_17 = early0_IterativeShifterPlugin_logic_shift_shiftReg[30];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_18 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[31],{early0_IterativeShifterPlugin_logic_shift_shiftReg[32],{early0_IterativeShifterPlugin_logic_shift_shiftReg[33],{early0_IterativeShifterPlugin_logic_shift_shiftReg[34],{early0_IterativeShifterPlugin_logic_shift_shiftReg[35],{early0_IterativeShifterPlugin_logic_shift_shiftReg[36],{early0_IterativeShifterPlugin_logic_shift_shiftReg[37],{early0_IterativeShifterPlugin_logic_shift_shiftReg[38],{early0_IterativeShifterPlugin_logic_shift_shiftReg[39],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_19,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_20,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_21}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_19 = early0_IterativeShifterPlugin_logic_shift_shiftReg[40];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_20 = early0_IterativeShifterPlugin_logic_shift_shiftReg[41];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_21 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[42],{early0_IterativeShifterPlugin_logic_shift_shiftReg[43],{early0_IterativeShifterPlugin_logic_shift_shiftReg[44],{early0_IterativeShifterPlugin_logic_shift_shiftReg[45],{early0_IterativeShifterPlugin_logic_shift_shiftReg[46],{early0_IterativeShifterPlugin_logic_shift_shiftReg[47],{early0_IterativeShifterPlugin_logic_shift_shiftReg[48],{early0_IterativeShifterPlugin_logic_shift_shiftReg[49],{early0_IterativeShifterPlugin_logic_shift_shiftReg[50],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_22,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_23,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_24}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_22 = early0_IterativeShifterPlugin_logic_shift_shiftReg[51];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_23 = early0_IterativeShifterPlugin_logic_shift_shiftReg[52];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_24 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[53],{early0_IterativeShifterPlugin_logic_shift_shiftReg[54],{early0_IterativeShifterPlugin_logic_shift_shiftReg[55],{early0_IterativeShifterPlugin_logic_shift_shiftReg[56],{early0_IterativeShifterPlugin_logic_shift_shiftReg[57],{early0_IterativeShifterPlugin_logic_shift_shiftReg[58],{early0_IterativeShifterPlugin_logic_shift_shiftReg[59],{early0_IterativeShifterPlugin_logic_shift_shiftReg[60],{early0_IterativeShifterPlugin_logic_shift_shiftReg[61],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_25,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_26}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_25 = early0_IterativeShifterPlugin_logic_shift_shiftReg[62];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_26 = early0_IterativeShifterPlugin_logic_shift_shiftReg[63];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_27 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[6];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_28 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[7];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_29 = {_zz_early0_IterativeShifterPlugin_logic_shift_muxed[8],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[9],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[10],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[11],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[12],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[13],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[14],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[15],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[16],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_30,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_31,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_32}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_30 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[17];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_31 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[18];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_32 = {_zz_early0_IterativeShifterPlugin_logic_shift_muxed[19],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[20],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[21],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[22],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[23],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[24],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[25],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[26],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[27],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_33,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_34,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_35}}}}}}}}}}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_33 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[28];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_34 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed[29];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_35 = {_zz_early0_IterativeShifterPlugin_logic_shift_muxed[30],_zz_early0_IterativeShifterPlugin_logic_shift_muxed[31]};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_10 = late0_IterativeShifterPlugin_logic_shift_shiftReg[7];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_11 = late0_IterativeShifterPlugin_logic_shift_shiftReg[8];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_12 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[9],{late0_IterativeShifterPlugin_logic_shift_shiftReg[10],{late0_IterativeShifterPlugin_logic_shift_shiftReg[11],{late0_IterativeShifterPlugin_logic_shift_shiftReg[12],{late0_IterativeShifterPlugin_logic_shift_shiftReg[13],{late0_IterativeShifterPlugin_logic_shift_shiftReg[14],{late0_IterativeShifterPlugin_logic_shift_shiftReg[15],{late0_IterativeShifterPlugin_logic_shift_shiftReg[16],{late0_IterativeShifterPlugin_logic_shift_shiftReg[17],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_13,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_14,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_15}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_13 = late0_IterativeShifterPlugin_logic_shift_shiftReg[18];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_14 = late0_IterativeShifterPlugin_logic_shift_shiftReg[19];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_15 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[20],{late0_IterativeShifterPlugin_logic_shift_shiftReg[21],{late0_IterativeShifterPlugin_logic_shift_shiftReg[22],{late0_IterativeShifterPlugin_logic_shift_shiftReg[23],{late0_IterativeShifterPlugin_logic_shift_shiftReg[24],{late0_IterativeShifterPlugin_logic_shift_shiftReg[25],{late0_IterativeShifterPlugin_logic_shift_shiftReg[26],{late0_IterativeShifterPlugin_logic_shift_shiftReg[27],{late0_IterativeShifterPlugin_logic_shift_shiftReg[28],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_16,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_17,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_18}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_16 = late0_IterativeShifterPlugin_logic_shift_shiftReg[29];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_17 = late0_IterativeShifterPlugin_logic_shift_shiftReg[30];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_18 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[31],{late0_IterativeShifterPlugin_logic_shift_shiftReg[32],{late0_IterativeShifterPlugin_logic_shift_shiftReg[33],{late0_IterativeShifterPlugin_logic_shift_shiftReg[34],{late0_IterativeShifterPlugin_logic_shift_shiftReg[35],{late0_IterativeShifterPlugin_logic_shift_shiftReg[36],{late0_IterativeShifterPlugin_logic_shift_shiftReg[37],{late0_IterativeShifterPlugin_logic_shift_shiftReg[38],{late0_IterativeShifterPlugin_logic_shift_shiftReg[39],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_19,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_20,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_21}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_19 = late0_IterativeShifterPlugin_logic_shift_shiftReg[40];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_20 = late0_IterativeShifterPlugin_logic_shift_shiftReg[41];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_21 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[42],{late0_IterativeShifterPlugin_logic_shift_shiftReg[43],{late0_IterativeShifterPlugin_logic_shift_shiftReg[44],{late0_IterativeShifterPlugin_logic_shift_shiftReg[45],{late0_IterativeShifterPlugin_logic_shift_shiftReg[46],{late0_IterativeShifterPlugin_logic_shift_shiftReg[47],{late0_IterativeShifterPlugin_logic_shift_shiftReg[48],{late0_IterativeShifterPlugin_logic_shift_shiftReg[49],{late0_IterativeShifterPlugin_logic_shift_shiftReg[50],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_22,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_23,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_24}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_22 = late0_IterativeShifterPlugin_logic_shift_shiftReg[51];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_23 = late0_IterativeShifterPlugin_logic_shift_shiftReg[52];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_24 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[53],{late0_IterativeShifterPlugin_logic_shift_shiftReg[54],{late0_IterativeShifterPlugin_logic_shift_shiftReg[55],{late0_IterativeShifterPlugin_logic_shift_shiftReg[56],{late0_IterativeShifterPlugin_logic_shift_shiftReg[57],{late0_IterativeShifterPlugin_logic_shift_shiftReg[58],{late0_IterativeShifterPlugin_logic_shift_shiftReg[59],{late0_IterativeShifterPlugin_logic_shift_shiftReg[60],{late0_IterativeShifterPlugin_logic_shift_shiftReg[61],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_25,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_26}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_25 = late0_IterativeShifterPlugin_logic_shift_shiftReg[62];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_26 = late0_IterativeShifterPlugin_logic_shift_shiftReg[63];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_27 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[6];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_28 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[7];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_29 = {_zz_late0_IterativeShifterPlugin_logic_shift_muxed[8],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[9],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[10],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[11],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[12],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[13],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[14],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[15],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[16],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_30,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_31,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_32}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_30 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[17];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_31 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[18];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_32 = {_zz_late0_IterativeShifterPlugin_logic_shift_muxed[19],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[20],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[21],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[22],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[23],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[24],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[25],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[26],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[27],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_33,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_34,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_35}}}}}}}}}}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_33 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[28];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_34 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed[29];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_35 = {_zz_late0_IterativeShifterPlugin_logic_shift_muxed[30],_zz_late0_IterativeShifterPlugin_logic_shift_muxed[31]};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[28];
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[27] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[26] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4 = {(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[25] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[24] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[23] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[22] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[21] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5 != early0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6,{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7,_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8}}}}}}}};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[20];
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[19] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[18] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8 = {(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[17] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[16] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[15] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[14] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[13] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9 != early0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10,{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11,_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12}}}}}}}};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[12];
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[11] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[10] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12 = {(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[9] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[8] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[7] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[6] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[5] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13 != early0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14,{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15,_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16}}}}}}}};
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[4];
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[3] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15 = (_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[2] != early0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16 = {(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[1] != early0_BranchPlugin_logic_alu_expectedMsb),(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[0] != early0_BranchPlugin_logic_alu_expectedMsb)};
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[28];
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[27] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[26] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4 = {(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[25] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[24] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[23] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[22] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[21] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5 != late0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6,{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7,_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8}}}}}}}};
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_5 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[20];
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_6 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[19] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_7 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[18] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_8 = {(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[17] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[16] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[15] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[14] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[13] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9 != late0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10,{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11,_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12}}}}}}}};
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_9 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[12];
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_10 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[11] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_11 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[10] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_12 = {(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[9] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[8] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[7] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[6] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[5] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13 != late0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14,{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15,_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16}}}}}}}};
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_13 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[4];
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_14 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[3] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_15 = (_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[2] != late0_BranchPlugin_logic_alu_expectedMsb);
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_16 = {(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[1] != late0_BranchPlugin_logic_alu_expectedMsb),(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[0] != late0_BranchPlugin_logic_alu_expectedMsb)};
  assign _zz_decode_ctrls_2_down_RD_ENABLE_0_1 = 32'h0000000c;
  assign _zz_decode_ctrls_2_down_RD_ENABLE_0_2 = 32'h00000028;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0 = 32'h0000106f;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_1 = (decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000405f);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_2 = 32'h00000003;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_3 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000207f) == 32'h00002073);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_4 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000306f) == 32'h00001063);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_5 = {((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000407f) == 32'h00004063),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000207f) == 32'h00002013),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & _zz_decode_ctrls_2_down_Decode_LEGAL_0_6) == 32'h00000003),{(_zz_decode_ctrls_2_down_Decode_LEGAL_0_7 == _zz_decode_ctrls_2_down_Decode_LEGAL_0_8),{_zz_decode_ctrls_2_down_Decode_LEGAL_0_9,{_zz_decode_ctrls_2_down_Decode_LEGAL_0_10,_zz_decode_ctrls_2_down_Decode_LEGAL_0_11}}}}}};
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_6 = 32'h0000207f;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_7 = (decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000707b);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_8 = 32'h00000063;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_9 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_10 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00007077) == 32'h00000013);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_11 = {((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hbc007077) == 32'h00005013),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hfc003077) == 32'h00001013),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & _zz_decode_ctrls_2_down_Decode_LEGAL_0_12) == 32'h00000033),{(_zz_decode_ctrls_2_down_Decode_LEGAL_0_13 == _zz_decode_ctrls_2_down_Decode_LEGAL_0_14),{_zz_decode_ctrls_2_down_Decode_LEGAL_0_15,{_zz_decode_ctrls_2_down_Decode_LEGAL_0_16,_zz_decode_ctrls_2_down_Decode_LEGAL_0_17}}}}}};
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_12 = 32'hfe00007f;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_13 = (decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hbe007077);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_14 = 32'h00005033;
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_15 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hfe003077) == 32'h00001033);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_16 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hbe007077) == 32'h00000033);
  assign _zz_decode_ctrls_2_down_Decode_LEGAL_0_17 = {((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hffefffff) == 32'h00000073),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hffffffff) == 32'h10500073),((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'hffffffff) == 32'h30200073)}};
  assign _zz_decode_logic_flushes_2_onLanes_0_doIt = 1'b1;
  assign _zz_decode_logic_flushes_2_onLanes_0_doIt_1 = (early0_BranchPlugin_logic_flushPort_valid && 1'b1);
  assign _zz_decode_logic_flushes_2_onLanes_0_doIt_2 = (LsuCachelessPlugin_logic_flushPort_valid && 1'b1);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2 && 1'b0);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1 && 1'b0));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_2 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid && 1'b0));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_3 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3 && 1'b0));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_4 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1 && _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_5));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_6 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid && _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_7));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_8 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3 && _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_9));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_10 = {(! _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_11),(! _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_12)};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_13 = (! (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3 && _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_14));
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_15 = {(! _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_16),(! _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_17)};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_5 = 1'b0;
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_7 = 1'b0;
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_9 = 1'b0;
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_11 = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2 && 1'b0);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_12 = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid && 1'b0);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_14 = 1'b0;
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_16 = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2 && 1'b0);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_17 = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1 && 1'b0);
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_1 = {early0_EnvPlugin_logic_trapPort_payload_tval,early0_EnvPlugin_logic_trapPort_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_2 = {LsuCachelessPlugin_logic_trapPort_payload_tval,LsuCachelessPlugin_logic_trapPort_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_3 = {early0_BranchPlugin_logic_trapPort_payload_tval,early0_BranchPlugin_logic_trapPort_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_4 = {CsrAccessPlugin_logic_trapPort_payload_tval,CsrAccessPlugin_logic_trapPort_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception = {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_tval,TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_1 = {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_tval,TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_2 = {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_tval,TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_exception};
  assign _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_3 = {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_tval,TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_exception};
  assign _zz_CsrAccessPlugin_logic_fsm_inject_implemented = COMB_CSR_3859;
  assign _zz_CsrAccessPlugin_logic_fsm_inject_implemented_1 = {COMB_CSR_3858,{COMB_CSR_3857,{COMB_CSR_1954,{COMB_CSR_1953,COMB_CSR_1952}}}};
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_7 = 64'h8000000000000100;
  assign _zz_fetch_logic_flushes_0_doIt = 1'b1;
  assign _zz_fetch_logic_flushes_0_doIt_1 = 1'b1;
  assign _zz_fetch_logic_flushes_1_doIt = 1'b1;
  assign _zz_fetch_logic_flushes_1_doIt_1 = (BtbPlugin_logic_flushPort_valid && 1'b1);
  assign _zz_fetch_logic_flushes_1_doIt_2 = (1'b0 || (1'b1 && BtbPlugin_logic_flushPort_payload_self));
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_3 = 33'h000002010;
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_4 = (execute_lane0_logic_decoding_decodingBits & 33'h000000050);
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_5 = 33'h000000010;
  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_6 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000028) == 33'h0);
  assign _zz_when_ExecuteLanePlugin_l300_1 = 1'b1;
  assign _zz_when_ExecuteLanePlugin_l300_1_1 = 1'b1;
  assign _zz_when_ExecuteLanePlugin_l300_1_2 = 1'b0;
  assign _zz_when_ExecuteLanePlugin_l300_1_3 = (1'b1 && CsrAccessPlugin_logic_flushPort_payload_self);
  assign _zz_when_ExecuteLanePlugin_l300_1_4 = (early0_BranchPlugin_logic_flushPort_valid && 1'b1);
  assign _zz_when_ExecuteLanePlugin_l300_1_5 = (1'b0 || (1'b1 && early0_BranchPlugin_logic_flushPort_payload_self));
  assign _zz_when_ExecuteLanePlugin_l300_1_6 = (LsuCachelessPlugin_logic_flushPort_valid && 1'b1);
  assign _zz_when_ExecuteLanePlugin_l300_1_7 = (1'b0 || (1'b1 && LsuCachelessPlugin_logic_flushPort_payload_self));
  assign BtbPlugin_logic_ras_mem_stack_spinal_port0 = BtbPlugin_logic_ras_mem_stack[BtbPlugin_logic_ras_ptr_pop_aheadValue];
  always @(posedge clk) begin
    if(_zz_2) begin
      BtbPlugin_logic_ras_mem_stack[BtbPlugin_logic_ras_write_payload_address] <= _zz_BtbPlugin_logic_ras_mem_stack_port;
    end
  end

  always @(posedge clk) begin
    if(_zz_7) begin
      FetchL1Plugin_logic_banks_0_mem[FetchL1Plugin_logic_banks_0_write_payload_address] <= FetchL1Plugin_logic_banks_0_write_payload_data;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_banks_0_read_cmd_valid) begin
      FetchL1Plugin_logic_banks_0_mem_spinal_port1 <= FetchL1Plugin_logic_banks_0_mem[FetchL1Plugin_logic_banks_0_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_6) begin
      FetchL1Plugin_logic_banks_1_mem[FetchL1Plugin_logic_banks_1_write_payload_address] <= FetchL1Plugin_logic_banks_1_write_payload_data;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_banks_1_read_cmd_valid) begin
      FetchL1Plugin_logic_banks_1_mem_spinal_port1 <= FetchL1Plugin_logic_banks_1_mem[FetchL1Plugin_logic_banks_1_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_5) begin
      FetchL1Plugin_logic_banks_2_mem[FetchL1Plugin_logic_banks_2_write_payload_address] <= FetchL1Plugin_logic_banks_2_write_payload_data;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_banks_2_read_cmd_valid) begin
      FetchL1Plugin_logic_banks_2_mem_spinal_port1 <= FetchL1Plugin_logic_banks_2_mem[FetchL1Plugin_logic_banks_2_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_4) begin
      FetchL1Plugin_logic_banks_3_mem[FetchL1Plugin_logic_banks_3_write_payload_address] <= FetchL1Plugin_logic_banks_3_write_payload_data;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_banks_3_read_cmd_valid) begin
      FetchL1Plugin_logic_banks_3_mem_spinal_port1 <= FetchL1Plugin_logic_banks_3_mem[FetchL1Plugin_logic_banks_3_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_FetchL1Plugin_logic_ways_0_mem_port_1) begin
      FetchL1Plugin_logic_ways_0_mem[FetchL1Plugin_logic_waysWrite_address] <= _zz_FetchL1Plugin_logic_ways_0_mem_port;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_ways_0_read_cmd_valid) begin
      FetchL1Plugin_logic_ways_0_mem_spinal_port1 <= FetchL1Plugin_logic_ways_0_mem[FetchL1Plugin_logic_ways_0_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_FetchL1Plugin_logic_ways_1_mem_port_1) begin
      FetchL1Plugin_logic_ways_1_mem[FetchL1Plugin_logic_waysWrite_address] <= _zz_FetchL1Plugin_logic_ways_1_mem_port;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_ways_1_read_cmd_valid) begin
      FetchL1Plugin_logic_ways_1_mem_spinal_port1 <= FetchL1Plugin_logic_ways_1_mem[FetchL1Plugin_logic_ways_1_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_FetchL1Plugin_logic_ways_2_mem_port_1) begin
      FetchL1Plugin_logic_ways_2_mem[FetchL1Plugin_logic_waysWrite_address] <= _zz_FetchL1Plugin_logic_ways_2_mem_port;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_ways_2_read_cmd_valid) begin
      FetchL1Plugin_logic_ways_2_mem_spinal_port1 <= FetchL1Plugin_logic_ways_2_mem[FetchL1Plugin_logic_ways_2_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_FetchL1Plugin_logic_ways_3_mem_port_1) begin
      FetchL1Plugin_logic_ways_3_mem[FetchL1Plugin_logic_waysWrite_address] <= _zz_FetchL1Plugin_logic_ways_3_mem_port;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_ways_3_read_cmd_valid) begin
      FetchL1Plugin_logic_ways_3_mem_spinal_port1 <= FetchL1Plugin_logic_ways_3_mem[FetchL1Plugin_logic_ways_3_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_3) begin
      FetchL1Plugin_logic_plru_mem[FetchL1Plugin_logic_plru_write_payload_address] <= _zz_FetchL1Plugin_logic_plru_mem_port;
    end
  end

  always @(posedge clk) begin
    if(FetchL1Plugin_logic_plru_read_cmd_valid) begin
      FetchL1Plugin_logic_plru_mem_spinal_port1 <= FetchL1Plugin_logic_plru_mem[FetchL1Plugin_logic_plru_read_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(BtbPlugin_logic_onLearn_port_valid) begin
      BtbPlugin_logic_mem[BtbPlugin_logic_onLearn_port_payload_address] <= _zz_BtbPlugin_logic_mem_port;
    end
  end

  always @(posedge clk) begin
    if(BtbPlugin_logic_readPort_cmd_valid) begin
      BtbPlugin_logic_mem_spinal_port1 <= BtbPlugin_logic_mem[BtbPlugin_logic_readPort_cmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      CsrRamPlugin_logic_mem[CsrRamPlugin_logic_writeLogic_port_payload_address] <= CsrRamPlugin_logic_writeLogic_port_payload_data;
    end
  end

  always @(posedge clk) begin
    if(CsrRamPlugin_logic_readLogic_port_cmd_valid) begin
      CsrRamPlugin_logic_mem_spinal_port1 <= CsrRamPlugin_logic_mem[CsrRamPlugin_logic_readLogic_port_cmd_payload];
    end
  end

  StreamArbiter streamArbiter_1 (
    .io_inputs_0_valid                      (late0_BranchPlugin_logic_jumpLogic_learn_combStage_valid                      ), //i
    .io_inputs_0_ready                      (streamArbiter_1_io_inputs_0_ready                                             ), //o
    .io_inputs_0_payload_pcOnLastSlice      (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcOnLastSlice[31:0]), //i
    .io_inputs_0_payload_pcTarget           (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcTarget[31:0]     ), //i
    .io_inputs_0_payload_taken              (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_taken              ), //i
    .io_inputs_0_payload_isBranch           (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isBranch           ), //i
    .io_inputs_0_payload_isPush             (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPush             ), //i
    .io_inputs_0_payload_isPop              (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPop              ), //i
    .io_inputs_0_payload_wasWrong           (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_wasWrong           ), //i
    .io_inputs_0_payload_badPredictedTarget (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_badPredictedTarget ), //i
    .io_inputs_0_payload_uopId              (late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_uopId[15:0]        ), //i
    .io_output_valid                        (streamArbiter_1_io_output_valid                                               ), //o
    .io_output_ready                        (io_output_combStage_ready                                                     ), //i
    .io_output_payload_pcOnLastSlice        (streamArbiter_1_io_output_payload_pcOnLastSlice[31:0]                         ), //o
    .io_output_payload_pcTarget             (streamArbiter_1_io_output_payload_pcTarget[31:0]                              ), //o
    .io_output_payload_taken                (streamArbiter_1_io_output_payload_taken                                       ), //o
    .io_output_payload_isBranch             (streamArbiter_1_io_output_payload_isBranch                                    ), //o
    .io_output_payload_isPush               (streamArbiter_1_io_output_payload_isPush                                      ), //o
    .io_output_payload_isPop                (streamArbiter_1_io_output_payload_isPop                                       ), //o
    .io_output_payload_wasWrong             (streamArbiter_1_io_output_payload_wasWrong                                    ), //o
    .io_output_payload_badPredictedTarget   (streamArbiter_1_io_output_payload_badPredictedTarget                          ), //o
    .io_output_payload_uopId                (streamArbiter_1_io_output_payload_uopId[15:0]                                 ), //o
    .io_chosenOH                            (streamArbiter_1_io_chosenOH                                                   ), //o
    .clk                                    (clk                                                                           ), //i
    .reset                                  (reset                                                                         )  //i
  );
  RegFileMem integer_RegFilePlugin_logic_regfile_fpga (
    .io_writes_0_valid   (integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_valid       ), //i
    .io_writes_0_address (integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_address[4:0]), //i
    .io_writes_0_data    (integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_data[63:0]  ), //i
    .io_writes_0_uopId   (integer_RegFilePlugin_logic_writeMerges_0_bus_uopId[15:0]        ), //i
    .io_reads_0_valid    (execute_lane0_bypasser_integer_RS1_port_valid                    ), //i
    .io_reads_0_address  (execute_lane0_bypasser_integer_RS1_port_address[4:0]             ), //i
    .io_reads_0_data     (integer_RegFilePlugin_logic_regfile_fpga_io_reads_0_data[63:0]   ), //o
    .io_reads_1_valid    (execute_lane0_bypasser_integer_RS2_port_valid                    ), //i
    .io_reads_1_address  (execute_lane0_bypasser_integer_RS2_port_address[4:0]             ), //i
    .io_reads_1_data     (integer_RegFilePlugin_logic_regfile_fpga_io_reads_1_data[63:0]   ), //o
    .clk                 (clk                                                              ), //i
    .reset               (reset                                                            )  //i
  );
  always @(*) begin
    case(_zz_early0_IterativeShifterPlugin_logic_shift_muxed_7)
      3'b000 : _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed_8;
      3'b001 : _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6 = _zz_early0_IterativeShifterPlugin_logic_shift_muxed_9;
      3'b010 : _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6 = {early0_IterativeShifterPlugin_logic_shift_shiftReg[0],{early0_IterativeShifterPlugin_logic_shift_shiftReg[1],{early0_IterativeShifterPlugin_logic_shift_shiftReg[2],{early0_IterativeShifterPlugin_logic_shift_shiftReg[3],{early0_IterativeShifterPlugin_logic_shift_shiftReg[4],{early0_IterativeShifterPlugin_logic_shift_shiftReg[5],{early0_IterativeShifterPlugin_logic_shift_shiftReg[6],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_10,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_11,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_12}}}}}}}}};
      3'b011 : _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6 = {{32{1'b0}},{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[0],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[1],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[2],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[3],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[4],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed[5],{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_27,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_28,_zz_early0_IterativeShifterPlugin_logic_shift_muxed_29}}}}}}}}};
      default : _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6 = early0_IterativeShifterPlugin_logic_shift_dataIn;
    endcase
  end

  always @(*) begin
    case(_zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4)
      2'b00 : _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5;
      2'b01 : _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6;
      default : _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = early0_IterativeShifterPlugin_logic_shift_shamt;
    endcase
  end

  always @(*) begin
    case(_zz_late0_IterativeShifterPlugin_logic_shift_muxed_7)
      3'b000 : _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed_8;
      3'b001 : _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6 = _zz_late0_IterativeShifterPlugin_logic_shift_muxed_9;
      3'b010 : _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6 = {late0_IterativeShifterPlugin_logic_shift_shiftReg[0],{late0_IterativeShifterPlugin_logic_shift_shiftReg[1],{late0_IterativeShifterPlugin_logic_shift_shiftReg[2],{late0_IterativeShifterPlugin_logic_shift_shiftReg[3],{late0_IterativeShifterPlugin_logic_shift_shiftReg[4],{late0_IterativeShifterPlugin_logic_shift_shiftReg[5],{late0_IterativeShifterPlugin_logic_shift_shiftReg[6],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_10,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_11,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_12}}}}}}}}};
      3'b011 : _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6 = {{32{1'b0}},{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[0],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[1],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[2],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[3],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[4],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed[5],{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_27,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_28,_zz_late0_IterativeShifterPlugin_logic_shift_muxed_29}}}}}}}}};
      default : _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6 = late0_IterativeShifterPlugin_logic_shift_dataIn;
    endcase
  end

  always @(*) begin
    case(_zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_4)
      2'b00 : _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_5;
      2'b01 : _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_6;
      default : _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3 = late0_IterativeShifterPlugin_logic_shift_shamt;
    endcase
  end

  always @(*) begin
    case(_zz_FetchL1Plugin_logic_banks_0_write_payload_address)
      2'b00 : _zz_FetchL1Plugin_logic_banks_0_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[63 : 0];
      2'b01 : _zz_FetchL1Plugin_logic_banks_0_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[127 : 64];
      2'b10 : _zz_FetchL1Plugin_logic_banks_0_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[191 : 128];
      default : _zz_FetchL1Plugin_logic_banks_0_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[255 : 192];
    endcase
  end

  always @(*) begin
    case(_zz_FetchL1Plugin_logic_banks_1_write_payload_address)
      2'b00 : _zz_FetchL1Plugin_logic_banks_1_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[63 : 0];
      2'b01 : _zz_FetchL1Plugin_logic_banks_1_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[127 : 64];
      2'b10 : _zz_FetchL1Plugin_logic_banks_1_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[191 : 128];
      default : _zz_FetchL1Plugin_logic_banks_1_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[255 : 192];
    endcase
  end

  always @(*) begin
    case(_zz_FetchL1Plugin_logic_banks_2_write_payload_address)
      2'b00 : _zz_FetchL1Plugin_logic_banks_2_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[63 : 0];
      2'b01 : _zz_FetchL1Plugin_logic_banks_2_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[127 : 64];
      2'b10 : _zz_FetchL1Plugin_logic_banks_2_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[191 : 128];
      default : _zz_FetchL1Plugin_logic_banks_2_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[255 : 192];
    endcase
  end

  always @(*) begin
    case(_zz_FetchL1Plugin_logic_banks_3_write_payload_address)
      2'b00 : _zz_FetchL1Plugin_logic_banks_3_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[63 : 0];
      2'b01 : _zz_FetchL1Plugin_logic_banks_3_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[127 : 64];
      2'b10 : _zz_FetchL1Plugin_logic_banks_3_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[191 : 128];
      default : _zz_FetchL1Plugin_logic_banks_3_write_payload_data = FetchL1Plugin_logic_bus_rsp_payload_data[255 : 192];
    endcase
  end

  always @(*) begin
    case(_zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0_1)
      1'b0 : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_0[31 : 0];
      default : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_0[63 : 32];
    endcase
  end

  always @(*) begin
    case(_zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1_1)
      1'b0 : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_1[31 : 0];
      default : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_1[63 : 32];
    endcase
  end

  always @(*) begin
    case(_zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2_1)
      1'b0 : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_2[31 : 0];
      default : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_2[63 : 32];
    endcase
  end

  always @(*) begin
    case(_zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3_1)
      1'b0 : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_3[31 : 0];
      default : _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_3[63 : 32];
    endcase
  end

  always @(*) begin
    case(FetchL1Plugin_logic_bankMux_reduced_bankId)
      2'b00 : _zz_fetch_logic_ctrls_2_down_Fetch_WORD = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_0;
      2'b01 : _zz_fetch_logic_ctrls_2_down_Fetch_WORD = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_1;
      2'b10 : _zz_fetch_logic_ctrls_2_down_Fetch_WORD = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_2;
      default : _zz_fetch_logic_ctrls_2_down_Fetch_WORD = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_3;
    endcase
  end

  always @(*) begin
    case(LsuCachelessPlugin_logic_onJoin_rspCounter_value)
      1'b0 : begin
        _zz_LsuCachelessPlugin_logic_onJoin_readerValid = LsuCachelessPlugin_logic_onJoin_buffers_0_valid;
        _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_error = LsuCachelessPlugin_logic_onJoin_buffers_0_payload_error;
        _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_data = LsuCachelessPlugin_logic_onJoin_buffers_0_payload_data;
      end
      default : begin
        _zz_LsuCachelessPlugin_logic_onJoin_readerValid = LsuCachelessPlugin_logic_onJoin_buffers_1_valid;
        _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_error = LsuCachelessPlugin_logic_onJoin_buffers_1_payload_error;
        _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_data = LsuCachelessPlugin_logic_onJoin_buffers_1_payload_data;
      end
    endcase
  end

  always @(*) begin
    case(_zz_LsuCachelessPlugin_logic_onWb_rspShifted_1)
      3'b000 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_0;
      3'b001 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_1;
      3'b010 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_2;
      3'b011 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_3;
      3'b100 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_4;
      3'b101 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_5;
      3'b110 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_6;
      default : _zz_LsuCachelessPlugin_logic_onWb_rspShifted = LsuCachelessPlugin_logic_onWb_rspSplits_7;
    endcase
  end

  always @(*) begin
    case(_zz_LsuCachelessPlugin_logic_onWb_rspShifted_4)
      2'b00 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3 = LsuCachelessPlugin_logic_onWb_rspSplits_1;
      2'b01 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3 = LsuCachelessPlugin_logic_onWb_rspSplits_3;
      2'b10 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3 = LsuCachelessPlugin_logic_onWb_rspSplits_5;
      default : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3 = LsuCachelessPlugin_logic_onWb_rspSplits_7;
    endcase
  end

  always @(*) begin
    case(_zz_LsuCachelessPlugin_logic_onWb_rspShifted_7)
      1'b0 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_6 = LsuCachelessPlugin_logic_onWb_rspSplits_2;
      default : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_6 = LsuCachelessPlugin_logic_onWb_rspSplits_6;
    endcase
  end

  always @(*) begin
    case(_zz_LsuCachelessPlugin_logic_onWb_rspShifted_10)
      1'b0 : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_9 = LsuCachelessPlugin_logic_onWb_rspSplits_3;
      default : _zz_LsuCachelessPlugin_logic_onWb_rspShifted_9 = LsuCachelessPlugin_logic_onWb_rspSplits_7;
    endcase
  end

  always @(*) begin
    case(CsrRamPlugin_logic_readLogic_sel)
      1'b0 : _zz_CsrRamPlugin_logic_readLogic_port_cmd_payload = TrapPlugin_logic_harts_0_crsPorts_read_address;
      default : _zz_CsrRamPlugin_logic_readLogic_port_cmd_payload = CsrRamPlugin_csrMapper_read_address;
    endcase
  end

  always @(*) begin
    case(_zz_WhiteboxerPlugin_logic_perf_candidatesCount_1)
      1'b0 : _zz_WhiteboxerPlugin_logic_perf_candidatesCount = 1'b0;
      default : _zz_WhiteboxerPlugin_logic_perf_candidatesCount = 1'b1;
    endcase
  end

  always @(*) begin
    case(_zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount_1)
      1'b0 : _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount = 1'b0;
      default : _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount = 1'b1;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_up_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_ECALL : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "ECALL     ";
      EnvPluginOp_EBREAK : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "SFENCE_VMA";
      EnvPluginOp_WFI : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "WFI       ";
      default : execute_ctrl1_up_early0_EnvPlugin_OP_lane0_string = "??????????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl0_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_ECALL : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "ECALL     ";
      EnvPluginOp_EBREAK : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "SFENCE_VMA";
      EnvPluginOp_WFI : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "WFI       ";
      default : execute_ctrl0_down_early0_EnvPlugin_OP_lane0_string = "??????????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_ECALL : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "ECALL     ";
      EnvPluginOp_EBREAK : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "SFENCE_VMA";
      EnvPluginOp_WFI : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "WFI       ";
      default : execute_ctrl1_down_early0_EnvPlugin_OP_lane0_string = "??????????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "ZERO ";
      default : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "ZERO ";
      default : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "ZERO ";
      default : _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_B : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "JALR";
      default : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1)
      BranchPlugin_BranchCtrlEnum_B : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1_string = "JALR";
      default : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2)
      BranchPlugin_BranchCtrlEnum_B : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2_string = "B   ";
      BranchPlugin_BranchCtrlEnum_JAL : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2_string = "JAL ";
      BranchPlugin_BranchCtrlEnum_JALR : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2_string = "JALR";
      default : _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1)
      EnvPluginOp_ECALL : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "ECALL     ";
      EnvPluginOp_EBREAK : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "SFENCE_VMA";
      EnvPluginOp_WFI : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "WFI       ";
      default : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2)
      EnvPluginOp_ECALL : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "ECALL     ";
      EnvPluginOp_EBREAK : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "SFENCE_VMA";
      EnvPluginOp_WFI : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "WFI       ";
      default : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3)
      EnvPluginOp_ECALL : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "ECALL     ";
      EnvPluginOp_EBREAK : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "EBREAK    ";
      EnvPluginOp_PRIV_RET : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "PRIV_RET  ";
      EnvPluginOp_FENCE_I : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "FENCE_I   ";
      EnvPluginOp_SFENCE_VMA : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "SFENCE_VMA";
      EnvPluginOp_WFI : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "WFI       ";
      default : _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "ZERO ";
      default : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "ZERO ";
      default : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3)
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string = "XOR_1";
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string = "OR_1 ";
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string = "AND_1";
      IntAluPlugin_AluBitwiseCtrlEnum_ZERO : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string = "ZERO ";
      default : _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RESET : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "RESET      ";
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "RUNNING    ";
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "PROCESS_1  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "TRAP_EPC   ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "TRAP_TVAL  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "TRAP_TVEC  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "TRAP_APPLY ";
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "XRET_EPC   ";
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "XRET_APPLY ";
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "JUMP       ";
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "FETCH_FLUSH";
      default : TrapPlugin_logic_harts_0_trap_fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(TrapPlugin_logic_harts_0_trap_fsm_stateNext)
      TrapPlugin_logic_harts_0_trap_fsm_RESET : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "RESET      ";
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "RUNNING    ";
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "PROCESS_1  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "TRAP_EPC   ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "TRAP_TVAL  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "TRAP_TVEC  ";
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "TRAP_APPLY ";
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "XRET_EPC   ";
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "XRET_APPLY ";
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "JUMP       ";
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "FETCH_FLUSH";
      default : TrapPlugin_logic_harts_0_trap_fsm_stateNext_string = "???????????";
    endcase
  end
  always @(*) begin
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_IDLE : CsrAccessPlugin_logic_fsm_stateReg_string = "IDLE      ";
      CsrAccessPlugin_logic_fsm_READ : CsrAccessPlugin_logic_fsm_stateReg_string = "READ      ";
      CsrAccessPlugin_logic_fsm_WRITE : CsrAccessPlugin_logic_fsm_stateReg_string = "WRITE     ";
      CsrAccessPlugin_logic_fsm_COMPLETION : CsrAccessPlugin_logic_fsm_stateReg_string = "COMPLETION";
      default : CsrAccessPlugin_logic_fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(CsrAccessPlugin_logic_fsm_stateNext)
      CsrAccessPlugin_logic_fsm_IDLE : CsrAccessPlugin_logic_fsm_stateNext_string = "IDLE      ";
      CsrAccessPlugin_logic_fsm_READ : CsrAccessPlugin_logic_fsm_stateNext_string = "READ      ";
      CsrAccessPlugin_logic_fsm_WRITE : CsrAccessPlugin_logic_fsm_stateNext_string = "WRITE     ";
      CsrAccessPlugin_logic_fsm_COMPLETION : CsrAccessPlugin_logic_fsm_stateNext_string = "COMPLETION";
      default : CsrAccessPlugin_logic_fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    BtbPlugin_logic_ras_ptr_pop_aheadValue = BtbPlugin_logic_ras_ptr_pop;
    BtbPlugin_logic_ras_ptr_pop_aheadValue = (_zz_BtbPlugin_logic_ras_ptr_pop_aheadValue - _zz_BtbPlugin_logic_ras_ptr_pop_aheadValue_3);
  end

  assign execute_ctrl3_down_RD_ENABLE_lane0 = execute_ctrl3_RD_ENABLE_lane0_bypass;
  always @(*) begin
    execute_ctrl3_RD_ENABLE_lane0_bypass = execute_ctrl3_up_RD_ENABLE_lane0;
    if(when_ExecuteLanePlugin_l300_3) begin
      execute_ctrl3_RD_ENABLE_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl3_down_LANE_SEL_lane0 = execute_ctrl3_LANE_SEL_lane0_bypass;
  always @(*) begin
    execute_ctrl3_LANE_SEL_lane0_bypass = execute_ctrl3_up_LANE_SEL_lane0;
    if(when_ExecuteLanePlugin_l300_3) begin
      execute_ctrl3_LANE_SEL_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl2_down_RD_ENABLE_lane0 = execute_ctrl2_RD_ENABLE_lane0_bypass;
  always @(*) begin
    execute_ctrl2_RD_ENABLE_lane0_bypass = execute_ctrl2_up_RD_ENABLE_lane0;
    if(when_ExecuteLanePlugin_l300_2) begin
      execute_ctrl2_RD_ENABLE_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl2_down_LANE_SEL_lane0 = execute_ctrl2_LANE_SEL_lane0_bypass;
  always @(*) begin
    execute_ctrl2_LANE_SEL_lane0_bypass = execute_ctrl2_up_LANE_SEL_lane0;
    if(when_ExecuteLanePlugin_l300_2) begin
      execute_ctrl2_LANE_SEL_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl1_down_RD_ENABLE_lane0 = execute_ctrl1_RD_ENABLE_lane0_bypass;
  always @(*) begin
    execute_ctrl1_RD_ENABLE_lane0_bypass = execute_ctrl1_up_RD_ENABLE_lane0;
    if(when_ExecuteLanePlugin_l300_1) begin
      execute_ctrl1_RD_ENABLE_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl1_down_LANE_SEL_lane0 = execute_ctrl1_LANE_SEL_lane0_bypass;
  always @(*) begin
    execute_ctrl1_LANE_SEL_lane0_bypass = execute_ctrl1_up_LANE_SEL_lane0;
    if(when_ExecuteLanePlugin_l300_1) begin
      execute_ctrl1_LANE_SEL_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl0_down_RD_ENABLE_lane0 = execute_ctrl0_RD_ENABLE_lane0_bypass;
  always @(*) begin
    execute_ctrl0_RD_ENABLE_lane0_bypass = execute_ctrl0_up_RD_ENABLE_lane0;
    if(when_ExecuteLanePlugin_l300) begin
      execute_ctrl0_RD_ENABLE_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl0_down_LANE_SEL_lane0 = execute_ctrl0_LANE_SEL_lane0_bypass;
  always @(*) begin
    execute_ctrl0_LANE_SEL_lane0_bypass = execute_ctrl0_up_LANE_SEL_lane0;
    if(when_ExecuteLanePlugin_l300) begin
      execute_ctrl0_LANE_SEL_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl2_down_integer_RS2_lane0 = execute_ctrl2_integer_RS2_lane0_bypass;
  assign execute_ctrl1_down_integer_RS2_lane0 = execute_ctrl1_integer_RS2_lane0_bypass;
  assign execute_ctrl2_down_integer_RS1_lane0 = execute_ctrl2_integer_RS1_lane0_bypass;
  assign execute_ctrl1_down_integer_RS1_lane0 = execute_ctrl1_integer_RS1_lane0_bypass;
  always @(*) begin
    _zz_1 = 1'b0;
    if(CsrRamPlugin_logic_writeLogic_port_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_ctrls_2_down_LANE_SEL_0 = decode_ctrls_2_LANE_SEL_0_bypass;
  always @(*) begin
    decode_ctrls_2_LANE_SEL_0_bypass = decode_ctrls_2_up_LANE_SEL_0;
    if(decode_logic_flushes_2_onLanes_0_doIt) begin
      decode_ctrls_2_LANE_SEL_0_bypass = 1'b0;
    end
  end

  assign decode_ctrls_1_down_LANE_SEL_0 = decode_ctrls_1_LANE_SEL_0_bypass;
  always @(*) begin
    decode_ctrls_1_LANE_SEL_0_bypass = decode_ctrls_1_up_LANE_SEL_0;
    if(decode_logic_flushes_1_onLanes_0_doIt) begin
      decode_ctrls_1_LANE_SEL_0_bypass = 1'b0;
    end
  end

  assign decode_ctrls_0_down_LANE_SEL_0 = decode_ctrls_0_LANE_SEL_0_bypass;
  always @(*) begin
    decode_ctrls_0_LANE_SEL_0_bypass = decode_ctrls_0_up_LANE_SEL_0;
    if(decode_logic_flushes_0_onLanes_0_doIt) begin
      decode_ctrls_0_LANE_SEL_0_bypass = 1'b0;
    end
  end

  assign execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 = execute_ctrl3_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  assign execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 = execute_ctrl2_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  assign execute_ctrl1_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 = execute_ctrl1_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass;
  assign execute_ctrl3_down_COMPLETED_lane0 = execute_ctrl3_COMPLETED_lane0_bypass;
  assign execute_ctrl2_down_COMPLETED_lane0 = execute_ctrl2_COMPLETED_lane0_bypass;
  assign execute_ctrl1_down_COMPLETED_lane0 = execute_ctrl1_COMPLETED_lane0_bypass;
  assign decode_ctrls_2_down_TRAP_0 = decode_ctrls_2_TRAP_0_bypass;
  always @(*) begin
    decode_ctrls_2_TRAP_0_bypass = decode_ctrls_2_up_TRAP_0;
    if(when_DecoderPlugin_l222) begin
      decode_ctrls_2_TRAP_0_bypass = 1'b1;
    end
  end

  assign execute_ctrl3_down_COMMIT_lane0 = execute_ctrl3_COMMIT_lane0_bypass;
  always @(*) begin
    execute_ctrl3_COMMIT_lane0_bypass = execute_ctrl3_up_COMMIT_lane0;
    if(when_BranchPlugin_l244_1) begin
      execute_ctrl3_COMMIT_lane0_bypass = 1'b0;
    end
  end

  assign execute_ctrl3_down_TRAP_lane0 = execute_ctrl3_TRAP_lane0_bypass;
  always @(*) begin
    execute_ctrl3_TRAP_lane0_bypass = execute_ctrl3_up_TRAP_lane0;
    if(when_BranchPlugin_l244_1) begin
      execute_ctrl3_TRAP_lane0_bypass = 1'b1;
    end
  end

  assign execute_ctrl1_down_COMMIT_lane0 = execute_ctrl1_COMMIT_lane0_bypass;
  always @(*) begin
    execute_ctrl1_COMMIT_lane0_bypass = execute_ctrl1_up_COMMIT_lane0;
    if(when_BranchPlugin_l244) begin
      execute_ctrl1_COMMIT_lane0_bypass = 1'b0;
    end
    if(when_EnvPlugin_l116) begin
      if(when_EnvPlugin_l120) begin
        execute_ctrl1_COMMIT_lane0_bypass = 1'b0;
      end
    end
    if(when_LsuCachelessPlugin_l298) begin
      execute_ctrl1_COMMIT_lane0_bypass = 1'b0;
    end
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              execute_ctrl1_COMMIT_lane0_bypass = 1'b0;
            end
          end
        end
      end
    endcase
  end

  assign execute_ctrl1_down_TRAP_lane0 = execute_ctrl1_TRAP_lane0_bypass;
  always @(*) begin
    execute_ctrl1_TRAP_lane0_bypass = execute_ctrl1_up_TRAP_lane0;
    if(when_BranchPlugin_l244) begin
      execute_ctrl1_TRAP_lane0_bypass = 1'b1;
    end
    if(when_EnvPlugin_l116) begin
      execute_ctrl1_TRAP_lane0_bypass = 1'b1;
    end
    if(when_LsuCachelessPlugin_l298) begin
      execute_ctrl1_TRAP_lane0_bypass = 1'b1;
    end
    if(CsrAccessPlugin_logic_fsm_inject_flushReg) begin
      execute_ctrl1_TRAP_lane0_bypass = 1'b1;
    end
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              execute_ctrl1_TRAP_lane0_bypass = 1'b1;
            end else begin
              if(CsrAccessPlugin_logic_fsm_inject_busTrapReg) begin
                execute_ctrl1_TRAP_lane0_bypass = 1'b1;
              end
            end
          end
        end
      end
    endcase
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(BtbPlugin_logic_ras_write_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235 = 1'b0;
    if(when_FetchL1Plugin_l234) begin
      _zz_fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(FetchL1Plugin_logic_plru_write_valid) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(FetchL1Plugin_logic_banks_3_write_valid) begin
      _zz_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(FetchL1Plugin_logic_banks_2_write_valid) begin
      _zz_5 = 1'b1;
    end
  end

  always @(*) begin
    _zz_6 = 1'b0;
    if(FetchL1Plugin_logic_banks_1_write_valid) begin
      _zz_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_7 = 1'b0;
    if(FetchL1Plugin_logic_banks_0_write_valid) begin
      _zz_7 = 1'b1;
    end
  end

  assign AlignerPlugin_api_singleFetch = 1'b0;
  assign AlignerPlugin_api_haltIt = 1'b0;
  assign DispatchPlugin_api_haltDispatch = 1'b0;
  assign CsrRamPlugin_api_holdRead = 1'b0;
  assign CsrRamPlugin_api_holdWrite = 1'b0;
  assign PrivilegedPlugin_api_harts_0_allowInterrupts = 1'b1;
  assign PrivilegedPlugin_api_harts_0_allowException = 1'b1;
  assign PrivilegedPlugin_api_harts_0_allowEbreakException = 1'b1;
  assign PrivilegedPlugin_api_harts_0_fpuEnable = 1'b0;
  always @(*) begin
    TrapPlugin_api_harts_0_redo = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        if(!when_TrapPlugin_l393) begin
          case(TrapPlugin_logic_harts_0_trap_pending_state_code)
            4'b0000 : begin
            end
            4'b0001 : begin
            end
            4'b0010 : begin
            end
            4'b0100 : begin
              TrapPlugin_api_harts_0_redo = 1'b1;
            end
            4'b0101 : begin
            end
            4'b1000 : begin
            end
            4'b0110 : begin
            end
            default : begin
            end
          endcase
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_api_harts_0_askWake = 1'b0;
    if(when_TrapPlugin_l214) begin
      TrapPlugin_api_harts_0_askWake = 1'b1;
    end
  end

  always @(*) begin
    TrapPlugin_api_harts_0_rvTrap = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_api_harts_0_rvTrap = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    DecoderPlugin_logic_forgetPort_valid = 1'b0;
    if(DecoderPlugin_logic_laneLogic_0_fixer_doIt) begin
      DecoderPlugin_logic_forgetPort_valid = 1'b1;
    end
  end

  always @(*) begin
    DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(DecoderPlugin_logic_laneLogic_0_fixer_doIt) begin
      DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice = (decode_ctrls_2_down_PC_0 + _zz_DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice);
    end
  end

  always @(*) begin
    case(execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : begin
        early0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0 & execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0);
      end
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : begin
        early0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0 | execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0);
      end
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : begin
        early0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0 ^ execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0);
      end
      default : begin
        early0_IntAluPlugin_logic_alu_bitwise = 64'h0;
      end
    endcase
  end

  assign early0_IntAluPlugin_logic_alu_result = (_zz_early0_IntAluPlugin_logic_alu_result | _zz_early0_IntAluPlugin_logic_alu_result_2);
  assign execute_ctrl1_down_early0_IntAluPlugin_ALU_RESULT_lane0 = early0_IntAluPlugin_logic_alu_result;
  assign early0_IntAluPlugin_logic_wb_valid = execute_ctrl1_down_early0_IntAluPlugin_SEL_lane0;
  assign early0_IntAluPlugin_logic_wb_payload = execute_ctrl1_down_early0_IntAluPlugin_ALU_RESULT_lane0;
  assign early0_IterativeShifterPlugin_logic_shift_selected = (execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_early0_IterativeShifterPlugin_SEL_lane0);
  always @(*) begin
    early0_IterativeShifterPlugin_logic_shift_shamt = _zz_early0_IterativeShifterPlugin_logic_shift_shamt;
    if(execute_ctrl1_down_IterativeShifterPlugin_IS_W_lane0) begin
      early0_IterativeShifterPlugin_logic_shift_shamt[5] = 1'b0;
    end
  end

  assign early0_IterativeShifterPlugin_logic_shift_rs1 = execute_ctrl1_up_integer_RS1_lane0;
  always @(*) begin
    early0_IterativeShifterPlugin_logic_shift_dataIn = early0_IterativeShifterPlugin_logic_shift_rs1;
    if(execute_ctrl1_down_IterativeShifterPlugin_IS_W_RIGHT_lane0) begin
      early0_IterativeShifterPlugin_logic_shift_dataIn[63 : 32] = ((execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0 && early0_IterativeShifterPlugin_logic_shift_rs1[31]) ? 32'hffffffff : 32'h0);
    end
  end

  assign early0_IterativeShifterPlugin_logic_shift_done = (((early0_IterativeShifterPlugin_logic_shift_shamt == 6'h0) || (early0_IterativeShifterPlugin_logic_shift_busy && (early0_IterativeShifterPlugin_logic_shift_amplitude == 6'h0))) || (((! execute_ctrl1_down_IterativeShifterPlugin_LEFT_lane0) && early0_IterativeShifterPlugin_logic_shift_busy) && ((early0_IterativeShifterPlugin_logic_shift_amplitude == 6'h01) || (early0_IterativeShifterPlugin_logic_shift_amplitude == 6'h08))));
  assign _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip = (execute_ctrl1_down_IterativeShifterPlugin_LEFT_lane0 && ((early0_IterativeShifterPlugin_logic_shift_busy && (! early0_IterativeShifterPlugin_logic_shift_flipped)) || early0_IterativeShifterPlugin_logic_shift_done));
  assign _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip_1 = (execute_ctrl1_down_IterativeShifterPlugin_IS_W_lane0 && _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed = early0_IterativeShifterPlugin_logic_shift_shiftReg[31 : 0];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_selector = {(early0_IterativeShifterPlugin_logic_shift_selected && (! early0_IterativeShifterPlugin_logic_shift_busy)),{_zz_early0_IterativeShifterPlugin_logic_shift_anyFlip_1,{_zz_early0_IterativeShifterPlugin_logic_shift_anyFlip,{(6'h08 <= early0_IterativeShifterPlugin_logic_shift_amplitude),1'b1}}}};
  always @(*) begin
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1[0] = _zz_early0_IterativeShifterPlugin_logic_shift_selector[4];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1[1] = _zz_early0_IterativeShifterPlugin_logic_shift_selector[3];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1[2] = _zz_early0_IterativeShifterPlugin_logic_shift_selector[2];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1[3] = _zz_early0_IterativeShifterPlugin_logic_shift_selector[1];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_1[4] = _zz_early0_IterativeShifterPlugin_logic_shift_selector[0];
  end

  assign _zz_early0_IterativeShifterPlugin_logic_shift_selector_2 = (_zz_early0_IterativeShifterPlugin_logic_shift_selector_1 & (~ _zz__zz_early0_IterativeShifterPlugin_logic_shift_selector_2));
  always @(*) begin
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3[0] = _zz_early0_IterativeShifterPlugin_logic_shift_selector_2[4];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3[1] = _zz_early0_IterativeShifterPlugin_logic_shift_selector_2[3];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3[2] = _zz_early0_IterativeShifterPlugin_logic_shift_selector_2[2];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3[3] = _zz_early0_IterativeShifterPlugin_logic_shift_selector_2[1];
    _zz_early0_IterativeShifterPlugin_logic_shift_selector_3[4] = _zz_early0_IterativeShifterPlugin_logic_shift_selector_2[0];
  end

  assign early0_IterativeShifterPlugin_logic_shift_selector = _zz_early0_IterativeShifterPlugin_logic_shift_selector_3;
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_1 = early0_IterativeShifterPlugin_logic_shift_selector[1];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_2 = early0_IterativeShifterPlugin_logic_shift_selector[3];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_3 = early0_IterativeShifterPlugin_logic_shift_selector[4];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_4 = (_zz_early0_IterativeShifterPlugin_logic_shift_muxed_1 || _zz_early0_IterativeShifterPlugin_logic_shift_muxed_2);
  assign _zz_early0_IterativeShifterPlugin_logic_shift_muxed_5 = (early0_IterativeShifterPlugin_logic_shift_selector[2] || _zz_early0_IterativeShifterPlugin_logic_shift_muxed_2);
  assign early0_IterativeShifterPlugin_logic_shift_muxed = _zz_early0_IterativeShifterPlugin_logic_shift_muxed_6;
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude = {_zz_early0_IterativeShifterPlugin_logic_shift_muxed_3,{_zz_early0_IterativeShifterPlugin_logic_shift_muxed_1,early0_IterativeShifterPlugin_logic_shift_selector[0]}};
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1 = _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude[1];
  assign _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2 = _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude[2];
  assign early0_IterativeShifterPlugin_logic_shift_updatedAmplitude = _zz_early0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3;
  assign early0_IterativeShifterPlugin_logic_shift_anyFlip = ((1'b0 || _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip) || _zz_early0_IterativeShifterPlugin_logic_shift_anyFlip_1);
  assign when_IterativeShiftPlugin_l179 = (! early0_IterativeShifterPlugin_logic_shift_anyFlip);
  assign when_IterativeShiftPlugin_l184 = early0_IterativeShifterPlugin_logic_shift_selector[4];
  assign when_IterativeShiftPlugin_l189 = ((early0_IterativeShifterPlugin_logic_shift_busy && early0_IterativeShifterPlugin_logic_shift_done) || early0_IterativeShifterPlugin_logic_shift_unscheduleRequest);
  assign early0_IterativeShifterPlugin_logic_shift_freezeIt = ((early0_IterativeShifterPlugin_logic_shift_selected && (! early0_IterativeShifterPlugin_logic_shift_done)) && (! early0_IterativeShifterPlugin_logic_shift_unscheduleRequest));
  assign execute_ctrl1_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0 = early0_IterativeShifterPlugin_logic_shift_muxed;
  assign early0_IterativeShifterPlugin_logic_wb_valid = execute_ctrl2_down_early0_IterativeShifterPlugin_SEL_lane0;
  assign early0_IterativeShifterPlugin_logic_wb_payload = execute_ctrl2_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  always @(*) begin
    PrivilegedPlugin_logic_harts_0_xretAwayFromMachine = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
        if(when_TrapPlugin_l637) begin
          PrivilegedPlugin_logic_harts_0_xretAwayFromMachine = 1'b1;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    PrivilegedPlugin_logic_harts_0_int_pending = 1'b0;
    if(TrapPlugin_logic_harts_0_interrupt_pendingInterrupt) begin
      PrivilegedPlugin_logic_harts_0_int_pending = 1'b1;
    end
  end

  assign PrivilegedPlugin_logic_harts_0_withMachinePrivilege = (2'b11 <= PrivilegedPlugin_logic_harts_0_privilege);
  assign PrivilegedPlugin_logic_harts_0_withSupervisorPrivilege = (2'b01 <= PrivilegedPlugin_logic_harts_0_privilege);
  assign PrivilegedPlugin_logic_harts_0_hartRunning = 1'b1;
  assign PrivilegedPlugin_logic_harts_0_debugMode = (! PrivilegedPlugin_logic_harts_0_hartRunning);
  assign PrivilegedPlugin_logic_harts_0_m_status_mpp = 2'b11;
  assign PrivilegedPlugin_logic_harts_0_m_status_sd = 1'b0;
  assign PrivilegedPlugin_logic_harts_0_m_status_tw = 1'b0;
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_1 = (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_768);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_2 = (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_834);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_3 = (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_836);
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_4 = (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_772);
  assign _zz_when_TrapPlugin_l195 = (PrivilegedPlugin_logic_harts_0_m_ip_mtip && PrivilegedPlugin_logic_harts_0_m_ie_mtie);
  assign _zz_when_TrapPlugin_l195_1 = (PrivilegedPlugin_logic_harts_0_m_ip_msip && PrivilegedPlugin_logic_harts_0_m_ie_msie);
  assign _zz_when_TrapPlugin_l195_2 = (PrivilegedPlugin_logic_harts_0_m_ip_meip && PrivilegedPlugin_logic_harts_0_m_ie_meie);
  always @(*) begin
    case(execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0)
      IntAluPlugin_AluBitwiseCtrlEnum_AND_1 : begin
        late0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0 & execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0);
      end
      IntAluPlugin_AluBitwiseCtrlEnum_OR_1 : begin
        late0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0 | execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0);
      end
      IntAluPlugin_AluBitwiseCtrlEnum_XOR_1 : begin
        late0_IntAluPlugin_logic_alu_bitwise = (execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0 ^ execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0);
      end
      default : begin
        late0_IntAluPlugin_logic_alu_bitwise = 64'h0;
      end
    endcase
  end

  assign late0_IntAluPlugin_logic_alu_result = (_zz_late0_IntAluPlugin_logic_alu_result | _zz_late0_IntAluPlugin_logic_alu_result_2);
  assign execute_ctrl3_down_late0_IntAluPlugin_ALU_RESULT_lane0 = late0_IntAluPlugin_logic_alu_result;
  assign late0_IntAluPlugin_logic_wb_valid = execute_ctrl3_down_late0_IntAluPlugin_SEL_lane0;
  assign late0_IntAluPlugin_logic_wb_payload = execute_ctrl3_down_late0_IntAluPlugin_ALU_RESULT_lane0;
  assign late0_IterativeShifterPlugin_logic_shift_selected = (execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_down_late0_IterativeShifterPlugin_SEL_lane0);
  always @(*) begin
    late0_IterativeShifterPlugin_logic_shift_shamt = _zz_late0_IterativeShifterPlugin_logic_shift_shamt;
    if(execute_ctrl3_down_IterativeShifterPlugin_IS_W_lane0) begin
      late0_IterativeShifterPlugin_logic_shift_shamt[5] = 1'b0;
    end
  end

  assign late0_IterativeShifterPlugin_logic_shift_rs1 = execute_ctrl3_up_integer_RS1_lane0;
  always @(*) begin
    late0_IterativeShifterPlugin_logic_shift_dataIn = late0_IterativeShifterPlugin_logic_shift_rs1;
    if(execute_ctrl3_down_IterativeShifterPlugin_IS_W_RIGHT_lane0) begin
      late0_IterativeShifterPlugin_logic_shift_dataIn[63 : 32] = ((execute_ctrl3_down_IterativeShifterPlugin_ARITHMETIC_lane0 && late0_IterativeShifterPlugin_logic_shift_rs1[31]) ? 32'hffffffff : 32'h0);
    end
  end

  assign late0_IterativeShifterPlugin_logic_shift_done = (((late0_IterativeShifterPlugin_logic_shift_shamt == 6'h0) || (late0_IterativeShifterPlugin_logic_shift_busy && (late0_IterativeShifterPlugin_logic_shift_amplitude == 6'h0))) || (((! execute_ctrl3_down_IterativeShifterPlugin_LEFT_lane0) && late0_IterativeShifterPlugin_logic_shift_busy) && ((late0_IterativeShifterPlugin_logic_shift_amplitude == 6'h01) || (late0_IterativeShifterPlugin_logic_shift_amplitude == 6'h08))));
  assign _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip = (execute_ctrl3_down_IterativeShifterPlugin_LEFT_lane0 && ((late0_IterativeShifterPlugin_logic_shift_busy && (! late0_IterativeShifterPlugin_logic_shift_flipped)) || late0_IterativeShifterPlugin_logic_shift_done));
  assign _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip_1 = (execute_ctrl3_down_IterativeShifterPlugin_IS_W_lane0 && _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed = late0_IterativeShifterPlugin_logic_shift_shiftReg[31 : 0];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_selector = {(late0_IterativeShifterPlugin_logic_shift_selected && (! late0_IterativeShifterPlugin_logic_shift_busy)),{_zz_late0_IterativeShifterPlugin_logic_shift_anyFlip_1,{_zz_late0_IterativeShifterPlugin_logic_shift_anyFlip,{(6'h08 <= late0_IterativeShifterPlugin_logic_shift_amplitude),1'b1}}}};
  always @(*) begin
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1[0] = _zz_late0_IterativeShifterPlugin_logic_shift_selector[4];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1[1] = _zz_late0_IterativeShifterPlugin_logic_shift_selector[3];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1[2] = _zz_late0_IterativeShifterPlugin_logic_shift_selector[2];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1[3] = _zz_late0_IterativeShifterPlugin_logic_shift_selector[1];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_1[4] = _zz_late0_IterativeShifterPlugin_logic_shift_selector[0];
  end

  assign _zz_late0_IterativeShifterPlugin_logic_shift_selector_2 = (_zz_late0_IterativeShifterPlugin_logic_shift_selector_1 & (~ _zz__zz_late0_IterativeShifterPlugin_logic_shift_selector_2));
  always @(*) begin
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3[0] = _zz_late0_IterativeShifterPlugin_logic_shift_selector_2[4];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3[1] = _zz_late0_IterativeShifterPlugin_logic_shift_selector_2[3];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3[2] = _zz_late0_IterativeShifterPlugin_logic_shift_selector_2[2];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3[3] = _zz_late0_IterativeShifterPlugin_logic_shift_selector_2[1];
    _zz_late0_IterativeShifterPlugin_logic_shift_selector_3[4] = _zz_late0_IterativeShifterPlugin_logic_shift_selector_2[0];
  end

  assign late0_IterativeShifterPlugin_logic_shift_selector = _zz_late0_IterativeShifterPlugin_logic_shift_selector_3;
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_1 = late0_IterativeShifterPlugin_logic_shift_selector[1];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_2 = late0_IterativeShifterPlugin_logic_shift_selector[3];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_3 = late0_IterativeShifterPlugin_logic_shift_selector[4];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_4 = (_zz_late0_IterativeShifterPlugin_logic_shift_muxed_1 || _zz_late0_IterativeShifterPlugin_logic_shift_muxed_2);
  assign _zz_late0_IterativeShifterPlugin_logic_shift_muxed_5 = (late0_IterativeShifterPlugin_logic_shift_selector[2] || _zz_late0_IterativeShifterPlugin_logic_shift_muxed_2);
  assign late0_IterativeShifterPlugin_logic_shift_muxed = _zz_late0_IterativeShifterPlugin_logic_shift_muxed_6;
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude = {_zz_late0_IterativeShifterPlugin_logic_shift_muxed_3,{_zz_late0_IterativeShifterPlugin_logic_shift_muxed_1,late0_IterativeShifterPlugin_logic_shift_selector[0]}};
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_1 = _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude[1];
  assign _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_2 = _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude[2];
  assign late0_IterativeShifterPlugin_logic_shift_updatedAmplitude = _zz_late0_IterativeShifterPlugin_logic_shift_updatedAmplitude_3;
  assign late0_IterativeShifterPlugin_logic_shift_anyFlip = ((1'b0 || _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip) || _zz_late0_IterativeShifterPlugin_logic_shift_anyFlip_1);
  assign when_IterativeShiftPlugin_l179_1 = (! late0_IterativeShifterPlugin_logic_shift_anyFlip);
  assign when_IterativeShiftPlugin_l184_1 = late0_IterativeShifterPlugin_logic_shift_selector[4];
  assign when_IterativeShiftPlugin_l189_1 = ((late0_IterativeShifterPlugin_logic_shift_busy && late0_IterativeShifterPlugin_logic_shift_done) || late0_IterativeShifterPlugin_logic_shift_unscheduleRequest);
  assign late0_IterativeShifterPlugin_logic_shift_freezeIt = ((late0_IterativeShifterPlugin_logic_shift_selected && (! late0_IterativeShifterPlugin_logic_shift_done)) && (! late0_IterativeShifterPlugin_logic_shift_unscheduleRequest));
  assign execute_ctrl3_down_late0_IterativeShifterPlugin_SHIFT_RESULT_lane0 = late0_IterativeShifterPlugin_logic_shift_muxed;
  assign late0_IterativeShifterPlugin_logic_wb_valid = execute_ctrl3_down_late0_IterativeShifterPlugin_SEL_lane0;
  assign late0_IterativeShifterPlugin_logic_wb_payload = execute_ctrl3_down_late0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  assign WhiteboxerPlugin_logic_fetch_fire = fetch_logic_ctrls_0_down_isFiring;
  always @(*) begin
    case(execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_JALR : begin
        early0_BranchPlugin_pcCalc_target_a = execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[31:0];
      end
      default : begin
        early0_BranchPlugin_pcCalc_target_a = execute_ctrl1_down_PC_lane0;
      end
    endcase
  end

  always @(*) begin
    case(execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_JAL : begin
        early0_BranchPlugin_pcCalc_target_b = {{43{_zz_early0_BranchPlugin_pcCalc_target_b[20]}}, _zz_early0_BranchPlugin_pcCalc_target_b};
      end
      BranchPlugin_BranchCtrlEnum_JALR : begin
        early0_BranchPlugin_pcCalc_target_b = {{52{_zz_early0_BranchPlugin_pcCalc_target_b_1[11]}}, _zz_early0_BranchPlugin_pcCalc_target_b_1};
      end
      default : begin
        early0_BranchPlugin_pcCalc_target_b = {{51{_zz_early0_BranchPlugin_pcCalc_target_b_2[12]}}, _zz_early0_BranchPlugin_pcCalc_target_b_2};
      end
    endcase
  end

  assign early0_BranchPlugin_pcCalc_slices = (_zz_early0_BranchPlugin_pcCalc_slices + {1'b0,1'b1});
  always @(*) begin
    execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 = _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0[31:0];
    execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0[0] = 1'b0;
  end

  assign execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 = (execute_ctrl1_down_PC_lane0 + _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0);
  assign execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 = (execute_ctrl1_down_PC_lane0 + _zz_execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0);
  assign AlignerPlugin_logic_maskGen_frontMasks_0 = 1'b1;
  assign AlignerPlugin_logic_maskGen_backMasks_0 = 1'b1;
  assign fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_MASK = (AlignerPlugin_logic_maskGen_frontMasks_0 & ((! fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED) ? 1'b1 : AlignerPlugin_logic_maskGen_backMasks_0));
  assign fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_LAST = ((fetch_logic_ctrls_2_up_isValid && fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED) ? 1'b1 : 1'b0);
  assign AlignerPlugin_logic_slicesInstructions_0 = AlignerPlugin_logic_slices_data_0;
  assign AlignerPlugin_logic_slicesInstructions_1 = AlignerPlugin_logic_slices_data_1;
  always @(*) begin
    AlignerPlugin_logic_scanners_0_usageMask = 2'b00;
    AlignerPlugin_logic_scanners_0_usageMask[0] = AlignerPlugin_logic_scanners_0_checker_0_required;
  end

  assign AlignerPlugin_logic_scanners_0_checker_0_required = 1'b1;
  assign AlignerPlugin_logic_scanners_0_checker_0_last = (AlignerPlugin_logic_slices_data_0[1 : 0] != 2'b11);
  assign AlignerPlugin_logic_scanners_0_checker_0_redo = 1'b0;
  assign AlignerPlugin_logic_scanners_0_checker_0_present = AlignerPlugin_logic_slices_mask[0];
  assign AlignerPlugin_logic_scanners_0_checker_0_valid = AlignerPlugin_logic_scanners_0_checker_0_present;
  assign AlignerPlugin_logic_scanners_0_redo = (|AlignerPlugin_logic_scanners_0_checker_0_redo);
  assign AlignerPlugin_logic_scanners_0_valid = (AlignerPlugin_logic_scanners_0_checker_0_valid && (1'b1 || (|AlignerPlugin_logic_scanners_0_checker_0_redo)));
  always @(*) begin
    AlignerPlugin_logic_scanners_1_usageMask = 2'b00;
    AlignerPlugin_logic_scanners_1_usageMask[1] = AlignerPlugin_logic_scanners_1_checker_0_required;
  end

  assign AlignerPlugin_logic_scanners_1_checker_0_required = 1'b1;
  assign AlignerPlugin_logic_scanners_1_checker_0_last = (AlignerPlugin_logic_slices_data_1[1 : 0] != 2'b11);
  assign AlignerPlugin_logic_scanners_1_checker_0_redo = 1'b0;
  assign AlignerPlugin_logic_scanners_1_checker_0_present = AlignerPlugin_logic_slices_mask[1];
  assign AlignerPlugin_logic_scanners_1_checker_0_valid = AlignerPlugin_logic_scanners_1_checker_0_present;
  assign AlignerPlugin_logic_scanners_1_redo = (|AlignerPlugin_logic_scanners_1_checker_0_redo);
  assign AlignerPlugin_logic_scanners_1_valid = (AlignerPlugin_logic_scanners_1_checker_0_valid && (1'b1 || (|AlignerPlugin_logic_scanners_1_checker_0_redo)));
  assign AlignerPlugin_logic_usedMask_0 = 2'b00;
  assign AlignerPlugin_logic_extractors_0_first = 1'b1;
  assign AlignerPlugin_logic_extractors_0_usableMask = {(AlignerPlugin_logic_scanners_1_valid && (! AlignerPlugin_logic_usedMask_0[1])),(AlignerPlugin_logic_scanners_0_valid && (! AlignerPlugin_logic_usedMask_0[0]))};
  assign _zz_AlignerPlugin_logic_extractors_0_usableMask_bools_0 = AlignerPlugin_logic_extractors_0_usableMask;
  assign AlignerPlugin_logic_extractors_0_usableMask_bools_0 = _zz_AlignerPlugin_logic_extractors_0_usableMask_bools_0[0];
  assign AlignerPlugin_logic_extractors_0_usableMask_bools_1 = _zz_AlignerPlugin_logic_extractors_0_usableMask_bools_0[1];
  always @(*) begin
    _zz_AlignerPlugin_logic_extractors_0_slicesOh[0] = (AlignerPlugin_logic_extractors_0_usableMask_bools_0 && (! 1'b0));
    _zz_AlignerPlugin_logic_extractors_0_slicesOh[1] = (AlignerPlugin_logic_extractors_0_usableMask_bools_1 && (! AlignerPlugin_logic_extractors_0_usableMask_bools_0));
  end

  assign AlignerPlugin_logic_extractors_0_slicesOh = _zz_AlignerPlugin_logic_extractors_0_slicesOh;
  assign _zz_AlignerPlugin_logic_extractors_0_redo = AlignerPlugin_logic_extractors_0_slicesOh[0];
  assign _zz_AlignerPlugin_logic_extractors_0_redo_1 = AlignerPlugin_logic_extractors_0_slicesOh[1];
  always @(*) begin
    AlignerPlugin_logic_extractors_0_redo = _zz_AlignerPlugin_logic_extractors_0_redo_2[0];
    if(when_AlignerPlugin_l163) begin
      AlignerPlugin_logic_extractors_0_redo = 1'b0;
    end
  end

  assign AlignerPlugin_logic_extractors_0_localMask = ((_zz_AlignerPlugin_logic_extractors_0_redo ? AlignerPlugin_logic_scanners_0_checker_0_required : 1'b0) | (_zz_AlignerPlugin_logic_extractors_0_redo_1 ? AlignerPlugin_logic_scanners_1_checker_0_required : 1'b0));
  assign AlignerPlugin_logic_extractors_0_usageMask = ((_zz_AlignerPlugin_logic_extractors_0_redo ? AlignerPlugin_logic_scanners_0_usageMask : 2'b00) | (_zz_AlignerPlugin_logic_extractors_0_redo_1 ? AlignerPlugin_logic_scanners_1_usageMask : 2'b00));
  assign AlignerPlugin_logic_usedMask_1 = (AlignerPlugin_logic_usedMask_0 | AlignerPlugin_logic_extractors_0_usageMask);
  always @(*) begin
    AlignerPlugin_logic_extractors_0_valid = (|AlignerPlugin_logic_extractors_0_slicesOh);
    if(when_AlignerPlugin_l163) begin
      AlignerPlugin_logic_extractors_0_valid = 1'b0;
    end
    if(when_AlignerPlugin_l243) begin
      if(when_AlignerPlugin_l244) begin
        AlignerPlugin_logic_extractors_0_valid = 1'b0;
      end
    end
  end

  assign when_AlignerPlugin_l163 = (AlignerPlugin_api_haltIt || (AlignerPlugin_api_singleFetch && (! AlignerPlugin_logic_extractors_0_first)));
  assign when_AlignerPlugin_l173 = (decode_ctrls_0_up_isFiring && 1'b1);
  assign AlignerPlugin_logic_feeder_lanes_0_valid = AlignerPlugin_logic_extractors_0_valid;
  assign decode_ctrls_0_up_LANE_SEL_0 = AlignerPlugin_logic_feeder_lanes_0_valid;
  assign decode_ctrls_0_up_Decode_INSTRUCTION_0 = AlignerPlugin_logic_extractors_0_ctx_instruction;
  assign decode_ctrls_0_up_Decode_DECOMPRESSION_FAULT_0 = 1'b0;
  always @(*) begin
    decode_ctrls_0_up_Decode_INSTRUCTION_RAW_0 = AlignerPlugin_logic_extractors_0_ctx_instruction;
    if(AlignerPlugin_logic_feeder_lanes_0_isRvc) begin
      decode_ctrls_0_up_Decode_INSTRUCTION_RAW_0[31 : 16] = 16'h0;
    end
  end

  assign AlignerPlugin_logic_feeder_lanes_0_isRvc = (AlignerPlugin_logic_extractors_0_ctx_instruction[1 : 0] != 2'b11);
  assign decode_ctrls_0_up_PC_0 = AlignerPlugin_logic_extractors_0_ctx_pc;
  assign decode_ctrls_0_up_Decode_DOP_ID_0 = AlignerPlugin_logic_feeder_harts_0_dopId;
  assign decode_ctrls_0_up_Fetch_ID_0 = AlignerPlugin_logic_extractors_0_ctx_hm_Fetch_ID;
  assign decode_ctrls_0_up_Prediction_WORD_SLICES_BRANCH_0 = AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_BRANCH;
  assign decode_ctrls_0_up_Prediction_WORD_SLICES_TAKEN_0 = AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_TAKEN;
  assign decode_ctrls_0_up_Prediction_WORD_JUMP_PC_0 = AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMP_PC;
  assign decode_ctrls_0_up_Prediction_WORD_JUMPED_0 = AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMPED;
  assign decode_ctrls_0_up_TRAP_0 = AlignerPlugin_logic_extractors_0_ctx_trap;
  assign AlignerPlugin_logic_feeder_lanes_0_onBtb_didPrediction = 1'b1;
  assign decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_0 = (decode_ctrls_0_up_Prediction_WORD_JUMPED_0 && AlignerPlugin_logic_feeder_lanes_0_onBtb_didPrediction);
  assign decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_PC_0 = decode_ctrls_0_up_Prediction_WORD_JUMP_PC_0;
  assign decode_ctrls_0_up_Prediction_ALIGNED_SLICES_BRANCH_0 = decode_ctrls_0_up_Prediction_WORD_SLICES_BRANCH_0;
  assign decode_ctrls_0_up_Prediction_ALIGNED_SLICES_TAKEN_0 = decode_ctrls_0_up_Prediction_WORD_SLICES_TAKEN_0;
  assign decode_ctrls_0_up_Prediction_ALIGN_REDO_0 = AlignerPlugin_logic_extractors_0_redo;
  assign decode_ctrls_0_up_valid = (|AlignerPlugin_logic_feeder_lanes_0_valid);
  assign _zz_AlignerPlugin_logic_slices_data_0 = {fetch_logic_ctrls_2_down_Fetch_WORD,AlignerPlugin_logic_buffer_data};
  assign AlignerPlugin_logic_slices_data_0 = _zz_AlignerPlugin_logic_slices_data_0[31 : 0];
  assign AlignerPlugin_logic_slices_data_1 = _zz_AlignerPlugin_logic_slices_data_0[63 : 32];
  assign AlignerPlugin_logic_slices_mask = {fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_MASK,AlignerPlugin_logic_buffer_mask};
  assign AlignerPlugin_logic_slices_last = {fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_LAST,AlignerPlugin_logic_buffer_last};
  assign when_AlignerPlugin_l243 = (! fetch_logic_ctrls_2_down_valid);
  assign when_AlignerPlugin_l244 = (AlignerPlugin_logic_extractors_0_usageMask[1 : 1] != 1'b0);
  assign AlignerPlugin_logic_buffer_downFire = (decode_ctrls_0_up_isReady || decode_ctrls_0_up_isCancel);
  assign AlignerPlugin_logic_buffer_usedMask = (AlignerPlugin_logic_extractors_0_valid ? AlignerPlugin_logic_extractors_0_usageMask : 2'b00);
  assign AlignerPlugin_logic_buffer_haltUp = ((|(AlignerPlugin_logic_buffer_mask & (~ (AlignerPlugin_logic_buffer_downFire ? AlignerPlugin_logic_buffer_usedMask[0 : 0] : 1'b0)))) || AlignerPlugin_api_haltIt);
  assign fetch_logic_ctrls_2_down_ready = ((! fetch_logic_ctrls_2_down_valid) || (! AlignerPlugin_logic_buffer_haltUp));
  assign when_AlignerPlugin_l259 = ((fetch_logic_ctrls_2_down_isValid && fetch_logic_ctrls_2_down_isReady) && (! fetch_logic_ctrls_2_down_isCancel));
  always @(*) begin
    CsrAccessPlugin_bus_decode_exception = 1'b0;
    if(when_PrivilegedPlugin_l681) begin
      CsrAccessPlugin_bus_decode_exception = 1'b1;
    end
  end

  always @(*) begin
    CsrAccessPlugin_bus_decode_trap = 1'b0;
    if(when_CsrAccessPlugin_l155) begin
      if(CsrAccessPlugin_bus_decode_write) begin
        CsrAccessPlugin_bus_decode_trap = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrAccessPlugin_bus_decode_trapCode = 4'bxxxx;
    if(when_CsrAccessPlugin_l155) begin
      if(CsrAccessPlugin_bus_decode_write) begin
        CsrAccessPlugin_bus_decode_trapCode = 4'b0101;
      end
    end
  end

  always @(*) begin
    CsrAccessPlugin_bus_read_halt = 1'b0;
    if(when_CsrRamPlugin_l77) begin
      CsrAccessPlugin_bus_read_halt = 1'b1;
    end
  end

  always @(*) begin
    CsrAccessPlugin_bus_write_halt = 1'b0;
    if(when_CsrRamPlugin_l88) begin
      CsrAccessPlugin_bus_write_halt = 1'b1;
    end
  end

  assign FetchL1Plugin_logic_banks_0_read_rsp = FetchL1Plugin_logic_banks_0_mem_spinal_port1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_0 = FetchL1Plugin_logic_banks_0_read_rsp;
  assign FetchL1Plugin_logic_banks_1_read_rsp = FetchL1Plugin_logic_banks_1_mem_spinal_port1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_1 = FetchL1Plugin_logic_banks_1_read_rsp;
  assign FetchL1Plugin_logic_banks_2_read_rsp = FetchL1Plugin_logic_banks_2_mem_spinal_port1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_2 = FetchL1Plugin_logic_banks_2_read_rsp;
  assign FetchL1Plugin_logic_banks_3_read_rsp = FetchL1Plugin_logic_banks_3_mem_spinal_port1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_WORDS_3 = FetchL1Plugin_logic_banks_3_read_rsp;
  always @(*) begin
    FetchL1Plugin_logic_waysWrite_mask = 4'b0000;
    if(when_FetchL1Plugin_l222) begin
      FetchL1Plugin_logic_waysWrite_mask = 4'b1111;
    end
    if(FetchL1Plugin_logic_invalidate_done) begin
      if(when_FetchL1Plugin_l326) begin
        FetchL1Plugin_logic_waysWrite_mask[FetchL1Plugin_logic_refill_onRsp_wayToAllocate] = 1'b1;
      end
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_waysWrite_address = 2'bxx;
    if(when_FetchL1Plugin_l222) begin
      FetchL1Plugin_logic_waysWrite_address = FetchL1Plugin_logic_invalidate_counter[1:0];
    end
    if(FetchL1Plugin_logic_invalidate_done) begin
      FetchL1Plugin_logic_waysWrite_address = FetchL1Plugin_logic_refill_onRsp_address[7 : 6];
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_waysWrite_tag_loaded = 1'bx;
    if(when_FetchL1Plugin_l222) begin
      FetchL1Plugin_logic_waysWrite_tag_loaded = 1'b0;
    end
    if(FetchL1Plugin_logic_invalidate_done) begin
      FetchL1Plugin_logic_waysWrite_tag_loaded = 1'b1;
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_waysWrite_tag_error = 1'bx;
    if(FetchL1Plugin_logic_invalidate_done) begin
      FetchL1Plugin_logic_waysWrite_tag_error = (FetchL1Plugin_logic_bus_rsp_valid && FetchL1Plugin_logic_bus_rsp_payload_error);
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_waysWrite_tag_address = 24'bxxxxxxxxxxxxxxxxxxxxxxxx;
    if(FetchL1Plugin_logic_invalidate_done) begin
      FetchL1Plugin_logic_waysWrite_tag_address = FetchL1Plugin_logic_refill_onRsp_address[31 : 8];
    end
  end

  assign _zz_FetchL1Plugin_logic_ways_0_read_rsp_loaded = FetchL1Plugin_logic_ways_0_mem_spinal_port1;
  assign FetchL1Plugin_logic_ways_0_read_rsp_loaded = _zz_FetchL1Plugin_logic_ways_0_read_rsp_loaded[0];
  assign FetchL1Plugin_logic_ways_0_read_rsp_error = _zz_FetchL1Plugin_logic_ways_0_read_rsp_loaded[1];
  assign FetchL1Plugin_logic_ways_0_read_rsp_address = _zz_FetchL1Plugin_logic_ways_0_read_rsp_loaded[25 : 2];
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded = FetchL1Plugin_logic_ways_0_read_rsp_loaded;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_error = FetchL1Plugin_logic_ways_0_read_rsp_error;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_address = FetchL1Plugin_logic_ways_0_read_rsp_address;
  assign _zz_FetchL1Plugin_logic_ways_1_read_rsp_loaded = FetchL1Plugin_logic_ways_1_mem_spinal_port1;
  assign FetchL1Plugin_logic_ways_1_read_rsp_loaded = _zz_FetchL1Plugin_logic_ways_1_read_rsp_loaded[0];
  assign FetchL1Plugin_logic_ways_1_read_rsp_error = _zz_FetchL1Plugin_logic_ways_1_read_rsp_loaded[1];
  assign FetchL1Plugin_logic_ways_1_read_rsp_address = _zz_FetchL1Plugin_logic_ways_1_read_rsp_loaded[25 : 2];
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded = FetchL1Plugin_logic_ways_1_read_rsp_loaded;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_error = FetchL1Plugin_logic_ways_1_read_rsp_error;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_address = FetchL1Plugin_logic_ways_1_read_rsp_address;
  assign _zz_FetchL1Plugin_logic_ways_2_read_rsp_loaded = FetchL1Plugin_logic_ways_2_mem_spinal_port1;
  assign FetchL1Plugin_logic_ways_2_read_rsp_loaded = _zz_FetchL1Plugin_logic_ways_2_read_rsp_loaded[0];
  assign FetchL1Plugin_logic_ways_2_read_rsp_error = _zz_FetchL1Plugin_logic_ways_2_read_rsp_loaded[1];
  assign FetchL1Plugin_logic_ways_2_read_rsp_address = _zz_FetchL1Plugin_logic_ways_2_read_rsp_loaded[25 : 2];
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded = FetchL1Plugin_logic_ways_2_read_rsp_loaded;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_error = FetchL1Plugin_logic_ways_2_read_rsp_error;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_address = FetchL1Plugin_logic_ways_2_read_rsp_address;
  assign _zz_FetchL1Plugin_logic_ways_3_read_rsp_loaded = FetchL1Plugin_logic_ways_3_mem_spinal_port1;
  assign FetchL1Plugin_logic_ways_3_read_rsp_loaded = _zz_FetchL1Plugin_logic_ways_3_read_rsp_loaded[0];
  assign FetchL1Plugin_logic_ways_3_read_rsp_error = _zz_FetchL1Plugin_logic_ways_3_read_rsp_loaded[1];
  assign FetchL1Plugin_logic_ways_3_read_rsp_address = _zz_FetchL1Plugin_logic_ways_3_read_rsp_loaded[25 : 2];
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded = FetchL1Plugin_logic_ways_3_read_rsp_loaded;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_error = FetchL1Plugin_logic_ways_3_read_rsp_error;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_address = FetchL1Plugin_logic_ways_3_read_rsp_address;
  assign _zz_FetchL1Plugin_logic_plru_read_rsp_0 = FetchL1Plugin_logic_plru_mem_spinal_port1;
  assign FetchL1Plugin_logic_plru_read_rsp_0 = _zz_FetchL1Plugin_logic_plru_read_rsp_0[0 : 0];
  assign FetchL1Plugin_logic_plru_read_rsp_1 = _zz_FetchL1Plugin_logic_plru_read_rsp_0[2 : 1];
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_0 = FetchL1Plugin_logic_plru_read_rsp_0;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_1 = FetchL1Plugin_logic_plru_read_rsp_1;
  assign FetchL1Plugin_logic_invalidate_cmd_valid = (|TrapPlugin_logic_fetchL1Invalidate_0_cmd_valid);
  always @(*) begin
    FetchL1Plugin_logic_invalidate_canStart = 1'b1;
    if(when_FetchL1Plugin_l295) begin
      FetchL1Plugin_logic_invalidate_canStart = 1'b0;
    end
  end

  assign FetchL1Plugin_logic_invalidate_counterIncr = (FetchL1Plugin_logic_invalidate_counter + 3'b001);
  assign FetchL1Plugin_logic_invalidate_done = FetchL1Plugin_logic_invalidate_counter[2];
  assign FetchL1Plugin_logic_invalidate_last = FetchL1Plugin_logic_invalidate_counterIncr[2];
  assign when_FetchL1Plugin_l222 = (! FetchL1Plugin_logic_invalidate_done);
  assign when_FetchL1Plugin_l229 = ((FetchL1Plugin_logic_invalidate_done && FetchL1Plugin_logic_invalidate_cmd_valid) && FetchL1Plugin_logic_invalidate_canStart);
  always @(*) begin
    TrapPlugin_logic_fetchL1Invalidate_0_cmd_ready = 1'b0;
    if(when_FetchL1Plugin_l234) begin
      if(FetchL1Plugin_logic_invalidate_last) begin
        TrapPlugin_logic_fetchL1Invalidate_0_cmd_ready = 1'b1;
      end
    end
  end

  assign when_FetchL1Plugin_l234 = (! FetchL1Plugin_logic_invalidate_done);
  assign fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235 = _zz_fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235;
  assign FetchL1Plugin_logic_refill_slots_0_askCmd = (FetchL1Plugin_logic_refill_slots_0_valid && (! FetchL1Plugin_logic_refill_slots_0_cmdSent));
  assign FetchL1Plugin_logic_refill_hazard = (|(FetchL1Plugin_logic_refill_slots_0_valid && (FetchL1Plugin_logic_refill_slots_0_address[7 : 6] == FetchL1Plugin_logic_refill_start_address[7 : 6])));
  assign when_FetchL1Plugin_l273 = ((FetchL1Plugin_logic_refill_start_valid && FetchL1Plugin_logic_invalidate_done) && (! FetchL1Plugin_logic_refill_hazard));
  assign when_FetchL1Plugin_l295 = ((|FetchL1Plugin_logic_refill_slots_0_valid) || FetchL1Plugin_logic_refill_start_valid);
  assign FetchL1Plugin_logic_refill_onCmd_oh = (FetchL1Plugin_logic_refill_slots_0_askCmd && 1'b1);
  assign FetchL1Plugin_logic_bus_cmd_valid = (|FetchL1Plugin_logic_refill_onCmd_oh);
  assign FetchL1Plugin_logic_bus_cmd_payload_address = {FetchL1Plugin_logic_refill_slots_0_address[31 : 6],6'h0};
  assign FetchL1Plugin_logic_bus_cmd_payload_io = FetchL1Plugin_logic_refill_slots_0_isIo;
  assign FetchL1Plugin_logic_refill_onRsp_holdHarts = ((|FetchL1Plugin_logic_waysWrite_mask) || (|((FetchL1Plugin_logic_refill_slots_0_valid && (FetchL1Plugin_logic_refill_slots_0_address[7 : 6] == fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6])) && (! (1'b1 && (fetch_logic_ctrls_0_down_Fetch_WORD_PC[5 : 5] < FetchL1Plugin_logic_refill_onRsp_wordIndex))))));
  assign fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l319 = FetchL1Plugin_logic_refill_onRsp_holdHarts;
  assign FetchL1Plugin_logic_bus_rsp_fire = (FetchL1Plugin_logic_bus_rsp_valid && FetchL1Plugin_logic_bus_rsp_ready);
  assign FetchL1Plugin_logic_refill_onRsp_wayToAllocate = FetchL1Plugin_logic_refill_slots_0_wayToAllocate;
  assign FetchL1Plugin_logic_refill_onRsp_address = FetchL1Plugin_logic_refill_slots_0_address;
  assign when_FetchL1Plugin_l326 = (FetchL1Plugin_logic_bus_rsp_valid && (FetchL1Plugin_logic_refill_onRsp_firstCycle || FetchL1Plugin_logic_bus_rsp_payload_error));
  assign _zz_FetchL1Plugin_logic_banks_0_write_payload_address = _zz__zz_FetchL1Plugin_logic_banks_0_write_payload_address[1 : 0];
  assign FetchL1Plugin_logic_banks_0_write_valid = (FetchL1Plugin_logic_bus_rsp_valid && 1'b1);
  assign FetchL1Plugin_logic_banks_0_write_payload_address = {{FetchL1Plugin_logic_refill_onRsp_address[7 : 6],FetchL1Plugin_logic_refill_onRsp_wordIndex},_zz_FetchL1Plugin_logic_banks_0_write_payload_address};
  assign FetchL1Plugin_logic_banks_0_write_payload_data = _zz_FetchL1Plugin_logic_banks_0_write_payload_data;
  assign _zz_FetchL1Plugin_logic_banks_1_write_payload_address = _zz__zz_FetchL1Plugin_logic_banks_1_write_payload_address[1 : 0];
  assign FetchL1Plugin_logic_banks_1_write_valid = (FetchL1Plugin_logic_bus_rsp_valid && 1'b1);
  assign FetchL1Plugin_logic_banks_1_write_payload_address = {{FetchL1Plugin_logic_refill_onRsp_address[7 : 6],FetchL1Plugin_logic_refill_onRsp_wordIndex},_zz_FetchL1Plugin_logic_banks_1_write_payload_address};
  assign FetchL1Plugin_logic_banks_1_write_payload_data = _zz_FetchL1Plugin_logic_banks_1_write_payload_data;
  assign _zz_FetchL1Plugin_logic_banks_2_write_payload_address = _zz__zz_FetchL1Plugin_logic_banks_2_write_payload_address[1 : 0];
  assign FetchL1Plugin_logic_banks_2_write_valid = (FetchL1Plugin_logic_bus_rsp_valid && 1'b1);
  assign FetchL1Plugin_logic_banks_2_write_payload_address = {{FetchL1Plugin_logic_refill_onRsp_address[7 : 6],FetchL1Plugin_logic_refill_onRsp_wordIndex},_zz_FetchL1Plugin_logic_banks_2_write_payload_address};
  assign FetchL1Plugin_logic_banks_2_write_payload_data = _zz_FetchL1Plugin_logic_banks_2_write_payload_data;
  assign _zz_FetchL1Plugin_logic_banks_3_write_payload_address = _zz__zz_FetchL1Plugin_logic_banks_3_write_payload_address[1 : 0];
  assign FetchL1Plugin_logic_banks_3_write_valid = (FetchL1Plugin_logic_bus_rsp_valid && 1'b1);
  assign FetchL1Plugin_logic_banks_3_write_payload_address = {{FetchL1Plugin_logic_refill_onRsp_address[7 : 6],FetchL1Plugin_logic_refill_onRsp_wordIndex},_zz_FetchL1Plugin_logic_banks_3_write_payload_address};
  assign FetchL1Plugin_logic_banks_3_write_payload_data = _zz_FetchL1Plugin_logic_banks_3_write_payload_data;
  assign FetchL1Plugin_logic_bus_rsp_ready = 1'b1;
  assign when_FetchL1Plugin_l352 = (FetchL1Plugin_logic_refill_onRsp_wordIndex == 1'b1);
  assign FetchL1Plugin_logic_cmd_doIt = (fetch_logic_ctrls_1_up_ready || ((! fetch_logic_ctrls_1_up_valid) && 1'b1));
  assign FetchL1Plugin_logic_banks_0_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_banks_0_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 3];
  assign FetchL1Plugin_logic_banks_1_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_banks_1_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 3];
  assign FetchL1Plugin_logic_banks_2_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_banks_2_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 3];
  assign FetchL1Plugin_logic_banks_3_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_banks_3_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 3];
  assign FetchL1Plugin_logic_ways_0_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_ways_0_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6];
  assign FetchL1Plugin_logic_ways_1_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_ways_1_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6];
  assign FetchL1Plugin_logic_ways_2_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_ways_2_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6];
  assign FetchL1Plugin_logic_ways_3_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_ways_3_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6];
  assign FetchL1Plugin_logic_plru_read_cmd_valid = FetchL1Plugin_logic_cmd_doIt;
  assign FetchL1Plugin_logic_plru_read_cmd_payload = fetch_logic_ctrls_0_down_Fetch_WORD_PC[7 : 6];
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID = (FetchL1Plugin_logic_plru_write_valid && (FetchL1Plugin_logic_plru_write_payload_address == FetchL1Plugin_logic_plru_read_cmd_payload));
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0 = FetchL1Plugin_logic_plru_write_payload_data_0;
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1 = FetchL1Plugin_logic_plru_write_payload_data_1;
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE = (|FetchL1Plugin_logic_waysWrite_mask);
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS = FetchL1Plugin_logic_waysWrite_address;
  always @(*) begin
    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_0 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_0;
    if(fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID) begin
      fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_0 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
    end
  end

  always @(*) begin
    fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_1 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_READ_1;
    if(fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID) begin
      fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_1 = fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
    end
  end

  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0 = _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1 = _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2 = _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3 = _zz_fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3;
  assign _zz_FetchL1Plugin_logic_bankMux_reduced_wayId = (fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_1 || fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_3);
  assign _zz_FetchL1Plugin_logic_bankMux_reduced_wayId_1 = (fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_2 || fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_3);
  assign FetchL1Plugin_logic_bankMux_reduced_wayId = {_zz_FetchL1Plugin_logic_bankMux_reduced_wayId_1,_zz_FetchL1Plugin_logic_bankMux_reduced_wayId};
  assign FetchL1Plugin_logic_bankMux_reduced_bankId = _zz_FetchL1Plugin_logic_bankMux_reduced_bankId;
  assign fetch_logic_ctrls_2_down_Fetch_WORD = _zz_fetch_logic_ctrls_2_down_Fetch_WORD;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_HAZARD = (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE && (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS == fetch_logic_ctrls_1_down_Fetch_WORD_PC[7 : 6]));
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_0 = (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded && (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_address == fetch_logic_ctrls_1_down_MMU_TRANSLATED[31 : 8]));
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_1 = (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded && (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_address == fetch_logic_ctrls_1_down_MMU_TRANSLATED[31 : 8]));
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_2 = (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded && (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_address == fetch_logic_ctrls_1_down_MMU_TRANSLATED[31 : 8]));
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_3 = (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded && (fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_address == fetch_logic_ctrls_1_down_MMU_TRANSLATED[31 : 8]));
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HIT = (|{fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_3,{fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_2,{fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_1,fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_0}}});
  assign FetchL1Plugin_logic_ctrl_pmaPort_cmd_address = fetch_logic_ctrls_2_down_MMU_TRANSLATED;
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_0_state = FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_0[0];
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_0 = (! FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_0_state);
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_stateSel = FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_0;
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_state = FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_1[FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_stateSel];
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_1 = (! FetchL1Plugin_logic_ctrl_plruLogic_core_evict_logic_1_state);
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_io_evict_id = {FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_0,FetchL1Plugin_logic_ctrl_plruLogic_core_evict_sel_1};
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_0[0] = FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_id[1];
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_update_logic_1_sel = FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_id[1 : 1];
  always @(*) begin
    FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_1 = FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_1;
    FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_1[FetchL1Plugin_logic_ctrl_plruLogic_core_update_logic_1_sel] = FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_id[0];
  end

  assign FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_0 = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_0;
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_io_context_state_1 = fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_1;
  assign FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_id = FetchL1Plugin_logic_bankMux_reduced_wayId;
  always @(*) begin
    FetchL1Plugin_logic_plru_write_valid = FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_valid;
    if(when_FetchL1Plugin_l580) begin
      FetchL1Plugin_logic_plru_write_valid = 1'b1;
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_plru_write_payload_address = FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_address;
    if(when_FetchL1Plugin_l580) begin
      FetchL1Plugin_logic_plru_write_payload_address = FetchL1Plugin_logic_invalidate_counter[1:0];
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_plru_write_payload_data_0 = FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_0;
    if(when_FetchL1Plugin_l580) begin
      FetchL1Plugin_logic_plru_write_payload_data_0 = _zz_FetchL1Plugin_logic_plru_write_payload_data_0[0 : 0];
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_plru_write_payload_data_1 = FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_1;
    if(when_FetchL1Plugin_l580) begin
      FetchL1Plugin_logic_plru_write_payload_data_1 = _zz_FetchL1Plugin_logic_plru_write_payload_data_0[2 : 1];
    end
  end

  assign FetchL1Plugin_logic_ctrl_plruLogic_buffer_valid = (fetch_logic_ctrls_2_up_isValid && fetch_logic_ctrls_2_up_isReady);
  assign FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_address = fetch_logic_ctrls_2_down_Fetch_WORD_PC[7 : 6];
  assign FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_0 = FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_0;
  assign FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_1 = FetchL1Plugin_logic_ctrl_plruLogic_core_io_update_state_1;
  assign FetchL1Plugin_logic_refill_start_wayToAllocate = FetchL1Plugin_logic_ctrl_plruLogic_core_io_evict_id;
  assign FetchL1Plugin_logic_ctrl_dataAccessFault = (_zz_FetchL1Plugin_logic_ctrl_dataAccessFault[0] && (! fetch_logic_ctrls_2_down_FetchL1Plugin_logic_HAZARD));
  always @(*) begin
    FetchL1Plugin_logic_trapPort_valid = 1'b0;
    if(when_FetchL1Plugin_l496) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(when_FetchL1Plugin_l502) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(when_FetchL1Plugin_l509) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_MMU_REFILL) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_MMU_HAZARD) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_Fetch_PC_FAULT) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b1;
    end
    if(when_FetchL1Plugin_l555) begin
      FetchL1Plugin_logic_trapPort_valid = 1'b0;
    end
  end

  assign FetchL1Plugin_logic_trapPort_payload_tval = fetch_logic_ctrls_2_down_Fetch_WORD_PC;
  always @(*) begin
    FetchL1Plugin_logic_trapPort_payload_exception = 1'bx;
    if(when_FetchL1Plugin_l496) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(when_FetchL1Plugin_l502) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(when_FetchL1Plugin_l509) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(fetch_logic_ctrls_2_down_MMU_REFILL) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_MMU_HAZARD) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_Fetch_PC_FAULT) begin
      FetchL1Plugin_logic_trapPort_payload_exception = 1'b1;
    end
  end

  always @(*) begin
    FetchL1Plugin_logic_trapPort_payload_code = 4'bxxxx;
    if(when_FetchL1Plugin_l496) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0100;
    end
    if(when_FetchL1Plugin_l502) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0001;
    end
    if(when_FetchL1Plugin_l509) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b1100;
    end
    if(fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0001;
    end
    if(fetch_logic_ctrls_2_down_MMU_REFILL) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0111;
    end
    if(fetch_logic_ctrls_2_down_MMU_HAZARD) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0100;
    end
    if(fetch_logic_ctrls_2_down_Fetch_PC_FAULT) begin
      FetchL1Plugin_logic_trapPort_payload_code = 4'b0001;
      if(when_FetchL1Plugin_l542) begin
        FetchL1Plugin_logic_trapPort_payload_code = 4'b1100;
      end
    end
  end

  assign _zz_32 = zz_FetchL1Plugin_logic_trapPort_payload_arg(1'b0);
  always @(*) FetchL1Plugin_logic_trapPort_payload_arg = _zz_32;
  always @(*) begin
    FetchL1Plugin_logic_ctrl_allowRefill = ((! fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HIT) && (! fetch_logic_ctrls_2_down_FetchL1Plugin_logic_HAZARD));
    if(when_FetchL1Plugin_l502) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
    if(when_FetchL1Plugin_l509) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_MMU_REFILL) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_MMU_HAZARD) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
    if(fetch_logic_ctrls_2_down_Fetch_PC_FAULT) begin
      FetchL1Plugin_logic_ctrl_allowRefill = 1'b0;
    end
  end

  assign when_FetchL1Plugin_l496 = ((! fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HIT) || fetch_logic_ctrls_2_down_FetchL1Plugin_logic_HAZARD);
  assign when_FetchL1Plugin_l502 = ((FetchL1Plugin_logic_ctrl_dataAccessFault || FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault) || fetch_logic_ctrls_2_down_FetchL1Plugin_logic_pmpPort_ACCESS_FAULT);
  assign when_FetchL1Plugin_l509 = (fetch_logic_ctrls_2_down_MMU_PAGE_FAULT || (! fetch_logic_ctrls_2_down_MMU_ALLOW_EXECUTE));
  assign when_FetchL1Plugin_l542 = (! fetch_logic_ctrls_2_down_MMU_BYPASS_TRANSLATION);
  always @(*) begin
    FetchL1Plugin_logic_refill_start_valid = (FetchL1Plugin_logic_ctrl_allowRefill && (! FetchL1Plugin_logic_ctrl_trapSent));
    if(when_FetchL1Plugin_l559) begin
      FetchL1Plugin_logic_refill_start_valid = 1'b0;
    end
  end

  assign FetchL1Plugin_logic_refill_start_address = fetch_logic_ctrls_2_down_MMU_TRANSLATED;
  assign FetchL1Plugin_logic_refill_start_isIo = FetchL1Plugin_logic_ctrl_pmaPort_rsp_io;
  assign fetch_logic_ctrls_2_down_TRAP = (FetchL1Plugin_logic_trapPort_valid || FetchL1Plugin_logic_ctrl_trapSent);
  assign when_FetchL1Plugin_l555 = ((! fetch_logic_ctrls_2_up_isValid) || FetchL1Plugin_logic_ctrl_trapSent);
  assign when_FetchL1Plugin_l559 = ((! fetch_logic_ctrls_2_up_isValid) && 1'b1);
  assign when_FetchL1Plugin_l563 = (((! fetch_logic_ctrls_2_up_isValid) || fetch_logic_ctrls_2_down_isReady) || fetch_logic_ctrls_2_up_isCanceling);
  assign when_FetchL1Plugin_l580 = (! FetchL1Plugin_logic_invalidate_done);
  assign _zz_FetchL1Plugin_logic_plru_write_payload_data_0 = 3'b000;
  assign execute_ctrl0_down_AguPlugin_SIZE_lane0 = execute_ctrl0_down_Decode_UOP_lane0[13 : 12];
  always @(*) begin
    execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0 = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0[63 : 0] = execute_ctrl1_up_integer_RS2_lane0;
  end

  assign execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0 = execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0;
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0 = (|{((execute_ctrl1_down_AguPlugin_SIZE_lane0 == 2'b11) && (execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[2 : 0] != 3'b000)),{((execute_ctrl1_down_AguPlugin_SIZE_lane0 == 2'b10) && (execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[1 : 0] != 2'b00)),((execute_ctrl1_down_AguPlugin_SIZE_lane0 == 2'b01) && (execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[0 : 0] != 1'b0))}});
  assign LsuCachelessPlugin_logic_onPma_port_cmd_address = execute_ctrl1_down_MMU_TRANSLATED_lane0;
  assign LsuCachelessPlugin_logic_onPma_port_cmd_size = execute_ctrl1_down_AguPlugin_SIZE_lane0;
  assign LsuCachelessPlugin_logic_onPma_port_cmd_op[0] = execute_ctrl1_down_AguPlugin_STORE_lane0;
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault = LsuCachelessPlugin_logic_onPma_port_rsp_fault;
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io = LsuCachelessPlugin_logic_onPma_port_rsp_io;
  assign PrivilegedPlugin_api_lsuTriggerBus_load = execute_ctrl1_down_AguPlugin_LOAD_lane0;
  assign PrivilegedPlugin_api_lsuTriggerBus_store = execute_ctrl1_down_AguPlugin_STORE_lane0;
  assign PrivilegedPlugin_api_lsuTriggerBus_virtual = execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[31:0];
  assign PrivilegedPlugin_api_lsuTriggerBus_size = execute_ctrl1_down_AguPlugin_SIZE_lane0;
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_onTrigger_HIT_lane0 = 1'b0;
  always @(*) begin
    LsuCachelessPlugin_logic_onFork_skip = 1'b0;
    if(when_LsuCachelessPlugin_l244) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(when_LsuCachelessPlugin_l250) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(when_LsuCachelessPlugin_l257) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(execute_ctrl1_down_MMU_ACCESS_FAULT_lane0) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(execute_ctrl1_down_MMU_REFILL_lane0) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(execute_ctrl1_down_MMU_HAZARD_lane0) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onTrigger_HIT_lane0) begin
      LsuCachelessPlugin_logic_onFork_skip = 1'b1;
    end
  end

  assign when_LsuCachelessPlugin_l198 = (! execute_freeze_valid);
  assign LsuCachelessPlugin_logic_onFork_askFence = (execute_ctrl1_up_LANE_SEL_lane0 && ((execute_ctrl1_down_LsuCachelessPlugin_FENCE_lane0 || (execute_ctrl1_down_AguPlugin_SEL_lane0 && execute_ctrl1_down_AguPlugin_ATOMIC_lane0)) || LsuCachelessPlugin_logic_onFork_askFenceReg));
  assign LsuCachelessPlugin_logic_onFork_doFence = (LsuCachelessPlugin_logic_onFork_askFence && LsuCachelessPlugin_logic_cmdInflights);
  assign LsuCachelessPlugin_logic_bus_cmd_fire = (LsuCachelessPlugin_logic_bus_cmd_valid && LsuCachelessPlugin_logic_bus_cmd_ready);
  always @(*) begin
    LsuCachelessPlugin_logic_onFork_cmdCounter_willIncrement = 1'b0;
    if(LsuCachelessPlugin_logic_bus_cmd_fire) begin
      LsuCachelessPlugin_logic_onFork_cmdCounter_willIncrement = 1'b1;
    end
  end

  assign LsuCachelessPlugin_logic_onFork_cmdCounter_willClear = 1'b0;
  assign LsuCachelessPlugin_logic_onFork_cmdCounter_willOverflowIfInc = (LsuCachelessPlugin_logic_onFork_cmdCounter_value == 1'b1);
  assign LsuCachelessPlugin_logic_onFork_cmdCounter_willOverflow = (LsuCachelessPlugin_logic_onFork_cmdCounter_willOverflowIfInc && LsuCachelessPlugin_logic_onFork_cmdCounter_willIncrement);
  always @(*) begin
    LsuCachelessPlugin_logic_onFork_cmdCounter_valueNext = (LsuCachelessPlugin_logic_onFork_cmdCounter_value + LsuCachelessPlugin_logic_onFork_cmdCounter_willIncrement);
    if(LsuCachelessPlugin_logic_onFork_cmdCounter_willClear) begin
      LsuCachelessPlugin_logic_onFork_cmdCounter_valueNext = 1'b0;
    end
  end

  assign when_LsuCachelessPlugin_l203 = (! execute_freeze_valid);
  assign LsuCachelessPlugin_logic_bus_cmd_isStall = (LsuCachelessPlugin_logic_bus_cmd_valid && (! LsuCachelessPlugin_logic_bus_cmd_ready));
  assign LsuCachelessPlugin_logic_bus_cmd_valid = (((((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_AguPlugin_SEL_lane0) && (! LsuCachelessPlugin_logic_onFork_cmdSent)) && (! execute_lane0_ctrls_1_upIsCancel)) && (! LsuCachelessPlugin_logic_onFork_skip)) && (! LsuCachelessPlugin_logic_onFork_doFence));
  assign LsuCachelessPlugin_logic_bus_cmd_payload_id = LsuCachelessPlugin_logic_onFork_cmdCounter_value;
  assign LsuCachelessPlugin_logic_bus_cmd_payload_write = execute_ctrl1_down_AguPlugin_STORE_lane0;
  assign LsuCachelessPlugin_logic_bus_cmd_payload_address = execute_ctrl1_down_MMU_TRANSLATED_lane0;
  assign LsuCachelessPlugin_logic_onFork_mapping_0_1 = {8{execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0[7 : 0]}};
  assign LsuCachelessPlugin_logic_onFork_mapping_1_1 = {4{execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0[15 : 0]}};
  assign LsuCachelessPlugin_logic_onFork_mapping_2_1 = {2{execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0[31 : 0]}};
  assign LsuCachelessPlugin_logic_onFork_mapping_3_1 = {1{execute_ctrl1_down_LsuCachelessPlugin_logic_onFirst_WRITE_DATA_lane0[63 : 0]}};
  always @(*) begin
    _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(LsuCachelessPlugin_logic_bus_cmd_payload_size)
      2'b00 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data = LsuCachelessPlugin_logic_onFork_mapping_0_1;
      end
      2'b01 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data = LsuCachelessPlugin_logic_onFork_mapping_1_1;
      end
      2'b10 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data = LsuCachelessPlugin_logic_onFork_mapping_2_1;
      end
      default : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data = LsuCachelessPlugin_logic_onFork_mapping_3_1;
      end
    endcase
  end

  assign LsuCachelessPlugin_logic_bus_cmd_payload_data = _zz_LsuCachelessPlugin_logic_bus_cmd_payload_data;
  assign LsuCachelessPlugin_logic_bus_cmd_payload_size = execute_ctrl1_down_AguPlugin_SIZE_lane0;
  always @(*) begin
    _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask = 8'bxxxxxxxx;
    case(LsuCachelessPlugin_logic_bus_cmd_payload_size)
      2'b00 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask = 8'h01;
      end
      2'b01 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask = 8'h03;
      end
      2'b10 : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask = 8'h0f;
      end
      default : begin
        _zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask = 8'hff;
      end
    endcase
  end

  assign LsuCachelessPlugin_logic_bus_cmd_payload_mask = (_zz_LsuCachelessPlugin_logic_bus_cmd_payload_mask <<< LsuCachelessPlugin_logic_bus_cmd_payload_address[2 : 0]);
  assign LsuCachelessPlugin_logic_bus_cmd_payload_io = execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  assign LsuCachelessPlugin_logic_bus_cmd_payload_fromHart = 1'b1;
  assign LsuCachelessPlugin_logic_bus_cmd_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign LsuCachelessPlugin_logic_onFork_freezeIt = (LsuCachelessPlugin_logic_bus_cmd_isStall || LsuCachelessPlugin_logic_onFork_doFence);
  always @(*) begin
    LsuCachelessPlugin_logic_flushPort_valid = 1'b0;
    if(when_LsuCachelessPlugin_l298) begin
      LsuCachelessPlugin_logic_flushPort_valid = 1'b1;
    end
  end

  assign LsuCachelessPlugin_logic_flushPort_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign LsuCachelessPlugin_logic_flushPort_payload_self = 1'b0;
  always @(*) begin
    LsuCachelessPlugin_logic_trapPort_valid = 1'b0;
    if(when_LsuCachelessPlugin_l298) begin
      LsuCachelessPlugin_logic_trapPort_valid = 1'b1;
    end
  end

  assign LsuCachelessPlugin_logic_trapPort_payload_tval = _zz_LsuCachelessPlugin_logic_trapPort_payload_tval[31:0];
  always @(*) begin
    LsuCachelessPlugin_logic_trapPort_payload_exception = 1'bx;
    if(when_LsuCachelessPlugin_l244) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(when_LsuCachelessPlugin_l250) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(when_LsuCachelessPlugin_l257) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(execute_ctrl1_down_MMU_ACCESS_FAULT_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(execute_ctrl1_down_MMU_REFILL_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(execute_ctrl1_down_MMU_HAZARD_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b0;
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b1;
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onTrigger_HIT_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_exception = 1'b0;
    end
  end

  always @(*) begin
    LsuCachelessPlugin_logic_trapPort_payload_code = 4'bxxxx;
    if(when_LsuCachelessPlugin_l244) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0100;
    end
    if(when_LsuCachelessPlugin_l250) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0101;
      if(execute_ctrl1_down_AguPlugin_STORE_lane0) begin
        LsuCachelessPlugin_logic_trapPort_payload_code[1] = 1'b1;
      end
    end
    if(when_LsuCachelessPlugin_l257) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b1101;
      if(execute_ctrl1_down_AguPlugin_STORE_lane0) begin
        LsuCachelessPlugin_logic_trapPort_payload_code[1] = 1'b1;
      end
    end
    if(execute_ctrl1_down_MMU_ACCESS_FAULT_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0101;
      if(execute_ctrl1_down_AguPlugin_STORE_lane0) begin
        LsuCachelessPlugin_logic_trapPort_payload_code[1] = 1'b1;
      end
    end
    if(execute_ctrl1_down_MMU_REFILL_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0111;
    end
    if(execute_ctrl1_down_MMU_HAZARD_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0100;
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_MISS_ALIGNED_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = {1'd0, _zz_LsuCachelessPlugin_logic_trapPort_payload_code};
    end
    if(execute_ctrl1_down_LsuCachelessPlugin_logic_onTrigger_HIT_lane0) begin
      LsuCachelessPlugin_logic_trapPort_payload_code = 4'b0011;
    end
  end

  always @(*) begin
    LsuCachelessPlugin_logic_trapPort_payload_arg = 2'b00;
    LsuCachelessPlugin_logic_trapPort_payload_arg[1 : 0] = (execute_ctrl1_down_AguPlugin_STORE_lane0 ? 2'b01 : 2'b00);
  end

  always @(*) begin
    BtbPlugin_logic_ras_ptr_pushIt = 1'b0;
    if(BtbPlugin_logic_applyIt_rasLogic_pushValid) begin
      BtbPlugin_logic_ras_ptr_pushIt = 1'b1;
    end
  end

  always @(*) begin
    BtbPlugin_logic_ras_ptr_popIt = 1'b0;
    if(when_BtbPlugin_l218) begin
      BtbPlugin_logic_ras_ptr_popIt = 1'b1;
    end
  end

  assign BtbPlugin_logic_ras_write_valid = BtbPlugin_logic_ras_ptr_pushIt;
  assign BtbPlugin_logic_ras_write_payload_address = BtbPlugin_logic_ras_ptr_push;
  always @(*) begin
    BtbPlugin_logic_ras_write_payload_data = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    BtbPlugin_logic_ras_write_payload_data = (_zz_BtbPlugin_logic_ras_write_payload_data >>> 2'd2);
  end

  assign WhiteboxerPlugin_logic_fetch_fetchId = fetch_logic_ctrls_0_down_Fetch_ID;
  assign WhiteboxerPlugin_logic_decodes_0_fire = ((decode_ctrls_0_up_LANE_SEL_0 && decode_ctrls_0_up_isReady) && (! decode_ctrls_0_lane0_upIsCancel));
  assign when_CtrlLaneApi_l46 = (decode_ctrls_0_up_isReady || decode_ctrls_0_lane0_upIsCancel);
  assign WhiteboxerPlugin_logic_decodes_0_spawn = (decode_ctrls_0_up_LANE_SEL_0 && (! decode_ctrls_0_up_LANE_SEL_0_regNext));
  assign WhiteboxerPlugin_logic_decodes_0_pc = _zz_WhiteboxerPlugin_logic_decodes_0_pc;
  assign WhiteboxerPlugin_logic_decodes_0_fetchId = decode_ctrls_0_down_Fetch_ID_0;
  assign WhiteboxerPlugin_logic_decodes_0_decodeId = decode_ctrls_0_down_Decode_DOP_ID_0;
  assign execute_ctrl1_down_early0_BranchPlugin_logic_alu_EQ_lane0 = ($signed(execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0) == $signed(execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0));
  assign execute_ctrl1_down_early0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0 = (execute_ctrl1_down_Prediction_ALIGNED_JUMPED_PC_lane0 != execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0);
  assign early0_BranchPlugin_logic_alu_expectedMsb = 1'b0;
  assign _zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = _zz__zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  assign execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = ((execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JALR) && (|{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[31] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[30] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0[29] != early0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1 != early0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2,{_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3,_zz_execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4}}}}}}));
  assign switch_Misc_l241 = execute_ctrl1_down_Decode_UOP_lane0[14 : 12];
  always @(*) begin
    casez(switch_Misc_l241)
      3'b000 : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 = execute_ctrl1_down_early0_BranchPlugin_logic_alu_EQ_lane0;
      end
      3'b001 : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 = (! execute_ctrl1_down_early0_BranchPlugin_logic_alu_EQ_lane0);
      end
      3'b1?1 : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 = (! execute_ctrl1_down_early0_SrcPlugin_LESS_lane0);
      end
      default : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 = execute_ctrl1_down_early0_SrcPlugin_LESS_lane0;
      end
    endcase
  end

  always @(*) begin
    case(execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_JALR : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = 1'b1;
      end
      BranchPlugin_BranchCtrlEnum_JAL : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = 1'b1;
      end
      default : begin
        _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0;
      end
    endcase
  end

  assign execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 = _zz_execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0_1;
  assign execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0 = (execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 ? execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 : execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0);
  assign early0_BranchPlugin_logic_jumpLogic_wrongCond = (execute_ctrl1_down_Prediction_ALIGNED_JUMPED_lane0 != execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0);
  assign early0_BranchPlugin_logic_jumpLogic_needFix = ((early0_BranchPlugin_logic_jumpLogic_wrongCond || (execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0 && execute_ctrl1_down_early0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0)) || execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0);
  assign early0_BranchPlugin_logic_jumpLogic_doIt = ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_early0_BranchPlugin_SEL_lane0) && early0_BranchPlugin_logic_jumpLogic_needFix);
  assign early0_BranchPlugin_logic_pcPort_valid = early0_BranchPlugin_logic_jumpLogic_doIt;
  assign early0_BranchPlugin_logic_pcPort_payload_fault = execute_ctrl1_down_early0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  assign early0_BranchPlugin_logic_pcPort_payload_pc = execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0;
  assign early0_BranchPlugin_logic_flushPort_valid = early0_BranchPlugin_logic_jumpLogic_doIt;
  assign early0_BranchPlugin_logic_flushPort_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign early0_BranchPlugin_logic_flushPort_payload_self = 1'b0;
  assign execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0 = ((execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0[1 : 0] != 2'b00) && execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_COND_lane0);
  always @(*) begin
    early0_BranchPlugin_logic_trapPort_valid = 1'b0;
    if(when_BranchPlugin_l244) begin
      early0_BranchPlugin_logic_trapPort_valid = 1'b1;
    end
  end

  assign early0_BranchPlugin_logic_trapPort_payload_exception = 1'b1;
  assign early0_BranchPlugin_logic_trapPort_payload_code = 4'b0000;
  assign early0_BranchPlugin_logic_trapPort_payload_tval = execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  assign early0_BranchPlugin_logic_trapPort_payload_arg = 2'b00;
  assign when_BranchPlugin_l244 = (early0_BranchPlugin_logic_jumpLogic_doIt && execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0);
  assign execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_IS_JAL_lane0 = (execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JAL);
  assign execute_ctrl1_down_early0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0 = (execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JALR);
  assign early0_BranchPlugin_logic_jumpLogic_rdLink = (|{(execute_ctrl1_down_Decode_UOP_lane0[11 : 7] == 5'h05),(execute_ctrl1_down_Decode_UOP_lane0[11 : 7] == 5'h01)});
  assign early0_BranchPlugin_logic_jumpLogic_rs1Link = (|{(execute_ctrl1_down_Decode_UOP_lane0[19 : 15] == 5'h05),(execute_ctrl1_down_Decode_UOP_lane0[19 : 15] == 5'h01)});
  assign early0_BranchPlugin_logic_jumpLogic_rdEquRs1 = (execute_ctrl1_down_Decode_UOP_lane0[11 : 7] == execute_ctrl1_down_Decode_UOP_lane0[19 : 15]);
  assign early0_BranchPlugin_logic_wb_valid = execute_ctrl1_down_early0_BranchPlugin_SEL_lane0;
  assign early0_BranchPlugin_logic_wb_payload = _zz_early0_BranchPlugin_logic_wb_payload;
  always @(*) begin
    early0_EnvPlugin_logic_flushPort_valid = 1'b0;
    if(when_EnvPlugin_l116) begin
      early0_EnvPlugin_logic_flushPort_valid = 1'b1;
    end
  end

  assign early0_EnvPlugin_logic_flushPort_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign early0_EnvPlugin_logic_flushPort_payload_self = 1'b0;
  always @(*) begin
    early0_EnvPlugin_logic_trapPort_valid = 1'b0;
    if(when_EnvPlugin_l116) begin
      early0_EnvPlugin_logic_trapPort_valid = 1'b1;
    end
  end

  always @(*) begin
    early0_EnvPlugin_logic_trapPort_payload_exception = 1'b1;
    case(execute_ctrl1_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_PRIV_RET : begin
        if(when_EnvPlugin_l83) begin
          early0_EnvPlugin_logic_trapPort_payload_exception = 1'b0;
        end
      end
      EnvPluginOp_WFI : begin
        if(when_EnvPlugin_l92) begin
          early0_EnvPlugin_logic_trapPort_payload_exception = 1'b0;
        end
      end
      EnvPluginOp_FENCE_I : begin
        early0_EnvPlugin_logic_trapPort_payload_exception = 1'b0;
      end
      default : begin
      end
    endcase
  end

  assign early0_EnvPlugin_logic_trapPort_payload_tval = ((execute_ctrl1_down_early0_EnvPlugin_OP_lane0 == EnvPluginOp_EBREAK) ? execute_ctrl1_down_PC_lane0 : 32'h0);
  always @(*) begin
    early0_EnvPlugin_logic_trapPort_payload_code = 4'b0010;
    case(execute_ctrl1_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_EBREAK : begin
        early0_EnvPlugin_logic_trapPort_payload_code = 4'b0011;
      end
      EnvPluginOp_ECALL : begin
        early0_EnvPlugin_logic_trapPort_payload_code = (_zz_early0_EnvPlugin_logic_trapPort_payload_code | 4'b1000);
      end
      EnvPluginOp_PRIV_RET : begin
        if(when_EnvPlugin_l83) begin
          early0_EnvPlugin_logic_trapPort_payload_code = 4'b0001;
        end
      end
      EnvPluginOp_WFI : begin
        if(when_EnvPlugin_l92) begin
          early0_EnvPlugin_logic_trapPort_payload_code = 4'b1000;
        end
      end
      EnvPluginOp_FENCE_I : begin
        early0_EnvPlugin_logic_trapPort_payload_code = 4'b0010;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    early0_EnvPlugin_logic_trapPort_payload_arg = 2'bxx;
    case(execute_ctrl1_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_PRIV_RET : begin
        if(when_EnvPlugin_l83) begin
          early0_EnvPlugin_logic_trapPort_payload_arg[1 : 0] = early0_EnvPlugin_logic_exe_xretPriv;
        end
      end
      default : begin
      end
    endcase
  end

  assign PrivilegedPlugin_logic_defaultTrap_csrPrivilege = CsrAccessPlugin_bus_decode_address[9 : 8];
  assign PrivilegedPlugin_logic_defaultTrap_csrReadOnly = (CsrAccessPlugin_bus_decode_address[11 : 10] == 2'b11);
  assign when_PrivilegedPlugin_l681 = ((PrivilegedPlugin_logic_defaultTrap_csrReadOnly && CsrAccessPlugin_bus_decode_write) || (PrivilegedPlugin_logic_harts_0_privilege < PrivilegedPlugin_logic_defaultTrap_csrPrivilege));
  assign FetchL1Plugin_pmaBuilder_addressBits = FetchL1Plugin_logic_ctrl_pmaPort_cmd_address;
  assign FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit = _zz_FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit[0];
  assign FetchL1Plugin_pmaBuilder_onTransfers_0_argsHit = (|1'b1);
  assign FetchL1Plugin_pmaBuilder_onTransfers_0_hit = (FetchL1Plugin_pmaBuilder_onTransfers_0_argsHit && FetchL1Plugin_pmaBuilder_onTransfers_0_addressHit);
  assign _zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault = ((FetchL1Plugin_pmaBuilder_addressBits & 32'h80000000) == 32'h80000000);
  assign FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault = (! ((|{_zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_fault,((FetchL1Plugin_pmaBuilder_addressBits & 32'hf0000000) == 32'h10000000)}) && (|FetchL1Plugin_pmaBuilder_onTransfers_0_hit)));
  assign FetchL1Plugin_logic_ctrl_pmaPort_rsp_io = (! _zz_FetchL1Plugin_logic_ctrl_pmaPort_rsp_io[0]);
  always @(*) begin
    _zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0 = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(execute_ctrl0_down_early0_SrcPlugin_logic_SRC1_CTRL_lane0)
      1'b0 : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0 = execute_ctrl0_down_integer_RS1_lane0;
      end
      default : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0 = {{32{_zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0[31]}}, _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0};
      end
    endcase
  end

  assign execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0 = _zz_execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0;
  always @(*) begin
    _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(execute_ctrl0_down_early0_SrcPlugin_logic_SRC2_CTRL_lane0)
      2'b00 : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = execute_ctrl0_down_integer_RS2_lane0;
      end
      2'b01 : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = {{52{_zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0[11]}}, _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0};
      end
      2'b10 : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_1;
      end
      default : begin
        _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = {{52{_zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_2[11]}}, _zz__zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0_2};
      end
    endcase
  end

  assign execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0 = _zz_execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0;
  always @(*) begin
    early0_SrcPlugin_logic_addsub_combined_rs2Patched = execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0;
    if(execute_ctrl1_down_SrcStageables_REVERT_lane0) begin
      early0_SrcPlugin_logic_addsub_combined_rs2Patched = (~ execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0);
    end
    if(execute_ctrl1_down_SrcStageables_ZERO_lane0) begin
      early0_SrcPlugin_logic_addsub_combined_rs2Patched = 64'h0;
    end
  end

  assign execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0 = ($signed(_zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0) + $signed(_zz_execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0_1));
  assign execute_ctrl1_down_early0_SrcPlugin_LESS_lane0 = ((execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[63] == execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0[63]) ? execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0[63] : (execute_ctrl1_down_SrcStageables_UNSIGNED_lane0 ? execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0[63] : execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0[63]));
  assign lane0_IntFormatPlugin_logic_stages_0_hits = early0_IntAluPlugin_logic_wb_valid;
  assign lane0_IntFormatPlugin_logic_stages_0_wb_valid = (execute_ctrl1_up_LANE_SEL_lane0 && (|lane0_IntFormatPlugin_logic_stages_0_hits));
  assign lane0_IntFormatPlugin_logic_stages_0_raw = early0_IntAluPlugin_logic_wb_payload;
  always @(*) begin
    lane0_IntFormatPlugin_logic_stages_0_wb_payload = lane0_IntFormatPlugin_logic_stages_0_raw;
    if(lane0_IntFormatPlugin_logic_stages_0_segments_0_doIt) begin
      lane0_IntFormatPlugin_logic_stages_0_wb_payload[63 : 32] = {32{lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value}};
    end
  end

  assign lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_sels_0 = lane0_IntFormatPlugin_logic_stages_0_raw[31];
  always @(*) begin
    _zz_lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value = 1'bx;
    case(execute_ctrl1_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0)
      2'b10 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value = lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_sels_0;
      end
      default : begin
      end
    endcase
  end

  assign lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value = (execute_ctrl1_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 && _zz_lane0_IntFormatPlugin_logic_stages_0_segments_0_sign_value);
  assign lane0_IntFormatPlugin_logic_stages_0_segments_0_doIt = (execute_ctrl1_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 < 2'b11);
  assign lane0_IntFormatPlugin_logic_stages_1_hits = {CsrAccessPlugin_logic_wbWi_valid,early0_IterativeShifterPlugin_logic_wb_valid};
  assign lane0_IntFormatPlugin_logic_stages_1_wb_valid = (execute_ctrl2_up_LANE_SEL_lane0 && (|lane0_IntFormatPlugin_logic_stages_1_hits));
  assign lane0_IntFormatPlugin_logic_stages_1_raw = ((lane0_IntFormatPlugin_logic_stages_1_hits[0] ? early0_IterativeShifterPlugin_logic_wb_payload : 64'h0) | (lane0_IntFormatPlugin_logic_stages_1_hits[1] ? CsrAccessPlugin_logic_wbWi_payload : 64'h0));
  always @(*) begin
    lane0_IntFormatPlugin_logic_stages_1_wb_payload = lane0_IntFormatPlugin_logic_stages_1_raw;
    if(lane0_IntFormatPlugin_logic_stages_1_segments_0_doIt) begin
      lane0_IntFormatPlugin_logic_stages_1_wb_payload[63 : 32] = {32{lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value}};
    end
  end

  assign lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_sels_0 = lane0_IntFormatPlugin_logic_stages_1_raw[31];
  always @(*) begin
    _zz_lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value = 1'bx;
    case(execute_ctrl2_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0)
      2'b10 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value = lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_sels_0;
      end
      default : begin
      end
    endcase
  end

  assign lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value = (execute_ctrl2_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 && _zz_lane0_IntFormatPlugin_logic_stages_1_segments_0_sign_value);
  assign lane0_IntFormatPlugin_logic_stages_1_segments_0_doIt = (execute_ctrl2_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 < 2'b11);
  assign lane0_IntFormatPlugin_logic_stages_2_hits = {LsuCachelessPlugin_logic_iwb_valid,{late0_IterativeShifterPlugin_logic_wb_valid,late0_IntAluPlugin_logic_wb_valid}};
  assign lane0_IntFormatPlugin_logic_stages_2_wb_valid = (execute_ctrl3_up_LANE_SEL_lane0 && (|lane0_IntFormatPlugin_logic_stages_2_hits));
  assign lane0_IntFormatPlugin_logic_stages_2_raw = (((lane0_IntFormatPlugin_logic_stages_2_hits[0] ? late0_IntAluPlugin_logic_wb_payload : 64'h0) | (lane0_IntFormatPlugin_logic_stages_2_hits[1] ? late0_IterativeShifterPlugin_logic_wb_payload : 64'h0)) | (lane0_IntFormatPlugin_logic_stages_2_hits[2] ? LsuCachelessPlugin_logic_iwb_payload : 64'h0));
  always @(*) begin
    lane0_IntFormatPlugin_logic_stages_2_wb_payload = lane0_IntFormatPlugin_logic_stages_2_raw;
    if(lane0_IntFormatPlugin_logic_stages_2_segments_0_doIt) begin
      lane0_IntFormatPlugin_logic_stages_2_wb_payload[15 : 8] = {8{lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value}};
    end
    if(lane0_IntFormatPlugin_logic_stages_2_segments_1_doIt) begin
      lane0_IntFormatPlugin_logic_stages_2_wb_payload[31 : 16] = {16{lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value}};
    end
    if(lane0_IntFormatPlugin_logic_stages_2_segments_2_doIt) begin
      lane0_IntFormatPlugin_logic_stages_2_wb_payload[63 : 32] = {32{lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value}};
    end
  end

  assign lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_sels_0 = lane0_IntFormatPlugin_logic_stages_2_raw[7];
  always @(*) begin
    _zz_lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value = 1'bx;
    case(execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0)
      2'b00 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_sels_0;
      end
      default : begin
      end
    endcase
  end

  assign lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 && _zz_lane0_IntFormatPlugin_logic_stages_2_segments_0_sign_value);
  assign lane0_IntFormatPlugin_logic_stages_2_segments_0_doIt = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 < 2'b01);
  assign lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_0 = lane0_IntFormatPlugin_logic_stages_2_raw[7];
  assign lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_1 = lane0_IntFormatPlugin_logic_stages_2_raw[15];
  always @(*) begin
    _zz_lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value = 1'bx;
    case(execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0)
      2'b00 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_0;
      end
      2'b01 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_sels_1;
      end
      default : begin
      end
    endcase
  end

  assign lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 && _zz_lane0_IntFormatPlugin_logic_stages_2_segments_1_sign_value);
  assign lane0_IntFormatPlugin_logic_stages_2_segments_1_doIt = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 < 2'b10);
  assign lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_0 = lane0_IntFormatPlugin_logic_stages_2_raw[31];
  assign lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_1 = lane0_IntFormatPlugin_logic_stages_2_raw[7];
  assign lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_2 = lane0_IntFormatPlugin_logic_stages_2_raw[15];
  always @(*) begin
    _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value = 1'bx;
    case(execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0)
      2'b10 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_0;
      end
      2'b00 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_1;
      end
      2'b01 : begin
        _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value = lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_sels_2;
      end
      default : begin
      end
    endcase
  end

  assign lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 && _zz_lane0_IntFormatPlugin_logic_stages_2_segments_2_sign_value);
  assign lane0_IntFormatPlugin_logic_stages_2_segments_2_doIt = (execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 < 2'b11);
  always @(*) begin
    _zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0 = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(execute_ctrl2_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0)
      1'b0 : begin
        _zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0 = execute_ctrl2_down_integer_RS1_lane0;
      end
      default : begin
        _zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0 = {{32{_zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0[31]}}, _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0};
      end
    endcase
  end

  assign execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0 = _zz_execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0;
  always @(*) begin
    _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(execute_ctrl2_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0)
      2'b00 : begin
        _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = execute_ctrl2_down_integer_RS2_lane0;
      end
      2'b01 : begin
        _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = {{52{_zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0[11]}}, _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0};
      end
      2'b10 : begin
        _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = _zz__zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0_1;
      end
      default : begin
      end
    endcase
  end

  assign execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0 = _zz_execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0;
  always @(*) begin
    late0_SrcPlugin_logic_addsub_combined_rs2Patched = execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0;
    if(execute_ctrl3_down_SrcStageables_REVERT_lane0) begin
      late0_SrcPlugin_logic_addsub_combined_rs2Patched = (~ execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0);
    end
    if(execute_ctrl3_down_SrcStageables_ZERO_lane0) begin
      late0_SrcPlugin_logic_addsub_combined_rs2Patched = 64'h0;
    end
  end

  assign execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0 = ($signed(_zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0) + $signed(_zz_execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0_1));
  assign execute_ctrl3_down_late0_SrcPlugin_LESS_lane0 = ((execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0[63] == execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0[63]) ? execute_ctrl3_down_late0_SrcPlugin_ADD_SUB_lane0[63] : (execute_ctrl3_down_SrcStageables_UNSIGNED_lane0 ? execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0[63] : execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0[63]));
  assign execute_ctrl3_down_late0_BranchPlugin_logic_alu_EQ_lane0 = ($signed(execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0) == $signed(execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0));
  assign execute_ctrl3_down_late0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0 = (execute_ctrl3_down_Prediction_ALIGNED_JUMPED_PC_lane0 != execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0);
  assign late0_BranchPlugin_logic_alu_expectedMsb = 1'b0;
  assign _zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = _zz__zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  assign execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0 = ((execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JALR) && (|{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[31] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[30] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0[29] != late0_BranchPlugin_logic_alu_expectedMsb),{(_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_1 != late0_BranchPlugin_logic_alu_expectedMsb),{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_2,{_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_3,_zz_execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0_4}}}}}}));
  assign switch_Misc_l241_1 = execute_ctrl3_down_Decode_UOP_lane0[14 : 12];
  always @(*) begin
    casez(switch_Misc_l241_1)
      3'b000 : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 = execute_ctrl3_down_late0_BranchPlugin_logic_alu_EQ_lane0;
      end
      3'b001 : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 = (! execute_ctrl3_down_late0_BranchPlugin_logic_alu_EQ_lane0);
      end
      3'b1?1 : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 = (! execute_ctrl3_down_late0_SrcPlugin_LESS_lane0);
      end
      default : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 = execute_ctrl3_down_late0_SrcPlugin_LESS_lane0;
      end
    endcase
  end

  always @(*) begin
    case(execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0)
      BranchPlugin_BranchCtrlEnum_JALR : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = 1'b1;
      end
      BranchPlugin_BranchCtrlEnum_JAL : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = 1'b1;
      end
      default : begin
        _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0_1 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0;
      end
    endcase
  end

  assign execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 = _zz_execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0_1;
  assign execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0 = (execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 ? execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 : execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0);
  assign late0_BranchPlugin_logic_jumpLogic_wrongCond = (execute_ctrl3_down_Prediction_ALIGNED_JUMPED_lane0 != execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0);
  assign late0_BranchPlugin_logic_jumpLogic_needFix = ((late0_BranchPlugin_logic_jumpLogic_wrongCond || (execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0 && execute_ctrl3_down_late0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0)) || execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0);
  assign late0_BranchPlugin_logic_jumpLogic_doIt = ((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_down_late0_BranchPlugin_SEL_lane0) && late0_BranchPlugin_logic_jumpLogic_needFix);
  assign late0_BranchPlugin_logic_pcPort_valid = late0_BranchPlugin_logic_jumpLogic_doIt;
  assign late0_BranchPlugin_logic_pcPort_payload_fault = execute_ctrl3_down_late0_BranchPlugin_logic_alu_MSB_FAILED_lane0;
  assign late0_BranchPlugin_logic_pcPort_payload_pc = execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_btb_REAL_TARGET_lane0;
  assign late0_BranchPlugin_logic_flushPort_valid = late0_BranchPlugin_logic_jumpLogic_doIt;
  assign late0_BranchPlugin_logic_flushPort_payload_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign late0_BranchPlugin_logic_flushPort_payload_self = 1'b0;
  assign execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0 = ((execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0[1 : 0] != 2'b00) && execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0);
  always @(*) begin
    late0_BranchPlugin_logic_trapPort_valid = 1'b0;
    if(when_BranchPlugin_l244_1) begin
      late0_BranchPlugin_logic_trapPort_valid = 1'b1;
    end
  end

  assign late0_BranchPlugin_logic_trapPort_payload_exception = 1'b1;
  assign late0_BranchPlugin_logic_trapPort_payload_code = 4'b0000;
  assign late0_BranchPlugin_logic_trapPort_payload_tval = execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  assign late0_BranchPlugin_logic_trapPort_payload_arg = 2'b00;
  assign when_BranchPlugin_l244_1 = (late0_BranchPlugin_logic_jumpLogic_doIt && execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_MISSALIGNED_lane0);
  assign execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JAL_lane0 = (execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JAL);
  assign execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0 = (execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_JALR);
  assign late0_BranchPlugin_logic_jumpLogic_rdLink = (|{(execute_ctrl3_down_Decode_UOP_lane0[11 : 7] == 5'h05),(execute_ctrl3_down_Decode_UOP_lane0[11 : 7] == 5'h01)});
  assign late0_BranchPlugin_logic_jumpLogic_rs1Link = (|{(execute_ctrl3_down_Decode_UOP_lane0[19 : 15] == 5'h05),(execute_ctrl3_down_Decode_UOP_lane0[19 : 15] == 5'h01)});
  assign late0_BranchPlugin_logic_jumpLogic_rdEquRs1 = (execute_ctrl3_down_Decode_UOP_lane0[11 : 7] == execute_ctrl3_down_Decode_UOP_lane0[19 : 15]);
  assign late0_BranchPlugin_logic_jumpLogic_learn_valid = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_upIsCancel)) && (|{execute_ctrl3_down_late0_BranchPlugin_SEL_lane0,execute_ctrl3_down_early0_BranchPlugin_SEL_lane0}));
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_taken = execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_COND_lane0;
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_pcTarget = execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_pcOnLastSlice = execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_isBranch = (execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0 == BranchPlugin_BranchCtrlEnum_B);
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_isPush = ((execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JAL_lane0 || execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0) && late0_BranchPlugin_logic_jumpLogic_rdLink);
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_isPop = (execute_ctrl3_down_late0_BranchPlugin_logic_jumpLogic_IS_JALR_lane0 && (((! late0_BranchPlugin_logic_jumpLogic_rdLink) && late0_BranchPlugin_logic_jumpLogic_rs1Link) || ((late0_BranchPlugin_logic_jumpLogic_rdLink && late0_BranchPlugin_logic_jumpLogic_rs1Link) && (! late0_BranchPlugin_logic_jumpLogic_rdEquRs1))));
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_wasWrong = late0_BranchPlugin_logic_jumpLogic_needFix;
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_badPredictedTarget = execute_ctrl3_down_late0_BranchPlugin_logic_alu_btb_BAD_TARGET_lane0;
  assign late0_BranchPlugin_logic_jumpLogic_learn_payload_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign late0_BranchPlugin_logic_wb_valid = execute_ctrl3_down_late0_BranchPlugin_SEL_lane0;
  assign late0_BranchPlugin_logic_wb_payload = _zz_late0_BranchPlugin_logic_wb_payload;
  assign early0_EnvPlugin_logic_exe_privilege = PrivilegedPlugin_logic_harts_0_privilege;
  assign early0_EnvPlugin_logic_exe_xretPriv = execute_ctrl1_down_Decode_UOP_lane0[29 : 28];
  always @(*) begin
    early0_EnvPlugin_logic_exe_commit = 1'b0;
    case(execute_ctrl1_down_early0_EnvPlugin_OP_lane0)
      EnvPluginOp_PRIV_RET : begin
        if(when_EnvPlugin_l83) begin
          early0_EnvPlugin_logic_exe_commit = 1'b1;
        end
      end
      EnvPluginOp_WFI : begin
        if(when_EnvPlugin_l92) begin
          early0_EnvPlugin_logic_exe_commit = 1'b1;
        end
      end
      EnvPluginOp_FENCE_I : begin
        early0_EnvPlugin_logic_exe_commit = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign early0_EnvPlugin_logic_exe_retKo = 1'b0;
  assign early0_EnvPlugin_logic_exe_vmaKo = 1'b0;
  assign when_EnvPlugin_l83 = ((early0_EnvPlugin_logic_exe_xretPriv <= PrivilegedPlugin_logic_harts_0_privilege) && (! early0_EnvPlugin_logic_exe_retKo));
  assign when_EnvPlugin_l92 = ((early0_EnvPlugin_logic_exe_privilege == 2'b11) || ((! PrivilegedPlugin_logic_harts_0_m_status_tw) && (1'b1 || (early0_EnvPlugin_logic_exe_privilege == 2'b01))));
  assign when_EnvPlugin_l116 = (execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_early0_EnvPlugin_SEL_lane0);
  assign when_EnvPlugin_l120 = (! early0_EnvPlugin_logic_exe_commit);
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_valid = late0_BranchPlugin_logic_jumpLogic_learn_valid;
  assign late0_BranchPlugin_logic_jumpLogic_learn_ready = late0_BranchPlugin_logic_jumpLogic_learn_combStage_ready;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcOnLastSlice = late0_BranchPlugin_logic_jumpLogic_learn_payload_pcOnLastSlice;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_pcTarget = late0_BranchPlugin_logic_jumpLogic_learn_payload_pcTarget;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_taken = late0_BranchPlugin_logic_jumpLogic_learn_payload_taken;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isBranch = late0_BranchPlugin_logic_jumpLogic_learn_payload_isBranch;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPush = late0_BranchPlugin_logic_jumpLogic_learn_payload_isPush;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_isPop = late0_BranchPlugin_logic_jumpLogic_learn_payload_isPop;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_wasWrong = late0_BranchPlugin_logic_jumpLogic_learn_payload_wasWrong;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_badPredictedTarget = late0_BranchPlugin_logic_jumpLogic_learn_payload_badPredictedTarget;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_payload_uopId = late0_BranchPlugin_logic_jumpLogic_learn_payload_uopId;
  assign late0_BranchPlugin_logic_jumpLogic_learn_combStage_ready = streamArbiter_1_io_inputs_0_ready;
  assign io_output_combStage_valid = streamArbiter_1_io_output_valid;
  assign io_output_combStage_payload_pcOnLastSlice = streamArbiter_1_io_output_payload_pcOnLastSlice;
  assign io_output_combStage_payload_pcTarget = streamArbiter_1_io_output_payload_pcTarget;
  assign io_output_combStage_payload_taken = streamArbiter_1_io_output_payload_taken;
  assign io_output_combStage_payload_isBranch = streamArbiter_1_io_output_payload_isBranch;
  assign io_output_combStage_payload_isPush = streamArbiter_1_io_output_payload_isPush;
  assign io_output_combStage_payload_isPop = streamArbiter_1_io_output_payload_isPop;
  assign io_output_combStage_payload_wasWrong = streamArbiter_1_io_output_payload_wasWrong;
  assign io_output_combStage_payload_badPredictedTarget = streamArbiter_1_io_output_payload_badPredictedTarget;
  assign io_output_combStage_payload_uopId = streamArbiter_1_io_output_payload_uopId;
  assign io_output_combStage_ready = 1'b1;
  assign io_output_combStage_toFlow_valid = io_output_combStage_valid;
  assign io_output_combStage_toFlow_payload_pcOnLastSlice = io_output_combStage_payload_pcOnLastSlice;
  assign io_output_combStage_toFlow_payload_pcTarget = io_output_combStage_payload_pcTarget;
  assign io_output_combStage_toFlow_payload_taken = io_output_combStage_payload_taken;
  assign io_output_combStage_toFlow_payload_isBranch = io_output_combStage_payload_isBranch;
  assign io_output_combStage_toFlow_payload_isPush = io_output_combStage_payload_isPush;
  assign io_output_combStage_toFlow_payload_isPop = io_output_combStage_payload_isPop;
  assign io_output_combStage_toFlow_payload_wasWrong = io_output_combStage_payload_wasWrong;
  assign io_output_combStage_toFlow_payload_badPredictedTarget = io_output_combStage_payload_badPredictedTarget;
  assign io_output_combStage_toFlow_payload_uopId = io_output_combStage_payload_uopId;
  assign LearnPlugin_logic_learn_valid = io_output_combStage_toFlow_valid;
  assign LearnPlugin_logic_learn_payload_pcOnLastSlice = io_output_combStage_toFlow_payload_pcOnLastSlice;
  assign LearnPlugin_logic_learn_payload_pcTarget = io_output_combStage_toFlow_payload_pcTarget;
  assign LearnPlugin_logic_learn_payload_taken = io_output_combStage_toFlow_payload_taken;
  assign LearnPlugin_logic_learn_payload_isBranch = io_output_combStage_toFlow_payload_isBranch;
  assign LearnPlugin_logic_learn_payload_isPush = io_output_combStage_toFlow_payload_isPush;
  assign LearnPlugin_logic_learn_payload_isPop = io_output_combStage_toFlow_payload_isPop;
  assign LearnPlugin_logic_learn_payload_wasWrong = io_output_combStage_toFlow_payload_wasWrong;
  assign LearnPlugin_logic_learn_payload_badPredictedTarget = io_output_combStage_toFlow_payload_badPredictedTarget;
  assign LearnPlugin_logic_learn_payload_uopId = io_output_combStage_toFlow_payload_uopId;
  assign when_DecoderPlugin_l138 = (decode_ctrls_2_up_isMoving && 1'b1);
  assign DecoderPlugin_logic_interrupt_async = PrivilegedPlugin_logic_harts_0_int_pending;
  assign when_DecoderPlugin_l146 = (((! decode_ctrls_2_up_valid) || decode_ctrls_2_up_ready) || decode_ctrls_2_up_isCanceling);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000018) == 32'h0);
  assign decode_ctrls_2_down_RS1_ENABLE_0 = _zz_decode_ctrls_2_down_RS1_ENABLE_0[0];
  assign decode_ctrls_2_down_RS1_PHYS_0 = decode_ctrls_2_down_Decode_INSTRUCTION_0[19 : 15];
  assign decode_ctrls_2_down_RS2_ENABLE_0 = _zz_decode_ctrls_2_down_RS2_ENABLE_0[0];
  assign decode_ctrls_2_down_RS2_PHYS_0 = decode_ctrls_2_down_Decode_INSTRUCTION_0[24 : 20];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000050) == 32'h00000010);
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_1 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000048) == 32'h00000048);
  always @(*) begin
    decode_ctrls_2_down_RD_ENABLE_0 = _zz_decode_ctrls_2_down_RD_ENABLE_0[0];
    if(when_DecoderPlugin_l240) begin
      decode_ctrls_2_down_RD_ENABLE_0 = 1'b0;
    end
  end

  assign decode_ctrls_2_down_RD_PHYS_0 = decode_ctrls_2_down_Decode_INSTRUCTION_0[11 : 7];
  assign decode_ctrls_2_down_Decode_LEGAL_0 = ((|{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000005f) == 32'h00000017),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0000007f) == 32'h0000006f),{((decode_ctrls_2_down_Decode_INSTRUCTION_0 & _zz_decode_ctrls_2_down_Decode_LEGAL_0) == 32'h00000003),{(_zz_decode_ctrls_2_down_Decode_LEGAL_0_1 == _zz_decode_ctrls_2_down_Decode_LEGAL_0_2),{_zz_decode_ctrls_2_down_Decode_LEGAL_0_3,{_zz_decode_ctrls_2_down_Decode_LEGAL_0_4,_zz_decode_ctrls_2_down_Decode_LEGAL_0_5}}}}}}) && (! decode_ctrls_2_down_Decode_DECOMPRESSION_FAULT_0));
  assign DecoderPlugin_logic_laneLogic_0_interruptPending = DecoderPlugin_logic_interrupt_buffered[0];
  always @(*) begin
    DecoderPlugin_logic_laneLogic_0_trapPort_valid = 1'b0;
    if(when_DecoderPlugin_l222) begin
      DecoderPlugin_logic_laneLogic_0_trapPort_valid = ((! decode_ctrls_2_up_TRAP_0) || DecoderPlugin_logic_laneLogic_0_interruptPending);
      if(DecoderPlugin_logic_laneLogic_0_fixer_doIt) begin
        DecoderPlugin_logic_laneLogic_0_trapPort_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    DecoderPlugin_logic_laneLogic_0_trapPort_payload_exception = 1'b1;
    if(DecoderPlugin_logic_laneLogic_0_fixer_doIt) begin
      DecoderPlugin_logic_laneLogic_0_trapPort_payload_exception = 1'b0;
    end
    if(DecoderPlugin_logic_laneLogic_0_interruptPending) begin
      DecoderPlugin_logic_laneLogic_0_trapPort_payload_exception = 1'b0;
    end
  end

  assign DecoderPlugin_logic_laneLogic_0_trapPort_payload_tval = decode_ctrls_2_down_Decode_INSTRUCTION_RAW_0;
  always @(*) begin
    DecoderPlugin_logic_laneLogic_0_trapPort_payload_code = 4'b0010;
    if(DecoderPlugin_logic_laneLogic_0_fixer_doIt) begin
      DecoderPlugin_logic_laneLogic_0_trapPort_payload_code = 4'b0100;
    end
    if(DecoderPlugin_logic_laneLogic_0_interruptPending) begin
      DecoderPlugin_logic_laneLogic_0_trapPort_payload_code = 4'b0000;
    end
  end

  assign DecoderPlugin_logic_laneLogic_0_trapPort_payload_laneAge = 1'b0;
  assign DecoderPlugin_logic_laneLogic_0_trapPort_payload_arg = 2'b00;
  assign DecoderPlugin_logic_laneLogic_0_fixer_isJb = _zz_DecoderPlugin_logic_laneLogic_0_fixer_isJb[0];
  assign DecoderPlugin_logic_laneLogic_0_fixer_doIt = (decode_ctrls_2_up_LANE_SEL_0 && ((decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_0 && (! DecoderPlugin_logic_laneLogic_0_fixer_isJb)) || decode_ctrls_2_down_Prediction_ALIGN_REDO_0));
  assign when_CtrlLaneApi_l46_1 = (decode_ctrls_2_up_isReady || decode_ctrls_2_lane0_upIsCancel);
  assign DecoderPlugin_logic_laneLogic_0_completionPort_valid = ((decode_ctrls_2_up_LANE_SEL_0 && decode_ctrls_2_down_TRAP_0) && (decode_ctrls_2_up_LANE_SEL_0 && (! decode_ctrls_2_up_LANE_SEL_0_regNext)));
  assign DecoderPlugin_logic_laneLogic_0_completionPort_payload_uopId = decode_ctrls_2_down_Decode_UOP_ID_0;
  assign DecoderPlugin_logic_laneLogic_0_completionPort_payload_trap = 1'b1;
  assign DecoderPlugin_logic_laneLogic_0_completionPort_payload_commit = 1'b0;
  assign when_DecoderPlugin_l222 = (decode_ctrls_2_up_LANE_SEL_0 && (((! decode_ctrls_2_down_Decode_LEGAL_0) || DecoderPlugin_logic_laneLogic_0_interruptPending) || DecoderPlugin_logic_laneLogic_0_fixer_doIt));
  assign DecoderPlugin_logic_laneLogic_0_flushPort_valid = (decode_ctrls_2_up_LANE_SEL_0 && decode_ctrls_2_down_TRAP_0);
  assign DecoderPlugin_logic_laneLogic_0_flushPort_payload_uopId = decode_ctrls_2_down_Decode_UOP_ID_0;
  assign DecoderPlugin_logic_laneLogic_0_flushPort_payload_self = 1'b0;
  assign when_DecoderPlugin_l240 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0[11 : 7] == 5'h0) && (|1'b1));
  assign decode_ctrls_2_down_Decode_UOP_0 = decode_ctrls_2_down_Decode_INSTRUCTION_0;
  assign DecoderPlugin_logic_laneLogic_0_uopIdBase = DecoderPlugin_logic_harts_0_uopId;
  assign decode_ctrls_2_down_Decode_UOP_ID_0 = (DecoderPlugin_logic_laneLogic_0_uopIdBase + 16'h0);
  assign BtbPlugin_logic_onLearn_hash = LearnPlugin_logic_learn_payload_pcOnLastSlice[16 : 9];
  always @(*) begin
    BtbPlugin_logic_onLearn_port_valid = (LearnPlugin_logic_learn_valid && (LearnPlugin_logic_learn_payload_wasWrong || LearnPlugin_logic_learn_payload_badPredictedTarget));
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_valid = DecoderPlugin_logic_forgetPort_valid;
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_address = _zz_BtbPlugin_logic_onLearn_port_payload_address[6:0];
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_address = _zz_BtbPlugin_logic_onLearn_port_payload_address_1[6:0];
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_mask = 1'b1;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_mask = 1'b1;
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_data_0_hash = BtbPlugin_logic_onLearn_hash;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_data_0_hash = (~ BtbPlugin_logic_onForget_hash);
    end
  end

  assign BtbPlugin_logic_onLearn_port_payload_data_0_pcTarget = (LearnPlugin_logic_learn_payload_pcTarget >>> 2'd2);
  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_data_0_isBranch = LearnPlugin_logic_learn_payload_isBranch;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_data_0_isBranch = 1'b0;
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_data_0_isPush = LearnPlugin_logic_learn_payload_isPush;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_data_0_isPush = 1'b0;
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_data_0_isPop = LearnPlugin_logic_learn_payload_isPop;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_data_0_isPop = 1'b0;
    end
  end

  always @(*) begin
    BtbPlugin_logic_onLearn_port_payload_data_0_taken = LearnPlugin_logic_learn_payload_taken;
    if(DecoderPlugin_logic_forgetPort_valid) begin
      BtbPlugin_logic_onLearn_port_payload_data_0_taken = 1'b0;
    end
  end

  assign execute_ctrl1_COMPLETED_lane0_bypass = (execute_ctrl1_up_COMPLETED_lane0 || execute_ctrl1_down_COMPLETION_AT_1_lane0);
  assign execute_ctrl2_COMPLETED_lane0_bypass = (execute_ctrl2_up_COMPLETED_lane0 || execute_ctrl2_down_COMPLETION_AT_2_lane0);
  assign execute_ctrl3_COMPLETED_lane0_bypass = (execute_ctrl3_up_COMPLETED_lane0 || execute_ctrl3_down_COMPLETION_AT_3_lane0);
  assign execute_lane0_api_hartsInflight[0] = (|{(execute_ctrl3_up_LANE_SEL_lane0 && 1'b1),{(execute_ctrl2_up_LANE_SEL_lane0 && 1'b1),(execute_ctrl1_up_LANE_SEL_lane0 && 1'b1)}});
  assign when_LsuCachelessPlugin_l244 = ((execute_ctrl1_down_AguPlugin_LOAD_lane0 && execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io) && (|((execute_ctrl2_up_LANE_SEL_lane0 && 1'b1) && 1'b1)));
  assign when_LsuCachelessPlugin_l250 = ((execute_ctrl1_down_MMU_ACCESS_FAULT_lane0 || execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault) || execute_ctrl1_down_LsuCachelessPlugin_logic_pmpPort_ACCESS_FAULT_lane0);
  assign when_LsuCachelessPlugin_l257 = (execute_ctrl1_down_MMU_PAGE_FAULT_lane0 || (execute_ctrl1_down_AguPlugin_STORE_lane0 ? (! execute_ctrl1_down_MMU_ALLOW_WRITE_lane0) : (! execute_ctrl1_down_MMU_ALLOW_READ_lane0)));
  assign when_LsuCachelessPlugin_l298 = ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_AguPlugin_SEL_lane0) && LsuCachelessPlugin_logic_onFork_skip);
  assign execute_ctrl1_down_LsuCachelessPlugin_WITH_RSP_lane0 = (LsuCachelessPlugin_logic_bus_cmd_valid || LsuCachelessPlugin_logic_onFork_cmdSent);
  assign LsuCachelessPlugin_logic_cmdInflights = (|{LsuCachelessPlugin_logic_onJoin_buffers_1_inflight,LsuCachelessPlugin_logic_onJoin_buffers_0_inflight});
  assign LsuCachelessPlugin_logic_onJoin_busRspWithoutId_error = LsuCachelessPlugin_logic_bus_rsp_payload_error;
  assign LsuCachelessPlugin_logic_onJoin_busRspWithoutId_data = LsuCachelessPlugin_logic_bus_rsp_payload_data;
  assign LsuCachelessPlugin_logic_onJoin_pop = (execute_ctrl2_down_LsuCachelessPlugin_WITH_RSP_lane0 && (! execute_freeze_valid));
  always @(*) begin
    LsuCachelessPlugin_logic_onJoin_rspCounter_willIncrement = 1'b0;
    if(LsuCachelessPlugin_logic_onJoin_pop) begin
      LsuCachelessPlugin_logic_onJoin_rspCounter_willIncrement = 1'b1;
    end
  end

  assign LsuCachelessPlugin_logic_onJoin_rspCounter_willClear = 1'b0;
  assign LsuCachelessPlugin_logic_onJoin_rspCounter_willOverflowIfInc = (LsuCachelessPlugin_logic_onJoin_rspCounter_value == 1'b1);
  assign LsuCachelessPlugin_logic_onJoin_rspCounter_willOverflow = (LsuCachelessPlugin_logic_onJoin_rspCounter_willOverflowIfInc && LsuCachelessPlugin_logic_onJoin_rspCounter_willIncrement);
  always @(*) begin
    LsuCachelessPlugin_logic_onJoin_rspCounter_valueNext = (LsuCachelessPlugin_logic_onJoin_rspCounter_value + LsuCachelessPlugin_logic_onJoin_rspCounter_willIncrement);
    if(LsuCachelessPlugin_logic_onJoin_rspCounter_willClear) begin
      LsuCachelessPlugin_logic_onJoin_rspCounter_valueNext = 1'b0;
    end
  end

  assign LsuCachelessPlugin_logic_onJoin_readerValid = _zz_LsuCachelessPlugin_logic_onJoin_readerValid;
  assign LsuCachelessPlugin_logic_onJoin_busRspHit = (LsuCachelessPlugin_logic_bus_rsp_valid && (LsuCachelessPlugin_logic_bus_rsp_payload_id == LsuCachelessPlugin_logic_onJoin_rspCounter_value));
  assign LsuCachelessPlugin_logic_onJoin_rspValid = (LsuCachelessPlugin_logic_onJoin_readerValid || LsuCachelessPlugin_logic_onJoin_busRspHit);
  assign LsuCachelessPlugin_logic_onJoin_rspPayload_error = (LsuCachelessPlugin_logic_onJoin_readerValid ? _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_error : LsuCachelessPlugin_logic_onJoin_busRspWithoutId_error);
  assign LsuCachelessPlugin_logic_onJoin_rspPayload_data = (LsuCachelessPlugin_logic_onJoin_readerValid ? _zz_LsuCachelessPlugin_logic_onJoin_rspPayload_data : LsuCachelessPlugin_logic_onJoin_busRspWithoutId_data);
  assign execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0 = 1'b0;
  assign execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0 = LsuCachelessPlugin_logic_onJoin_rspPayload_data;
  assign execute_ctrl2_up_LsuCachelessPlugin_WITH_ACCESS_lane0 = 1'b0;
  assign LsuCachelessPlugin_logic_onWb_rspSplits_0 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[7 : 0];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_1 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[15 : 8];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_2 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[23 : 16];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_3 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[31 : 24];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_4 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[39 : 32];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_5 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[47 : 40];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_6 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[55 : 48];
  assign LsuCachelessPlugin_logic_onWb_rspSplits_7 = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0[63 : 56];
  always @(*) begin
    LsuCachelessPlugin_logic_onWb_rspShifted[7 : 0] = _zz_LsuCachelessPlugin_logic_onWb_rspShifted;
    LsuCachelessPlugin_logic_onWb_rspShifted[15 : 8] = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_3;
    LsuCachelessPlugin_logic_onWb_rspShifted[23 : 16] = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_6;
    LsuCachelessPlugin_logic_onWb_rspShifted[31 : 24] = _zz_LsuCachelessPlugin_logic_onWb_rspShifted_9;
    LsuCachelessPlugin_logic_onWb_rspShifted[39 : 32] = LsuCachelessPlugin_logic_onWb_rspSplits_4;
    LsuCachelessPlugin_logic_onWb_rspShifted[47 : 40] = LsuCachelessPlugin_logic_onWb_rspSplits_5;
    LsuCachelessPlugin_logic_onWb_rspShifted[55 : 48] = LsuCachelessPlugin_logic_onWb_rspSplits_6;
    LsuCachelessPlugin_logic_onWb_rspShifted[63 : 56] = LsuCachelessPlugin_logic_onWb_rspSplits_7;
  end

  assign LsuCachelessPlugin_logic_iwb_valid = (execute_ctrl3_down_AguPlugin_SEL_lane0 && (! execute_ctrl3_down_AguPlugin_FLOAT_lane0));
  assign LsuCachelessPlugin_logic_iwb_payload = LsuCachelessPlugin_logic_onWb_rspShifted;
  assign DispatchPlugin_logic_trapPendings[0] = 1'b0;
  assign DispatchPlugin_logic_candidates_0_moving = (((! DispatchPlugin_logic_candidates_0_ctx_valid) || DispatchPlugin_logic_candidates_0_fire) || DispatchPlugin_logic_candidates_0_cancel);
  assign DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_0_hazard = (DispatchPlugin_logic_candidates_0_ctx_hm_RS1_ENABLE && (|{((((DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_up_RD_PHYS_lane0 == DispatchPlugin_logic_candidates_0_ctx_hm_RS1_PHYS)) && 1'b1) && (! execute_ctrl2_down_BYPASSED_AT_2_lane0)),((((DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0 && execute_ctrl1_up_RD_ENABLE_lane0) && (execute_ctrl1_up_RD_PHYS_lane0 == DispatchPlugin_logic_candidates_0_ctx_hm_RS1_PHYS)) && 1'b1) && (! execute_ctrl1_down_BYPASSED_AT_1_lane0))}));
  assign DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_1_hazard = (DispatchPlugin_logic_candidates_0_ctx_hm_RS2_ENABLE && (|{((((DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_up_RD_PHYS_lane0 == DispatchPlugin_logic_candidates_0_ctx_hm_RS2_PHYS)) && 1'b1) && (! execute_ctrl2_down_BYPASSED_AT_2_lane0)),((((DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0 && execute_ctrl1_up_RD_ENABLE_lane0) && (execute_ctrl1_up_RD_PHYS_lane0 == DispatchPlugin_logic_candidates_0_ctx_hm_RS2_PHYS)) && 1'b1) && (! execute_ctrl1_down_BYPASSED_AT_1_lane0))}));
  always @(*) begin
    DispatchPlugin_logic_candidates_0_rsHazards[0] = (|{DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_1_hazard,DispatchPlugin_logic_rsHazardChecker_0_onLl_0_onRs_0_hazard});
    DispatchPlugin_logic_candidates_0_rsHazards[1] = (|{DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_1_hazard,DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_0_hazard});
  end

  assign DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_0_hazard = (DispatchPlugin_logic_candidates_0_ctx_hm_RS1_ENABLE && 1'b0);
  assign DispatchPlugin_logic_rsHazardChecker_0_onLl_1_onRs_1_hazard = (DispatchPlugin_logic_candidates_0_ctx_hm_RS2_ENABLE && 1'b0);
  assign DispatchPlugin_logic_reservationChecker_0_onLl_0_hit = 1'b0;
  always @(*) begin
    DispatchPlugin_logic_candidates_0_reservationHazards[0] = DispatchPlugin_logic_reservationChecker_0_onLl_0_hit;
    DispatchPlugin_logic_candidates_0_reservationHazards[1] = DispatchPlugin_logic_reservationChecker_0_onLl_1_hit;
  end

  assign DispatchPlugin_logic_reservationChecker_0_onLl_1_hit = 1'b0;
  assign DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_0 = (|{(((DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_3 && execute_ctrl1_up_LANE_SEL_lane0) && 1'b1) && execute_ctrl1_down_MAY_FLUSH_PRECISE_3_lane0),(((DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_2 && execute_ctrl1_up_LANE_SEL_lane0) && 1'b1) && execute_ctrl1_down_MAY_FLUSH_PRECISE_2_lane0)});
  assign DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_1 = (|(((DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_2 && execute_ctrl2_up_LANE_SEL_lane0) && 1'b1) && execute_ctrl2_down_MAY_FLUSH_PRECISE_2_lane0));
  assign DispatchPlugin_logic_flushChecker_0_oldersHazard = 1'b0;
  assign DispatchPlugin_logic_candidates_0_flushHazards = ((|{DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_1,DispatchPlugin_logic_flushChecker_0_executeCheck_0_hits_0}) || (DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH_FROM_LANES && DispatchPlugin_logic_flushChecker_0_oldersHazard));
  assign DispatchPlugin_logic_fenceChecker_olderInflights = (|execute_lane0_api_hartsInflight[0]);
  assign DispatchPlugin_logic_candidates_0_fenceOlderHazards = (DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_FENCE_OLDER && (DispatchPlugin_logic_fenceChecker_olderInflights[0] || 1'b0));
  always @(*) begin
    decode_ctrls_2_down_ready = 1'b1;
    if(when_DispatchPlugin_l358) begin
      decode_ctrls_2_down_ready = 1'b0;
    end
  end

  assign DispatchPlugin_logic_feeds_0_sending = DispatchPlugin_logic_candidates_0_fire;
  assign DispatchPlugin_logic_candidates_0_cancel = decode_ctrls_2_lane0_upIsCancel;
  assign DispatchPlugin_logic_candidates_0_ctx_valid = ((decode_ctrls_2_up_isValid && decode_ctrls_2_up_LANE_SEL_0) && (! DispatchPlugin_logic_feeds_0_sent));
  always @(*) begin
    DispatchPlugin_logic_candidates_0_ctx_laneLayerHits = {decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0,decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0};
    if(decode_ctrls_2_down_TRAP_0) begin
      DispatchPlugin_logic_candidates_0_ctx_laneLayerHits = 2'b01;
    end
  end

  assign DispatchPlugin_logic_candidates_0_ctx_uop = decode_ctrls_2_down_Decode_UOP_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED = decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED_PC = decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_PC_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_TAKEN = decode_ctrls_2_down_Prediction_ALIGNED_SLICES_TAKEN_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_BRANCH = decode_ctrls_2_down_Prediction_ALIGNED_SLICES_BRANCH_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_FENCE_OLDER = decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_MAY_FLUSH = decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH = decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH_FROM_LANES = decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_2 = decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_3 = decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_PC = decode_ctrls_2_down_PC_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_TRAP = decode_ctrls_2_down_TRAP_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_Decode_UOP_ID = decode_ctrls_2_down_Decode_UOP_ID_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RS1_ENABLE = decode_ctrls_2_down_RS1_ENABLE_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RS1_PHYS = decode_ctrls_2_down_RS1_PHYS_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RS2_ENABLE = decode_ctrls_2_down_RS2_ENABLE_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RS2_PHYS = decode_ctrls_2_down_RS2_PHYS_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RD_ENABLE = decode_ctrls_2_down_RD_ENABLE_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_RD_PHYS = decode_ctrls_2_down_RD_PHYS_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0 = decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0 = decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0 = decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0;
  assign DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0 = decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0;
  assign when_DispatchPlugin_l358 = ((decode_ctrls_2_up_LANE_SEL_0 && (! DispatchPlugin_logic_feeds_0_sent)) && (! DispatchPlugin_logic_candidates_0_fire));
  assign DispatchPlugin_logic_scheduler_eusFree_0 = 1'b1;
  assign DispatchPlugin_logic_scheduler_hartFree_0 = 1'b1;
  assign DispatchPlugin_logic_scheduler_arbiters_0_candHazard = 1'b0;
  assign DispatchPlugin_logic_scheduler_arbiters_0_layersHits = (((DispatchPlugin_logic_candidates_0_ctx_laneLayerHits & (~ DispatchPlugin_logic_candidates_0_rsHazards)) & (~ DispatchPlugin_logic_candidates_0_reservationHazards)) & {DispatchPlugin_logic_scheduler_eusFree_0[0],DispatchPlugin_logic_scheduler_eusFree_0[0]});
  assign _zz_DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0 = DispatchPlugin_logic_scheduler_arbiters_0_layersHits;
  assign DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0 = _zz_DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0[0];
  assign DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_1 = _zz_DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0[1];
  always @(*) begin
    _zz_DispatchPlugin_logic_scheduler_arbiters_0_layerOh[0] = (DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0 && (! 1'b0));
    _zz_DispatchPlugin_logic_scheduler_arbiters_0_layerOh[1] = (DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_1 && (! DispatchPlugin_logic_scheduler_arbiters_0_layersHits_bools_0));
  end

  assign DispatchPlugin_logic_scheduler_arbiters_0_layerOh = _zz_DispatchPlugin_logic_scheduler_arbiters_0_layerOh;
  assign DispatchPlugin_logic_scheduler_arbiters_0_eusOh = (|{DispatchPlugin_logic_scheduler_arbiters_0_layerOh[1],DispatchPlugin_logic_scheduler_arbiters_0_layerOh[0]});
  assign DispatchPlugin_logic_scheduler_arbiters_0_doIt = (((((DispatchPlugin_logic_candidates_0_ctx_valid && (! DispatchPlugin_logic_candidates_0_flushHazards)) && (! DispatchPlugin_logic_candidates_0_fenceOlderHazards)) && (|DispatchPlugin_logic_scheduler_arbiters_0_layerOh)) && DispatchPlugin_logic_scheduler_hartFree_0[0]) && (! DispatchPlugin_logic_scheduler_arbiters_0_candHazard));
  assign DispatchPlugin_logic_scheduler_eusFree_1 = (DispatchPlugin_logic_scheduler_eusFree_0 & ((! DispatchPlugin_logic_scheduler_arbiters_0_doIt) ? 1'b1 : (~ DispatchPlugin_logic_scheduler_arbiters_0_eusOh)));
  assign DispatchPlugin_logic_scheduler_hartFree_1 = (DispatchPlugin_logic_scheduler_hartFree_0 & (((! DispatchPlugin_logic_candidates_0_ctx_valid) || DispatchPlugin_logic_scheduler_arbiters_0_doIt) ? 1'b1 : (~ 1'b1)));
  assign DispatchPlugin_logic_candidates_0_fire = ((DispatchPlugin_logic_scheduler_arbiters_0_doIt && (! execute_freeze_valid)) && (! DispatchPlugin_api_haltDispatch));
  assign DispatchPlugin_logic_inserter_0_oh = (DispatchPlugin_logic_scheduler_arbiters_0_doIt && DispatchPlugin_logic_scheduler_arbiters_0_eusOh[0]);
  assign DispatchPlugin_logic_inserter_0_trap = DispatchPlugin_logic_candidates_0_ctx_hm_TRAP;
  assign execute_ctrl0_up_LANE_SEL_lane0 = (((|DispatchPlugin_logic_inserter_0_oh) && (! DispatchPlugin_logic_candidates_0_cancel)) && (! DispatchPlugin_api_haltDispatch));
  assign execute_ctrl0_up_Decode_UOP_lane0 = DispatchPlugin_logic_candidates_0_ctx_uop;
  assign execute_ctrl0_up_Prediction_ALIGNED_JUMPED_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED;
  assign execute_ctrl0_up_Prediction_ALIGNED_JUMPED_PC_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_JUMPED_PC;
  assign execute_ctrl0_up_Prediction_ALIGNED_SLICES_TAKEN_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_TAKEN;
  assign execute_ctrl0_up_Prediction_ALIGNED_SLICES_BRANCH_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_Prediction_ALIGNED_SLICES_BRANCH;
  assign execute_ctrl0_up_DispatchPlugin_FENCE_OLDER_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_FENCE_OLDER;
  always @(*) begin
    execute_ctrl0_up_DispatchPlugin_MAY_FLUSH_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_MAY_FLUSH;
    if(when_DispatchPlugin_l427) begin
      execute_ctrl0_up_DispatchPlugin_MAY_FLUSH_lane0 = 1'b0;
    end
  end

  assign execute_ctrl0_up_DispatchPlugin_DONT_FLUSH_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH;
  assign execute_ctrl0_up_DispatchPlugin_DONT_FLUSH_FROM_LANES_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_DONT_FLUSH_FROM_LANES;
  assign execute_ctrl0_up_DONT_FLUSH_PRECISE_2_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_2;
  assign execute_ctrl0_up_DONT_FLUSH_PRECISE_3_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DONT_FLUSH_PRECISE_3;
  assign execute_ctrl0_up_PC_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_PC;
  assign execute_ctrl0_up_TRAP_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_TRAP;
  assign execute_ctrl0_up_Decode_UOP_ID_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_Decode_UOP_ID;
  assign execute_ctrl0_up_RS1_ENABLE_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RS1_ENABLE;
  assign execute_ctrl0_up_RS1_PHYS_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RS1_PHYS;
  assign execute_ctrl0_up_RS2_ENABLE_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RS2_ENABLE;
  assign execute_ctrl0_up_RS2_PHYS_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RS2_PHYS;
  always @(*) begin
    execute_ctrl0_up_RD_ENABLE_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RD_ENABLE;
    if(when_DispatchPlugin_l427) begin
      execute_ctrl0_up_RD_ENABLE_lane0 = 1'b0;
    end
  end

  assign execute_ctrl0_up_RD_PHYS_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_RD_PHYS;
  assign execute_ctrl0_up_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0;
  assign execute_ctrl0_up_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0;
  assign execute_ctrl0_up_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0;
  assign execute_ctrl0_up_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_lane0 = DispatchPlugin_logic_candidates_0_ctx_hm_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0;
  assign when_DispatchPlugin_l427 = ((! execute_ctrl0_up_LANE_SEL_lane0) || DispatchPlugin_logic_inserter_0_trap);
  assign execute_ctrl0_up_COMPLETED_lane0 = DispatchPlugin_logic_inserter_0_trap;
  assign DispatchPlugin_logic_inserter_0_layerOhUnfiltred = (DispatchPlugin_logic_inserter_0_oh[0] ? DispatchPlugin_logic_scheduler_arbiters_0_layerOh : 2'b00);
  assign DispatchPlugin_logic_inserter_0_layer_0_0 = 1'b1;
  assign DispatchPlugin_logic_inserter_0_layer_0_1 = DispatchPlugin_logic_inserter_0_layerOhUnfiltred[0];
  assign DispatchPlugin_logic_inserter_0_layer_1_0 = 1'b0;
  assign DispatchPlugin_logic_inserter_0_layer_1_1 = DispatchPlugin_logic_inserter_0_layerOhUnfiltred[1];
  assign _zz_execute_ctrl0_up_lane0_LAYER_SEL_lane0 = {DispatchPlugin_logic_inserter_0_layer_1_1,DispatchPlugin_logic_inserter_0_layer_0_1};
  assign execute_ctrl0_up_lane0_LAYER_SEL_lane0 = ((_zz_execute_ctrl0_up_lane0_LAYER_SEL_lane0[0] ? DispatchPlugin_logic_inserter_0_layer_0_0 : 1'b0) | (_zz_execute_ctrl0_up_lane0_LAYER_SEL_lane0[1] ? DispatchPlugin_logic_inserter_0_layer_1_0 : 1'b0));
  assign lane0_integer_WriteBackPlugin_logic_stages_0_hits = {lane0_IntFormatPlugin_logic_stages_0_wb_valid,early0_BranchPlugin_logic_wb_valid};
  assign lane0_integer_WriteBackPlugin_logic_stages_0_muxed = ((lane0_integer_WriteBackPlugin_logic_stages_0_hits[0] ? early0_BranchPlugin_logic_wb_payload : 64'h0) | (lane0_integer_WriteBackPlugin_logic_stages_0_hits[1] ? lane0_IntFormatPlugin_logic_stages_0_wb_payload : 64'h0));
  assign execute_ctrl1_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass = lane0_integer_WriteBackPlugin_logic_stages_0_muxed;
  assign lane0_integer_WriteBackPlugin_logic_stages_0_write_valid = (((((execute_ctrl1_down_LANE_SEL_lane0 && execute_ctrl1_down_isReady) && (! execute_lane0_ctrls_1_downIsCancel)) && (|lane0_integer_WriteBackPlugin_logic_stages_0_hits)) && execute_ctrl1_up_RD_ENABLE_lane0) && execute_ctrl1_down_COMMIT_lane0);
  assign lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_data = lane0_integer_WriteBackPlugin_logic_stages_0_muxed;
  assign lane0_integer_WriteBackPlugin_logic_stages_1_hits = lane0_IntFormatPlugin_logic_stages_1_wb_valid;
  assign lane0_integer_WriteBackPlugin_logic_stages_1_muxed = (lane0_integer_WriteBackPlugin_logic_stages_1_hits[0] ? lane0_IntFormatPlugin_logic_stages_1_wb_payload : 64'h0);
  assign lane0_integer_WriteBackPlugin_logic_stages_1_merged = (execute_ctrl2_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0 | lane0_integer_WriteBackPlugin_logic_stages_1_muxed);
  assign execute_ctrl2_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass = lane0_integer_WriteBackPlugin_logic_stages_1_merged;
  assign lane0_integer_WriteBackPlugin_logic_stages_1_write_valid = (((((execute_ctrl2_down_LANE_SEL_lane0 && execute_ctrl2_down_isReady) && (! execute_lane0_ctrls_2_downIsCancel)) && (|lane0_integer_WriteBackPlugin_logic_stages_1_hits)) && execute_ctrl2_up_RD_ENABLE_lane0) && execute_ctrl2_down_COMMIT_lane0);
  assign lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_uopId = execute_ctrl2_down_Decode_UOP_ID_lane0;
  assign lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_data = lane0_integer_WriteBackPlugin_logic_stages_1_muxed;
  assign lane0_integer_WriteBackPlugin_logic_stages_2_hits = {lane0_IntFormatPlugin_logic_stages_2_wb_valid,late0_BranchPlugin_logic_wb_valid};
  assign lane0_integer_WriteBackPlugin_logic_stages_2_muxed = ((lane0_integer_WriteBackPlugin_logic_stages_2_hits[0] ? late0_BranchPlugin_logic_wb_payload : 64'h0) | (lane0_integer_WriteBackPlugin_logic_stages_2_hits[1] ? lane0_IntFormatPlugin_logic_stages_2_wb_payload : 64'h0));
  assign lane0_integer_WriteBackPlugin_logic_stages_2_merged = (execute_ctrl3_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0 | lane0_integer_WriteBackPlugin_logic_stages_2_muxed);
  assign execute_ctrl3_lane0_integer_WriteBackPlugin_logic_DATA_lane0_bypass = lane0_integer_WriteBackPlugin_logic_stages_2_merged;
  assign lane0_integer_WriteBackPlugin_logic_stages_2_write_valid = (((((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && (|lane0_integer_WriteBackPlugin_logic_stages_2_hits)) && execute_ctrl3_up_RD_ENABLE_lane0) && execute_ctrl3_down_COMMIT_lane0);
  assign lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_data = lane0_integer_WriteBackPlugin_logic_stages_2_muxed;
  assign lane0_integer_WriteBackPlugin_logic_write_port_valid = (((((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_upIsCancel)) && execute_ctrl3_up_RD_ENABLE_lane0) && execute_ctrl3_down_lane0_integer_WriteBackPlugin_SEL_lane0) && execute_ctrl3_down_COMMIT_lane0);
  assign lane0_integer_WriteBackPlugin_logic_write_port_address = execute_ctrl3_down_RD_PHYS_lane0;
  assign lane0_integer_WriteBackPlugin_logic_write_port_data = execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
  assign lane0_integer_WriteBackPlugin_logic_write_port_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign _zz_CsrRamPlugin_csrMapper_ramAddress = CsrAccessPlugin_bus_decode_address;
  assign CsrRamPlugin_csrMapper_ramAddress = {(|{((_zz_CsrRamPlugin_csrMapper_ramAddress & 12'h002) == 12'h002),((_zz_CsrRamPlugin_csrMapper_ramAddress & 12'h040) == 12'h0)}),(|((_zz_CsrRamPlugin_csrMapper_ramAddress & 12'h003) == 12'h001))};
  always @(*) begin
    CsrRamPlugin_csrMapper_withRead = 1'b0;
    if(when_CsrAccessPlugin_l264) begin
      CsrRamPlugin_csrMapper_withRead = 1'b1;
    end
  end

  assign CsrRamPlugin_csrMapper_read_valid = (CsrRamPlugin_csrMapper_withRead && (! CsrRamPlugin_api_holdRead));
  assign CsrRamPlugin_csrMapper_read_address = CsrRamPlugin_csrMapper_ramAddress;
  assign when_CsrRamPlugin_l77 = (CsrRamPlugin_csrMapper_withRead && (! CsrRamPlugin_csrMapper_read_ready));
  always @(*) begin
    CsrRamPlugin_csrMapper_doWrite = 1'b0;
    if(when_CsrAccessPlugin_l356_2) begin
      CsrRamPlugin_csrMapper_doWrite = 1'b1;
    end
  end

  assign when_CsrRamPlugin_l84 = (CsrRamPlugin_csrMapper_write_valid && CsrRamPlugin_csrMapper_write_ready);
  assign CsrRamPlugin_csrMapper_write_valid = ((CsrRamPlugin_csrMapper_doWrite && (! CsrRamPlugin_csrMapper_fired)) && (! CsrRamPlugin_api_holdWrite));
  assign CsrRamPlugin_csrMapper_write_address = CsrRamPlugin_csrMapper_ramAddress;
  assign CsrRamPlugin_csrMapper_write_data = CsrAccessPlugin_bus_write_bits;
  assign when_CsrRamPlugin_l88 = ((CsrRamPlugin_csrMapper_doWrite && (! CsrRamPlugin_csrMapper_fired)) && (! CsrRamPlugin_csrMapper_write_ready));
  assign PmpPlugin_logic_isMachine = (PrivilegedPlugin_logic_harts_0_privilege == 2'b11);
  assign PmpPlugin_logic_checkInstruction = (! PmpPlugin_logic_isMachine);
  assign PmpPlugin_logic_checkData = ((! PmpPlugin_logic_isMachine) || (PrivilegedPlugin_logic_harts_0_m_status_mprv && (PrivilegedPlugin_logic_harts_0_m_status_mpp != 2'b11)));
  assign FetchL1Plugin_logic_pmpPort_logic_portCheckData = (PmpPlugin_logic_checkData || 1'b0);
  assign FetchL1Plugin_logic_pmpPort_logic_torCmpAddress = (fetch_logic_ctrls_1_down_MMU_TRANSLATED >>> 4'd12);
  assign fetch_logic_ctrls_0_down_FetchL1Plugin_logic_pmpPort_logic_NEED_HIT = ((PmpPlugin_logic_checkInstruction && 1'b1) || (FetchL1Plugin_logic_pmpPort_logic_portCheckData && (1'b0 || 1'b0)));
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_pmpPort_ACCESS_FAULT = 1'b0;
  assign LsuCachelessPlugin_logic_pmpPort_logic_portCheckData = (PmpPlugin_logic_checkData || 1'b0);
  assign LsuCachelessPlugin_logic_pmpPort_logic_torCmpAddress = (execute_ctrl1_down_MMU_TRANSLATED_lane0 >>> 4'd12);
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_pmpPort_logic_NEED_HIT_lane0 = ((PmpPlugin_logic_checkInstruction && 1'b0) || (LsuCachelessPlugin_logic_pmpPort_logic_portCheckData && (execute_ctrl1_down_AguPlugin_LOAD_lane0 || execute_ctrl1_down_AguPlugin_STORE_lane0)));
  assign execute_ctrl1_down_LsuCachelessPlugin_logic_pmpPort_ACCESS_FAULT_lane0 = 1'b0;
  assign LsuCachelessPlugin_pmaBuilder_addressBits = LsuCachelessPlugin_logic_onPma_port_cmd_address;
  assign LsuCachelessPlugin_pmaBuilder_argsBits = {LsuCachelessPlugin_logic_onPma_port_cmd_size,LsuCachelessPlugin_logic_onPma_port_cmd_op};
  assign LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit = _zz_LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit[0];
  assign LsuCachelessPlugin_pmaBuilder_onTransfers_0_argsHit = (|((LsuCachelessPlugin_pmaBuilder_argsBits & 3'b000) == 3'b000));
  assign LsuCachelessPlugin_pmaBuilder_onTransfers_0_hit = (LsuCachelessPlugin_pmaBuilder_onTransfers_0_argsHit && LsuCachelessPlugin_pmaBuilder_onTransfers_0_addressHit);
  assign _zz_LsuCachelessPlugin_logic_onPma_port_rsp_fault = ((LsuCachelessPlugin_pmaBuilder_addressBits & 32'h80000000) == 32'h80000000);
  assign LsuCachelessPlugin_logic_onPma_port_rsp_fault = (! ((|{_zz_LsuCachelessPlugin_logic_onPma_port_rsp_fault,((LsuCachelessPlugin_pmaBuilder_addressBits & 32'hf0000000) == 32'h10000000)}) && (|LsuCachelessPlugin_pmaBuilder_onTransfers_0_hit)));
  assign LsuCachelessPlugin_logic_onPma_port_rsp_io = (! _zz_LsuCachelessPlugin_logic_onPma_port_rsp_io[0]);
  assign decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0 = _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_FPU_0[0];
  assign decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0 = _zz_decode_ctrls_2_down_DecoderPlugin_logic_NEED_RM_0[0];
  assign _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h0) == 32'h0);
  assign decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_0_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_LANES_LAYER_HIT_1_0_2[0];
  assign decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0 = _zz_decode_ctrls_2_down_DispatchPlugin_MAY_FLUSH_0_1[0];
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00000070) == 32'h00000020);
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_1 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00002050) == 32'h00002050);
  assign _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_2 = ((decode_ctrls_2_down_Decode_INSTRUCTION_0 & 32'h00001050) == 32'h00001050);
  assign decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0 = _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0 = _zz_decode_ctrls_2_down_DispatchPlugin_DONT_FLUSH_FROM_LANES_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0 = _zz_decode_ctrls_2_down_DispatchPlugin_FENCE_OLDER_0[0];
  assign decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0 = _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_2_0[0];
  assign decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0 = _zz_decode_ctrls_2_down_DONT_FLUSH_PRECISE_3_0_3[0];
  assign decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_0_ENABLES_0_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_0_onRs_1_ENABLES_0_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_0_ENABLES_0_0[0];
  assign decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0 = _zz_decode_ctrls_2_down_DispatchPlugin_logic_hcs_1_onRs_1_ENABLES_0_0_1[0];
  assign when_CtrlLaneApi_l46_2 = (decode_ctrls_2_up_isReady || decode_ctrls_2_lane0_upIsCancel);
  assign WhiteboxerPlugin_logic_serializeds_0_fire = (decode_ctrls_2_up_LANE_SEL_0 && (! decode_ctrls_2_up_LANE_SEL_0_regNext_1));
  assign WhiteboxerPlugin_logic_serializeds_0_decodeId = decode_ctrls_2_down_Decode_DOP_ID_0;
  assign WhiteboxerPlugin_logic_serializeds_0_microOpId = decode_ctrls_2_down_Decode_UOP_ID_0;
  assign WhiteboxerPlugin_logic_serializeds_0_microOp = decode_ctrls_2_down_Decode_UOP_0;
  assign when_CtrlLaneApi_l46_3 = (execute_ctrl0_down_isReady || execute_lane0_ctrls_0_downIsCancel);
  assign WhiteboxerPlugin_logic_dispatches_0_fire = (execute_ctrl0_down_LANE_SEL_lane0 && (! execute_ctrl0_down_LANE_SEL_lane0_regNext));
  assign WhiteboxerPlugin_logic_dispatches_0_microOpId = execute_ctrl0_down_Decode_UOP_ID_lane0;
  assign when_CtrlLaneApi_l46_4 = (execute_ctrl1_down_isReady || execute_lane0_ctrls_1_downIsCancel);
  assign WhiteboxerPlugin_logic_executes_0_fire = ((execute_ctrl1_down_LANE_SEL_lane0 && (! execute_ctrl1_down_LANE_SEL_lane0_regNext)) && execute_ctrl1_down_COMMIT_lane0);
  assign WhiteboxerPlugin_logic_executes_0_microOpId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign BtbPlugin_logic_onForget_hash = DecoderPlugin_logic_forgetPort_payload_pcOnLastSlice[16 : 9];
  assign _zz_BtbPlugin_logic_readPort_rsp_0_hash = BtbPlugin_logic_mem_spinal_port1[41 : 0];
  assign BtbPlugin_logic_readPort_rsp_0_hash = _zz_BtbPlugin_logic_readPort_rsp_0_hash[7 : 0];
  assign BtbPlugin_logic_readPort_rsp_0_pcTarget = _zz_BtbPlugin_logic_readPort_rsp_0_hash[37 : 8];
  assign BtbPlugin_logic_readPort_rsp_0_isBranch = _zz_BtbPlugin_logic_readPort_rsp_0_hash[38];
  assign BtbPlugin_logic_readPort_rsp_0_isPush = _zz_BtbPlugin_logic_readPort_rsp_0_hash[39];
  assign BtbPlugin_logic_readPort_rsp_0_isPop = _zz_BtbPlugin_logic_readPort_rsp_0_hash[40];
  assign BtbPlugin_logic_readPort_rsp_0_taken = _zz_BtbPlugin_logic_readPort_rsp_0_hash[41];
  assign BtbPlugin_logic_readPort_cmd_valid = fetch_logic_ctrls_0_down_isReady;
  assign BtbPlugin_logic_readPort_cmd_payload = _zz_BtbPlugin_logic_readPort_cmd_payload[6:0];
  assign fetch_logic_ctrls_0_down_BtbPlugin_logic_readCmd_HAZARDS = ((BtbPlugin_logic_onLearn_port_valid && (BtbPlugin_logic_onLearn_port_payload_address == BtbPlugin_logic_readPort_cmd_payload)) ? BtbPlugin_logic_onLearn_port_payload_mask : 1'b0);
  assign fetch_logic_ctrls_0_haltRequest_BtbPlugin_l171 = BtbPlugin_logic_onLearn_port_valid;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash = BtbPlugin_logic_readPort_rsp_0_hash;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget = BtbPlugin_logic_readPort_rsp_0_pcTarget;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch = BtbPlugin_logic_readPort_rsp_0_isBranch;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush = BtbPlugin_logic_readPort_rsp_0_isPush;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop = BtbPlugin_logic_readPort_rsp_0_isPop;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken = BtbPlugin_logic_readPort_rsp_0_taken;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT = ((fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash == fetch_logic_ctrls_1_down_Fetch_WORD_PC[16 : 9]) && 1'b1);
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_predict_TAKEN = ((! fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch) || fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken);
  assign BtbPlugin_logic_ras_readIt = fetch_logic_ctrls_1_down_isReady;
  assign BtbPlugin_logic_applyIt_chunksMask = (fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT && 1'b1);
  assign BtbPlugin_logic_applyIt_chunksTakenOh = (fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_predict_TAKEN & BtbPlugin_logic_applyIt_chunksMask);
  assign BtbPlugin_logic_applyIt_needIt = (fetch_logic_ctrls_2_up_isValid && (|BtbPlugin_logic_applyIt_chunksTakenOh));
  assign when_BtbPlugin_l205 = (fetch_logic_ctrls_2_up_isReady || fetch_logic_ctrls_2_up_isCancel);
  assign BtbPlugin_logic_applyIt_doIt = (BtbPlugin_logic_applyIt_needIt && (! BtbPlugin_logic_applyIt_correctionSent));
  assign BtbPlugin_logic_applyIt_entry_hash = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash;
  assign BtbPlugin_logic_applyIt_entry_pcTarget = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget;
  assign BtbPlugin_logic_applyIt_entry_isBranch = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch;
  assign BtbPlugin_logic_applyIt_entry_isPush = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush;
  assign BtbPlugin_logic_applyIt_entry_isPop = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop;
  assign BtbPlugin_logic_applyIt_entry_taken = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken;
  always @(*) begin
    BtbPlugin_logic_applyIt_pcTarget = BtbPlugin_logic_applyIt_entry_pcTarget;
    if(BtbPlugin_logic_applyIt_entry_isPop) begin
      BtbPlugin_logic_applyIt_pcTarget = BtbPlugin_logic_ras_read;
    end
  end

  assign BtbPlugin_logic_applyIt_rasLogic_pushValid = (BtbPlugin_logic_applyIt_doIt && BtbPlugin_logic_applyIt_entry_isPush);
  assign BtbPlugin_logic_applyIt_rasLogic_pushPc = fetch_logic_ctrls_2_down_Fetch_WORD_PC;
  assign when_BtbPlugin_l218 = (BtbPlugin_logic_applyIt_doIt && BtbPlugin_logic_applyIt_entry_isPop);
  assign BtbPlugin_logic_flushPort_valid = BtbPlugin_logic_applyIt_doIt;
  assign BtbPlugin_logic_flushPort_payload_self = 1'b0;
  assign BtbPlugin_logic_pcPort_valid = BtbPlugin_logic_applyIt_doIt;
  assign BtbPlugin_logic_pcPort_payload_fault = 1'b0;
  assign BtbPlugin_logic_pcPort_payload_pc = ({2'd0,BtbPlugin_logic_applyIt_pcTarget} <<< 2'd2);
  assign fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED = BtbPlugin_logic_applyIt_needIt;
  assign fetch_logic_ctrls_2_down_Prediction_WORD_JUMP_PC = ({2'd0,BtbPlugin_logic_applyIt_pcTarget} <<< 2'd2);
  assign fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_BRANCH[0] = ((fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT && fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch) && 1'b1);
  assign fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_TAKEN[0] = fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_predict_TAKEN;
  assign AlignerPlugin_logic_buffer_flushIt = (|{(DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),(LsuCachelessPlugin_logic_flushPort_valid && 1'b1)}}}}});
  assign AlignerPlugin_logic_buffer_readers_0_firstFromBuffer = (|_zz_AlignerPlugin_logic_extractors_0_redo);
  assign AlignerPlugin_logic_buffer_readers_0_lastFromBuffer = (AlignerPlugin_logic_extractors_0_usageMask[1] == 1'b0);
  assign _zz_AlignerPlugin_logic_extractors_0_ctx_instruction = {_zz_AlignerPlugin_logic_extractors_0_redo_1,_zz_AlignerPlugin_logic_extractors_0_redo};
  assign AlignerPlugin_logic_extractors_0_ctx_instruction = ((_zz_AlignerPlugin_logic_extractors_0_ctx_instruction[0] ? AlignerPlugin_logic_slicesInstructions_0 : 32'h0) | (_zz_AlignerPlugin_logic_extractors_0_ctx_instruction[1] ? AlignerPlugin_logic_slicesInstructions_1 : 32'h0));
  assign AlignerPlugin_logic_extractors_0_ctx_pc = (AlignerPlugin_logic_buffer_readers_0_firstFromBuffer ? AlignerPlugin_logic_buffer_pc : fetch_logic_ctrls_2_down_Fetch_WORD_PC);
  assign AlignerPlugin_logic_extractors_0_ctx_trap = ((AlignerPlugin_logic_buffer_readers_0_firstFromBuffer && AlignerPlugin_logic_buffer_trap) || ((! AlignerPlugin_logic_buffer_readers_0_lastFromBuffer) && fetch_logic_ctrls_2_down_TRAP));
  assign AlignerPlugin_logic_extractors_0_ctx_hm_Fetch_ID = (AlignerPlugin_logic_buffer_readers_0_firstFromBuffer ? AlignerPlugin_logic_buffer_hm_Fetch_ID : fetch_logic_ctrls_2_down_Fetch_ID);
  assign AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_BRANCH = (AlignerPlugin_logic_buffer_readers_0_lastFromBuffer ? AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_BRANCH : fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_BRANCH);
  assign AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_SLICES_TAKEN = (AlignerPlugin_logic_buffer_readers_0_lastFromBuffer ? AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_TAKEN : fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_TAKEN);
  assign AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMP_PC = (AlignerPlugin_logic_buffer_readers_0_lastFromBuffer ? AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMP_PC : fetch_logic_ctrls_2_down_Prediction_WORD_JUMP_PC);
  assign AlignerPlugin_logic_extractors_0_ctx_hm_Prediction_WORD_JUMPED = (AlignerPlugin_logic_buffer_readers_0_lastFromBuffer ? AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMPED : fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED);
  assign AlignerPlugin_api_downMoving = decode_ctrls_0_up_isMoving;
  always @(*) begin
    TrapPlugin_logic_harts_0_crsPorts_read_valid = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
        TrapPlugin_logic_harts_0_crsPorts_read_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
        TrapPlugin_logic_harts_0_crsPorts_read_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_crsPorts_read_address = 2'bxx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
        TrapPlugin_logic_harts_0_crsPorts_read_address = 2'b11;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
        TrapPlugin_logic_harts_0_crsPorts_read_address = 2'b01;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  assign decode_logic_flushes_0_onLanes_0_doIt = (|{(DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),(LsuCachelessPlugin_logic_flushPort_valid && 1'b1)}}}}});
  assign decode_ctrls_0_lane0_downIsCancel = 1'b0;
  assign decode_ctrls_0_lane0_upIsCancel = decode_logic_flushes_0_onLanes_0_doIt;
  assign decode_logic_flushes_1_onLanes_0_doIt = (|{(DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),(LsuCachelessPlugin_logic_flushPort_valid && 1'b1)}}}}});
  assign decode_ctrls_1_lane0_downIsCancel = 1'b0;
  assign decode_ctrls_1_lane0_upIsCancel = decode_logic_flushes_1_onLanes_0_doIt;
  assign decode_logic_flushes_2_onLanes_0_doIt = (|{((DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1) && (1'b0 || (1'b1 && DecoderPlugin_logic_laneLogic_0_flushPort_payload_self))),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && _zz_decode_logic_flushes_2_onLanes_0_doIt),{_zz_decode_logic_flushes_2_onLanes_0_doIt_1,_zz_decode_logic_flushes_2_onLanes_0_doIt_2}}}}});
  assign decode_ctrls_2_lane0_downIsCancel = 1'b0;
  assign decode_ctrls_2_lane0_upIsCancel = decode_logic_flushes_2_onLanes_0_doIt;
  assign decode_logic_trapPending[0] = (|{((decode_ctrls_2_up_LANE_SEL_0 && 1'b1) && decode_ctrls_2_down_TRAP_0),{((decode_ctrls_1_up_LANE_SEL_0 && 1'b1) && decode_ctrls_1_down_TRAP_0),((decode_ctrls_0_up_LANE_SEL_0 && 1'b1) && decode_ctrls_0_down_TRAP_0)}});
  always @(*) begin
    TrapPlugin_logic_harts_0_crsPorts_write_valid = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
        TrapPlugin_logic_harts_0_crsPorts_write_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
        TrapPlugin_logic_harts_0_crsPorts_write_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_crsPorts_write_address = 2'bxx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
        TrapPlugin_logic_harts_0_crsPorts_write_address = 2'b01;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
        TrapPlugin_logic_harts_0_crsPorts_write_address = 2'b10;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_crsPorts_write_data = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
        TrapPlugin_logic_harts_0_crsPorts_write_data = _zz_TrapPlugin_logic_harts_0_crsPorts_write_data;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
        TrapPlugin_logic_harts_0_crsPorts_write_data = _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_1;
        if(TrapPlugin_logic_harts_0_trap_fsm_triggerEbreakReg) begin
          TrapPlugin_logic_harts_0_crsPorts_write_data = _zz_TrapPlugin_logic_harts_0_crsPorts_write_data_3;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_interrupt_valid = 1'b0;
    if(when_TrapPlugin_l189) begin
      if(when_TrapPlugin_l195) begin
        TrapPlugin_logic_harts_0_interrupt_valid = 1'b1;
      end
      if(when_TrapPlugin_l195_1) begin
        TrapPlugin_logic_harts_0_interrupt_valid = 1'b1;
      end
      if(when_TrapPlugin_l195_2) begin
        TrapPlugin_logic_harts_0_interrupt_valid = 1'b1;
      end
    end
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_interrupt_code = 4'bxxxx;
    if(when_TrapPlugin_l189) begin
      if(when_TrapPlugin_l195) begin
        TrapPlugin_logic_harts_0_interrupt_code = 4'b0111;
      end
      if(when_TrapPlugin_l195_1) begin
        TrapPlugin_logic_harts_0_interrupt_code = 4'b0011;
      end
      if(when_TrapPlugin_l195_2) begin
        TrapPlugin_logic_harts_0_interrupt_code = 4'b1011;
      end
    end
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_interrupt_targetPrivilege = 2'bxx;
    if(when_TrapPlugin_l189) begin
      if(when_TrapPlugin_l195) begin
        TrapPlugin_logic_harts_0_interrupt_targetPrivilege = 2'b11;
      end
      if(when_TrapPlugin_l195_1) begin
        TrapPlugin_logic_harts_0_interrupt_targetPrivilege = 2'b11;
      end
      if(when_TrapPlugin_l195_2) begin
        TrapPlugin_logic_harts_0_interrupt_targetPrivilege = 2'b11;
      end
    end
  end

  assign when_TrapPlugin_l189 = (PrivilegedPlugin_logic_harts_0_m_status_mie || (! PrivilegedPlugin_logic_harts_0_withMachinePrivilege));
  assign when_TrapPlugin_l195 = ((_zz_when_TrapPlugin_l195 && 1'b1) && (! 1'b0));
  assign when_TrapPlugin_l195_1 = ((_zz_when_TrapPlugin_l195_1 && 1'b1) && (! 1'b0));
  assign when_TrapPlugin_l195_2 = ((_zz_when_TrapPlugin_l195_2 && 1'b1) && (! 1'b0));
  assign TrapPlugin_logic_harts_0_interrupt_pendingInterrupt = (TrapPlugin_logic_harts_0_interrupt_validBuffer && PrivilegedPlugin_api_harts_0_allowInterrupts);
  assign when_TrapPlugin_l214 = (|{_zz_when_TrapPlugin_l195_2,{_zz_when_TrapPlugin_l195_1,_zz_when_TrapPlugin_l195}});
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid = (early0_EnvPlugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid = (FetchL1Plugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1 = (LsuCachelessPlugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2 = (early0_BranchPlugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3 = (CsrAccessPlugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid = (late0_BranchPlugin_logic_trapPort_valid && 1'b1);
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid = (DecoderPlugin_logic_laneLogic_0_trapPort_valid && 1'b1);
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid = (|_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid);
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_exception = late0_BranchPlugin_logic_trapPort_payload_exception;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_tval = late0_BranchPlugin_logic_trapPort_payload_tval;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_code = late0_BranchPlugin_logic_trapPort_payload_code;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_arg = late0_BranchPlugin_logic_trapPort_payload_arg;
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception = {(_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3 && (&{(! _zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception),{_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_2}})),{(_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2 && (&{_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_3,{_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_4,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_6}})),{(_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1 && (&{_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_8,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_10})),(_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid && (&{_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_13,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_15}))}}};
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid = (|{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1,_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid}}});
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1 = (((_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception[0] ? {early0_EnvPlugin_logic_trapPort_payload_arg,{early0_EnvPlugin_logic_trapPort_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_1}} : 39'h0) | (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception[1] ? {LsuCachelessPlugin_logic_trapPort_payload_arg,{LsuCachelessPlugin_logic_trapPort_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_2}} : 39'h0)) | ((_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception[2] ? {early0_BranchPlugin_logic_trapPort_payload_arg,{early0_BranchPlugin_logic_trapPort_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_3}} : 39'h0) | (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception[3] ? {CsrAccessPlugin_logic_trapPort_payload_arg,{CsrAccessPlugin_logic_trapPort_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1_4}} : 39'h0)));
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1[0];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_tval = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1[32 : 1];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_code = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1[36 : 33];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_arg = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_exception_1[38 : 37];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid = (|_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid);
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_exception = DecoderPlugin_logic_laneLogic_0_trapPort_payload_exception;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_tval = DecoderPlugin_logic_laneLogic_0_trapPort_payload_tval;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_code = DecoderPlugin_logic_laneLogic_0_trapPort_payload_code;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_arg = DecoderPlugin_logic_laneLogic_0_trapPort_payload_arg;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid = (|_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid);
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_exception = FetchL1Plugin_logic_trapPort_payload_exception;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_tval = FetchL1Plugin_logic_trapPort_payload_tval;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_code = FetchL1Plugin_logic_trapPort_payload_code;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_arg = FetchL1Plugin_logic_trapPort_payload_arg;
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh = {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid,TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid}}};
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1 = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[0];
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_2 = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[1];
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_3 = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[2];
  always @(*) begin
    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4[0] = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1 && (! 1'b0));
    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4[1] = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_2 && (! _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1));
    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4[2] = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_3 && (! (|{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_2,_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1})));
    _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4[3] = (_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[3] && (! (|{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_3,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_2,_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_1}})));
  end

  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_oh = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_oh_4;
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_down_valid = (|{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_valid,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_valid,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_3,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_2,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid_1,{_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_valid,_zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_valid}}}}}});
  assign _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception = (((TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[0] ? {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_arg,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_0_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception}} : 39'h0) | (TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[1] ? {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_arg,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_1_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_1}} : 39'h0)) | ((TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[2] ? {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_arg,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_2_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_2}} : 39'h0) | (TrapPlugin_logic_harts_0_trap_pending_arbiter_oh[3] ? {TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_arg,{TrapPlugin_logic_harts_0_trap_pending_arbiter_ports_3_payload_code,_zz__zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception_3}} : 39'h0)));
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception[0];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_tval = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception[32 : 1];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_code = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception[36 : 33];
  assign TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_arg = _zz_TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception[38 : 37];
  assign TrapPlugin_logic_harts_0_trap_pending_xret_sourcePrivilege = TrapPlugin_logic_harts_0_trap_pending_state_arg[1 : 0];
  assign TrapPlugin_logic_harts_0_trap_pending_xret_targetPrivilege = PrivilegedPlugin_logic_harts_0_m_status_mpp;
  assign TrapPlugin_logic_harts_0_trap_exception_exceptionTargetPrivilegeUncapped = 2'b11;
  assign TrapPlugin_logic_harts_0_trap_exception_code = TrapPlugin_logic_harts_0_trap_pending_state_code;
  assign TrapPlugin_logic_harts_0_trap_exception_targetPrivilege = ((PrivilegedPlugin_logic_harts_0_privilege < TrapPlugin_logic_harts_0_trap_exception_exceptionTargetPrivilegeUncapped) ? TrapPlugin_logic_harts_0_trap_exception_exceptionTargetPrivilegeUncapped : PrivilegedPlugin_logic_harts_0_privilege);
  assign PrivilegedPlugin_logic_harts_0_commitMask = (((execute_ctrl4_down_LANE_SEL_lane0 && execute_ctrl4_down_isReady) && (! execute_lane0_ctrls_4_downIsCancel)) && execute_ctrl4_down_COMMIT_lane0);
  assign TrapPlugin_logic_harts_0_trap_trigger_oh = (((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && execute_ctrl3_down_TRAP_lane0);
  assign TrapPlugin_logic_harts_0_trap_trigger_valid = (|TrapPlugin_logic_harts_0_trap_trigger_oh);
  always @(*) begin
    TrapPlugin_logic_harts_0_trap_whitebox_trap = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_whitebox_trap = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_trap_whitebox_interrupt = 1'bx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_whitebox_interrupt = TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_trap_whitebox_code = 4'bxxxx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_whitebox_code = TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_code;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_trap_pcPort_valid = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        if(!when_TrapPlugin_l393) begin
          case(TrapPlugin_logic_harts_0_trap_pending_state_code)
            4'b0000 : begin
              TrapPlugin_logic_harts_0_trap_pcPort_valid = 1'b1;
            end
            4'b0001 : begin
            end
            4'b0010 : begin
            end
            4'b0100 : begin
            end
            4'b0101 : begin
            end
            4'b1000 : begin
            end
            4'b0110 : begin
            end
            default : begin
            end
          endcase
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_pcPort_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
        TrapPlugin_logic_harts_0_trap_pcPort_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
        TrapPlugin_logic_harts_0_trap_pcPort_valid = 1'b1;
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  assign TrapPlugin_logic_harts_0_trap_pcPort_payload_fault = 1'b0;
  always @(*) begin
    TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        if(!when_TrapPlugin_l393) begin
          case(TrapPlugin_logic_harts_0_trap_pending_state_code)
            4'b0000 : begin
              TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = TrapPlugin_logic_harts_0_trap_pending_pc;
            end
            4'b0001 : begin
            end
            4'b0010 : begin
            end
            4'b0100 : begin
            end
            4'b0101 : begin
            end
            4'b1000 : begin
            end
            4'b0110 : begin
            end
            default : begin
            end
          endcase
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc[31:0];
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
        TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = _zz_TrapPlugin_logic_harts_0_trap_pcPort_payload_pc_1[31:0];
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
        TrapPlugin_logic_harts_0_trap_pcPort_payload_pc = TrapPlugin_logic_harts_0_trap_fsm_jumpTarget;
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  assign TrapPlugin_logic_harts_0_trap_fsm_wantExit = 1'b0;
  always @(*) begin
    TrapPlugin_logic_harts_0_trap_fsm_wantStart = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
        TrapPlugin_logic_harts_0_trap_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign TrapPlugin_logic_harts_0_trap_fsm_wantKill = 1'b0;
  assign TrapPlugin_logic_harts_0_trap_fsm_inflightTrap = (|{execute_lane0_logic_trapPending[0],{DispatchPlugin_logic_trapPendings[0],decode_logic_trapPending[0]}});
  assign TrapPlugin_logic_harts_0_trap_fsm_holdPort = (TrapPlugin_logic_harts_0_trap_fsm_inflightTrap || (! (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_RUNNING)));
  assign TrapPlugin_api_harts_0_fsmBusy = (! (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_RUNNING));
  always @(*) begin
    TrapPlugin_logic_harts_0_trap_fsm_wfi = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        if(!when_TrapPlugin_l393) begin
          case(TrapPlugin_logic_harts_0_trap_pending_state_code)
            4'b0000 : begin
            end
            4'b0001 : begin
            end
            4'b0010 : begin
            end
            4'b0100 : begin
            end
            4'b0101 : begin
            end
            4'b1000 : begin
              TrapPlugin_logic_harts_0_trap_fsm_wfi = 1'b1;
            end
            4'b0110 : begin
            end
            default : begin
            end
          endcase
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
        if(TrapPlugin_logic_harts_0_trap_trigger_valid) begin
          TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt = 1'b1;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
  end

  assign TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt = ((TrapPlugin_logic_harts_0_trap_pending_state_code == 4'b0000) && TrapPlugin_logic_harts_0_trap_fsm_buffer_i_valid);
  assign TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_targetPrivilege = (TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt ? TrapPlugin_logic_harts_0_trap_fsm_buffer_i_targetPrivilege : TrapPlugin_logic_harts_0_trap_exception_targetPrivilege);
  assign TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_tval = ((! TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt) ? TrapPlugin_logic_harts_0_trap_pending_state_tval : 32'h0);
  assign TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_code = (TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt ? TrapPlugin_logic_harts_0_trap_fsm_buffer_i_code : TrapPlugin_logic_harts_0_trap_pending_state_code);
  assign TrapPlugin_logic_harts_0_trap_fsm_resetToRunConditions_0 = (! TrapPlugin_logic_initHold);
  assign TrapPlugin_logic_harts_0_trap_fsm_jumpOffset = ((|{(TrapPlugin_logic_harts_0_trap_pending_state_code == 4'b1000),{(TrapPlugin_logic_harts_0_trap_pending_state_code == 4'b0110),{(TrapPlugin_logic_harts_0_trap_pending_state_code == 4'b0010),(TrapPlugin_logic_harts_0_trap_pending_state_code == 4'b0101)}}}) ? TrapPlugin_logic_harts_0_trap_pending_slices : 1'b0);
  always @(*) begin
    TrapPlugin_logic_fetchL1Invalidate_0_cmd_valid = 1'b0;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
        TrapPlugin_logic_fetchL1Invalidate_0_cmd_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign TrapPlugin_logic_harts_0_trap_fsm_triggerEbreak = 1'b0;
  assign when_TrapPlugin_l539 = (TrapPlugin_logic_harts_0_crsPorts_read_valid && TrapPlugin_logic_harts_0_crsPorts_read_ready);
  assign TrapPlugin_logic_harts_0_trap_fsm_xretPrivilege = TrapPlugin_logic_harts_0_trap_pending_state_arg[1 : 0];
  assign PcPlugin_logic_forcedSpawn = (|{TrapPlugin_logic_harts_0_trap_pcPort_valid,{late0_BranchPlugin_logic_pcPort_valid,{early0_BranchPlugin_logic_pcPort_valid,BtbPlugin_logic_pcPort_valid}}});
  assign PcPlugin_logic_harts_0_self_pc = (PcPlugin_logic_harts_0_self_state + _zz_PcPlugin_logic_harts_0_self_pc);
  assign PcPlugin_logic_harts_0_self_flow_valid = 1'b1;
  assign PcPlugin_logic_harts_0_self_flow_payload_fault = PcPlugin_logic_harts_0_self_fault;
  assign PcPlugin_logic_harts_0_self_flow_payload_pc = PcPlugin_logic_harts_0_self_pc;
  assign PcPlugin_logic_harts_0_aggregator_sortedByPriority_3_laneValid = 1'b1;
  assign PcPlugin_logic_harts_0_aggregator_sortedByPriority_2_laneValid = 1'b1;
  assign PcPlugin_logic_harts_0_aggregator_sortedByPriority_1_laneValid = 1'b1;
  assign PcPlugin_logic_harts_0_aggregator_sortedByPriority_0_laneValid = 1'b1;
  assign PcPlugin_logic_harts_0_aggregator_sortedByPriority_4_laneValid = 1'b1;
  assign PcPlugin_logic_harts_0_aggregator_valids_0 = ((TrapPlugin_logic_harts_0_trap_pcPort_valid && 1'b1) && PcPlugin_logic_harts_0_aggregator_sortedByPriority_0_laneValid);
  assign PcPlugin_logic_harts_0_aggregator_valids_1 = ((late0_BranchPlugin_logic_pcPort_valid && 1'b1) && PcPlugin_logic_harts_0_aggregator_sortedByPriority_1_laneValid);
  assign PcPlugin_logic_harts_0_aggregator_valids_2 = ((early0_BranchPlugin_logic_pcPort_valid && 1'b1) && PcPlugin_logic_harts_0_aggregator_sortedByPriority_2_laneValid);
  assign PcPlugin_logic_harts_0_aggregator_valids_3 = ((BtbPlugin_logic_pcPort_valid && 1'b1) && PcPlugin_logic_harts_0_aggregator_sortedByPriority_3_laneValid);
  assign PcPlugin_logic_harts_0_aggregator_valids_4 = ((PcPlugin_logic_harts_0_self_flow_valid && 1'b1) && PcPlugin_logic_harts_0_aggregator_sortedByPriority_4_laneValid);
  assign _zz_PcPlugin_logic_harts_0_aggregator_oh = {PcPlugin_logic_harts_0_aggregator_valids_4,{PcPlugin_logic_harts_0_aggregator_valids_3,{PcPlugin_logic_harts_0_aggregator_valids_2,{PcPlugin_logic_harts_0_aggregator_valids_1,PcPlugin_logic_harts_0_aggregator_valids_0}}}};
  assign _zz_PcPlugin_logic_harts_0_aggregator_oh_1 = _zz_PcPlugin_logic_harts_0_aggregator_oh[0];
  assign _zz_PcPlugin_logic_harts_0_aggregator_oh_2 = _zz_PcPlugin_logic_harts_0_aggregator_oh[1];
  assign _zz_PcPlugin_logic_harts_0_aggregator_oh_3 = _zz_PcPlugin_logic_harts_0_aggregator_oh[2];
  assign _zz_PcPlugin_logic_harts_0_aggregator_oh_4 = _zz_PcPlugin_logic_harts_0_aggregator_oh[3];
  always @(*) begin
    _zz_PcPlugin_logic_harts_0_aggregator_oh_5[0] = (_zz_PcPlugin_logic_harts_0_aggregator_oh_1 && (! 1'b0));
    _zz_PcPlugin_logic_harts_0_aggregator_oh_5[1] = (_zz_PcPlugin_logic_harts_0_aggregator_oh_2 && (! _zz_PcPlugin_logic_harts_0_aggregator_oh_1));
    _zz_PcPlugin_logic_harts_0_aggregator_oh_5[2] = (_zz_PcPlugin_logic_harts_0_aggregator_oh_3 && (! (|{_zz_PcPlugin_logic_harts_0_aggregator_oh_2,_zz_PcPlugin_logic_harts_0_aggregator_oh_1})));
    _zz_PcPlugin_logic_harts_0_aggregator_oh_5[3] = (_zz_PcPlugin_logic_harts_0_aggregator_oh_4 && (! (|{_zz_PcPlugin_logic_harts_0_aggregator_oh_3,{_zz_PcPlugin_logic_harts_0_aggregator_oh_2,_zz_PcPlugin_logic_harts_0_aggregator_oh_1}})));
    _zz_PcPlugin_logic_harts_0_aggregator_oh_5[4] = (_zz_PcPlugin_logic_harts_0_aggregator_oh[4] && (! (|{_zz_PcPlugin_logic_harts_0_aggregator_oh_4,{_zz_PcPlugin_logic_harts_0_aggregator_oh_3,{_zz_PcPlugin_logic_harts_0_aggregator_oh_2,_zz_PcPlugin_logic_harts_0_aggregator_oh_1}}})));
  end

  assign PcPlugin_logic_harts_0_aggregator_oh = _zz_PcPlugin_logic_harts_0_aggregator_oh_5;
  assign _zz_PcPlugin_logic_harts_0_aggregator_target = PcPlugin_logic_harts_0_aggregator_oh[0];
  assign _zz_PcPlugin_logic_harts_0_aggregator_target_1 = PcPlugin_logic_harts_0_aggregator_oh[1];
  assign _zz_PcPlugin_logic_harts_0_aggregator_target_2 = PcPlugin_logic_harts_0_aggregator_oh[2];
  assign _zz_PcPlugin_logic_harts_0_aggregator_target_3 = PcPlugin_logic_harts_0_aggregator_oh[3];
  assign _zz_PcPlugin_logic_harts_0_aggregator_target_4 = PcPlugin_logic_harts_0_aggregator_oh[4];
  assign PcPlugin_logic_harts_0_aggregator_target = ((((_zz_PcPlugin_logic_harts_0_aggregator_target ? TrapPlugin_logic_harts_0_trap_pcPort_payload_pc : 32'h0) | (_zz_PcPlugin_logic_harts_0_aggregator_target_1 ? late0_BranchPlugin_logic_pcPort_payload_pc : 32'h0)) | ((_zz_PcPlugin_logic_harts_0_aggregator_target_2 ? early0_BranchPlugin_logic_pcPort_payload_pc : 32'h0) | (_zz_PcPlugin_logic_harts_0_aggregator_target_3 ? BtbPlugin_logic_pcPort_payload_pc : 32'h0))) | (_zz_PcPlugin_logic_harts_0_aggregator_target_4 ? PcPlugin_logic_harts_0_self_flow_payload_pc : 32'h0));
  assign PcPlugin_logic_harts_0_aggregator_fault = _zz_PcPlugin_logic_harts_0_aggregator_fault[0];
  assign PcPlugin_logic_harts_0_holdComb = (|TrapPlugin_logic_harts_0_trap_fsm_holdPort);
  assign PcPlugin_logic_harts_0_output_valid = (! PcPlugin_logic_harts_0_holdReg);
  assign PcPlugin_logic_harts_0_output_payload_fault = PcPlugin_logic_harts_0_aggregator_fault;
  always @(*) begin
    PcPlugin_logic_harts_0_output_payload_pc = PcPlugin_logic_harts_0_aggregator_target;
    PcPlugin_logic_harts_0_output_payload_pc[1 : 0] = 2'b00;
  end

  assign PcPlugin_logic_harts_0_output_fire = (PcPlugin_logic_harts_0_output_valid && PcPlugin_logic_harts_0_output_ready);
  assign fetch_logic_ctrls_0_up_valid = PcPlugin_logic_harts_0_output_valid;
  assign PcPlugin_logic_harts_0_output_ready = fetch_logic_ctrls_0_up_ready;
  assign fetch_logic_ctrls_0_up_Fetch_WORD_PC = PcPlugin_logic_harts_0_output_payload_pc;
  assign fetch_logic_ctrls_0_up_Fetch_PC_FAULT = PcPlugin_logic_harts_0_output_payload_fault;
  always @(*) begin
    fetch_logic_ctrls_0_up_Fetch_ID = 10'bxxxxxxxxxx;
    fetch_logic_ctrls_0_up_Fetch_ID = PcPlugin_logic_harts_0_self_id;
  end

  assign PcPlugin_logic_holdHalter_doIt = PcPlugin_logic_harts_0_holdComb;
  assign fetch_logic_ctrls_0_haltRequest_PcPlugin_l136 = PcPlugin_logic_holdHalter_doIt;
  assign CsrAccessPlugin_logic_fsm_wantExit = 1'b0;
  always @(*) begin
    CsrAccessPlugin_logic_fsm_wantStart = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        CsrAccessPlugin_logic_fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign CsrAccessPlugin_logic_fsm_wantKill = 1'b0;
  always @(*) begin
    CsrAccessPlugin_logic_fsm_regs_fire = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
        if(execute_ctrl1_down_isReady) begin
          CsrAccessPlugin_logic_fsm_regs_fire = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign CsrAccessPlugin_logic_fsm_inject_csrAddress = execute_ctrl1_down_Decode_UOP_lane0[31 : 20];
  assign CsrAccessPlugin_logic_fsm_inject_immZero = (execute_ctrl1_down_Decode_UOP_lane0[19 : 15] == 5'h0);
  assign CsrAccessPlugin_logic_fsm_inject_srcZero = (execute_ctrl1_down_CsrAccessPlugin_CSR_IMM_lane0 ? CsrAccessPlugin_logic_fsm_inject_immZero : (execute_ctrl1_down_Decode_UOP_lane0[19 : 15] == 5'h0));
  assign CsrAccessPlugin_logic_fsm_inject_csrWrite = (! (execute_ctrl1_down_CsrAccessPlugin_CSR_MASK_lane0 && CsrAccessPlugin_logic_fsm_inject_srcZero));
  assign CsrAccessPlugin_logic_fsm_inject_csrRead = (! ((! execute_ctrl1_down_CsrAccessPlugin_CSR_MASK_lane0) && (! execute_ctrl1_up_RD_ENABLE_lane0)));
  assign COMB_CSR_1952 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h7a0);
  assign COMB_CSR_1953 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h7a1);
  assign COMB_CSR_1954 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h7a2);
  assign COMB_CSR_3857 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'hf11);
  assign COMB_CSR_3858 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'hf12);
  assign COMB_CSR_3859 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'hf13);
  assign COMB_CSR_3860 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'hf14);
  assign COMB_CSR_769 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h301);
  assign COMB_CSR_768 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h300);
  assign COMB_CSR_834 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h342);
  assign COMB_CSR_836 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h344);
  assign COMB_CSR_772 = (CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h304);
  assign COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter = (|(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h305));
  assign COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter = (|(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h341));
  assign COMB_CSR_CsrRamPlugin_csrMapper_selFilter = (|{(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h340),{(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h341),{(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h343),(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h305)}}});
  assign COMB_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter = (|(CsrAccessPlugin_logic_fsm_inject_csrAddress == 12'h300));
  assign CsrAccessPlugin_logic_fsm_inject_implemented = (|{COMB_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter,{COMB_CSR_CsrRamPlugin_csrMapper_selFilter,{COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter,{COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter,{COMB_CSR_772,{COMB_CSR_836,{COMB_CSR_834,{COMB_CSR_768,{COMB_CSR_769,{COMB_CSR_3860,{_zz_CsrAccessPlugin_logic_fsm_inject_implemented,_zz_CsrAccessPlugin_logic_fsm_inject_implemented_1}}}}}}}}}}});
  assign CsrAccessPlugin_logic_fsm_inject_onDecodeDo = ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_CsrAccessPlugin_SEL_lane0) && (CsrAccessPlugin_logic_fsm_stateReg == CsrAccessPlugin_logic_fsm_IDLE));
  assign when_CsrAccessPlugin_l155 = (CsrAccessPlugin_logic_fsm_inject_onDecodeDo && COMB_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter);
  assign CsrAccessPlugin_logic_fsm_inject_trap = ((! CsrAccessPlugin_logic_fsm_inject_implemented) || CsrAccessPlugin_bus_decode_exception);
  assign CsrAccessPlugin_bus_decode_read = CsrAccessPlugin_logic_fsm_inject_csrRead;
  assign CsrAccessPlugin_bus_decode_write = CsrAccessPlugin_logic_fsm_inject_csrWrite;
  assign CsrAccessPlugin_bus_decode_address = CsrAccessPlugin_logic_fsm_inject_csrAddress;
  assign CsrAccessPlugin_logic_fsm_regs_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_rs1 = execute_ctrl1_up_integer_RS1_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_uop = execute_ctrl1_down_Decode_UOP_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_doImm = execute_ctrl1_down_CsrAccessPlugin_CSR_IMM_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_doMask = execute_ctrl1_down_CsrAccessPlugin_CSR_MASK_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_doClear = execute_ctrl1_down_CsrAccessPlugin_CSR_CLEAR_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_rdEnable = execute_ctrl1_up_RD_ENABLE_lane0;
  assign CsrAccessPlugin_logic_fsm_regs_rdPhys = execute_ctrl1_down_RD_PHYS_lane0;
  assign CsrAccessPlugin_logic_fsm_inject_iLogic_freeze = ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_CsrAccessPlugin_SEL_lane0) && (! CsrAccessPlugin_logic_fsm_inject_unfreeze));
  always @(*) begin
    CsrAccessPlugin_logic_flushPort_valid = 1'b0;
    if(CsrAccessPlugin_logic_fsm_inject_flushReg) begin
      CsrAccessPlugin_logic_flushPort_valid = 1'b1;
    end
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              CsrAccessPlugin_logic_flushPort_valid = 1'b1;
            end else begin
              if(CsrAccessPlugin_logic_fsm_inject_busTrapReg) begin
                CsrAccessPlugin_logic_flushPort_valid = 1'b1;
              end
            end
          end
        end
      end
    endcase
  end

  assign CsrAccessPlugin_logic_flushPort_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign CsrAccessPlugin_logic_flushPort_payload_self = 1'b0;
  always @(*) begin
    CsrAccessPlugin_logic_trapPort_valid = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              CsrAccessPlugin_logic_trapPort_valid = 1'b1;
            end else begin
              if(CsrAccessPlugin_logic_fsm_inject_busTrapReg) begin
                CsrAccessPlugin_logic_trapPort_valid = 1'b1;
              end
            end
          end
        end
      end
    endcase
  end

  always @(*) begin
    CsrAccessPlugin_logic_trapPort_payload_exception = 1'b1;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(!CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              if(CsrAccessPlugin_logic_fsm_inject_busTrapReg) begin
                CsrAccessPlugin_logic_trapPort_payload_exception = 1'b0;
              end
            end
          end
        end
      end
    endcase
  end

  always @(*) begin
    CsrAccessPlugin_logic_trapPort_payload_code = 4'b0010;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(!CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              if(CsrAccessPlugin_logic_fsm_inject_busTrapReg) begin
                CsrAccessPlugin_logic_trapPort_payload_code = CsrAccessPlugin_logic_fsm_inject_busTrapCodeReg;
              end
            end
          end
        end
      end
    endcase
  end

  assign CsrAccessPlugin_logic_trapPort_payload_tval = execute_ctrl1_down_Decode_UOP_lane0;
  assign CsrAccessPlugin_logic_trapPort_payload_arg = 2'b00;
  assign when_CsrAccessPlugin_l209 = (! execute_freeze_valid);
  always @(*) begin
    CsrAccessPlugin_logic_fsm_readLogic_onReadsDo = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
        CsrAccessPlugin_logic_fsm_readLogic_onReadsDo = CsrAccessPlugin_logic_fsm_regs_read;
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrAccessPlugin_logic_fsm_readLogic_onReadsFireDo = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
        if(when_CsrAccessPlugin_l308) begin
          CsrAccessPlugin_logic_fsm_readLogic_onReadsFireDo = CsrAccessPlugin_logic_fsm_regs_read;
        end
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
      end
    endcase
  end

  assign CsrAccessPlugin_bus_read_valid = CsrAccessPlugin_logic_fsm_readLogic_onReadsDo;
  assign CsrAccessPlugin_bus_read_address = CsrAccessPlugin_logic_fsm_regs_uop[31 : 20];
  assign CsrAccessPlugin_bus_read_moving = (! CsrAccessPlugin_bus_read_halt);
  assign when_CsrAccessPlugin_l264 = (CsrAccessPlugin_logic_fsm_readLogic_onReadsDo && REG_CSR_CsrRamPlugin_csrMapper_selFilter);
  assign CsrAccessPlugin_logic_fsm_readLogic_csrValue = (((((64'h0 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_5) | (64'h0 | 64'h0)) | ((((_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue && REG_CSR_769) ? _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_7 : 64'h0) | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_8) | (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_10 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_12))) | (((_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_14 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_15) | (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_17 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_18)) | ((_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_20 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_22) | (_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_24 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_26)))) | ((_zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_28 | _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue_30) | (CsrRamPlugin_csrMapper_withRead ? CsrRamPlugin_csrMapper_read_data : 64'h0)));
  assign CsrAccessPlugin_bus_read_data = CsrAccessPlugin_logic_fsm_readLogic_csrValue;
  assign CsrAccessPlugin_bus_read_toWriteBits = CsrAccessPlugin_logic_fsm_readLogic_csrValue;
  assign _zz_CsrAccessPlugin_logic_fsm_readLogic_csrValue = 1'b1;
  assign CsrAccessPlugin_bus_write_moving = (! CsrAccessPlugin_bus_write_halt);
  assign CsrAccessPlugin_logic_fsm_writeLogic_alu_mask = (CsrAccessPlugin_logic_fsm_regs_doImm ? _zz_CsrAccessPlugin_logic_fsm_writeLogic_alu_mask : CsrAccessPlugin_logic_fsm_regs_rs1);
  assign CsrAccessPlugin_logic_fsm_writeLogic_alu_masked = (CsrAccessPlugin_logic_fsm_regs_doClear ? (CsrAccessPlugin_logic_fsm_regs_aluInput & (~ CsrAccessPlugin_logic_fsm_writeLogic_alu_mask)) : (CsrAccessPlugin_logic_fsm_regs_aluInput | CsrAccessPlugin_logic_fsm_writeLogic_alu_mask));
  assign CsrAccessPlugin_logic_fsm_writeLogic_alu_result = (CsrAccessPlugin_logic_fsm_regs_doMask ? CsrAccessPlugin_logic_fsm_writeLogic_alu_masked : CsrAccessPlugin_logic_fsm_writeLogic_alu_mask);
  always @(*) begin
    CsrAccessPlugin_bus_write_bits = CsrAccessPlugin_logic_fsm_writeLogic_alu_result;
    if(when_CsrAccessPlugin_l356) begin
      CsrAccessPlugin_bus_write_bits[1 : 0] = 2'b00;
    end
    if(when_CsrAccessPlugin_l356_1) begin
      CsrAccessPlugin_bus_write_bits[1 : 0] = 2'b00;
    end
  end

  assign CsrAccessPlugin_bus_write_address = CsrAccessPlugin_logic_fsm_regs_uop[31 : 20];
  always @(*) begin
    CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
        CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo = CsrAccessPlugin_logic_fsm_regs_write;
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
        if(when_CsrAccessPlugin_l338) begin
          CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo = CsrAccessPlugin_logic_fsm_regs_write;
        end
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
      end
    endcase
  end

  assign CsrAccessPlugin_bus_write_valid = CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo;
  assign when_CsrAccessPlugin_l359 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo && REG_CSR_768);
  assign when_CsrAccessPlugin_l359_1 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo && REG_CSR_834);
  assign when_CsrAccessPlugin_l359_2 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesFireDo && REG_CSR_772);
  assign when_CsrAccessPlugin_l356 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo && REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter);
  assign when_CsrAccessPlugin_l356_1 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo && REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter);
  assign when_CsrAccessPlugin_l356_2 = (CsrAccessPlugin_logic_fsm_writeLogic_onWritesDo && REG_CSR_CsrRamPlugin_csrMapper_selFilter);
  always @(*) begin
    CsrAccessPlugin_logic_fsm_completion_valid = 1'b0;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
        if(execute_ctrl1_down_isReady) begin
          CsrAccessPlugin_logic_fsm_completion_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign CsrAccessPlugin_logic_fsm_completion_payload_uopId = CsrAccessPlugin_logic_fsm_regs_uopId;
  assign CsrAccessPlugin_logic_fsm_completion_payload_trap = execute_ctrl1_down_TRAP_lane0;
  assign CsrAccessPlugin_logic_fsm_completion_payload_commit = execute_ctrl1_down_COMMIT_lane0;
  assign CsrAccessPlugin_logic_wbWi_valid = execute_ctrl2_down_CsrAccessPlugin_SEL_lane0;
  assign CsrAccessPlugin_logic_wbWi_payload = CsrAccessPlugin_logic_fsm_regs_csrValue;
  assign fetch_logic_ctrls_1_down_MMU_REFILL = 1'b0;
  assign fetch_logic_ctrls_1_down_MMU_HAZARD = 1'b0;
  assign fetch_logic_ctrls_1_down_MMU_TRANSLATED = fetch_logic_ctrls_1_down_Fetch_WORD_PC;
  assign fetch_logic_ctrls_1_down_MMU_ALLOW_EXECUTE = 1'b1;
  assign fetch_logic_ctrls_1_down_MMU_ALLOW_READ = 1'b1;
  assign fetch_logic_ctrls_1_down_MMU_ALLOW_WRITE = 1'b1;
  assign fetch_logic_ctrls_1_down_MMU_PAGE_FAULT = 1'b0;
  assign fetch_logic_ctrls_1_down_MMU_ACCESS_FAULT = 1'b0;
  assign fetch_logic_ctrls_1_down_MMU_BYPASS_TRANSLATION = 1'b1;
  assign execute_ctrl1_down_MMU_REFILL_lane0 = 1'b0;
  assign execute_ctrl1_down_MMU_HAZARD_lane0 = 1'b0;
  assign execute_ctrl1_down_MMU_TRANSLATED_lane0 = execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[31:0];
  assign execute_ctrl1_down_MMU_ALLOW_EXECUTE_lane0 = 1'b1;
  assign execute_ctrl1_down_MMU_ALLOW_READ_lane0 = 1'b1;
  assign execute_ctrl1_down_MMU_ALLOW_WRITE_lane0 = 1'b1;
  assign execute_ctrl1_down_MMU_PAGE_FAULT_lane0 = 1'b0;
  assign execute_ctrl1_down_MMU_ACCESS_FAULT_lane0 = (execute_ctrl1_down_LsuCachelessPlugin_logic_onAddress_RAW_ADDRESS_lane0[63 : 32] != 32'h0);
  assign execute_ctrl1_down_MMU_BYPASS_TRANSLATION_lane0 = 1'b1;
  assign fetch_logic_flushes_0_doIt = (|{(DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),{(LsuCachelessPlugin_logic_flushPort_valid && _zz_fetch_logic_flushes_0_doIt),(BtbPlugin_logic_flushPort_valid && _zz_fetch_logic_flushes_0_doIt_1)}}}}}});
  assign fetch_logic_ctrls_1_throwWhen_FetchPipelinePlugin_l44 = fetch_logic_flushes_0_doIt;
  assign fetch_logic_flushes_1_doIt = (|{(DecoderPlugin_logic_laneLogic_0_flushPort_valid && 1'b1),{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),{(LsuCachelessPlugin_logic_flushPort_valid && _zz_fetch_logic_flushes_1_doIt),(_zz_fetch_logic_flushes_1_doIt_1 && _zz_fetch_logic_flushes_1_doIt_2)}}}}}});
  assign fetch_logic_ctrls_2_forgetsSingleRequest_FetchPipelinePlugin_l46 = fetch_logic_flushes_1_doIt;
  assign CsrRamPlugin_logic_writeLogic_hits = {CsrRamPlugin_setup_initPort_valid,{CsrRamPlugin_csrMapper_write_valid,TrapPlugin_logic_harts_0_crsPorts_write_valid}};
  assign CsrRamPlugin_logic_writeLogic_hit = (|CsrRamPlugin_logic_writeLogic_hits);
  assign CsrRamPlugin_logic_writeLogic_hits_ohFirst_input = CsrRamPlugin_logic_writeLogic_hits;
  assign CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked = (CsrRamPlugin_logic_writeLogic_hits_ohFirst_input & (~ _zz_CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked));
  assign CsrRamPlugin_logic_writeLogic_oh = CsrRamPlugin_logic_writeLogic_hits_ohFirst_masked;
  assign _zz_TrapPlugin_logic_harts_0_crsPorts_write_ready = CsrRamPlugin_logic_writeLogic_oh[0];
  assign _zz_CsrRamPlugin_csrMapper_write_ready = CsrRamPlugin_logic_writeLogic_oh[1];
  assign _zz_CsrRamPlugin_setup_initPort_ready = CsrRamPlugin_logic_writeLogic_oh[2];
  assign CsrRamPlugin_logic_writeLogic_port_valid = CsrRamPlugin_logic_writeLogic_hit;
  assign CsrRamPlugin_logic_writeLogic_port_payload_address = (((_zz_TrapPlugin_logic_harts_0_crsPorts_write_ready ? TrapPlugin_logic_harts_0_crsPorts_write_address : 2'b00) | (_zz_CsrRamPlugin_csrMapper_write_ready ? CsrRamPlugin_csrMapper_write_address : 2'b00)) | (_zz_CsrRamPlugin_setup_initPort_ready ? CsrRamPlugin_setup_initPort_address : 2'b00));
  assign CsrRamPlugin_logic_writeLogic_port_payload_data = (((_zz_TrapPlugin_logic_harts_0_crsPorts_write_ready ? TrapPlugin_logic_harts_0_crsPorts_write_data : 64'h0) | (_zz_CsrRamPlugin_csrMapper_write_ready ? CsrRamPlugin_csrMapper_write_data : 64'h0)) | (_zz_CsrRamPlugin_setup_initPort_ready ? CsrRamPlugin_setup_initPort_data : 64'h0));
  assign TrapPlugin_logic_harts_0_crsPorts_write_ready = _zz_TrapPlugin_logic_harts_0_crsPorts_write_ready;
  assign CsrRamPlugin_csrMapper_write_ready = _zz_CsrRamPlugin_csrMapper_write_ready;
  assign CsrRamPlugin_setup_initPort_ready = _zz_CsrRamPlugin_setup_initPort_ready;
  assign CsrRamPlugin_logic_readLogic_hits = {CsrRamPlugin_csrMapper_read_valid,TrapPlugin_logic_harts_0_crsPorts_read_valid};
  assign CsrRamPlugin_logic_readLogic_hit = (|CsrRamPlugin_logic_readLogic_hits);
  assign CsrRamPlugin_logic_readLogic_hits_ohFirst_input = CsrRamPlugin_logic_readLogic_hits;
  assign CsrRamPlugin_logic_readLogic_hits_ohFirst_masked = (CsrRamPlugin_logic_readLogic_hits_ohFirst_input & (~ _zz_CsrRamPlugin_logic_readLogic_hits_ohFirst_masked));
  assign CsrRamPlugin_logic_readLogic_oh = CsrRamPlugin_logic_readLogic_hits_ohFirst_masked;
  assign _zz_CsrRamPlugin_logic_readLogic_sel = CsrRamPlugin_logic_readLogic_oh[1];
  assign CsrRamPlugin_logic_readLogic_sel = _zz_CsrRamPlugin_logic_readLogic_sel;
  assign CsrRamPlugin_logic_readLogic_port_rsp = CsrRamPlugin_logic_mem_spinal_port1;
  assign CsrRamPlugin_logic_readLogic_port_cmd_valid = (((|CsrRamPlugin_logic_readLogic_oh) && (! CsrRamPlugin_logic_writeLogic_port_valid)) && (! CsrRamPlugin_logic_readLogic_busy));
  assign CsrRamPlugin_logic_readLogic_port_cmd_payload = _zz_CsrRamPlugin_logic_readLogic_port_cmd_payload;
  assign TrapPlugin_logic_harts_0_crsPorts_read_ready = CsrRamPlugin_logic_readLogic_ohReg[0];
  assign CsrRamPlugin_csrMapper_read_ready = CsrRamPlugin_logic_readLogic_ohReg[1];
  assign TrapPlugin_logic_harts_0_crsPorts_read_data = CsrRamPlugin_logic_readLogic_port_rsp;
  assign CsrRamPlugin_csrMapper_read_data = CsrRamPlugin_logic_readLogic_port_rsp;
  assign CsrRamPlugin_logic_flush_done = CsrRamPlugin_logic_flush_counter[2];
  assign CsrRamPlugin_setup_initPort_valid = (! CsrRamPlugin_logic_flush_done);
  assign CsrRamPlugin_setup_initPort_address = CsrRamPlugin_logic_flush_counter[1:0];
  assign CsrRamPlugin_setup_initPort_data = 64'h0;
  assign execute_lane0_bypasser_integer_RS1_port_valid = (! execute_freeze_valid);
  assign execute_lane0_bypasser_integer_RS1_port_address = execute_ctrl0_down_RS1_PHYS_lane0;
  always @(*) begin
    execute_lane0_bypasser_integer_RS1_bypassEnables[0] = (((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_up_RD_ENABLE_lane0) && (execute_ctrl1_down_RD_PHYS_lane0 == execute_ctrl0_down_RS1_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS1_bypassEnables[1] = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl0_down_RS1_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS1_bypassEnables[2] = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl0_down_RS1_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS1_bypassEnables[3] = 1'b1;
  end

  assign _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0 = execute_lane0_bypasser_integer_RS1_bypassEnables;
  assign execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0 = _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0[0];
  assign execute_lane0_bypasser_integer_RS1_bypassEnables_bools_1 = _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0[1];
  assign execute_lane0_bypasser_integer_RS1_bypassEnables_bools_2 = _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0[2];
  assign execute_lane0_bypasser_integer_RS1_bypassEnables_bools_3 = _zz_execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0[3];
  always @(*) begin
    _zz_execute_lane0_bypasser_integer_RS1_sel[0] = (execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0 && (! 1'b0));
    _zz_execute_lane0_bypasser_integer_RS1_sel[1] = (execute_lane0_bypasser_integer_RS1_bypassEnables_bools_1 && (! execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0));
    _zz_execute_lane0_bypasser_integer_RS1_sel[2] = (execute_lane0_bypasser_integer_RS1_bypassEnables_bools_2 && (! execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_1));
    _zz_execute_lane0_bypasser_integer_RS1_sel[3] = (execute_lane0_bypasser_integer_RS1_bypassEnables_bools_3 && (! execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_2));
  end

  assign execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_1 = (|{execute_lane0_bypasser_integer_RS1_bypassEnables_bools_1,execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0});
  assign execute_lane0_bypasser_integer_RS1_bypassEnables_range_0_to_2 = (|{execute_lane0_bypasser_integer_RS1_bypassEnables_bools_2,{execute_lane0_bypasser_integer_RS1_bypassEnables_bools_1,execute_lane0_bypasser_integer_RS1_bypassEnables_bools_0}});
  assign execute_lane0_bypasser_integer_RS1_sel = _zz_execute_lane0_bypasser_integer_RS1_sel;
  assign _zz_execute_ctrl0_down_integer_RS1_lane0 = execute_lane0_bypasser_integer_RS1_sel[3 : 1];
  always @(*) begin
    _zz_execute_ctrl0_down_integer_RS1_lane0_1 = (((_zz_execute_ctrl0_down_integer_RS1_lane0[0] ? execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0) | (_zz_execute_ctrl0_down_integer_RS1_lane0[1] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0)) | (_zz_execute_ctrl0_down_integer_RS1_lane0[2] ? execute_lane0_bypasser_integer_RS1_port_data : 64'h0));
    if(when_ExecuteLanePlugin_l190) begin
      _zz_execute_ctrl0_down_integer_RS1_lane0_1 = execute_ctrl1_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
    end
  end

  assign execute_ctrl0_down_integer_RS1_lane0 = _zz_execute_ctrl0_down_integer_RS1_lane0_1;
  assign when_ExecuteLanePlugin_l190 = execute_lane0_bypasser_integer_RS1_sel[0];
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_selfHit = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl1_down_RS1_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_hit = (execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_selfHit && (! 1'b0));
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_selfHit = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl1_down_RS1_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_youngerHits_0 = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl1_down_RS1_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_hit = (execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_selfHit && (! (|execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_youngerHits_0)));
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_0_hits = {execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_1_hit,execute_lane0_bypasser_integer_RS1_along_bypasses_0_checks_0_hit};
  assign _zz_execute_ctrl1_integer_RS1_lane0_bypass = {execute_lane0_bypasser_integer_RS1_along_bypasses_0_hits,(! (|execute_lane0_bypasser_integer_RS1_along_bypasses_0_hits))};
  assign execute_ctrl1_integer_RS1_lane0_bypass = (((_zz_execute_ctrl1_integer_RS1_lane0_bypass[0] ? execute_ctrl1_up_integer_RS1_lane0 : 64'h0) | (_zz_execute_ctrl1_integer_RS1_lane0_bypass[1] ? execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0)) | (_zz_execute_ctrl1_integer_RS1_lane0_bypass[2] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0));
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_selfHit = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl2_down_RS1_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_hit = (execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_selfHit && (! 1'b0));
  assign execute_lane0_bypasser_integer_RS1_along_bypasses_1_hits = execute_lane0_bypasser_integer_RS1_along_bypasses_1_checks_0_hit;
  assign _zz_execute_ctrl2_integer_RS1_lane0_bypass = {execute_lane0_bypasser_integer_RS1_along_bypasses_1_hits,(! (|execute_lane0_bypasser_integer_RS1_along_bypasses_1_hits))};
  assign execute_ctrl2_integer_RS1_lane0_bypass = ((_zz_execute_ctrl2_integer_RS1_lane0_bypass[0] ? execute_ctrl2_up_integer_RS1_lane0 : 64'h0) | (_zz_execute_ctrl2_integer_RS1_lane0_bypass[1] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0));
  assign execute_lane0_bypasser_integer_RS2_port_valid = (! execute_freeze_valid);
  assign execute_lane0_bypasser_integer_RS2_port_address = execute_ctrl0_down_RS2_PHYS_lane0;
  always @(*) begin
    execute_lane0_bypasser_integer_RS2_bypassEnables[0] = (((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_up_RD_ENABLE_lane0) && (execute_ctrl1_down_RD_PHYS_lane0 == execute_ctrl0_down_RS2_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS2_bypassEnables[1] = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl0_down_RS2_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS2_bypassEnables[2] = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl0_down_RS2_PHYS_lane0)) && 1'b1);
    execute_lane0_bypasser_integer_RS2_bypassEnables[3] = 1'b1;
  end

  assign _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0 = execute_lane0_bypasser_integer_RS2_bypassEnables;
  assign execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0 = _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0[0];
  assign execute_lane0_bypasser_integer_RS2_bypassEnables_bools_1 = _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0[1];
  assign execute_lane0_bypasser_integer_RS2_bypassEnables_bools_2 = _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0[2];
  assign execute_lane0_bypasser_integer_RS2_bypassEnables_bools_3 = _zz_execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0[3];
  always @(*) begin
    _zz_execute_lane0_bypasser_integer_RS2_sel[0] = (execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0 && (! 1'b0));
    _zz_execute_lane0_bypasser_integer_RS2_sel[1] = (execute_lane0_bypasser_integer_RS2_bypassEnables_bools_1 && (! execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0));
    _zz_execute_lane0_bypasser_integer_RS2_sel[2] = (execute_lane0_bypasser_integer_RS2_bypassEnables_bools_2 && (! execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_1));
    _zz_execute_lane0_bypasser_integer_RS2_sel[3] = (execute_lane0_bypasser_integer_RS2_bypassEnables_bools_3 && (! execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_2));
  end

  assign execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_1 = (|{execute_lane0_bypasser_integer_RS2_bypassEnables_bools_1,execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0});
  assign execute_lane0_bypasser_integer_RS2_bypassEnables_range_0_to_2 = (|{execute_lane0_bypasser_integer_RS2_bypassEnables_bools_2,{execute_lane0_bypasser_integer_RS2_bypassEnables_bools_1,execute_lane0_bypasser_integer_RS2_bypassEnables_bools_0}});
  assign execute_lane0_bypasser_integer_RS2_sel = _zz_execute_lane0_bypasser_integer_RS2_sel;
  assign _zz_execute_ctrl0_down_integer_RS2_lane0 = execute_lane0_bypasser_integer_RS2_sel[3 : 1];
  always @(*) begin
    _zz_execute_ctrl0_down_integer_RS2_lane0_1 = (((_zz_execute_ctrl0_down_integer_RS2_lane0[0] ? execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0) | (_zz_execute_ctrl0_down_integer_RS2_lane0[1] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0)) | (_zz_execute_ctrl0_down_integer_RS2_lane0[2] ? execute_lane0_bypasser_integer_RS2_port_data : 64'h0));
    if(when_ExecuteLanePlugin_l190_1) begin
      _zz_execute_ctrl0_down_integer_RS2_lane0_1 = execute_ctrl1_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
    end
  end

  assign execute_ctrl0_down_integer_RS2_lane0 = _zz_execute_ctrl0_down_integer_RS2_lane0_1;
  assign when_ExecuteLanePlugin_l190_1 = execute_lane0_bypasser_integer_RS2_sel[0];
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_selfHit = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl1_down_RS2_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_hit = (execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_selfHit && (! 1'b0));
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_selfHit = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl1_down_RS2_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_youngerHits_0 = (((execute_ctrl2_up_LANE_SEL_lane0 && execute_ctrl2_up_RD_ENABLE_lane0) && (execute_ctrl2_down_RD_PHYS_lane0 == execute_ctrl1_down_RS2_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_hit = (execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_selfHit && (! (|execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_youngerHits_0)));
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_0_hits = {execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_1_hit,execute_lane0_bypasser_integer_RS2_along_bypasses_0_checks_0_hit};
  assign _zz_execute_ctrl1_integer_RS2_lane0_bypass = {execute_lane0_bypasser_integer_RS2_along_bypasses_0_hits,(! (|execute_lane0_bypasser_integer_RS2_along_bypasses_0_hits))};
  assign execute_ctrl1_integer_RS2_lane0_bypass = (((_zz_execute_ctrl1_integer_RS2_lane0_bypass[0] ? execute_ctrl1_up_integer_RS2_lane0 : 64'h0) | (_zz_execute_ctrl1_integer_RS2_lane0_bypass[1] ? execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0)) | (_zz_execute_ctrl1_integer_RS2_lane0_bypass[2] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0));
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_selfHit = (((execute_ctrl3_up_LANE_SEL_lane0 && execute_ctrl3_up_RD_ENABLE_lane0) && (execute_ctrl3_down_RD_PHYS_lane0 == execute_ctrl2_down_RS2_PHYS_lane0)) && 1'b1);
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_hit = (execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_selfHit && (! 1'b0));
  assign execute_lane0_bypasser_integer_RS2_along_bypasses_1_hits = execute_lane0_bypasser_integer_RS2_along_bypasses_1_checks_0_hit;
  assign _zz_execute_ctrl2_integer_RS2_lane0_bypass = {execute_lane0_bypasser_integer_RS2_along_bypasses_1_hits,(! (|execute_lane0_bypasser_integer_RS2_along_bypasses_1_hits))};
  assign execute_ctrl2_integer_RS2_lane0_bypass = ((_zz_execute_ctrl2_integer_RS2_lane0_bypass[0] ? execute_ctrl2_up_integer_RS2_lane0 : 64'h0) | (_zz_execute_ctrl2_integer_RS2_lane0_bypass[1] ? execute_ctrl3_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0 : 64'h0));
  assign execute_lane0_logic_completions_onCtrl_0_port_valid = (((execute_ctrl1_down_LANE_SEL_lane0 && execute_ctrl1_down_isReady) && (! execute_lane0_ctrls_1_downIsCancel)) && execute_ctrl1_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0);
  assign execute_lane0_logic_completions_onCtrl_0_port_payload_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign execute_lane0_logic_completions_onCtrl_0_port_payload_trap = execute_ctrl1_down_TRAP_lane0;
  assign execute_lane0_logic_completions_onCtrl_0_port_payload_commit = execute_ctrl1_down_COMMIT_lane0;
  assign execute_lane0_logic_completions_onCtrl_1_port_valid = (((execute_ctrl2_down_LANE_SEL_lane0 && execute_ctrl2_down_isReady) && (! execute_lane0_ctrls_2_downIsCancel)) && execute_ctrl2_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0);
  assign execute_lane0_logic_completions_onCtrl_1_port_payload_uopId = execute_ctrl2_down_Decode_UOP_ID_lane0;
  assign execute_lane0_logic_completions_onCtrl_1_port_payload_trap = execute_ctrl2_down_TRAP_lane0;
  assign execute_lane0_logic_completions_onCtrl_1_port_payload_commit = execute_ctrl2_down_COMMIT_lane0;
  assign execute_lane0_logic_completions_onCtrl_2_port_valid = (((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && execute_ctrl3_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0);
  assign execute_lane0_logic_completions_onCtrl_2_port_payload_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign execute_lane0_logic_completions_onCtrl_2_port_payload_trap = execute_ctrl3_down_TRAP_lane0;
  assign execute_lane0_logic_completions_onCtrl_2_port_payload_commit = execute_ctrl3_down_COMMIT_lane0;
  assign execute_lane0_logic_decoding_decodingBits = {execute_ctrl0_down_lane0_LAYER_SEL_lane0,execute_ctrl0_down_Decode_UOP_lane0};
  assign _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h100001050) == 33'h100000010);
  assign _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_1 = ((execute_lane0_logic_decoding_decodingBits & 33'h100002050) == 33'h100002010);
  always @(*) begin
    execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h100000050) == 33'h100000040);
  always @(*) begin
    execute_ctrl0_down_early0_BranchPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_BranchPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_early0_BranchPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_early0_EnvPlugin_SEL_lane0 = _zz_execute_ctrl0_down_early0_EnvPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_early0_EnvPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h100000010) == 33'h0);
  always @(*) begin
    execute_ctrl0_down_late0_BranchPlugin_SEL_lane0 = _zz_execute_ctrl0_down_late0_BranchPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_late0_BranchPlugin_SEL_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000002050) == 33'h000002050);
  always @(*) begin
    execute_ctrl0_down_CsrAccessPlugin_SEL_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_CsrAccessPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_AguPlugin_SEL_lane0 = _zz_execute_ctrl0_down_AguPlugin_SEL_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_AguPlugin_SEL_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0 = _zz_execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h00000000c) == 33'h000000004);
  always @(*) begin
    execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0 = _zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0_1[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_1 = ((execute_lane0_logic_decoding_decodingBits & 33'h100003040) == 33'h100000040);
  assign _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_2 = ((execute_lane0_logic_decoding_decodingBits & 33'h100000004) == 33'h100000004);
  always @(*) begin
    execute_ctrl0_down_COMPLETION_AT_1_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_1_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_COMPLETION_AT_1_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_1 = ((execute_lane0_logic_decoding_decodingBits & 33'h100003014) == 33'h100001010);
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_2 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000070) == 33'h000000020);
  always @(*) begin
    execute_ctrl0_down_COMPLETION_AT_2_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_2_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_COMPLETION_AT_2_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000038) == 33'h0);
  assign _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_1 = ((execute_lane0_logic_decoding_decodingBits & 33'h100000000) == 33'h0);
  always @(*) begin
    execute_ctrl0_down_COMPLETION_AT_3_lane0 = _zz_execute_ctrl0_down_COMPLETION_AT_3_lane0[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_COMPLETION_AT_3_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0_2[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_3[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0 = 1'b0;
    end
  end

  always @(*) begin
    execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = _zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0_2[0];
    if(execute_ctrl0_down_TRAP_lane0) begin
      execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = 1'b0;
    end
  end

  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000006000) == 33'h0);
  assign _zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000004) == 33'h000000004);
  assign execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000006004) == 33'h000002000);
  assign execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000003000) == 33'h000002000);
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000004000) == 33'h0);
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000001000) == 33'h000001000);
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1 = {(|{_zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0,{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,_zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0}}),(|{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,{_zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0,_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0}})};
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1;
  assign _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  assign execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = _zz_execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2;
  assign execute_ctrl0_down_SrcStageables_REVERT_lane0 = _zz_execute_ctrl0_down_SrcStageables_REVERT_lane0[0];
  assign execute_ctrl0_down_SrcStageables_ZERO_lane0 = _zz_execute_ctrl0_down_SrcStageables_ZERO_lane0[0];
  assign execute_ctrl0_down_early0_SrcPlugin_logic_SRC1_CTRL_lane0 = (|((execute_lane0_logic_decoding_decodingBits & 33'h000000044) == 33'h000000004));
  assign _zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0_1 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000024) == 33'h0);
  assign execute_ctrl0_down_early0_SrcPlugin_logic_SRC2_CTRL_lane0 = {(|{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,_zz_execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0_2}),(|{((execute_lane0_logic_decoding_decodingBits & 33'h000000050) == 33'h0),_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0_1})};
  assign _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000008) == 33'h000000008);
  assign execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 = _zz_execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0[0];
  assign _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000002000) == 33'h000002000);
  assign execute_ctrl0_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 = {(|{((execute_lane0_logic_decoding_decodingBits & 33'h000000010) == 33'h000000010),_zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0}),(|{((execute_lane0_logic_decoding_decodingBits & 33'h000000018) == 33'h000000010),((execute_lane0_logic_decoding_decodingBits & 33'h000001008) == 33'h000001000)})};
  assign execute_ctrl0_down_BYPASSED_AT_1_lane0 = _zz_execute_ctrl0_down_BYPASSED_AT_1_lane0_3[0];
  assign execute_ctrl0_down_BYPASSED_AT_2_lane0 = _zz_execute_ctrl0_down_BYPASSED_AT_2_lane0[0];
  assign execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0 = _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0[0];
  assign execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0 = _zz_execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0_1[0];
  assign execute_ctrl0_down_SrcStageables_UNSIGNED_lane0 = _zz_execute_ctrl0_down_SrcStageables_UNSIGNED_lane0[0];
  assign execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0_1[0];
  assign execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0[0];
  assign execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0_1[0];
  assign execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0 = _zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0[0];
  assign _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1 = {(|_zz_execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0),(|_zz_execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0)};
  assign _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0 = _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_1;
  assign _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2 = _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0;
  assign execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0 = _zz_execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0_2;
  assign execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0[0];
  assign execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0_1[0];
  assign execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0 = _zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0_1[0];
  assign execute_ctrl0_down_AguPlugin_LOAD_lane0 = _zz_execute_ctrl0_down_AguPlugin_LOAD_lane0[0];
  assign execute_ctrl0_down_AguPlugin_STORE_lane0 = _zz_execute_ctrl0_down_AguPlugin_STORE_lane0[0];
  assign execute_ctrl0_down_AguPlugin_ATOMIC_lane0 = _zz_execute_ctrl0_down_AguPlugin_ATOMIC_lane0[0];
  assign execute_ctrl0_down_AguPlugin_FLOAT_lane0 = _zz_execute_ctrl0_down_AguPlugin_FLOAT_lane0[0];
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0 = ((execute_lane0_logic_decoding_decodingBits & 33'h000000040) == 33'h0);
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2 = {(|((execute_lane0_logic_decoding_decodingBits & 33'h030001000) == 33'h010000000)),{(|{((execute_lane0_logic_decoding_decodingBits & 33'h020000000) == 33'h020000000),_zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0}),(|{((execute_lane0_logic_decoding_decodingBits & 33'h000100000) == 33'h000100000),_zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0})}};
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1 = _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_2;
  assign _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3 = _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_1;
  assign execute_ctrl0_down_early0_EnvPlugin_OP_lane0 = _zz_execute_ctrl0_down_early0_EnvPlugin_OP_lane0_3;
  assign execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0_1[0];
  assign execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0_1[0];
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2 = {(|{_zz_execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0,{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,_zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0}}),(|{_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0,{_zz_execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0,_zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0}})};
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_2;
  assign _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_1;
  assign execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = _zz_execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0_3;
  assign execute_ctrl0_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0 = (|_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0);
  assign execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0 = {(|_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0),(|_zz_execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0_1)};
  assign when_ExecuteLanePlugin_l300 = (|{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{(early0_EnvPlugin_logic_flushPort_valid && 1'b1),{(CsrAccessPlugin_logic_flushPort_valid && 1'b1),{(early0_BranchPlugin_logic_flushPort_valid && 1'b1),(LsuCachelessPlugin_logic_flushPort_valid && 1'b1)}}}});
  assign execute_lane0_ctrls_0_downIsCancel = 1'b0;
  assign execute_lane0_ctrls_0_upIsCancel = when_ExecuteLanePlugin_l300;
  assign when_ExecuteLanePlugin_l300_1 = (|{(late0_BranchPlugin_logic_flushPort_valid && 1'b1),{((early0_EnvPlugin_logic_flushPort_valid && 1'b1) && (1'b0 || (_zz_when_ExecuteLanePlugin_l300_1 && early0_EnvPlugin_logic_flushPort_payload_self))),{((CsrAccessPlugin_logic_flushPort_valid && _zz_when_ExecuteLanePlugin_l300_1_1) && (_zz_when_ExecuteLanePlugin_l300_1_2 || _zz_when_ExecuteLanePlugin_l300_1_3)),{(_zz_when_ExecuteLanePlugin_l300_1_4 && _zz_when_ExecuteLanePlugin_l300_1_5),(_zz_when_ExecuteLanePlugin_l300_1_6 && _zz_when_ExecuteLanePlugin_l300_1_7)}}}});
  assign execute_lane0_ctrls_1_downIsCancel = 1'b0;
  assign execute_lane0_ctrls_1_upIsCancel = when_ExecuteLanePlugin_l300_1;
  assign when_ExecuteLanePlugin_l300_2 = (|(late0_BranchPlugin_logic_flushPort_valid && 1'b1));
  assign execute_lane0_ctrls_2_downIsCancel = 1'b0;
  assign execute_lane0_ctrls_2_upIsCancel = when_ExecuteLanePlugin_l300_2;
  assign when_ExecuteLanePlugin_l300_3 = (|((late0_BranchPlugin_logic_flushPort_valid && 1'b1) && (1'b0 || (1'b1 && late0_BranchPlugin_logic_flushPort_payload_self))));
  assign execute_lane0_ctrls_3_downIsCancel = 1'b0;
  assign execute_lane0_ctrls_3_upIsCancel = when_ExecuteLanePlugin_l300_3;
  assign execute_lane0_ctrls_4_downIsCancel = 1'b0;
  assign execute_lane0_ctrls_4_upIsCancel = 1'b0;
  assign execute_lane0_logic_trapPending[0] = (|{((execute_ctrl3_up_LANE_SEL_lane0 && 1'b1) && execute_ctrl3_down_TRAP_lane0),{((execute_ctrl2_up_LANE_SEL_lane0 && 1'b1) && execute_ctrl2_down_TRAP_lane0),((execute_ctrl1_up_LANE_SEL_lane0 && 1'b1) && execute_ctrl1_down_TRAP_lane0)}});
  assign execute_ctrl1_up_COMMIT_lane0 = (! execute_ctrl1_up_TRAP_lane0);
  assign WhiteboxerPlugin_logic_csr_access_valid = CsrAccessPlugin_logic_fsm_regs_fire;
  assign WhiteboxerPlugin_logic_csr_access_payload_uopId = CsrAccessPlugin_logic_fsm_regs_uopId;
  assign WhiteboxerPlugin_logic_csr_access_payload_address = _zz_WhiteboxerPlugin_logic_csr_access_payload_address[31 : 20];
  assign WhiteboxerPlugin_logic_csr_access_payload_write = CsrAccessPlugin_logic_fsm_regs_onWriteBits;
  assign WhiteboxerPlugin_logic_csr_access_payload_read = CsrAccessPlugin_logic_fsm_regs_csrValue;
  assign WhiteboxerPlugin_logic_csr_access_payload_writeDone = CsrAccessPlugin_logic_fsm_regs_write;
  assign WhiteboxerPlugin_logic_csr_access_payload_readDone = CsrAccessPlugin_logic_fsm_regs_read;
  assign WhiteboxerPlugin_logic_csr_port_valid = WhiteboxerPlugin_logic_csr_access_valid;
  assign WhiteboxerPlugin_logic_csr_port_payload_uopId = WhiteboxerPlugin_logic_csr_access_payload_uopId;
  assign WhiteboxerPlugin_logic_csr_port_payload_address = WhiteboxerPlugin_logic_csr_access_payload_address;
  assign WhiteboxerPlugin_logic_csr_port_payload_write = WhiteboxerPlugin_logic_csr_access_payload_write;
  assign WhiteboxerPlugin_logic_csr_port_payload_read = WhiteboxerPlugin_logic_csr_access_payload_read;
  assign WhiteboxerPlugin_logic_csr_port_payload_writeDone = WhiteboxerPlugin_logic_csr_access_payload_writeDone;
  assign WhiteboxerPlugin_logic_csr_port_payload_readDone = WhiteboxerPlugin_logic_csr_access_payload_readDone;
  assign WhiteboxerPlugin_logic_rfWrites_ports_0_valid = lane0_integer_WriteBackPlugin_logic_stages_0_write_valid;
  assign WhiteboxerPlugin_logic_rfWrites_ports_0_payload_uopId = lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_uopId;
  assign WhiteboxerPlugin_logic_rfWrites_ports_0_payload_data = lane0_integer_WriteBackPlugin_logic_stages_0_write_payload_data;
  assign WhiteboxerPlugin_logic_rfWrites_ports_1_valid = lane0_integer_WriteBackPlugin_logic_stages_1_write_valid;
  assign WhiteboxerPlugin_logic_rfWrites_ports_1_payload_uopId = lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_uopId;
  assign WhiteboxerPlugin_logic_rfWrites_ports_1_payload_data = lane0_integer_WriteBackPlugin_logic_stages_1_write_payload_data;
  assign WhiteboxerPlugin_logic_rfWrites_ports_2_valid = lane0_integer_WriteBackPlugin_logic_stages_2_write_valid;
  assign WhiteboxerPlugin_logic_rfWrites_ports_2_payload_uopId = lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_uopId;
  assign WhiteboxerPlugin_logic_rfWrites_ports_2_payload_data = lane0_integer_WriteBackPlugin_logic_stages_2_write_payload_data;
  assign WhiteboxerPlugin_logic_completions_ports_0_valid = DecoderPlugin_logic_laneLogic_0_completionPort_valid;
  assign WhiteboxerPlugin_logic_completions_ports_0_payload_uopId = DecoderPlugin_logic_laneLogic_0_completionPort_payload_uopId;
  assign WhiteboxerPlugin_logic_completions_ports_0_payload_trap = DecoderPlugin_logic_laneLogic_0_completionPort_payload_trap;
  assign WhiteboxerPlugin_logic_completions_ports_0_payload_commit = DecoderPlugin_logic_laneLogic_0_completionPort_payload_commit;
  assign WhiteboxerPlugin_logic_completions_ports_1_valid = execute_lane0_logic_completions_onCtrl_0_port_valid;
  assign WhiteboxerPlugin_logic_completions_ports_1_payload_uopId = execute_lane0_logic_completions_onCtrl_0_port_payload_uopId;
  assign WhiteboxerPlugin_logic_completions_ports_1_payload_trap = execute_lane0_logic_completions_onCtrl_0_port_payload_trap;
  assign WhiteboxerPlugin_logic_completions_ports_1_payload_commit = execute_lane0_logic_completions_onCtrl_0_port_payload_commit;
  assign WhiteboxerPlugin_logic_completions_ports_2_valid = execute_lane0_logic_completions_onCtrl_1_port_valid;
  assign WhiteboxerPlugin_logic_completions_ports_2_payload_uopId = execute_lane0_logic_completions_onCtrl_1_port_payload_uopId;
  assign WhiteboxerPlugin_logic_completions_ports_2_payload_trap = execute_lane0_logic_completions_onCtrl_1_port_payload_trap;
  assign WhiteboxerPlugin_logic_completions_ports_2_payload_commit = execute_lane0_logic_completions_onCtrl_1_port_payload_commit;
  assign WhiteboxerPlugin_logic_completions_ports_3_valid = execute_lane0_logic_completions_onCtrl_2_port_valid;
  assign WhiteboxerPlugin_logic_completions_ports_3_payload_uopId = execute_lane0_logic_completions_onCtrl_2_port_payload_uopId;
  assign WhiteboxerPlugin_logic_completions_ports_3_payload_trap = execute_lane0_logic_completions_onCtrl_2_port_payload_trap;
  assign WhiteboxerPlugin_logic_completions_ports_3_payload_commit = execute_lane0_logic_completions_onCtrl_2_port_payload_commit;
  assign WhiteboxerPlugin_logic_commits_ports_0_oh_0 = ((((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && execute_ctrl3_down_COMMIT_lane0) && 1'b1);
  assign WhiteboxerPlugin_logic_commits_ports_0_valid = (|WhiteboxerPlugin_logic_commits_ports_0_oh_0);
  assign WhiteboxerPlugin_logic_commits_ports_0_pc = (WhiteboxerPlugin_logic_commits_ports_0_oh_0 ? execute_ctrl3_down_PC_lane0 : 32'h0);
  assign WhiteboxerPlugin_logic_commits_ports_0_uop = (WhiteboxerPlugin_logic_commits_ports_0_oh_0 ? execute_ctrl3_down_Decode_UOP_lane0 : 32'h0);
  assign WhiteboxerPlugin_logic_reschedules_flushes_0_valid = BtbPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_0_payload_self = BtbPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_1_valid = LsuCachelessPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_1_payload_uopId = LsuCachelessPlugin_logic_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_1_payload_self = LsuCachelessPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_2_valid = early0_BranchPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_2_payload_uopId = early0_BranchPlugin_logic_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_2_payload_self = early0_BranchPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_3_valid = CsrAccessPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_3_payload_uopId = CsrAccessPlugin_logic_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_3_payload_self = CsrAccessPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_4_valid = early0_EnvPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_4_payload_uopId = early0_EnvPlugin_logic_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_4_payload_self = early0_EnvPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_5_valid = late0_BranchPlugin_logic_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_5_payload_uopId = late0_BranchPlugin_logic_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_5_payload_self = late0_BranchPlugin_logic_flushPort_payload_self;
  assign WhiteboxerPlugin_logic_reschedules_flushes_6_valid = DecoderPlugin_logic_laneLogic_0_flushPort_valid;
  assign WhiteboxerPlugin_logic_reschedules_flushes_6_payload_uopId = DecoderPlugin_logic_laneLogic_0_flushPort_payload_uopId;
  assign WhiteboxerPlugin_logic_reschedules_flushes_6_payload_self = DecoderPlugin_logic_laneLogic_0_flushPort_payload_self;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_valid = late0_BranchPlugin_logic_jumpLogic_learn_valid;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcOnLastSlice = late0_BranchPlugin_logic_jumpLogic_learn_payload_pcOnLastSlice;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcTarget = late0_BranchPlugin_logic_jumpLogic_learn_payload_pcTarget;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_taken = late0_BranchPlugin_logic_jumpLogic_learn_payload_taken;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isBranch = late0_BranchPlugin_logic_jumpLogic_learn_payload_isBranch;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPush = late0_BranchPlugin_logic_jumpLogic_learn_payload_isPush;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPop = late0_BranchPlugin_logic_jumpLogic_learn_payload_isPop;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_wasWrong = late0_BranchPlugin_logic_jumpLogic_learn_payload_wasWrong;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_badPredictedTarget = late0_BranchPlugin_logic_jumpLogic_learn_payload_badPredictedTarget;
  assign late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_uopId = late0_BranchPlugin_logic_jumpLogic_learn_payload_uopId;
  assign WhiteboxerPlugin_logic_prediction_learns_0_valid = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_valid;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_pcOnLastSlice = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcOnLastSlice;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_pcTarget = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_pcTarget;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_taken = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_taken;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_isBranch = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isBranch;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_isPush = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPush;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_isPop = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_isPop;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_wasWrong = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_wasWrong;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_badPredictedTarget = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_badPredictedTarget;
  assign WhiteboxerPlugin_logic_prediction_learns_0_payload_uopId = late0_BranchPlugin_logic_jumpLogic_learn_asFlow_payload_uopId;
  assign WhiteboxerPlugin_logic_loadExecute_fire = ((((((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && execute_ctrl3_down_AguPlugin_SEL_lane0) && execute_ctrl3_down_AguPlugin_LOAD_lane0) && (! execute_ctrl3_down_TRAP_lane0)) && (! execute_ctrl3_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io));
  assign WhiteboxerPlugin_logic_loadExecute_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign WhiteboxerPlugin_logic_loadExecute_size = execute_ctrl3_down_AguPlugin_SIZE_lane0;
  assign WhiteboxerPlugin_logic_loadExecute_address = execute_ctrl3_down_MMU_TRANSLATED_lane0;
  assign WhiteboxerPlugin_logic_loadExecute_data = lane0_IntFormatPlugin_logic_stages_2_wb_payload;
  assign WhiteboxerPlugin_logic_storeCommit_fire = ((LsuCachelessPlugin_logic_bus_cmd_fire && LsuCachelessPlugin_logic_bus_cmd_payload_write) && (! LsuCachelessPlugin_logic_bus_cmd_payload_io));
  assign WhiteboxerPlugin_logic_storeCommit_uopId = execute_ctrl1_down_Decode_UOP_ID_lane0;
  assign WhiteboxerPlugin_logic_storeCommit_size = LsuCachelessPlugin_logic_bus_cmd_payload_size;
  assign WhiteboxerPlugin_logic_storeCommit_address = LsuCachelessPlugin_logic_bus_cmd_payload_address;
  assign WhiteboxerPlugin_logic_storeCommit_data = LsuCachelessPlugin_logic_bus_cmd_payload_data;
  assign WhiteboxerPlugin_logic_storeCommit_storeId = execute_ctrl1_down_Decode_UOP_ID_lane0[11:0];
  assign WhiteboxerPlugin_logic_storeCommit_amo = 1'b0;
  assign WhiteboxerPlugin_logic_storeConditional_fire = (((((execute_ctrl3_down_LANE_SEL_lane0 && execute_ctrl3_down_isReady) && (! execute_lane0_ctrls_3_downIsCancel)) && execute_ctrl3_down_AguPlugin_SEL_lane0) && (execute_ctrl3_down_AguPlugin_ATOMIC_lane0 && (! execute_ctrl3_down_AguPlugin_LOAD_lane0))) && (! execute_ctrl3_down_TRAP_lane0));
  assign WhiteboxerPlugin_logic_storeConditional_uopId = execute_ctrl3_down_Decode_UOP_ID_lane0;
  assign WhiteboxerPlugin_logic_storeConditional_miss = execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
  assign WhiteboxerPlugin_logic_storeBroadcast_fire = WhiteboxerPlugin_logic_storeCommit_fire;
  assign WhiteboxerPlugin_logic_storeBroadcast_storeId = WhiteboxerPlugin_logic_storeCommit_storeId;
  assign integer_RegFilePlugin_logic_writeMerges_0_bus_valid = (|lane0_integer_WriteBackPlugin_logic_write_port_valid);
  assign integer_RegFilePlugin_logic_writeMerges_0_bus_address = lane0_integer_WriteBackPlugin_logic_write_port_address;
  assign integer_RegFilePlugin_logic_writeMerges_0_bus_data = lane0_integer_WriteBackPlugin_logic_write_port_data;
  assign integer_RegFilePlugin_logic_writeMerges_0_bus_uopId = lane0_integer_WriteBackPlugin_logic_write_port_uopId;
  assign execute_lane0_bypasser_integer_RS1_port_data = integer_RegFilePlugin_logic_regfile_fpga_io_reads_0_data;
  assign execute_lane0_bypasser_integer_RS2_port_data = integer_RegFilePlugin_logic_regfile_fpga_io_reads_1_data;
  always @(*) begin
    integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_valid = integer_RegFilePlugin_logic_writeMerges_0_bus_valid;
    if(when_RegFilePlugin_l127) begin
      integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_valid = 1'b1;
    end
  end

  always @(*) begin
    integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_address = integer_RegFilePlugin_logic_writeMerges_0_bus_address;
    if(when_RegFilePlugin_l127) begin
      integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_address = integer_RegFilePlugin_logic_initalizer_counter[4:0];
    end
  end

  always @(*) begin
    integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_data = integer_RegFilePlugin_logic_writeMerges_0_bus_data;
    if(when_RegFilePlugin_l127) begin
      integer_RegFilePlugin_logic_regfile_fpga_io_writes_0_data = 64'h0;
    end
  end

  assign integer_RegFilePlugin_logic_initalizer_done = integer_RegFilePlugin_logic_initalizer_counter[5];
  assign when_RegFilePlugin_l127 = (! integer_RegFilePlugin_logic_initalizer_done);
  assign integer_write_0_valid = integer_RegFilePlugin_logic_writeMerges_0_bus_valid;
  assign integer_write_0_address = integer_RegFilePlugin_logic_writeMerges_0_bus_address;
  assign integer_write_0_data = integer_RegFilePlugin_logic_writeMerges_0_bus_data;
  assign integer_write_0_uopId = integer_RegFilePlugin_logic_writeMerges_0_bus_uopId;
  assign execute_freeze_valid = (|{CsrAccessPlugin_logic_fsm_inject_iLogic_freeze,{(execute_ctrl2_down_LsuCachelessPlugin_WITH_RSP_lane0 && (! LsuCachelessPlugin_logic_onJoin_rspValid)),{LsuCachelessPlugin_logic_onFork_freezeIt,{late0_IterativeShifterPlugin_logic_shift_freezeIt,early0_IterativeShifterPlugin_logic_shift_freezeIt}}}});
  assign execute_ctrl4_down_ready = (! execute_freeze_valid);
  assign TrapPlugin_logic_initHold = (|{(! CsrRamPlugin_logic_flush_done),{(! integer_RegFilePlugin_logic_initalizer_done),{(FetchL1Plugin_logic_invalidate_firstEver || 1'b0),1'b0}}});
  assign WhiteboxerPlugin_logic_wfi = TrapPlugin_logic_harts_0_trap_fsm_wfi;
  assign WhiteboxerPlugin_logic_perf_executeFreezed = execute_freeze_valid;
  assign WhiteboxerPlugin_logic_perf_dispatchHazards = (|(DispatchPlugin_logic_candidates_0_ctx_valid && (! DispatchPlugin_logic_candidates_0_fire)));
  assign WhiteboxerPlugin_logic_perf_candidatesCount = _zz_WhiteboxerPlugin_logic_perf_candidatesCount;
  assign WhiteboxerPlugin_logic_perf_dispatchFeedCount = _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCount;
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter = 1'b0;
    if(WhiteboxerPlugin_logic_perf_executeFreezed) begin
      _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1 = (_zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_2 + _zz__zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_executeFreezedCounter = _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_2;
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter = 1'b0;
    if(WhiteboxerPlugin_logic_perf_dispatchHazards) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1 = (_zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_2 + _zz__zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_dispatchHazardsCounter = _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_2;
  assign when_Utils_l586 = (WhiteboxerPlugin_logic_perf_candidatesCount == 1'b0);
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0 = 1'b0;
    if(when_Utils_l586) begin
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0 = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1 = (_zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_2 + _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_candidatesCountCounters_0 = _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_2;
  assign when_Utils_l586_1 = (WhiteboxerPlugin_logic_perf_candidatesCount == 1'b1);
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1 = 1'b0;
    if(when_Utils_l586_1) begin
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1 = (_zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_2 + _zz__zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_candidatesCountCounters_1 = _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_2;
  assign when_Utils_l586_2 = (WhiteboxerPlugin_logic_perf_dispatchFeedCount == 1'b0);
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0 = 1'b0;
    if(when_Utils_l586_2) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0 = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1 = (_zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_2 + _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0 = _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_2;
  assign when_Utils_l586_3 = (WhiteboxerPlugin_logic_perf_dispatchFeedCount == 1'b1);
  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1 = 1'b0;
    if(when_Utils_l586_3) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1 = (_zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_2 + _zz__zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1);
    if(1'b0) begin
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1 = 60'h0;
    end
  end

  assign WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1 = _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_2;
  assign WhiteboxerPlugin_logic_trap_ports_0_valid = TrapPlugin_logic_harts_0_trap_whitebox_trap;
  assign WhiteboxerPlugin_logic_trap_ports_0_interrupt = TrapPlugin_logic_harts_0_trap_whitebox_interrupt;
  assign WhiteboxerPlugin_logic_trap_ports_0_cause = TrapPlugin_logic_harts_0_trap_whitebox_code;
  assign fetch_logic_ctrls_2_up_forgetOne = (|fetch_logic_ctrls_2_forgetsSingleRequest_FetchPipelinePlugin_l46);
  assign fetch_logic_ctrls_2_up_cancel = (|fetch_logic_flushes_1_doIt);
  assign fetch_logic_ctrls_1_up_forgetOne = (|fetch_logic_ctrls_1_throwWhen_FetchPipelinePlugin_l44);
  assign fetch_logic_ctrls_1_up_cancel = (|fetch_logic_ctrls_1_throwWhen_FetchPipelinePlugin_l44);
  assign fetch_logic_ctrls_0_down_ready = fetch_logic_ctrls_1_up_ready;
  assign fetch_logic_ctrls_1_down_ready = fetch_logic_ctrls_2_up_ready;
  always @(*) begin
    fetch_logic_ctrls_0_down_valid = fetch_logic_ctrls_0_up_valid;
    if(when_CtrlLink_l150) begin
      fetch_logic_ctrls_0_down_valid = 1'b0;
    end
  end

  always @(*) begin
    fetch_logic_ctrls_0_up_ready = fetch_logic_ctrls_0_down_isReady;
    if(when_CtrlLink_l150) begin
      fetch_logic_ctrls_0_up_ready = 1'b0;
    end
  end

  assign when_CtrlLink_l150 = (|{fetch_logic_ctrls_0_haltRequest_PcPlugin_l136,{fetch_logic_ctrls_0_haltRequest_BtbPlugin_l171,{fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l319,fetch_logic_ctrls_0_haltRequest_FetchL1Plugin_l235}}});
  assign fetch_logic_ctrls_0_down_Fetch_WORD_PC = fetch_logic_ctrls_0_up_Fetch_WORD_PC;
  assign fetch_logic_ctrls_0_down_Fetch_PC_FAULT = fetch_logic_ctrls_0_up_Fetch_PC_FAULT;
  assign fetch_logic_ctrls_0_down_Fetch_ID = fetch_logic_ctrls_0_up_Fetch_ID;
  always @(*) begin
    fetch_logic_ctrls_1_down_valid = fetch_logic_ctrls_1_up_valid;
    if(when_CtrlLink_l157) begin
      fetch_logic_ctrls_1_down_valid = 1'b0;
    end
  end

  assign fetch_logic_ctrls_1_up_ready = fetch_logic_ctrls_1_down_isReady;
  assign when_CtrlLink_l157 = (|fetch_logic_ctrls_1_throwWhen_FetchPipelinePlugin_l44);
  assign fetch_logic_ctrls_1_down_Fetch_WORD_PC = fetch_logic_ctrls_1_up_Fetch_WORD_PC;
  assign fetch_logic_ctrls_1_down_Fetch_PC_FAULT = fetch_logic_ctrls_1_up_Fetch_PC_FAULT;
  assign fetch_logic_ctrls_1_down_Fetch_ID = fetch_logic_ctrls_1_up_Fetch_ID;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID = fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0 = fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1 = fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE = fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE;
  assign fetch_logic_ctrls_1_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS = fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS;
  assign fetch_logic_ctrls_1_down_BtbPlugin_logic_readCmd_HAZARDS = fetch_logic_ctrls_1_up_BtbPlugin_logic_readCmd_HAZARDS;
  assign fetch_logic_ctrls_2_down_valid = fetch_logic_ctrls_2_up_valid;
  assign fetch_logic_ctrls_2_up_ready = fetch_logic_ctrls_2_down_isReady;
  assign fetch_logic_ctrls_2_down_Fetch_WORD_PC = fetch_logic_ctrls_2_up_Fetch_WORD_PC;
  assign fetch_logic_ctrls_2_down_Fetch_PC_FAULT = fetch_logic_ctrls_2_up_Fetch_PC_FAULT;
  assign fetch_logic_ctrls_2_down_Fetch_ID = fetch_logic_ctrls_2_up_Fetch_ID;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_loaded;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_error = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_error;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_0_address = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_address;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_loaded;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_error = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_error;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_1_address = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_address;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_loaded;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_error = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_error;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_2_address = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_address;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_loaded;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_error = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_error;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_TAGS_3_address = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_address;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_0 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_0;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_PLRU_BYPASSED_1 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_1;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_0 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_0;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_1 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_1;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_2 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_2;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_BANKS_MUXES_3 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_3;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_HAZARD = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_HAZARD;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_0 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_0;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_1 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_1;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_2 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_2;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HITS_3 = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_3;
  assign fetch_logic_ctrls_2_down_MMU_TRANSLATED = fetch_logic_ctrls_2_up_MMU_TRANSLATED;
  assign fetch_logic_ctrls_2_down_FetchL1Plugin_logic_WAYS_HIT = fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HIT;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken;
  assign fetch_logic_ctrls_2_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT = fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT;
  assign fetch_logic_ctrls_2_down_MMU_REFILL = fetch_logic_ctrls_2_up_MMU_REFILL;
  assign fetch_logic_ctrls_2_down_MMU_HAZARD = fetch_logic_ctrls_2_up_MMU_HAZARD;
  assign fetch_logic_ctrls_2_down_MMU_ALLOW_EXECUTE = fetch_logic_ctrls_2_up_MMU_ALLOW_EXECUTE;
  assign fetch_logic_ctrls_2_down_MMU_PAGE_FAULT = fetch_logic_ctrls_2_up_MMU_PAGE_FAULT;
  assign fetch_logic_ctrls_2_down_MMU_ACCESS_FAULT = fetch_logic_ctrls_2_up_MMU_ACCESS_FAULT;
  assign fetch_logic_ctrls_2_down_MMU_BYPASS_TRANSLATION = fetch_logic_ctrls_2_up_MMU_BYPASS_TRANSLATION;
  always @(*) begin
    decode_ctrls_0_down_ready = decode_ctrls_1_up_ready;
    if(when_StageLink_l67) begin
      decode_ctrls_0_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67 = (! decode_ctrls_1_up_isValid);
  assign when_DecodePipelinePlugin_l68 = ((! decode_ctrls_1_up_isReady) && decode_ctrls_1_lane0_upIsCancel);
  always @(*) begin
    decode_ctrls_1_down_ready = decode_ctrls_2_up_ready;
    if(when_StageLink_l67_1) begin
      decode_ctrls_1_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67_1 = (! decode_ctrls_2_up_isValid);
  assign when_DecodePipelinePlugin_l68_1 = ((! decode_ctrls_2_up_isReady) && decode_ctrls_2_lane0_upIsCancel);
  assign decode_ctrls_0_down_valid = decode_ctrls_0_up_valid;
  assign decode_ctrls_0_up_ready = decode_ctrls_0_down_isReady;
  assign decode_ctrls_0_down_Decode_INSTRUCTION_0 = decode_ctrls_0_up_Decode_INSTRUCTION_0;
  assign decode_ctrls_0_down_Decode_DECOMPRESSION_FAULT_0 = decode_ctrls_0_up_Decode_DECOMPRESSION_FAULT_0;
  assign decode_ctrls_0_down_Decode_INSTRUCTION_RAW_0 = decode_ctrls_0_up_Decode_INSTRUCTION_RAW_0;
  assign decode_ctrls_0_down_PC_0 = decode_ctrls_0_up_PC_0;
  assign decode_ctrls_0_down_Decode_DOP_ID_0 = decode_ctrls_0_up_Decode_DOP_ID_0;
  assign decode_ctrls_0_down_Fetch_ID_0 = decode_ctrls_0_up_Fetch_ID_0;
  assign decode_ctrls_0_down_TRAP_0 = decode_ctrls_0_up_TRAP_0;
  assign decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_0 = decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_0;
  assign decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_PC_0 = decode_ctrls_0_up_Prediction_ALIGNED_JUMPED_PC_0;
  assign decode_ctrls_0_down_Prediction_ALIGNED_SLICES_BRANCH_0 = decode_ctrls_0_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  assign decode_ctrls_0_down_Prediction_ALIGNED_SLICES_TAKEN_0 = decode_ctrls_0_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  assign decode_ctrls_0_down_Prediction_ALIGN_REDO_0 = decode_ctrls_0_up_Prediction_ALIGN_REDO_0;
  assign decode_ctrls_1_down_valid = decode_ctrls_1_up_valid;
  assign decode_ctrls_1_up_ready = decode_ctrls_1_down_isReady;
  assign decode_ctrls_1_down_Decode_INSTRUCTION_0 = decode_ctrls_1_up_Decode_INSTRUCTION_0;
  assign decode_ctrls_1_down_Decode_DECOMPRESSION_FAULT_0 = decode_ctrls_1_up_Decode_DECOMPRESSION_FAULT_0;
  assign decode_ctrls_1_down_Decode_INSTRUCTION_RAW_0 = decode_ctrls_1_up_Decode_INSTRUCTION_RAW_0;
  assign decode_ctrls_1_down_PC_0 = decode_ctrls_1_up_PC_0;
  assign decode_ctrls_1_down_Decode_DOP_ID_0 = decode_ctrls_1_up_Decode_DOP_ID_0;
  assign decode_ctrls_1_down_TRAP_0 = decode_ctrls_1_up_TRAP_0;
  assign decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_0 = decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_0;
  assign decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_PC_0 = decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_PC_0;
  assign decode_ctrls_1_down_Prediction_ALIGNED_SLICES_BRANCH_0 = decode_ctrls_1_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  assign decode_ctrls_1_down_Prediction_ALIGNED_SLICES_TAKEN_0 = decode_ctrls_1_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  assign decode_ctrls_1_down_Prediction_ALIGN_REDO_0 = decode_ctrls_1_up_Prediction_ALIGN_REDO_0;
  assign decode_ctrls_2_down_valid = decode_ctrls_2_up_valid;
  assign decode_ctrls_2_up_ready = decode_ctrls_2_down_isReady;
  assign decode_ctrls_2_down_Decode_INSTRUCTION_0 = decode_ctrls_2_up_Decode_INSTRUCTION_0;
  assign decode_ctrls_2_down_Decode_DECOMPRESSION_FAULT_0 = decode_ctrls_2_up_Decode_DECOMPRESSION_FAULT_0;
  assign decode_ctrls_2_down_Decode_INSTRUCTION_RAW_0 = decode_ctrls_2_up_Decode_INSTRUCTION_RAW_0;
  assign decode_ctrls_2_down_PC_0 = decode_ctrls_2_up_PC_0;
  assign decode_ctrls_2_down_Decode_DOP_ID_0 = decode_ctrls_2_up_Decode_DOP_ID_0;
  assign decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_0 = decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_0;
  assign decode_ctrls_2_down_Prediction_ALIGNED_JUMPED_PC_0 = decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_PC_0;
  assign decode_ctrls_2_down_Prediction_ALIGNED_SLICES_BRANCH_0 = decode_ctrls_2_up_Prediction_ALIGNED_SLICES_BRANCH_0;
  assign decode_ctrls_2_down_Prediction_ALIGNED_SLICES_TAKEN_0 = decode_ctrls_2_up_Prediction_ALIGNED_SLICES_TAKEN_0;
  assign decode_ctrls_2_down_Prediction_ALIGN_REDO_0 = decode_ctrls_2_up_Prediction_ALIGN_REDO_0;
  assign execute_ctrl0_down_ready = execute_ctrl1_up_ready;
  assign execute_ctrl1_down_ready = execute_ctrl2_up_ready;
  assign execute_ctrl2_down_ready = execute_ctrl3_up_ready;
  assign execute_ctrl3_down_ready = execute_ctrl4_up_ready;
  assign execute_ctrl0_up_ready = execute_ctrl0_down_isReady;
  assign execute_ctrl0_down_Decode_UOP_lane0 = execute_ctrl0_up_Decode_UOP_lane0;
  assign execute_ctrl0_down_Prediction_ALIGNED_JUMPED_lane0 = execute_ctrl0_up_Prediction_ALIGNED_JUMPED_lane0;
  assign execute_ctrl0_down_Prediction_ALIGNED_JUMPED_PC_lane0 = execute_ctrl0_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  assign execute_ctrl0_down_PC_lane0 = execute_ctrl0_up_PC_lane0;
  assign execute_ctrl0_down_TRAP_lane0 = execute_ctrl0_up_TRAP_lane0;
  assign execute_ctrl0_down_Decode_UOP_ID_lane0 = execute_ctrl0_up_Decode_UOP_ID_lane0;
  assign execute_ctrl0_down_RS1_PHYS_lane0 = execute_ctrl0_up_RS1_PHYS_lane0;
  assign execute_ctrl0_down_RS2_PHYS_lane0 = execute_ctrl0_up_RS2_PHYS_lane0;
  assign execute_ctrl0_down_RD_PHYS_lane0 = execute_ctrl0_up_RD_PHYS_lane0;
  assign execute_ctrl0_down_COMPLETED_lane0 = execute_ctrl0_up_COMPLETED_lane0;
  assign execute_ctrl0_down_lane0_LAYER_SEL_lane0 = execute_ctrl0_up_lane0_LAYER_SEL_lane0;
  assign execute_ctrl1_up_ready = execute_ctrl1_down_isReady;
  assign execute_ctrl1_down_Decode_UOP_lane0 = execute_ctrl1_up_Decode_UOP_lane0;
  assign execute_ctrl1_down_Prediction_ALIGNED_JUMPED_lane0 = execute_ctrl1_up_Prediction_ALIGNED_JUMPED_lane0;
  assign execute_ctrl1_down_Prediction_ALIGNED_JUMPED_PC_lane0 = execute_ctrl1_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  assign execute_ctrl1_down_PC_lane0 = execute_ctrl1_up_PC_lane0;
  assign execute_ctrl1_down_Decode_UOP_ID_lane0 = execute_ctrl1_up_Decode_UOP_ID_lane0;
  assign execute_ctrl1_down_RS1_PHYS_lane0 = execute_ctrl1_up_RS1_PHYS_lane0;
  assign execute_ctrl1_down_RS2_PHYS_lane0 = execute_ctrl1_up_RS2_PHYS_lane0;
  assign execute_ctrl1_down_RD_PHYS_lane0 = execute_ctrl1_up_RD_PHYS_lane0;
  assign execute_ctrl1_down_AguPlugin_SIZE_lane0 = execute_ctrl1_up_AguPlugin_SIZE_lane0;
  assign execute_ctrl1_down_early0_SrcPlugin_SRC1_lane0 = execute_ctrl1_up_early0_SrcPlugin_SRC1_lane0;
  assign execute_ctrl1_down_early0_SrcPlugin_SRC2_lane0 = execute_ctrl1_up_early0_SrcPlugin_SRC2_lane0;
  assign execute_ctrl1_down_early0_IntAluPlugin_SEL_lane0 = execute_ctrl1_up_early0_IntAluPlugin_SEL_lane0;
  assign execute_ctrl1_down_early0_IterativeShifterPlugin_SEL_lane0 = execute_ctrl1_up_early0_IterativeShifterPlugin_SEL_lane0;
  assign execute_ctrl1_down_early0_BranchPlugin_SEL_lane0 = execute_ctrl1_up_early0_BranchPlugin_SEL_lane0;
  assign execute_ctrl1_down_early0_EnvPlugin_SEL_lane0 = execute_ctrl1_up_early0_EnvPlugin_SEL_lane0;
  assign execute_ctrl1_down_late0_IntAluPlugin_SEL_lane0 = execute_ctrl1_up_late0_IntAluPlugin_SEL_lane0;
  assign execute_ctrl1_down_late0_IterativeShifterPlugin_SEL_lane0 = execute_ctrl1_up_late0_IterativeShifterPlugin_SEL_lane0;
  assign execute_ctrl1_down_late0_BranchPlugin_SEL_lane0 = execute_ctrl1_up_late0_BranchPlugin_SEL_lane0;
  assign execute_ctrl1_down_CsrAccessPlugin_SEL_lane0 = execute_ctrl1_up_CsrAccessPlugin_SEL_lane0;
  assign execute_ctrl1_down_AguPlugin_SEL_lane0 = execute_ctrl1_up_AguPlugin_SEL_lane0;
  assign execute_ctrl1_down_LsuCachelessPlugin_FENCE_lane0 = execute_ctrl1_up_LsuCachelessPlugin_FENCE_lane0;
  assign execute_ctrl1_down_lane0_integer_WriteBackPlugin_SEL_lane0 = execute_ctrl1_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  assign execute_ctrl1_down_COMPLETION_AT_1_lane0 = execute_ctrl1_up_COMPLETION_AT_1_lane0;
  assign execute_ctrl1_down_COMPLETION_AT_2_lane0 = execute_ctrl1_up_COMPLETION_AT_2_lane0;
  assign execute_ctrl1_down_COMPLETION_AT_3_lane0 = execute_ctrl1_up_COMPLETION_AT_3_lane0;
  assign execute_ctrl1_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0 = execute_ctrl1_up_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
  assign execute_ctrl1_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0 = execute_ctrl1_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  assign execute_ctrl1_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = execute_ctrl1_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  assign execute_ctrl1_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0 = execute_ctrl1_up_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
  assign execute_ctrl1_down_early0_IntAluPlugin_ALU_SLTX_lane0 = execute_ctrl1_up_early0_IntAluPlugin_ALU_SLTX_lane0;
  assign execute_ctrl1_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  assign execute_ctrl1_down_SrcStageables_REVERT_lane0 = execute_ctrl1_up_SrcStageables_REVERT_lane0;
  assign execute_ctrl1_down_SrcStageables_ZERO_lane0 = execute_ctrl1_up_SrcStageables_ZERO_lane0;
  assign execute_ctrl1_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 = execute_ctrl1_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  assign execute_ctrl1_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 = execute_ctrl1_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  assign execute_ctrl1_down_BYPASSED_AT_1_lane0 = execute_ctrl1_up_BYPASSED_AT_1_lane0;
  assign execute_ctrl1_down_BYPASSED_AT_2_lane0 = execute_ctrl1_up_BYPASSED_AT_2_lane0;
  assign execute_ctrl1_down_MAY_FLUSH_PRECISE_2_lane0 = execute_ctrl1_up_MAY_FLUSH_PRECISE_2_lane0;
  assign execute_ctrl1_down_MAY_FLUSH_PRECISE_3_lane0 = execute_ctrl1_up_MAY_FLUSH_PRECISE_3_lane0;
  assign execute_ctrl1_down_SrcStageables_UNSIGNED_lane0 = execute_ctrl1_up_SrcStageables_UNSIGNED_lane0;
  assign execute_ctrl1_down_IterativeShifterPlugin_LEFT_lane0 = execute_ctrl1_up_IterativeShifterPlugin_LEFT_lane0;
  assign execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0 = execute_ctrl1_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  assign execute_ctrl1_down_IterativeShifterPlugin_IS_W_lane0 = execute_ctrl1_up_IterativeShifterPlugin_IS_W_lane0;
  assign execute_ctrl1_down_IterativeShifterPlugin_IS_W_RIGHT_lane0 = execute_ctrl1_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  assign execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0 = execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0;
  assign execute_ctrl1_down_CsrAccessPlugin_CSR_IMM_lane0 = execute_ctrl1_up_CsrAccessPlugin_CSR_IMM_lane0;
  assign execute_ctrl1_down_CsrAccessPlugin_CSR_MASK_lane0 = execute_ctrl1_up_CsrAccessPlugin_CSR_MASK_lane0;
  assign execute_ctrl1_down_CsrAccessPlugin_CSR_CLEAR_lane0 = execute_ctrl1_up_CsrAccessPlugin_CSR_CLEAR_lane0;
  assign execute_ctrl1_down_AguPlugin_LOAD_lane0 = execute_ctrl1_up_AguPlugin_LOAD_lane0;
  assign execute_ctrl1_down_AguPlugin_STORE_lane0 = execute_ctrl1_up_AguPlugin_STORE_lane0;
  assign execute_ctrl1_down_AguPlugin_ATOMIC_lane0 = execute_ctrl1_up_AguPlugin_ATOMIC_lane0;
  assign execute_ctrl1_down_AguPlugin_FLOAT_lane0 = execute_ctrl1_up_AguPlugin_FLOAT_lane0;
  assign execute_ctrl1_down_early0_EnvPlugin_OP_lane0 = execute_ctrl1_up_early0_EnvPlugin_OP_lane0;
  assign execute_ctrl1_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 = execute_ctrl1_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  assign execute_ctrl1_down_late0_IntAluPlugin_ALU_SLTX_lane0 = execute_ctrl1_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  assign execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  assign execute_ctrl1_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0 = execute_ctrl1_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  assign execute_ctrl1_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0 = execute_ctrl1_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  assign execute_ctrl2_up_ready = execute_ctrl2_down_isReady;
  assign execute_ctrl2_down_Decode_UOP_lane0 = execute_ctrl2_up_Decode_UOP_lane0;
  assign execute_ctrl2_down_Prediction_ALIGNED_JUMPED_lane0 = execute_ctrl2_up_Prediction_ALIGNED_JUMPED_lane0;
  assign execute_ctrl2_down_Prediction_ALIGNED_JUMPED_PC_lane0 = execute_ctrl2_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  assign execute_ctrl2_down_PC_lane0 = execute_ctrl2_up_PC_lane0;
  assign execute_ctrl2_down_TRAP_lane0 = execute_ctrl2_up_TRAP_lane0;
  assign execute_ctrl2_down_Decode_UOP_ID_lane0 = execute_ctrl2_up_Decode_UOP_ID_lane0;
  assign execute_ctrl2_down_RS1_PHYS_lane0 = execute_ctrl2_up_RS1_PHYS_lane0;
  assign execute_ctrl2_down_RS2_PHYS_lane0 = execute_ctrl2_up_RS2_PHYS_lane0;
  assign execute_ctrl2_down_RD_PHYS_lane0 = execute_ctrl2_up_RD_PHYS_lane0;
  assign execute_ctrl2_down_AguPlugin_SIZE_lane0 = execute_ctrl2_up_AguPlugin_SIZE_lane0;
  assign execute_ctrl2_down_early0_IterativeShifterPlugin_SEL_lane0 = execute_ctrl2_up_early0_IterativeShifterPlugin_SEL_lane0;
  assign execute_ctrl2_down_early0_BranchPlugin_SEL_lane0 = execute_ctrl2_up_early0_BranchPlugin_SEL_lane0;
  assign execute_ctrl2_down_late0_IntAluPlugin_SEL_lane0 = execute_ctrl2_up_late0_IntAluPlugin_SEL_lane0;
  assign execute_ctrl2_down_late0_IterativeShifterPlugin_SEL_lane0 = execute_ctrl2_up_late0_IterativeShifterPlugin_SEL_lane0;
  assign execute_ctrl2_down_late0_BranchPlugin_SEL_lane0 = execute_ctrl2_up_late0_BranchPlugin_SEL_lane0;
  assign execute_ctrl2_down_CsrAccessPlugin_SEL_lane0 = execute_ctrl2_up_CsrAccessPlugin_SEL_lane0;
  assign execute_ctrl2_down_AguPlugin_SEL_lane0 = execute_ctrl2_up_AguPlugin_SEL_lane0;
  assign execute_ctrl2_down_lane0_integer_WriteBackPlugin_SEL_lane0 = execute_ctrl2_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  assign execute_ctrl2_down_COMPLETION_AT_2_lane0 = execute_ctrl2_up_COMPLETION_AT_2_lane0;
  assign execute_ctrl2_down_COMPLETION_AT_3_lane0 = execute_ctrl2_up_COMPLETION_AT_3_lane0;
  assign execute_ctrl2_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0 = execute_ctrl2_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
  assign execute_ctrl2_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = execute_ctrl2_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  assign execute_ctrl2_down_SrcStageables_REVERT_lane0 = execute_ctrl2_up_SrcStageables_REVERT_lane0;
  assign execute_ctrl2_down_SrcStageables_ZERO_lane0 = execute_ctrl2_up_SrcStageables_ZERO_lane0;
  assign execute_ctrl2_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 = execute_ctrl2_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  assign execute_ctrl2_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 = execute_ctrl2_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  assign execute_ctrl2_down_BYPASSED_AT_2_lane0 = execute_ctrl2_up_BYPASSED_AT_2_lane0;
  assign execute_ctrl2_down_MAY_FLUSH_PRECISE_2_lane0 = execute_ctrl2_up_MAY_FLUSH_PRECISE_2_lane0;
  assign execute_ctrl2_down_SrcStageables_UNSIGNED_lane0 = execute_ctrl2_up_SrcStageables_UNSIGNED_lane0;
  assign execute_ctrl2_down_IterativeShifterPlugin_LEFT_lane0 = execute_ctrl2_up_IterativeShifterPlugin_LEFT_lane0;
  assign execute_ctrl2_down_IterativeShifterPlugin_ARITHMETIC_lane0 = execute_ctrl2_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  assign execute_ctrl2_down_IterativeShifterPlugin_IS_W_lane0 = execute_ctrl2_up_IterativeShifterPlugin_IS_W_lane0;
  assign execute_ctrl2_down_IterativeShifterPlugin_IS_W_RIGHT_lane0 = execute_ctrl2_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  assign execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0 = execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0;
  assign execute_ctrl2_down_AguPlugin_LOAD_lane0 = execute_ctrl2_up_AguPlugin_LOAD_lane0;
  assign execute_ctrl2_down_AguPlugin_STORE_lane0 = execute_ctrl2_up_AguPlugin_STORE_lane0;
  assign execute_ctrl2_down_AguPlugin_ATOMIC_lane0 = execute_ctrl2_up_AguPlugin_ATOMIC_lane0;
  assign execute_ctrl2_down_AguPlugin_FLOAT_lane0 = execute_ctrl2_up_AguPlugin_FLOAT_lane0;
  assign execute_ctrl2_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 = execute_ctrl2_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  assign execute_ctrl2_down_late0_IntAluPlugin_ALU_SLTX_lane0 = execute_ctrl2_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  assign execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  assign execute_ctrl2_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0 = execute_ctrl2_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
  assign execute_ctrl2_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0 = execute_ctrl2_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
  assign execute_ctrl2_down_COMMIT_lane0 = execute_ctrl2_up_COMMIT_lane0;
  assign execute_ctrl2_down_early0_SrcPlugin_ADD_SUB_lane0 = execute_ctrl2_up_early0_SrcPlugin_ADD_SUB_lane0;
  assign execute_ctrl2_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0 = execute_ctrl2_up_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
  assign execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 = execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  assign execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 = execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  assign execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 = execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  assign execute_ctrl2_down_MMU_TRANSLATED_lane0 = execute_ctrl2_up_MMU_TRANSLATED_lane0;
  assign execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault = execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  assign execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io = execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  assign execute_ctrl2_down_LsuCachelessPlugin_WITH_RSP_lane0 = execute_ctrl2_up_LsuCachelessPlugin_WITH_RSP_lane0;
  assign execute_ctrl3_up_ready = execute_ctrl3_down_isReady;
  assign execute_ctrl3_down_Decode_UOP_lane0 = execute_ctrl3_up_Decode_UOP_lane0;
  assign execute_ctrl3_down_Prediction_ALIGNED_JUMPED_lane0 = execute_ctrl3_up_Prediction_ALIGNED_JUMPED_lane0;
  assign execute_ctrl3_down_Prediction_ALIGNED_JUMPED_PC_lane0 = execute_ctrl3_up_Prediction_ALIGNED_JUMPED_PC_lane0;
  assign execute_ctrl3_down_PC_lane0 = execute_ctrl3_up_PC_lane0;
  assign execute_ctrl3_down_Decode_UOP_ID_lane0 = execute_ctrl3_up_Decode_UOP_ID_lane0;
  assign execute_ctrl3_down_RD_PHYS_lane0 = execute_ctrl3_up_RD_PHYS_lane0;
  assign execute_ctrl3_down_AguPlugin_SIZE_lane0 = execute_ctrl3_up_AguPlugin_SIZE_lane0;
  assign execute_ctrl3_down_early0_BranchPlugin_SEL_lane0 = execute_ctrl3_up_early0_BranchPlugin_SEL_lane0;
  assign execute_ctrl3_down_late0_IntAluPlugin_SEL_lane0 = execute_ctrl3_up_late0_IntAluPlugin_SEL_lane0;
  assign execute_ctrl3_down_late0_IterativeShifterPlugin_SEL_lane0 = execute_ctrl3_up_late0_IterativeShifterPlugin_SEL_lane0;
  assign execute_ctrl3_down_late0_BranchPlugin_SEL_lane0 = execute_ctrl3_up_late0_BranchPlugin_SEL_lane0;
  assign execute_ctrl3_down_AguPlugin_SEL_lane0 = execute_ctrl3_up_AguPlugin_SEL_lane0;
  assign execute_ctrl3_down_lane0_integer_WriteBackPlugin_SEL_lane0 = execute_ctrl3_up_lane0_integer_WriteBackPlugin_SEL_lane0;
  assign execute_ctrl3_down_COMPLETION_AT_3_lane0 = execute_ctrl3_up_COMPLETION_AT_3_lane0;
  assign execute_ctrl3_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0 = execute_ctrl3_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
  assign execute_ctrl3_down_SrcStageables_REVERT_lane0 = execute_ctrl3_up_SrcStageables_REVERT_lane0;
  assign execute_ctrl3_down_SrcStageables_ZERO_lane0 = execute_ctrl3_up_SrcStageables_ZERO_lane0;
  assign execute_ctrl3_down_lane0_IntFormatPlugin_logic_SIGNED_lane0 = execute_ctrl3_up_lane0_IntFormatPlugin_logic_SIGNED_lane0;
  assign execute_ctrl3_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 = execute_ctrl3_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
  assign execute_ctrl3_down_SrcStageables_UNSIGNED_lane0 = execute_ctrl3_up_SrcStageables_UNSIGNED_lane0;
  assign execute_ctrl3_down_IterativeShifterPlugin_LEFT_lane0 = execute_ctrl3_up_IterativeShifterPlugin_LEFT_lane0;
  assign execute_ctrl3_down_IterativeShifterPlugin_ARITHMETIC_lane0 = execute_ctrl3_up_IterativeShifterPlugin_ARITHMETIC_lane0;
  assign execute_ctrl3_down_IterativeShifterPlugin_IS_W_lane0 = execute_ctrl3_up_IterativeShifterPlugin_IS_W_lane0;
  assign execute_ctrl3_down_IterativeShifterPlugin_IS_W_RIGHT_lane0 = execute_ctrl3_up_IterativeShifterPlugin_IS_W_RIGHT_lane0;
  assign execute_ctrl3_down_BranchPlugin_BRANCH_CTRL_lane0 = execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0;
  assign execute_ctrl3_down_AguPlugin_LOAD_lane0 = execute_ctrl3_up_AguPlugin_LOAD_lane0;
  assign execute_ctrl3_down_AguPlugin_ATOMIC_lane0 = execute_ctrl3_up_AguPlugin_ATOMIC_lane0;
  assign execute_ctrl3_down_AguPlugin_FLOAT_lane0 = execute_ctrl3_up_AguPlugin_FLOAT_lane0;
  assign execute_ctrl3_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0 = execute_ctrl3_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
  assign execute_ctrl3_down_late0_IntAluPlugin_ALU_SLTX_lane0 = execute_ctrl3_up_late0_IntAluPlugin_ALU_SLTX_lane0;
  assign execute_ctrl3_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 = execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
  assign execute_ctrl3_down_early0_SrcPlugin_ADD_SUB_lane0 = execute_ctrl3_up_early0_SrcPlugin_ADD_SUB_lane0;
  assign execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 = execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
  assign execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 = execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
  assign execute_ctrl3_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 = execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
  assign execute_ctrl3_down_MMU_TRANSLATED_lane0 = execute_ctrl3_up_MMU_TRANSLATED_lane0;
  assign execute_ctrl3_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault = execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
  assign execute_ctrl3_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io = execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
  assign execute_ctrl3_down_late0_SrcPlugin_SRC1_lane0 = execute_ctrl3_up_late0_SrcPlugin_SRC1_lane0;
  assign execute_ctrl3_down_late0_SrcPlugin_SRC2_lane0 = execute_ctrl3_up_late0_SrcPlugin_SRC2_lane0;
  assign execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0 = execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
  assign execute_ctrl3_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0 = execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0;
  assign execute_ctrl4_up_ready = execute_ctrl4_down_isReady;
  assign execute_ctrl4_down_LANE_SEL_lane0 = execute_ctrl4_up_LANE_SEL_lane0;
  assign execute_ctrl4_down_COMMIT_lane0 = execute_ctrl4_up_COMMIT_lane0;
  assign fetch_logic_ctrls_0_down_isFiring = (fetch_logic_ctrls_0_down_isValid && fetch_logic_ctrls_0_down_isReady);
  assign fetch_logic_ctrls_0_down_isValid = fetch_logic_ctrls_0_down_valid;
  assign fetch_logic_ctrls_0_down_isReady = fetch_logic_ctrls_0_down_ready;
  assign fetch_logic_ctrls_1_up_isValid = fetch_logic_ctrls_1_up_valid;
  assign fetch_logic_ctrls_1_down_isValid = fetch_logic_ctrls_1_down_valid;
  assign fetch_logic_ctrls_1_down_isReady = fetch_logic_ctrls_1_down_ready;
  assign fetch_logic_ctrls_2_up_isValid = fetch_logic_ctrls_2_up_valid;
  assign fetch_logic_ctrls_2_up_isReady = fetch_logic_ctrls_2_up_ready;
  assign fetch_logic_ctrls_2_up_isCancel = fetch_logic_ctrls_2_up_cancel;
  assign fetch_logic_ctrls_2_up_isCanceling = (fetch_logic_ctrls_2_up_isValid && fetch_logic_ctrls_2_up_isCancel);
  assign fetch_logic_ctrls_0_up_isFiring = (fetch_logic_ctrls_0_up_isValid && fetch_logic_ctrls_0_up_isReady);
  assign fetch_logic_ctrls_0_up_isValid = fetch_logic_ctrls_0_up_valid;
  assign fetch_logic_ctrls_0_up_isReady = fetch_logic_ctrls_0_up_ready;
  assign fetch_logic_ctrls_2_down_isValid = fetch_logic_ctrls_2_down_valid;
  assign fetch_logic_ctrls_2_down_isReady = fetch_logic_ctrls_2_down_ready;
  assign fetch_logic_ctrls_2_down_isCancel = 1'b0;
  assign decode_ctrls_0_down_isValid = decode_ctrls_0_down_valid;
  assign decode_ctrls_0_down_isReady = decode_ctrls_0_down_ready;
  assign decode_ctrls_1_up_isValid = decode_ctrls_1_up_valid;
  assign decode_ctrls_1_up_isReady = decode_ctrls_1_up_ready;
  assign decode_ctrls_1_down_isValid = decode_ctrls_1_down_valid;
  assign decode_ctrls_1_down_isReady = decode_ctrls_1_down_ready;
  assign decode_ctrls_2_up_isMoving = (decode_ctrls_2_up_isValid && decode_ctrls_2_up_isReady);
  assign decode_ctrls_2_up_isValid = decode_ctrls_2_up_valid;
  assign decode_ctrls_2_up_isReady = decode_ctrls_2_up_ready;
  assign decode_ctrls_2_up_isCanceling = 1'b0;
  assign decode_ctrls_0_up_isFiring = (decode_ctrls_0_up_isValid && decode_ctrls_0_up_isReady);
  assign decode_ctrls_0_up_isMoving = (decode_ctrls_0_up_isValid && decode_ctrls_0_up_isReady);
  assign decode_ctrls_0_up_isValid = decode_ctrls_0_up_valid;
  assign decode_ctrls_0_up_isReady = decode_ctrls_0_up_ready;
  assign decode_ctrls_0_up_isCancel = 1'b0;
  assign decode_ctrls_2_down_isReady = decode_ctrls_2_down_ready;
  assign execute_ctrl0_down_isReady = execute_ctrl0_down_ready;
  assign execute_ctrl1_down_isReady = execute_ctrl1_down_ready;
  assign execute_ctrl2_down_isReady = execute_ctrl2_down_ready;
  assign execute_ctrl3_down_isReady = execute_ctrl3_down_ready;
  assign execute_ctrl4_down_isReady = execute_ctrl4_down_ready;
  always @(*) begin
    TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_stateReg;
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
        if(TrapPlugin_logic_harts_0_trap_trigger_valid) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        if(when_TrapPlugin_l393) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL;
        end else begin
          case(TrapPlugin_logic_harts_0_trap_pending_state_code)
            4'b0000 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RUNNING;
            end
            4'b0001 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC;
            end
            4'b0010 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH;
            end
            4'b0100 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_JUMP;
            end
            4'b0101 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_JUMP;
            end
            4'b1000 : begin
              if(TrapPlugin_api_harts_0_askWake) begin
                TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_JUMP;
              end
            end
            4'b0110 : begin
              TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_JUMP;
            end
            default : begin
            end
          endcase
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
        if(TrapPlugin_logic_harts_0_crsPorts_write_ready) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
        if(TrapPlugin_logic_harts_0_crsPorts_write_ready) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
        if(TrapPlugin_logic_harts_0_crsPorts_read_ready) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
        TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RUNNING;
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
        if(TrapPlugin_logic_harts_0_crsPorts_read_ready) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY;
        end
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
        TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RUNNING;
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
        TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RUNNING;
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
        if(TrapPlugin_logic_fetchL1Invalidate_0_cmd_ready) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_JUMP;
        end
      end
      default : begin
        if(when_TrapPlugin_l348) begin
          TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RUNNING;
        end
      end
    endcase
    if(TrapPlugin_logic_harts_0_trap_fsm_wantKill) begin
      TrapPlugin_logic_harts_0_trap_fsm_stateNext = TrapPlugin_logic_harts_0_trap_fsm_RESET;
    end
  end

  assign when_TrapPlugin_l393 = ((TrapPlugin_logic_harts_0_trap_pending_state_exception || TrapPlugin_logic_harts_0_trap_fsm_triggerEbreak) || TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt);
  assign when_TrapPlugin_l637 = (TrapPlugin_logic_harts_0_trap_pending_xret_targetPrivilege != 2'b11);
  assign switch_TrapPlugin_l638 = TrapPlugin_logic_harts_0_trap_pending_state_arg[1 : 0];
  assign when_TrapPlugin_l348 = (&TrapPlugin_logic_harts_0_trap_fsm_resetToRunConditions_0);
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_RESET = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_RESET) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_RESET));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_RUNNING = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_RUNNING) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_RUNNING));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_PROCESS_1 = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_EPC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_TVAL = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_TVEC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_TRAP_APPLY = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_XRET_EPC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_XRET_APPLY = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_JUMP = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_JUMP) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_JUMP));
  assign TrapPlugin_logic_harts_0_trap_fsm_onExit_FETCH_FLUSH = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext != TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg == TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_RESET = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_RESET) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_RESET));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_RUNNING = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_RUNNING) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_RUNNING));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_PROCESS_1 = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_EPC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_TVAL = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_TVEC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_TRAP_APPLY = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_XRET_EPC = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_XRET_APPLY = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_JUMP = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_JUMP) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_JUMP));
  assign TrapPlugin_logic_harts_0_trap_fsm_onEntry_FETCH_FLUSH = ((TrapPlugin_logic_harts_0_trap_fsm_stateNext == TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH) && (TrapPlugin_logic_harts_0_trap_fsm_stateReg != TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH));
  always @(*) begin
    CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_stateReg;
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
        if(when_CsrAccessPlugin_l308) begin
          CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_WRITE;
        end
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
        if(when_CsrAccessPlugin_l338) begin
          CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_COMPLETION;
        end
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
        if(execute_ctrl1_down_isReady) begin
          CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_IDLE;
        end
      end
      default : begin
        if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
          if(when_CsrAccessPlugin_l224) begin
            CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_READ;
          end
          if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
            if(!CsrAccessPlugin_logic_fsm_inject_trapReg) begin
              CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_READ;
            end
          end
        end
      end
    endcase
    if(CsrAccessPlugin_logic_fsm_wantKill) begin
      CsrAccessPlugin_logic_fsm_stateNext = CsrAccessPlugin_logic_fsm_IDLE;
    end
  end

  assign when_CsrAccessPlugin_l308 = (! CsrAccessPlugin_bus_read_halt);
  assign when_CsrAccessPlugin_l338 = (! CsrAccessPlugin_bus_write_halt);
  assign when_CsrAccessPlugin_l224 = ((! CsrAccessPlugin_logic_fsm_inject_trap) && (! CsrAccessPlugin_bus_decode_trap));
  assign CsrAccessPlugin_logic_fsm_onExit_IDLE = ((CsrAccessPlugin_logic_fsm_stateNext != CsrAccessPlugin_logic_fsm_IDLE) && (CsrAccessPlugin_logic_fsm_stateReg == CsrAccessPlugin_logic_fsm_IDLE));
  assign CsrAccessPlugin_logic_fsm_onExit_READ = ((CsrAccessPlugin_logic_fsm_stateNext != CsrAccessPlugin_logic_fsm_READ) && (CsrAccessPlugin_logic_fsm_stateReg == CsrAccessPlugin_logic_fsm_READ));
  assign CsrAccessPlugin_logic_fsm_onExit_WRITE = ((CsrAccessPlugin_logic_fsm_stateNext != CsrAccessPlugin_logic_fsm_WRITE) && (CsrAccessPlugin_logic_fsm_stateReg == CsrAccessPlugin_logic_fsm_WRITE));
  assign CsrAccessPlugin_logic_fsm_onExit_COMPLETION = ((CsrAccessPlugin_logic_fsm_stateNext != CsrAccessPlugin_logic_fsm_COMPLETION) && (CsrAccessPlugin_logic_fsm_stateReg == CsrAccessPlugin_logic_fsm_COMPLETION));
  assign CsrAccessPlugin_logic_fsm_onEntry_IDLE = ((CsrAccessPlugin_logic_fsm_stateNext == CsrAccessPlugin_logic_fsm_IDLE) && (CsrAccessPlugin_logic_fsm_stateReg != CsrAccessPlugin_logic_fsm_IDLE));
  assign CsrAccessPlugin_logic_fsm_onEntry_READ = ((CsrAccessPlugin_logic_fsm_stateNext == CsrAccessPlugin_logic_fsm_READ) && (CsrAccessPlugin_logic_fsm_stateReg != CsrAccessPlugin_logic_fsm_READ));
  assign CsrAccessPlugin_logic_fsm_onEntry_WRITE = ((CsrAccessPlugin_logic_fsm_stateNext == CsrAccessPlugin_logic_fsm_WRITE) && (CsrAccessPlugin_logic_fsm_stateReg != CsrAccessPlugin_logic_fsm_WRITE));
  assign CsrAccessPlugin_logic_fsm_onEntry_COMPLETION = ((CsrAccessPlugin_logic_fsm_stateNext == CsrAccessPlugin_logic_fsm_COMPLETION) && (CsrAccessPlugin_logic_fsm_stateReg != CsrAccessPlugin_logic_fsm_COMPLETION));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      early0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= 1'b0;
      early0_IterativeShifterPlugin_logic_shift_busy <= 1'b0;
      PrivilegedPlugin_logic_harts_0_privilege <= 2'b11;
      PrivilegedPlugin_logic_harts_0_m_status_mie <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_status_mpie <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_status_mprv <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_cause_interrupt <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_cause_code <= 4'b0000;
      PrivilegedPlugin_logic_harts_0_m_ip_meip <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_ip_mtip <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_ip_msip <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_ie_meie <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_ie_mtie <= 1'b0;
      PrivilegedPlugin_logic_harts_0_m_ie_msie <= 1'b0;
      late0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= 1'b0;
      late0_IterativeShifterPlugin_logic_shift_busy <= 1'b0;
      AlignerPlugin_logic_feeder_harts_0_dopId <= 10'h0;
      AlignerPlugin_logic_buffer_mask <= 1'b0;
      AlignerPlugin_logic_buffer_last <= 1'b0;
      AlignerPlugin_logic_buffer_trap <= 1'b0;
      FetchL1Plugin_logic_invalidate_counter <= 3'b000;
      FetchL1Plugin_logic_invalidate_firstEver <= 1'b1;
      FetchL1Plugin_logic_refill_slots_0_valid <= 1'b0;
      FetchL1Plugin_logic_refill_slots_0_cmdSent <= 1'b1;
      FetchL1Plugin_logic_refill_pushCounter <= 32'h0;
      FetchL1Plugin_logic_refill_onRsp_wordIndex <= 1'b0;
      FetchL1Plugin_logic_refill_onRsp_firstCycle <= 1'b1;
      FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_valid <= 1'b0;
      FetchL1Plugin_logic_ctrl_trapSent <= 1'b0;
      FetchL1Plugin_logic_ctrl_firstCycle <= 1'b1;
      LsuCachelessPlugin_logic_onFork_askFenceReg <= 1'b0;
      LsuCachelessPlugin_logic_onFork_cmdCounter_value <= 1'b0;
      LsuCachelessPlugin_logic_onFork_cmdSent <= 1'b0;
      LsuCachelessPlugin_logic_bus_cmd_valid_regNext <= 1'b0;
      LsuCachelessPlugin_logic_bus_cmd_ready_regNext <= 1'b0;
      LsuCachelessPlugin_logic_bus_cmd_isStall_regNext <= 1'b0;
      BtbPlugin_logic_ras_ptr_push <= 2'b00;
      BtbPlugin_logic_ras_ptr_pop <= 2'b11;
      decode_ctrls_0_up_LANE_SEL_0_regNext <= 1'b0;
      DecoderPlugin_logic_harts_0_uopId <= 16'h0;
      DecoderPlugin_logic_interrupt_buffered <= 1'b0;
      decode_ctrls_2_up_LANE_SEL_0_regNext <= 1'b0;
      LsuCachelessPlugin_logic_onJoin_buffers_0_valid <= 1'b0;
      LsuCachelessPlugin_logic_onJoin_buffers_0_inflight <= 1'b0;
      LsuCachelessPlugin_logic_onJoin_buffers_1_valid <= 1'b0;
      LsuCachelessPlugin_logic_onJoin_buffers_1_inflight <= 1'b0;
      LsuCachelessPlugin_logic_onJoin_rspCounter_value <= 1'b0;
      execute_ctrl2_up_LsuCachelessPlugin_WITH_RSP_lane0 <= 1'b0;
      DispatchPlugin_logic_feeds_0_sent <= 1'b0;
      CsrRamPlugin_csrMapper_fired <= 1'b0;
      decode_ctrls_2_up_LANE_SEL_0_regNext_1 <= 1'b0;
      execute_ctrl0_down_LANE_SEL_lane0_regNext <= 1'b0;
      execute_ctrl1_down_LANE_SEL_lane0_regNext <= 1'b0;
      BtbPlugin_logic_applyIt_correctionSent <= 1'b0;
      decode_ctrls_1_up_LANE_SEL_0 <= 1'b0;
      decode_ctrls_2_up_LANE_SEL_0 <= 1'b0;
      TrapPlugin_logic_harts_0_interrupt_validBuffer <= 1'b0;
      TrapPlugin_logic_harts_0_trap_fsm_trapEnterDebug <= 1'b0;
      PcPlugin_logic_harts_0_self_id <= 10'h0;
      PcPlugin_logic_harts_0_self_increment <= 1'b0;
      PcPlugin_logic_harts_0_self_fault <= 1'b0;
      PcPlugin_logic_harts_0_self_state <= 32'h80000000;
      PcPlugin_logic_harts_0_holdReg <= 1'b1;
      CsrAccessPlugin_logic_fsm_inject_unfreeze <= 1'b0;
      CsrAccessPlugin_logic_fsm_inject_flushReg <= 1'b0;
      CsrAccessPlugin_logic_fsm_inject_sampled <= 1'b0;
      CsrRamPlugin_logic_readLogic_ohReg <= 2'b00;
      CsrRamPlugin_logic_readLogic_busy <= 1'b0;
      CsrRamPlugin_logic_flush_counter <= 3'b000;
      execute_ctrl1_up_LANE_SEL_lane0 <= 1'b0;
      execute_ctrl2_up_LANE_SEL_lane0 <= 1'b0;
      execute_ctrl3_up_LANE_SEL_lane0 <= 1'b0;
      execute_ctrl4_up_LANE_SEL_lane0 <= 1'b0;
      integer_RegFilePlugin_logic_initalizer_counter <= 6'h0;
      _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_2 <= 60'h0;
      _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_2 <= 60'h0;
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_2 <= 60'h0;
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_2 <= 60'h0;
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_2 <= 60'h0;
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_2 <= 60'h0;
      fetch_logic_ctrls_1_up_valid <= 1'b0;
      fetch_logic_ctrls_2_up_valid <= 1'b0;
      decode_ctrls_1_up_valid <= 1'b0;
      decode_ctrls_2_up_valid <= 1'b0;
      TrapPlugin_logic_harts_0_trap_fsm_stateReg <= TrapPlugin_logic_harts_0_trap_fsm_RESET;
      CsrAccessPlugin_logic_fsm_stateReg <= CsrAccessPlugin_logic_fsm_IDLE;
    end else begin
      early0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= execute_lane0_ctrls_1_upIsCancel;
      if(execute_ctrl1_down_isReady) begin
        early0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= 1'b0;
      end
      if(when_IterativeShiftPlugin_l184) begin
        early0_IterativeShifterPlugin_logic_shift_busy <= (early0_IterativeShifterPlugin_logic_shift_shamt != 6'h0);
      end
      if(when_IterativeShiftPlugin_l189) begin
        early0_IterativeShifterPlugin_logic_shift_busy <= 1'b0;
      end
      if(PrivilegedPlugin_logic_harts_0_xretAwayFromMachine) begin
        PrivilegedPlugin_logic_harts_0_m_status_mprv <= 1'b0;
      end
      PrivilegedPlugin_logic_harts_0_m_ip_meip <= PrivilegedPlugin_logic_harts_0_int_m_external;
      PrivilegedPlugin_logic_harts_0_m_ip_mtip <= PrivilegedPlugin_logic_harts_0_int_m_timer;
      PrivilegedPlugin_logic_harts_0_m_ip_msip <= PrivilegedPlugin_logic_harts_0_int_m_software;
      late0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= execute_lane0_ctrls_3_upIsCancel;
      if(execute_ctrl3_down_isReady) begin
        late0_IterativeShifterPlugin_logic_shift_unscheduleRequest <= 1'b0;
      end
      if(when_IterativeShiftPlugin_l184_1) begin
        late0_IterativeShifterPlugin_logic_shift_busy <= (late0_IterativeShifterPlugin_logic_shift_shamt != 6'h0);
      end
      if(when_IterativeShiftPlugin_l189_1) begin
        late0_IterativeShifterPlugin_logic_shift_busy <= 1'b0;
      end
      if(when_AlignerPlugin_l173) begin
        AlignerPlugin_logic_feeder_harts_0_dopId <= (decode_ctrls_0_down_Decode_DOP_ID_0 + 10'h001);
      end
      if(AlignerPlugin_logic_buffer_downFire) begin
        AlignerPlugin_logic_buffer_mask <= (AlignerPlugin_logic_buffer_mask & (~ AlignerPlugin_logic_buffer_usedMask[0 : 0]));
        AlignerPlugin_logic_buffer_last <= (AlignerPlugin_logic_buffer_last & (~ AlignerPlugin_logic_buffer_usedMask[0 : 0]));
      end
      if(when_AlignerPlugin_l259) begin
        AlignerPlugin_logic_buffer_mask <= (fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_MASK & (~ (AlignerPlugin_logic_buffer_downFire ? AlignerPlugin_logic_buffer_usedMask[1 : 1] : 1'b0)));
        AlignerPlugin_logic_buffer_trap <= fetch_logic_ctrls_2_down_TRAP;
        AlignerPlugin_logic_buffer_last <= fetch_logic_ctrls_2_down_AlignerPlugin_logic_FETCH_LAST;
      end
      if(FetchL1Plugin_logic_invalidate_done) begin
        FetchL1Plugin_logic_invalidate_firstEver <= 1'b0;
      end
      if(when_FetchL1Plugin_l222) begin
        FetchL1Plugin_logic_invalidate_counter <= FetchL1Plugin_logic_invalidate_counterIncr;
      end
      if(when_FetchL1Plugin_l229) begin
        FetchL1Plugin_logic_invalidate_counter <= 3'b000;
      end
      if(when_FetchL1Plugin_l273) begin
        if(_zz_when) begin
          FetchL1Plugin_logic_refill_slots_0_valid <= 1'b1;
          FetchL1Plugin_logic_refill_slots_0_cmdSent <= 1'b0;
        end
        FetchL1Plugin_logic_refill_pushCounter <= (FetchL1Plugin_logic_refill_pushCounter + 32'h00000001);
      end
      if(FetchL1Plugin_logic_bus_cmd_ready) begin
        if(FetchL1Plugin_logic_refill_onCmd_oh[0]) begin
          FetchL1Plugin_logic_refill_slots_0_cmdSent <= 1'b1;
        end
      end
      if(FetchL1Plugin_logic_bus_rsp_fire) begin
        FetchL1Plugin_logic_refill_onRsp_firstCycle <= 1'b0;
      end
      if(FetchL1Plugin_logic_bus_rsp_valid) begin
        FetchL1Plugin_logic_refill_onRsp_wordIndex <= (FetchL1Plugin_logic_refill_onRsp_wordIndex + 1'b1);
        if(when_FetchL1Plugin_l352) begin
          FetchL1Plugin_logic_refill_onRsp_firstCycle <= 1'b1;
          FetchL1Plugin_logic_refill_slots_0_valid <= 1'b0;
        end
      end
      FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_valid <= FetchL1Plugin_logic_ctrl_plruLogic_buffer_valid;
      if(FetchL1Plugin_logic_trapPort_valid) begin
        FetchL1Plugin_logic_ctrl_trapSent <= 1'b1;
      end
      if(fetch_logic_ctrls_2_up_isCancel) begin
        FetchL1Plugin_logic_ctrl_trapSent <= 1'b0;
      end
      if(fetch_logic_ctrls_2_up_isValid) begin
        FetchL1Plugin_logic_ctrl_firstCycle <= 1'b0;
      end
      if(when_FetchL1Plugin_l563) begin
        FetchL1Plugin_logic_ctrl_firstCycle <= 1'b1;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((|FetchL1Plugin_logic_refill_slots_0_valid) && (! FetchL1Plugin_logic_invalidate_done)))); // FetchL1Plugin.scala:L578
        `else
          if(!(! ((|FetchL1Plugin_logic_refill_slots_0_valid) && (! FetchL1Plugin_logic_invalidate_done)))) begin
            $display("FAILURE "); // FetchL1Plugin.scala:L578
            $finish;
          end
        `endif
      `endif
      if(when_LsuCachelessPlugin_l198) begin
        LsuCachelessPlugin_logic_onFork_askFenceReg <= ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_AguPlugin_SEL_lane0) && execute_ctrl1_down_AguPlugin_ATOMIC_lane0);
      end
      LsuCachelessPlugin_logic_onFork_cmdCounter_value <= LsuCachelessPlugin_logic_onFork_cmdCounter_valueNext;
      if(LsuCachelessPlugin_logic_bus_cmd_fire) begin
        LsuCachelessPlugin_logic_onFork_cmdSent <= 1'b1;
      end
      if(when_LsuCachelessPlugin_l203) begin
        LsuCachelessPlugin_logic_onFork_cmdSent <= 1'b0;
      end
      LsuCachelessPlugin_logic_bus_cmd_valid_regNext <= LsuCachelessPlugin_logic_bus_cmd_valid;
      LsuCachelessPlugin_logic_bus_cmd_ready_regNext <= LsuCachelessPlugin_logic_bus_cmd_ready;
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((! LsuCachelessPlugin_logic_bus_cmd_valid) && LsuCachelessPlugin_logic_bus_cmd_valid_regNext) && (! LsuCachelessPlugin_logic_bus_cmd_ready_regNext)))); // Stream.scala:L544
        `else
          if(!(! (((! LsuCachelessPlugin_logic_bus_cmd_valid) && LsuCachelessPlugin_logic_bus_cmd_valid_regNext) && (! LsuCachelessPlugin_logic_bus_cmd_ready_regNext)))) begin
            $display("FAILURE Stream valid persistence failed"); // Stream.scala:L544
            $finish;
          end
        `endif
      `endif
      LsuCachelessPlugin_logic_bus_cmd_isStall_regNext <= LsuCachelessPlugin_logic_bus_cmd_isStall;
      if(LsuCachelessPlugin_logic_bus_cmd_isStall_regNext) begin
        `ifndef SYNTHESIS
          `ifdef FORMAL
            assert(((((((((((LsuCachelessPlugin_logic_bus_cmd_payload_id == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_id) && (LsuCachelessPlugin_logic_bus_cmd_payload_write == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_write)) && (LsuCachelessPlugin_logic_bus_cmd_payload_address == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_address)) && (LsuCachelessPlugin_logic_bus_cmd_payload_data == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_data)) && (LsuCachelessPlugin_logic_bus_cmd_payload_size == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_size)) && (LsuCachelessPlugin_logic_bus_cmd_payload_mask == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_mask)) && (LsuCachelessPlugin_logic_bus_cmd_payload_io == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_io)) && (LsuCachelessPlugin_logic_bus_cmd_payload_fromHart == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_fromHart)) && 1'b1) && (LsuCachelessPlugin_logic_bus_cmd_payload_uopId == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_uopId))); // Stream.scala:L548
          `else
            if(!((((((((((LsuCachelessPlugin_logic_bus_cmd_payload_id == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_id) && (LsuCachelessPlugin_logic_bus_cmd_payload_write == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_write)) && (LsuCachelessPlugin_logic_bus_cmd_payload_address == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_address)) && (LsuCachelessPlugin_logic_bus_cmd_payload_data == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_data)) && (LsuCachelessPlugin_logic_bus_cmd_payload_size == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_size)) && (LsuCachelessPlugin_logic_bus_cmd_payload_mask == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_mask)) && (LsuCachelessPlugin_logic_bus_cmd_payload_io == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_io)) && (LsuCachelessPlugin_logic_bus_cmd_payload_fromHart == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_fromHart)) && 1'b1) && (LsuCachelessPlugin_logic_bus_cmd_payload_uopId == LsuCachelessPlugin_logic_bus_cmd_payload_regNext_uopId))) begin
              $display("FAILURE Stream payload persistence failed"); // Stream.scala:L548
              $finish;
            end
          `endif
        `endif
      end
      BtbPlugin_logic_ras_ptr_push <= (_zz_BtbPlugin_logic_ras_ptr_push - _zz_BtbPlugin_logic_ras_ptr_push_3);
      decode_ctrls_0_up_LANE_SEL_0_regNext <= decode_ctrls_0_up_LANE_SEL_0;
      if(when_CtrlLaneApi_l46) begin
        decode_ctrls_0_up_LANE_SEL_0_regNext <= 1'b0;
      end
      if(when_DecoderPlugin_l138) begin
        DecoderPlugin_logic_harts_0_uopId <= (DecoderPlugin_logic_harts_0_uopId + 16'h0001);
      end
      if(when_DecoderPlugin_l146) begin
        DecoderPlugin_logic_interrupt_buffered <= DecoderPlugin_logic_interrupt_async;
      end
      decode_ctrls_2_up_LANE_SEL_0_regNext <= decode_ctrls_2_up_LANE_SEL_0;
      if(when_CtrlLaneApi_l46_1) begin
        decode_ctrls_2_up_LANE_SEL_0_regNext <= 1'b0;
      end
      if(LsuCachelessPlugin_logic_bus_cmd_fire) begin
        case(LsuCachelessPlugin_logic_bus_cmd_payload_id)
          1'b0 : begin
            LsuCachelessPlugin_logic_onJoin_buffers_0_inflight <= 1'b1;
          end
          default : begin
            LsuCachelessPlugin_logic_onJoin_buffers_1_inflight <= 1'b1;
          end
        endcase
      end
      if(LsuCachelessPlugin_logic_bus_rsp_valid) begin
        case(LsuCachelessPlugin_logic_bus_rsp_payload_id)
          1'b0 : begin
            LsuCachelessPlugin_logic_onJoin_buffers_0_valid <= 1'b1;
            LsuCachelessPlugin_logic_onJoin_buffers_0_inflight <= 1'b0;
          end
          default : begin
            LsuCachelessPlugin_logic_onJoin_buffers_1_valid <= 1'b1;
            LsuCachelessPlugin_logic_onJoin_buffers_1_inflight <= 1'b0;
          end
        endcase
      end
      LsuCachelessPlugin_logic_onJoin_rspCounter_value <= LsuCachelessPlugin_logic_onJoin_rspCounter_valueNext;
      if(LsuCachelessPlugin_logic_onJoin_pop) begin
        case(LsuCachelessPlugin_logic_onJoin_rspCounter_value)
          1'b0 : begin
            LsuCachelessPlugin_logic_onJoin_buffers_0_valid <= 1'b0;
          end
          default : begin
            LsuCachelessPlugin_logic_onJoin_buffers_1_valid <= 1'b0;
          end
        endcase
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((((execute_ctrl2_up_LANE_SEL_lane0 && execute_lane0_ctrls_2_upIsCancel) && execute_ctrl2_down_AguPlugin_SEL_lane0) && execute_ctrl2_down_AguPlugin_STORE_lane0) && (! execute_ctrl2_up_TRAP_lane0)))); // LsuCachelessPlugin.scala:L363
        `else
          if(!(! ((((execute_ctrl2_up_LANE_SEL_lane0 && execute_lane0_ctrls_2_upIsCancel) && execute_ctrl2_down_AguPlugin_SEL_lane0) && execute_ctrl2_down_AguPlugin_STORE_lane0) && (! execute_ctrl2_up_TRAP_lane0)))) begin
            $display("FAILURE LsuCachelessPlugin saw unexpected select && STORE && cancel request"); // LsuCachelessPlugin.scala:L363
            $finish;
          end
        `endif
      `endif
      if(DispatchPlugin_logic_feeds_0_sending) begin
        DispatchPlugin_logic_feeds_0_sent <= 1'b1;
      end
      if(decode_ctrls_2_up_isMoving) begin
        DispatchPlugin_logic_feeds_0_sent <= 1'b0;
      end
      if(when_CsrRamPlugin_l84) begin
        CsrRamPlugin_csrMapper_fired <= 1'b1;
      end
      if(CsrAccessPlugin_bus_write_moving) begin
        CsrRamPlugin_csrMapper_fired <= 1'b0;
      end
      decode_ctrls_2_up_LANE_SEL_0_regNext_1 <= decode_ctrls_2_up_LANE_SEL_0;
      if(when_CtrlLaneApi_l46_2) begin
        decode_ctrls_2_up_LANE_SEL_0_regNext_1 <= 1'b0;
      end
      execute_ctrl0_down_LANE_SEL_lane0_regNext <= execute_ctrl0_down_LANE_SEL_lane0;
      if(when_CtrlLaneApi_l46_3) begin
        execute_ctrl0_down_LANE_SEL_lane0_regNext <= 1'b0;
      end
      execute_ctrl1_down_LANE_SEL_lane0_regNext <= execute_ctrl1_down_LANE_SEL_lane0;
      if(when_CtrlLaneApi_l46_4) begin
        execute_ctrl1_down_LANE_SEL_lane0_regNext <= 1'b0;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (fetch_logic_ctrls_1_up_isValid && fetch_logic_ctrls_1_down_BtbPlugin_logic_readCmd_HAZARDS[0]))); // BtbPlugin.scala:L187
        `else
          if(!(! (fetch_logic_ctrls_1_up_isValid && fetch_logic_ctrls_1_down_BtbPlugin_logic_readCmd_HAZARDS[0]))) begin
            $display("FAILURE "); // BtbPlugin.scala:L187
            $finish;
          end
        `endif
      `endif
      if(fetch_logic_ctrls_2_up_isValid) begin
        BtbPlugin_logic_applyIt_correctionSent <= 1'b1;
      end
      if(when_BtbPlugin_l205) begin
        BtbPlugin_logic_applyIt_correctionSent <= 1'b0;
      end
      if(AlignerPlugin_logic_buffer_flushIt) begin
        AlignerPlugin_logic_buffer_mask <= 1'b0;
        AlignerPlugin_logic_buffer_last <= 1'b0;
      end
      TrapPlugin_logic_harts_0_interrupt_validBuffer <= TrapPlugin_logic_harts_0_interrupt_valid;
      PcPlugin_logic_harts_0_holdReg <= PcPlugin_logic_harts_0_holdComb;
      PcPlugin_logic_harts_0_self_state <= PcPlugin_logic_harts_0_output_payload_pc;
      PcPlugin_logic_harts_0_self_fault <= PcPlugin_logic_harts_0_output_payload_fault;
      PcPlugin_logic_harts_0_self_increment <= 1'b0;
      if(PcPlugin_logic_harts_0_output_fire) begin
        PcPlugin_logic_harts_0_self_increment <= 1'b1;
      end
      if(fetch_logic_ctrls_0_up_isFiring) begin
        PcPlugin_logic_harts_0_self_id <= (PcPlugin_logic_harts_0_self_id + 10'h001);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_CsrAccessPlugin_SEL_lane0) && execute_lane0_ctrls_1_upIsCancel))); // CsrAccessPlugin.scala:L136
        `else
          if(!(! ((execute_ctrl1_up_LANE_SEL_lane0 && execute_ctrl1_down_CsrAccessPlugin_SEL_lane0) && execute_lane0_ctrls_1_upIsCancel))) begin
            $display("FAILURE CsrAccessPlugin saw forbidden select && cancel request"); // CsrAccessPlugin.scala:L136
            $finish;
          end
        `endif
      `endif
      CsrAccessPlugin_logic_fsm_inject_unfreeze <= 1'b0;
      if(CsrAccessPlugin_logic_flushPort_valid) begin
        CsrAccessPlugin_logic_fsm_inject_flushReg <= 1'b1;
      end
      if(when_CsrAccessPlugin_l209) begin
        CsrAccessPlugin_logic_fsm_inject_flushReg <= 1'b0;
      end
      CsrAccessPlugin_logic_fsm_inject_sampled <= execute_freeze_valid;
      if(when_CsrAccessPlugin_l359) begin
        PrivilegedPlugin_logic_harts_0_m_status_mpie <= CsrAccessPlugin_bus_write_bits[7];
        PrivilegedPlugin_logic_harts_0_m_status_mie <= CsrAccessPlugin_bus_write_bits[3];
        PrivilegedPlugin_logic_harts_0_m_status_mprv <= CsrAccessPlugin_bus_write_bits[17];
      end
      if(when_CsrAccessPlugin_l359_1) begin
        PrivilegedPlugin_logic_harts_0_m_cause_interrupt <= CsrAccessPlugin_bus_write_bits[63];
        PrivilegedPlugin_logic_harts_0_m_cause_code <= CsrAccessPlugin_bus_write_bits[3 : 0];
      end
      if(when_CsrAccessPlugin_l359_2) begin
        PrivilegedPlugin_logic_harts_0_m_ie_meie <= CsrAccessPlugin_bus_write_bits[11];
        PrivilegedPlugin_logic_harts_0_m_ie_mtie <= CsrAccessPlugin_bus_write_bits[7];
        PrivilegedPlugin_logic_harts_0_m_ie_msie <= CsrAccessPlugin_bus_write_bits[3];
      end
      CsrRamPlugin_logic_readLogic_ohReg <= (CsrRamPlugin_logic_readLogic_port_cmd_valid ? CsrRamPlugin_logic_readLogic_oh : 2'b00);
      CsrRamPlugin_logic_readLogic_busy <= CsrRamPlugin_logic_readLogic_port_cmd_valid;
      CsrRamPlugin_logic_flush_counter <= (CsrRamPlugin_logic_flush_counter + _zz_CsrRamPlugin_logic_flush_counter);
      if(when_RegFilePlugin_l127) begin
        integer_RegFilePlugin_logic_initalizer_counter <= (integer_RegFilePlugin_logic_initalizer_counter + 6'h01);
      end
      _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_2 <= _zz_WhiteboxerPlugin_logic_perf_executeFreezedCounter_1;
      _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_2 <= _zz_WhiteboxerPlugin_logic_perf_dispatchHazardsCounter_1;
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_2 <= _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_0_1;
      _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_2 <= _zz_WhiteboxerPlugin_logic_perf_candidatesCountCounters_1_1;
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_2 <= _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_0_1;
      _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_2 <= _zz_WhiteboxerPlugin_logic_perf_dispatchFeedCounters_1_1;
      if(fetch_logic_ctrls_1_up_forgetOne) begin
        fetch_logic_ctrls_1_up_valid <= 1'b0;
      end
      if(fetch_logic_ctrls_0_down_isReady) begin
        fetch_logic_ctrls_1_up_valid <= fetch_logic_ctrls_0_down_isValid;
      end
      if(fetch_logic_ctrls_2_up_forgetOne) begin
        fetch_logic_ctrls_2_up_valid <= 1'b0;
      end
      if(fetch_logic_ctrls_1_down_isReady) begin
        fetch_logic_ctrls_2_up_valid <= fetch_logic_ctrls_1_down_isValid;
      end
      if(decode_ctrls_0_down_isReady) begin
        decode_ctrls_1_up_valid <= decode_ctrls_0_down_isValid;
      end
      if(decode_ctrls_0_down_isReady) begin
        decode_ctrls_1_up_LANE_SEL_0 <= decode_ctrls_0_down_LANE_SEL_0;
      end
      if(when_DecodePipelinePlugin_l68) begin
        decode_ctrls_1_up_LANE_SEL_0 <= 1'b0;
      end
      if(decode_ctrls_1_down_isReady) begin
        decode_ctrls_2_up_valid <= decode_ctrls_1_down_isValid;
      end
      if(decode_ctrls_1_down_isReady) begin
        decode_ctrls_2_up_LANE_SEL_0 <= decode_ctrls_1_down_LANE_SEL_0;
      end
      if(when_DecodePipelinePlugin_l68_1) begin
        decode_ctrls_2_up_LANE_SEL_0 <= 1'b0;
      end
      if(execute_ctrl0_down_isReady) begin
        execute_ctrl1_up_LANE_SEL_lane0 <= execute_ctrl0_down_LANE_SEL_lane0;
      end
      if(execute_ctrl1_down_isReady) begin
        execute_ctrl2_up_LANE_SEL_lane0 <= execute_ctrl1_down_LANE_SEL_lane0;
        execute_ctrl2_up_LsuCachelessPlugin_WITH_RSP_lane0 <= execute_ctrl1_down_LsuCachelessPlugin_WITH_RSP_lane0;
      end
      if(execute_ctrl2_down_isReady) begin
        execute_ctrl3_up_LANE_SEL_lane0 <= execute_ctrl2_down_LANE_SEL_lane0;
      end
      if(execute_ctrl3_down_isReady) begin
        execute_ctrl4_up_LANE_SEL_lane0 <= execute_ctrl3_down_LANE_SEL_lane0;
      end
      TrapPlugin_logic_harts_0_trap_fsm_stateReg <= TrapPlugin_logic_harts_0_trap_fsm_stateNext;
      case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
        TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
          TrapPlugin_logic_harts_0_trap_fsm_trapEnterDebug <= 1'b0;
          if(!when_TrapPlugin_l393) begin
            case(TrapPlugin_logic_harts_0_trap_pending_state_code)
              4'b0000 : begin
                `ifndef SYNTHESIS
                  `ifdef FORMAL
                    assert((! TrapPlugin_logic_harts_0_trap_fsm_buffer_i_valid)); // TrapPlugin.scala:L415
                  `else
                    if(!(! TrapPlugin_logic_harts_0_trap_fsm_buffer_i_valid)) begin
                      $display("FAILURE "); // TrapPlugin.scala:L415
                      $finish;
                    end
                  `endif
                `endif
              end
              4'b0001 : begin
              end
              4'b0010 : begin
              end
              4'b0100 : begin
              end
              4'b0101 : begin
              end
              4'b1000 : begin
              end
              4'b0110 : begin
              end
              default : begin
                `ifndef SYNTHESIS
                  `ifdef FORMAL
                    assert(1'b0); // TrapPlugin.scala:L466
                  `else
                    if(!1'b0) begin
                      $display("FAILURE Unexpected trap reason"); // TrapPlugin.scala:L466
                      $finish;
                    end
                  `endif
                `endif
              end
            endcase
          end
        end
        TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
          PrivilegedPlugin_logic_harts_0_privilege <= TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_targetPrivilege;
          case(TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_targetPrivilege)
            2'b11 : begin
              PrivilegedPlugin_logic_harts_0_m_status_mie <= 1'b0;
              PrivilegedPlugin_logic_harts_0_m_status_mpie <= PrivilegedPlugin_logic_harts_0_m_status_mie;
              PrivilegedPlugin_logic_harts_0_m_cause_code <= TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_code;
              PrivilegedPlugin_logic_harts_0_m_cause_interrupt <= TrapPlugin_logic_harts_0_trap_fsm_buffer_trap_interrupt;
            end
            default : begin
            end
          endcase
        end
        TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
          PrivilegedPlugin_logic_harts_0_privilege <= TrapPlugin_logic_harts_0_trap_pending_xret_targetPrivilege;
          case(switch_TrapPlugin_l638)
            2'b11 : begin
              PrivilegedPlugin_logic_harts_0_m_status_mie <= PrivilegedPlugin_logic_harts_0_m_status_mpie;
              PrivilegedPlugin_logic_harts_0_m_status_mpie <= 1'b1;
            end
            default : begin
            end
          endcase
        end
        TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
        end
        TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
        end
        default : begin
        end
      endcase
      CsrAccessPlugin_logic_fsm_stateReg <= CsrAccessPlugin_logic_fsm_stateNext;
      case(CsrAccessPlugin_logic_fsm_stateReg)
        CsrAccessPlugin_logic_fsm_READ : begin
        end
        CsrAccessPlugin_logic_fsm_WRITE : begin
        end
        CsrAccessPlugin_logic_fsm_COMPLETION : begin
        end
        default : begin
          if(CsrAccessPlugin_logic_fsm_inject_onDecodeDo) begin
            if(CsrAccessPlugin_logic_fsm_inject_sampled) begin
              if(CsrAccessPlugin_logic_fsm_inject_trapReg) begin
                CsrAccessPlugin_logic_fsm_inject_unfreeze <= execute_freeze_valid;
              end
            end
          end
        end
      endcase
      case(CsrAccessPlugin_logic_fsm_stateNext)
        CsrAccessPlugin_logic_fsm_READ : begin
        end
        CsrAccessPlugin_logic_fsm_WRITE : begin
        end
        CsrAccessPlugin_logic_fsm_COMPLETION : begin
          CsrAccessPlugin_logic_fsm_inject_unfreeze <= 1'b1;
        end
        default : begin
        end
      endcase
      BtbPlugin_logic_ras_ptr_pop <= BtbPlugin_logic_ras_ptr_pop_aheadValue;
    end
  end

  always @(posedge clk) begin
    early0_IterativeShifterPlugin_logic_shift_shiftReg <= early0_IterativeShifterPlugin_logic_shift_muxed;
    if(early0_IterativeShifterPlugin_logic_shift_anyFlip) begin
      early0_IterativeShifterPlugin_logic_shift_flipped <= (! early0_IterativeShifterPlugin_logic_shift_flipped);
    end
    if(when_IterativeShiftPlugin_l179) begin
      early0_IterativeShifterPlugin_logic_shift_amplitude <= early0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
    end
    if(when_IterativeShiftPlugin_l184) begin
      early0_IterativeShifterPlugin_logic_shift_flipped <= 1'b0;
    end
    late0_IterativeShifterPlugin_logic_shift_shiftReg <= late0_IterativeShifterPlugin_logic_shift_muxed;
    if(late0_IterativeShifterPlugin_logic_shift_anyFlip) begin
      late0_IterativeShifterPlugin_logic_shift_flipped <= (! late0_IterativeShifterPlugin_logic_shift_flipped);
    end
    if(when_IterativeShiftPlugin_l179_1) begin
      late0_IterativeShifterPlugin_logic_shift_amplitude <= late0_IterativeShifterPlugin_logic_shift_updatedAmplitude;
    end
    if(when_IterativeShiftPlugin_l184_1) begin
      late0_IterativeShifterPlugin_logic_shift_flipped <= 1'b0;
    end
    if(when_AlignerPlugin_l259) begin
      AlignerPlugin_logic_buffer_data <= fetch_logic_ctrls_2_down_Fetch_WORD;
      AlignerPlugin_logic_buffer_pc <= fetch_logic_ctrls_2_down_Fetch_WORD_PC;
      AlignerPlugin_logic_buffer_hm_Fetch_ID <= fetch_logic_ctrls_2_down_Fetch_ID;
      AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_BRANCH <= fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_BRANCH;
      AlignerPlugin_logic_buffer_hm_Prediction_WORD_SLICES_TAKEN <= fetch_logic_ctrls_2_down_Prediction_WORD_SLICES_TAKEN;
      AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMP_PC <= fetch_logic_ctrls_2_down_Prediction_WORD_JUMP_PC;
      AlignerPlugin_logic_buffer_hm_Prediction_WORD_JUMPED <= fetch_logic_ctrls_2_down_Prediction_WORD_JUMPED;
    end
    if(when_FetchL1Plugin_l273) begin
      if(_zz_when) begin
        FetchL1Plugin_logic_refill_slots_0_address <= FetchL1Plugin_logic_refill_start_address;
        FetchL1Plugin_logic_refill_slots_0_isIo <= FetchL1Plugin_logic_refill_start_isIo;
        FetchL1Plugin_logic_refill_slots_0_wayToAllocate <= FetchL1Plugin_logic_refill_start_wayToAllocate;
        FetchL1Plugin_logic_refill_slots_0_priority <= FetchL1Plugin_logic_refill_slots_0_valid;
      end
    end
    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_address <= FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_address;
    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_0 <= FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_0;
    FetchL1Plugin_logic_ctrl_plruLogic_buffer_regNext_payload_data_1 <= FetchL1Plugin_logic_ctrl_plruLogic_buffer_payload_data_1;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_id <= LsuCachelessPlugin_logic_bus_cmd_payload_id;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_write <= LsuCachelessPlugin_logic_bus_cmd_payload_write;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_address <= LsuCachelessPlugin_logic_bus_cmd_payload_address;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_data <= LsuCachelessPlugin_logic_bus_cmd_payload_data;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_size <= LsuCachelessPlugin_logic_bus_cmd_payload_size;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_mask <= LsuCachelessPlugin_logic_bus_cmd_payload_mask;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_io <= LsuCachelessPlugin_logic_bus_cmd_payload_io;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_fromHart <= LsuCachelessPlugin_logic_bus_cmd_payload_fromHart;
    LsuCachelessPlugin_logic_bus_cmd_payload_regNext_uopId <= LsuCachelessPlugin_logic_bus_cmd_payload_uopId;
    if(BtbPlugin_logic_ras_readIt) begin
      BtbPlugin_logic_ras_read <= BtbPlugin_logic_ras_mem_stack_spinal_port0;
    end
    if(LsuCachelessPlugin_logic_bus_rsp_valid) begin
      case(LsuCachelessPlugin_logic_bus_rsp_payload_id)
        1'b0 : begin
          LsuCachelessPlugin_logic_onJoin_buffers_0_payload_error <= LsuCachelessPlugin_logic_onJoin_busRspWithoutId_error;
          LsuCachelessPlugin_logic_onJoin_buffers_0_payload_data <= LsuCachelessPlugin_logic_onJoin_busRspWithoutId_data;
        end
        default : begin
          LsuCachelessPlugin_logic_onJoin_buffers_1_payload_error <= LsuCachelessPlugin_logic_onJoin_busRspWithoutId_error;
          LsuCachelessPlugin_logic_onJoin_buffers_1_payload_data <= LsuCachelessPlugin_logic_onJoin_busRspWithoutId_data;
        end
      endcase
    end
    if(TrapPlugin_logic_harts_0_trap_pending_arbiter_down_valid) begin
      TrapPlugin_logic_harts_0_trap_pending_state_exception <= TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_exception;
      TrapPlugin_logic_harts_0_trap_pending_state_tval <= TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_tval;
      TrapPlugin_logic_harts_0_trap_pending_state_code <= TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_code;
      TrapPlugin_logic_harts_0_trap_pending_state_arg <= TrapPlugin_logic_harts_0_trap_pending_arbiter_down_payload_arg;
    end
    if(TrapPlugin_logic_harts_0_trap_trigger_valid) begin
      TrapPlugin_logic_harts_0_trap_pending_pc <= execute_ctrl3_down_PC_lane0;
      TrapPlugin_logic_harts_0_trap_pending_slices <= (1'b0 + 1'b1);
    end
    if(TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt) begin
      TrapPlugin_logic_harts_0_trap_fsm_buffer_i_valid <= TrapPlugin_logic_harts_0_interrupt_valid;
    end
    if(TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt) begin
      TrapPlugin_logic_harts_0_trap_fsm_buffer_i_code <= TrapPlugin_logic_harts_0_interrupt_code;
    end
    if(TrapPlugin_logic_harts_0_trap_fsm_buffer_sampleIt) begin
      TrapPlugin_logic_harts_0_trap_fsm_buffer_i_targetPrivilege <= TrapPlugin_logic_harts_0_interrupt_targetPrivilege;
    end
    TrapPlugin_logic_harts_0_trap_fsm_jumpTarget <= (TrapPlugin_logic_harts_0_trap_pending_pc + _zz_TrapPlugin_logic_harts_0_trap_fsm_jumpTarget);
    if(when_TrapPlugin_l539) begin
      TrapPlugin_logic_harts_0_trap_fsm_readed <= TrapPlugin_logic_harts_0_crsPorts_read_data;
    end
    CsrAccessPlugin_logic_fsm_regs_read <= ((execute_ctrl1_down_CsrAccessPlugin_SEL_lane0 && (! CsrAccessPlugin_logic_fsm_inject_trap)) && CsrAccessPlugin_logic_fsm_inject_csrRead);
    CsrAccessPlugin_logic_fsm_regs_write <= ((execute_ctrl1_down_CsrAccessPlugin_SEL_lane0 && (! CsrAccessPlugin_logic_fsm_inject_trap)) && CsrAccessPlugin_logic_fsm_inject_csrWrite);
    CsrAccessPlugin_logic_fsm_inject_trapReg <= CsrAccessPlugin_logic_fsm_inject_trap;
    CsrAccessPlugin_logic_fsm_inject_busTrapReg <= CsrAccessPlugin_bus_decode_trap;
    CsrAccessPlugin_logic_fsm_inject_busTrapCodeReg <= CsrAccessPlugin_bus_decode_trapCode;
    CsrAccessPlugin_logic_fsm_regs_onWriteBits <= CsrAccessPlugin_logic_fsm_writeLogic_alu_result;
    if(fetch_logic_ctrls_0_down_isReady) begin
      fetch_logic_ctrls_1_up_Fetch_WORD_PC <= fetch_logic_ctrls_0_down_Fetch_WORD_PC;
      fetch_logic_ctrls_1_up_Fetch_PC_FAULT <= fetch_logic_ctrls_0_down_Fetch_PC_FAULT;
      fetch_logic_ctrls_1_up_Fetch_ID <= fetch_logic_ctrls_0_down_Fetch_ID;
      fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID <= fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_VALID;
      fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0 <= fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_0;
      fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1 <= fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_PLRU_BYPASS_DATA_1;
      fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE <= fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE;
      fetch_logic_ctrls_1_up_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS <= fetch_logic_ctrls_0_down_FetchL1Plugin_logic_cmd_TAGS_UPDATE_ADDRESS;
      fetch_logic_ctrls_1_up_BtbPlugin_logic_readCmd_HAZARDS <= fetch_logic_ctrls_0_down_BtbPlugin_logic_readCmd_HAZARDS;
    end
    if(fetch_logic_ctrls_1_down_isReady) begin
      fetch_logic_ctrls_2_up_Fetch_WORD_PC <= fetch_logic_ctrls_1_down_Fetch_WORD_PC;
      fetch_logic_ctrls_2_up_Fetch_PC_FAULT <= fetch_logic_ctrls_1_down_Fetch_PC_FAULT;
      fetch_logic_ctrls_2_up_Fetch_ID <= fetch_logic_ctrls_1_down_Fetch_ID;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_loaded <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_loaded;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_error <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_error;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_0_address <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_0_address;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_loaded <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_loaded;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_error <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_error;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_1_address <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_1_address;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_loaded <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_loaded;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_error <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_error;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_2_address <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_2_address;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_loaded <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_loaded;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_error <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_error;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_TAGS_3_address <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_TAGS_3_address;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_0 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_0;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_PLRU_BYPASSED_1 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_PLRU_BYPASSED_1;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_0 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_0;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_1 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_1;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_2 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_2;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_BANKS_MUXES_3 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_BANKS_MUXES_3;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_HAZARD <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_HAZARD;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_0 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_0;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_1 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_1;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_2 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_2;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HITS_3 <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HITS_3;
      fetch_logic_ctrls_2_up_MMU_TRANSLATED <= fetch_logic_ctrls_1_down_MMU_TRANSLATED;
      fetch_logic_ctrls_2_up_FetchL1Plugin_logic_WAYS_HIT <= fetch_logic_ctrls_1_down_FetchL1Plugin_logic_WAYS_HIT;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_hash;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_pcTarget;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isBranch;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPush;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_isPop;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_readRsp_ENTRY_taken;
      fetch_logic_ctrls_2_up_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT <= fetch_logic_ctrls_1_down_BtbPlugin_logic_chunksLogic_0_hitCalc_HIT;
      fetch_logic_ctrls_2_up_MMU_REFILL <= fetch_logic_ctrls_1_down_MMU_REFILL;
      fetch_logic_ctrls_2_up_MMU_HAZARD <= fetch_logic_ctrls_1_down_MMU_HAZARD;
      fetch_logic_ctrls_2_up_MMU_ALLOW_EXECUTE <= fetch_logic_ctrls_1_down_MMU_ALLOW_EXECUTE;
      fetch_logic_ctrls_2_up_MMU_PAGE_FAULT <= fetch_logic_ctrls_1_down_MMU_PAGE_FAULT;
      fetch_logic_ctrls_2_up_MMU_ACCESS_FAULT <= fetch_logic_ctrls_1_down_MMU_ACCESS_FAULT;
      fetch_logic_ctrls_2_up_MMU_BYPASS_TRANSLATION <= fetch_logic_ctrls_1_down_MMU_BYPASS_TRANSLATION;
    end
    if(decode_ctrls_0_down_isReady) begin
      decode_ctrls_1_up_Decode_INSTRUCTION_0 <= decode_ctrls_0_down_Decode_INSTRUCTION_0;
      decode_ctrls_1_up_Decode_DECOMPRESSION_FAULT_0 <= decode_ctrls_0_down_Decode_DECOMPRESSION_FAULT_0;
      decode_ctrls_1_up_Decode_INSTRUCTION_RAW_0 <= decode_ctrls_0_down_Decode_INSTRUCTION_RAW_0;
      decode_ctrls_1_up_PC_0 <= decode_ctrls_0_down_PC_0;
      decode_ctrls_1_up_Decode_DOP_ID_0 <= decode_ctrls_0_down_Decode_DOP_ID_0;
      decode_ctrls_1_up_TRAP_0 <= decode_ctrls_0_down_TRAP_0;
      decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_0 <= decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_0;
      decode_ctrls_1_up_Prediction_ALIGNED_JUMPED_PC_0 <= decode_ctrls_0_down_Prediction_ALIGNED_JUMPED_PC_0;
      decode_ctrls_1_up_Prediction_ALIGNED_SLICES_BRANCH_0 <= decode_ctrls_0_down_Prediction_ALIGNED_SLICES_BRANCH_0;
      decode_ctrls_1_up_Prediction_ALIGNED_SLICES_TAKEN_0 <= decode_ctrls_0_down_Prediction_ALIGNED_SLICES_TAKEN_0;
      decode_ctrls_1_up_Prediction_ALIGN_REDO_0 <= decode_ctrls_0_down_Prediction_ALIGN_REDO_0;
    end
    if(decode_ctrls_1_down_isReady) begin
      decode_ctrls_2_up_Decode_INSTRUCTION_0 <= decode_ctrls_1_down_Decode_INSTRUCTION_0;
      decode_ctrls_2_up_Decode_DECOMPRESSION_FAULT_0 <= decode_ctrls_1_down_Decode_DECOMPRESSION_FAULT_0;
      decode_ctrls_2_up_Decode_INSTRUCTION_RAW_0 <= decode_ctrls_1_down_Decode_INSTRUCTION_RAW_0;
      decode_ctrls_2_up_PC_0 <= decode_ctrls_1_down_PC_0;
      decode_ctrls_2_up_Decode_DOP_ID_0 <= decode_ctrls_1_down_Decode_DOP_ID_0;
      decode_ctrls_2_up_TRAP_0 <= decode_ctrls_1_down_TRAP_0;
      decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_0 <= decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_0;
      decode_ctrls_2_up_Prediction_ALIGNED_JUMPED_PC_0 <= decode_ctrls_1_down_Prediction_ALIGNED_JUMPED_PC_0;
      decode_ctrls_2_up_Prediction_ALIGNED_SLICES_BRANCH_0 <= decode_ctrls_1_down_Prediction_ALIGNED_SLICES_BRANCH_0;
      decode_ctrls_2_up_Prediction_ALIGNED_SLICES_TAKEN_0 <= decode_ctrls_1_down_Prediction_ALIGNED_SLICES_TAKEN_0;
      decode_ctrls_2_up_Prediction_ALIGN_REDO_0 <= decode_ctrls_1_down_Prediction_ALIGN_REDO_0;
    end
    if(execute_ctrl0_down_isReady) begin
      execute_ctrl1_up_Decode_UOP_lane0 <= execute_ctrl0_down_Decode_UOP_lane0;
      execute_ctrl1_up_Prediction_ALIGNED_JUMPED_lane0 <= execute_ctrl0_down_Prediction_ALIGNED_JUMPED_lane0;
      execute_ctrl1_up_Prediction_ALIGNED_JUMPED_PC_lane0 <= execute_ctrl0_down_Prediction_ALIGNED_JUMPED_PC_lane0;
      execute_ctrl1_up_PC_lane0 <= execute_ctrl0_down_PC_lane0;
      execute_ctrl1_up_TRAP_lane0 <= execute_ctrl0_down_TRAP_lane0;
      execute_ctrl1_up_Decode_UOP_ID_lane0 <= execute_ctrl0_down_Decode_UOP_ID_lane0;
      execute_ctrl1_up_RS1_PHYS_lane0 <= execute_ctrl0_down_RS1_PHYS_lane0;
      execute_ctrl1_up_RS2_PHYS_lane0 <= execute_ctrl0_down_RS2_PHYS_lane0;
      execute_ctrl1_up_RD_ENABLE_lane0 <= execute_ctrl0_down_RD_ENABLE_lane0;
      execute_ctrl1_up_RD_PHYS_lane0 <= execute_ctrl0_down_RD_PHYS_lane0;
      execute_ctrl1_up_COMPLETED_lane0 <= execute_ctrl0_down_COMPLETED_lane0;
      execute_ctrl1_up_AguPlugin_SIZE_lane0 <= execute_ctrl0_down_AguPlugin_SIZE_lane0;
      execute_ctrl1_up_early0_SrcPlugin_SRC1_lane0 <= execute_ctrl0_down_early0_SrcPlugin_SRC1_lane0;
      execute_ctrl1_up_integer_RS1_lane0 <= execute_ctrl0_down_integer_RS1_lane0;
      execute_ctrl1_up_early0_SrcPlugin_SRC2_lane0 <= execute_ctrl0_down_early0_SrcPlugin_SRC2_lane0;
      execute_ctrl1_up_integer_RS2_lane0 <= execute_ctrl0_down_integer_RS2_lane0;
      execute_ctrl1_up_early0_IntAluPlugin_SEL_lane0 <= execute_ctrl0_down_early0_IntAluPlugin_SEL_lane0;
      execute_ctrl1_up_early0_IterativeShifterPlugin_SEL_lane0 <= execute_ctrl0_down_early0_IterativeShifterPlugin_SEL_lane0;
      execute_ctrl1_up_early0_BranchPlugin_SEL_lane0 <= execute_ctrl0_down_early0_BranchPlugin_SEL_lane0;
      execute_ctrl1_up_early0_EnvPlugin_SEL_lane0 <= execute_ctrl0_down_early0_EnvPlugin_SEL_lane0;
      execute_ctrl1_up_late0_IntAluPlugin_SEL_lane0 <= execute_ctrl0_down_late0_IntAluPlugin_SEL_lane0;
      execute_ctrl1_up_late0_IterativeShifterPlugin_SEL_lane0 <= execute_ctrl0_down_late0_IterativeShifterPlugin_SEL_lane0;
      execute_ctrl1_up_late0_BranchPlugin_SEL_lane0 <= execute_ctrl0_down_late0_BranchPlugin_SEL_lane0;
      execute_ctrl1_up_CsrAccessPlugin_SEL_lane0 <= execute_ctrl0_down_CsrAccessPlugin_SEL_lane0;
      execute_ctrl1_up_AguPlugin_SEL_lane0 <= execute_ctrl0_down_AguPlugin_SEL_lane0;
      execute_ctrl1_up_LsuCachelessPlugin_FENCE_lane0 <= execute_ctrl0_down_LsuCachelessPlugin_FENCE_lane0;
      execute_ctrl1_up_lane0_integer_WriteBackPlugin_SEL_lane0 <= execute_ctrl0_down_lane0_integer_WriteBackPlugin_SEL_lane0;
      execute_ctrl1_up_COMPLETION_AT_1_lane0 <= execute_ctrl0_down_COMPLETION_AT_1_lane0;
      execute_ctrl1_up_COMPLETION_AT_2_lane0 <= execute_ctrl0_down_COMPLETION_AT_2_lane0;
      execute_ctrl1_up_COMPLETION_AT_3_lane0 <= execute_ctrl0_down_COMPLETION_AT_3_lane0;
      execute_ctrl1_up_lane0_logic_completions_onCtrl_0_ENABLE_lane0 <= execute_ctrl0_down_lane0_logic_completions_onCtrl_0_ENABLE_lane0;
      execute_ctrl1_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0 <= execute_ctrl0_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
      execute_ctrl1_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0 <= execute_ctrl0_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
      execute_ctrl1_up_early0_IntAluPlugin_ALU_ADD_SUB_lane0 <= execute_ctrl0_down_early0_IntAluPlugin_ALU_ADD_SUB_lane0;
      execute_ctrl1_up_early0_IntAluPlugin_ALU_SLTX_lane0 <= execute_ctrl0_down_early0_IntAluPlugin_ALU_SLTX_lane0;
      execute_ctrl1_up_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 <= execute_ctrl0_down_early0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
      execute_ctrl1_up_SrcStageables_REVERT_lane0 <= execute_ctrl0_down_SrcStageables_REVERT_lane0;
      execute_ctrl1_up_SrcStageables_ZERO_lane0 <= execute_ctrl0_down_SrcStageables_ZERO_lane0;
      execute_ctrl1_up_lane0_IntFormatPlugin_logic_SIGNED_lane0 <= execute_ctrl0_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
      execute_ctrl1_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 <= execute_ctrl0_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
      execute_ctrl1_up_BYPASSED_AT_1_lane0 <= execute_ctrl0_down_BYPASSED_AT_1_lane0;
      execute_ctrl1_up_BYPASSED_AT_2_lane0 <= execute_ctrl0_down_BYPASSED_AT_2_lane0;
      execute_ctrl1_up_MAY_FLUSH_PRECISE_2_lane0 <= execute_ctrl0_down_MAY_FLUSH_PRECISE_2_lane0;
      execute_ctrl1_up_MAY_FLUSH_PRECISE_3_lane0 <= execute_ctrl0_down_MAY_FLUSH_PRECISE_3_lane0;
      execute_ctrl1_up_SrcStageables_UNSIGNED_lane0 <= execute_ctrl0_down_SrcStageables_UNSIGNED_lane0;
      execute_ctrl1_up_IterativeShifterPlugin_LEFT_lane0 <= execute_ctrl0_down_IterativeShifterPlugin_LEFT_lane0;
      execute_ctrl1_up_IterativeShifterPlugin_ARITHMETIC_lane0 <= execute_ctrl0_down_IterativeShifterPlugin_ARITHMETIC_lane0;
      execute_ctrl1_up_IterativeShifterPlugin_IS_W_lane0 <= execute_ctrl0_down_IterativeShifterPlugin_IS_W_lane0;
      execute_ctrl1_up_IterativeShifterPlugin_IS_W_RIGHT_lane0 <= execute_ctrl0_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
      execute_ctrl1_up_BranchPlugin_BRANCH_CTRL_lane0 <= execute_ctrl0_down_BranchPlugin_BRANCH_CTRL_lane0;
      execute_ctrl1_up_CsrAccessPlugin_CSR_IMM_lane0 <= execute_ctrl0_down_CsrAccessPlugin_CSR_IMM_lane0;
      execute_ctrl1_up_CsrAccessPlugin_CSR_MASK_lane0 <= execute_ctrl0_down_CsrAccessPlugin_CSR_MASK_lane0;
      execute_ctrl1_up_CsrAccessPlugin_CSR_CLEAR_lane0 <= execute_ctrl0_down_CsrAccessPlugin_CSR_CLEAR_lane0;
      execute_ctrl1_up_AguPlugin_LOAD_lane0 <= execute_ctrl0_down_AguPlugin_LOAD_lane0;
      execute_ctrl1_up_AguPlugin_STORE_lane0 <= execute_ctrl0_down_AguPlugin_STORE_lane0;
      execute_ctrl1_up_AguPlugin_ATOMIC_lane0 <= execute_ctrl0_down_AguPlugin_ATOMIC_lane0;
      execute_ctrl1_up_AguPlugin_FLOAT_lane0 <= execute_ctrl0_down_AguPlugin_FLOAT_lane0;
      execute_ctrl1_up_early0_EnvPlugin_OP_lane0 <= execute_ctrl0_down_early0_EnvPlugin_OP_lane0;
      execute_ctrl1_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0 <= execute_ctrl0_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
      execute_ctrl1_up_late0_IntAluPlugin_ALU_SLTX_lane0 <= execute_ctrl0_down_late0_IntAluPlugin_ALU_SLTX_lane0;
      execute_ctrl1_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 <= execute_ctrl0_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
      execute_ctrl1_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0 <= execute_ctrl0_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
      execute_ctrl1_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0 <= execute_ctrl0_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
    end
    if(execute_ctrl1_down_isReady) begin
      execute_ctrl2_up_Decode_UOP_lane0 <= execute_ctrl1_down_Decode_UOP_lane0;
      execute_ctrl2_up_Prediction_ALIGNED_JUMPED_lane0 <= execute_ctrl1_down_Prediction_ALIGNED_JUMPED_lane0;
      execute_ctrl2_up_Prediction_ALIGNED_JUMPED_PC_lane0 <= execute_ctrl1_down_Prediction_ALIGNED_JUMPED_PC_lane0;
      execute_ctrl2_up_PC_lane0 <= execute_ctrl1_down_PC_lane0;
      execute_ctrl2_up_TRAP_lane0 <= execute_ctrl1_down_TRAP_lane0;
      execute_ctrl2_up_Decode_UOP_ID_lane0 <= execute_ctrl1_down_Decode_UOP_ID_lane0;
      execute_ctrl2_up_RS1_PHYS_lane0 <= execute_ctrl1_down_RS1_PHYS_lane0;
      execute_ctrl2_up_RS2_PHYS_lane0 <= execute_ctrl1_down_RS2_PHYS_lane0;
      execute_ctrl2_up_RD_ENABLE_lane0 <= execute_ctrl1_down_RD_ENABLE_lane0;
      execute_ctrl2_up_RD_PHYS_lane0 <= execute_ctrl1_down_RD_PHYS_lane0;
      execute_ctrl2_up_COMPLETED_lane0 <= execute_ctrl1_down_COMPLETED_lane0;
      execute_ctrl2_up_AguPlugin_SIZE_lane0 <= execute_ctrl1_down_AguPlugin_SIZE_lane0;
      execute_ctrl2_up_integer_RS1_lane0 <= execute_ctrl1_down_integer_RS1_lane0;
      execute_ctrl2_up_integer_RS2_lane0 <= execute_ctrl1_down_integer_RS2_lane0;
      execute_ctrl2_up_early0_IterativeShifterPlugin_SEL_lane0 <= execute_ctrl1_down_early0_IterativeShifterPlugin_SEL_lane0;
      execute_ctrl2_up_early0_BranchPlugin_SEL_lane0 <= execute_ctrl1_down_early0_BranchPlugin_SEL_lane0;
      execute_ctrl2_up_late0_IntAluPlugin_SEL_lane0 <= execute_ctrl1_down_late0_IntAluPlugin_SEL_lane0;
      execute_ctrl2_up_late0_IterativeShifterPlugin_SEL_lane0 <= execute_ctrl1_down_late0_IterativeShifterPlugin_SEL_lane0;
      execute_ctrl2_up_late0_BranchPlugin_SEL_lane0 <= execute_ctrl1_down_late0_BranchPlugin_SEL_lane0;
      execute_ctrl2_up_CsrAccessPlugin_SEL_lane0 <= execute_ctrl1_down_CsrAccessPlugin_SEL_lane0;
      execute_ctrl2_up_AguPlugin_SEL_lane0 <= execute_ctrl1_down_AguPlugin_SEL_lane0;
      execute_ctrl2_up_lane0_integer_WriteBackPlugin_SEL_lane0 <= execute_ctrl1_down_lane0_integer_WriteBackPlugin_SEL_lane0;
      execute_ctrl2_up_COMPLETION_AT_2_lane0 <= execute_ctrl1_down_COMPLETION_AT_2_lane0;
      execute_ctrl2_up_COMPLETION_AT_3_lane0 <= execute_ctrl1_down_COMPLETION_AT_3_lane0;
      execute_ctrl2_up_lane0_logic_completions_onCtrl_1_ENABLE_lane0 <= execute_ctrl1_down_lane0_logic_completions_onCtrl_1_ENABLE_lane0;
      execute_ctrl2_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0 <= execute_ctrl1_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
      execute_ctrl2_up_SrcStageables_REVERT_lane0 <= execute_ctrl1_down_SrcStageables_REVERT_lane0;
      execute_ctrl2_up_SrcStageables_ZERO_lane0 <= execute_ctrl1_down_SrcStageables_ZERO_lane0;
      execute_ctrl2_up_lane0_IntFormatPlugin_logic_SIGNED_lane0 <= execute_ctrl1_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
      execute_ctrl2_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 <= execute_ctrl1_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
      execute_ctrl2_up_BYPASSED_AT_2_lane0 <= execute_ctrl1_down_BYPASSED_AT_2_lane0;
      execute_ctrl2_up_MAY_FLUSH_PRECISE_2_lane0 <= execute_ctrl1_down_MAY_FLUSH_PRECISE_2_lane0;
      execute_ctrl2_up_SrcStageables_UNSIGNED_lane0 <= execute_ctrl1_down_SrcStageables_UNSIGNED_lane0;
      execute_ctrl2_up_IterativeShifterPlugin_LEFT_lane0 <= execute_ctrl1_down_IterativeShifterPlugin_LEFT_lane0;
      execute_ctrl2_up_IterativeShifterPlugin_ARITHMETIC_lane0 <= execute_ctrl1_down_IterativeShifterPlugin_ARITHMETIC_lane0;
      execute_ctrl2_up_IterativeShifterPlugin_IS_W_lane0 <= execute_ctrl1_down_IterativeShifterPlugin_IS_W_lane0;
      execute_ctrl2_up_IterativeShifterPlugin_IS_W_RIGHT_lane0 <= execute_ctrl1_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
      execute_ctrl2_up_BranchPlugin_BRANCH_CTRL_lane0 <= execute_ctrl1_down_BranchPlugin_BRANCH_CTRL_lane0;
      execute_ctrl2_up_AguPlugin_LOAD_lane0 <= execute_ctrl1_down_AguPlugin_LOAD_lane0;
      execute_ctrl2_up_AguPlugin_STORE_lane0 <= execute_ctrl1_down_AguPlugin_STORE_lane0;
      execute_ctrl2_up_AguPlugin_ATOMIC_lane0 <= execute_ctrl1_down_AguPlugin_ATOMIC_lane0;
      execute_ctrl2_up_AguPlugin_FLOAT_lane0 <= execute_ctrl1_down_AguPlugin_FLOAT_lane0;
      execute_ctrl2_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0 <= execute_ctrl1_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
      execute_ctrl2_up_late0_IntAluPlugin_ALU_SLTX_lane0 <= execute_ctrl1_down_late0_IntAluPlugin_ALU_SLTX_lane0;
      execute_ctrl2_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 <= execute_ctrl1_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
      execute_ctrl2_up_late0_SrcPlugin_logic_SRC1_CTRL_lane0 <= execute_ctrl1_down_late0_SrcPlugin_logic_SRC1_CTRL_lane0;
      execute_ctrl2_up_late0_SrcPlugin_logic_SRC2_CTRL_lane0 <= execute_ctrl1_down_late0_SrcPlugin_logic_SRC2_CTRL_lane0;
      execute_ctrl2_up_COMMIT_lane0 <= execute_ctrl1_down_COMMIT_lane0;
      execute_ctrl2_up_early0_SrcPlugin_ADD_SUB_lane0 <= execute_ctrl1_down_early0_SrcPlugin_ADD_SUB_lane0;
      execute_ctrl2_up_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0 <= execute_ctrl1_down_early0_IterativeShifterPlugin_SHIFT_RESULT_lane0;
      execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 <= execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
      execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 <= execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
      execute_ctrl2_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 <= execute_ctrl1_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
      execute_ctrl2_up_MMU_TRANSLATED_lane0 <= execute_ctrl1_down_MMU_TRANSLATED_lane0;
      execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault <= execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
      execute_ctrl2_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io <= execute_ctrl1_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
      execute_ctrl2_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0 <= execute_ctrl1_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
    end
    if(execute_ctrl2_down_isReady) begin
      execute_ctrl3_up_Decode_UOP_lane0 <= execute_ctrl2_down_Decode_UOP_lane0;
      execute_ctrl3_up_Prediction_ALIGNED_JUMPED_lane0 <= execute_ctrl2_down_Prediction_ALIGNED_JUMPED_lane0;
      execute_ctrl3_up_Prediction_ALIGNED_JUMPED_PC_lane0 <= execute_ctrl2_down_Prediction_ALIGNED_JUMPED_PC_lane0;
      execute_ctrl3_up_PC_lane0 <= execute_ctrl2_down_PC_lane0;
      execute_ctrl3_up_TRAP_lane0 <= execute_ctrl2_down_TRAP_lane0;
      execute_ctrl3_up_Decode_UOP_ID_lane0 <= execute_ctrl2_down_Decode_UOP_ID_lane0;
      execute_ctrl3_up_RD_ENABLE_lane0 <= execute_ctrl2_down_RD_ENABLE_lane0;
      execute_ctrl3_up_RD_PHYS_lane0 <= execute_ctrl2_down_RD_PHYS_lane0;
      execute_ctrl3_up_COMPLETED_lane0 <= execute_ctrl2_down_COMPLETED_lane0;
      execute_ctrl3_up_AguPlugin_SIZE_lane0 <= execute_ctrl2_down_AguPlugin_SIZE_lane0;
      execute_ctrl3_up_integer_RS1_lane0 <= execute_ctrl2_down_integer_RS1_lane0;
      execute_ctrl3_up_early0_BranchPlugin_SEL_lane0 <= execute_ctrl2_down_early0_BranchPlugin_SEL_lane0;
      execute_ctrl3_up_late0_IntAluPlugin_SEL_lane0 <= execute_ctrl2_down_late0_IntAluPlugin_SEL_lane0;
      execute_ctrl3_up_late0_IterativeShifterPlugin_SEL_lane0 <= execute_ctrl2_down_late0_IterativeShifterPlugin_SEL_lane0;
      execute_ctrl3_up_late0_BranchPlugin_SEL_lane0 <= execute_ctrl2_down_late0_BranchPlugin_SEL_lane0;
      execute_ctrl3_up_AguPlugin_SEL_lane0 <= execute_ctrl2_down_AguPlugin_SEL_lane0;
      execute_ctrl3_up_lane0_integer_WriteBackPlugin_SEL_lane0 <= execute_ctrl2_down_lane0_integer_WriteBackPlugin_SEL_lane0;
      execute_ctrl3_up_COMPLETION_AT_3_lane0 <= execute_ctrl2_down_COMPLETION_AT_3_lane0;
      execute_ctrl3_up_lane0_logic_completions_onCtrl_2_ENABLE_lane0 <= execute_ctrl2_down_lane0_logic_completions_onCtrl_2_ENABLE_lane0;
      execute_ctrl3_up_SrcStageables_REVERT_lane0 <= execute_ctrl2_down_SrcStageables_REVERT_lane0;
      execute_ctrl3_up_SrcStageables_ZERO_lane0 <= execute_ctrl2_down_SrcStageables_ZERO_lane0;
      execute_ctrl3_up_lane0_IntFormatPlugin_logic_SIGNED_lane0 <= execute_ctrl2_down_lane0_IntFormatPlugin_logic_SIGNED_lane0;
      execute_ctrl3_up_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0 <= execute_ctrl2_down_lane0_IntFormatPlugin_logic_WIDTH_ID_lane0;
      execute_ctrl3_up_SrcStageables_UNSIGNED_lane0 <= execute_ctrl2_down_SrcStageables_UNSIGNED_lane0;
      execute_ctrl3_up_IterativeShifterPlugin_LEFT_lane0 <= execute_ctrl2_down_IterativeShifterPlugin_LEFT_lane0;
      execute_ctrl3_up_IterativeShifterPlugin_ARITHMETIC_lane0 <= execute_ctrl2_down_IterativeShifterPlugin_ARITHMETIC_lane0;
      execute_ctrl3_up_IterativeShifterPlugin_IS_W_lane0 <= execute_ctrl2_down_IterativeShifterPlugin_IS_W_lane0;
      execute_ctrl3_up_IterativeShifterPlugin_IS_W_RIGHT_lane0 <= execute_ctrl2_down_IterativeShifterPlugin_IS_W_RIGHT_lane0;
      execute_ctrl3_up_BranchPlugin_BRANCH_CTRL_lane0 <= execute_ctrl2_down_BranchPlugin_BRANCH_CTRL_lane0;
      execute_ctrl3_up_AguPlugin_LOAD_lane0 <= execute_ctrl2_down_AguPlugin_LOAD_lane0;
      execute_ctrl3_up_AguPlugin_ATOMIC_lane0 <= execute_ctrl2_down_AguPlugin_ATOMIC_lane0;
      execute_ctrl3_up_AguPlugin_FLOAT_lane0 <= execute_ctrl2_down_AguPlugin_FLOAT_lane0;
      execute_ctrl3_up_late0_IntAluPlugin_ALU_ADD_SUB_lane0 <= execute_ctrl2_down_late0_IntAluPlugin_ALU_ADD_SUB_lane0;
      execute_ctrl3_up_late0_IntAluPlugin_ALU_SLTX_lane0 <= execute_ctrl2_down_late0_IntAluPlugin_ALU_SLTX_lane0;
      execute_ctrl3_up_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0 <= execute_ctrl2_down_late0_IntAluPlugin_ALU_BITWISE_CTRL_lane0;
      execute_ctrl3_up_COMMIT_lane0 <= execute_ctrl2_down_COMMIT_lane0;
      execute_ctrl3_up_early0_SrcPlugin_ADD_SUB_lane0 <= execute_ctrl2_down_early0_SrcPlugin_ADD_SUB_lane0;
      execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_TRUE_lane0 <= execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_TRUE_lane0;
      execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_FALSE_lane0 <= execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_FALSE_lane0;
      execute_ctrl3_up_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0 <= execute_ctrl2_down_early0_BranchPlugin_pcCalc_PC_LAST_SLICE_lane0;
      execute_ctrl3_up_MMU_TRANSLATED_lane0 <= execute_ctrl2_down_MMU_TRANSLATED_lane0;
      execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault <= execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_fault;
      execute_ctrl3_up_LsuCachelessPlugin_logic_onPma_RSP_lane0_io <= execute_ctrl2_down_LsuCachelessPlugin_logic_onPma_RSP_lane0_io;
      execute_ctrl3_up_lane0_integer_WriteBackPlugin_logic_DATA_lane0 <= execute_ctrl2_down_lane0_integer_WriteBackPlugin_logic_DATA_lane0;
      execute_ctrl3_up_late0_SrcPlugin_SRC1_lane0 <= execute_ctrl2_down_late0_SrcPlugin_SRC1_lane0;
      execute_ctrl3_up_late0_SrcPlugin_SRC2_lane0 <= execute_ctrl2_down_late0_SrcPlugin_SRC2_lane0;
      execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0 <= execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_SC_MISS_lane0;
      execute_ctrl3_up_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0 <= execute_ctrl2_down_LsuCachelessPlugin_logic_onJoin_READ_DATA_lane0;
    end
    if(execute_ctrl3_down_isReady) begin
      execute_ctrl4_up_COMMIT_lane0 <= execute_ctrl3_down_COMMIT_lane0;
    end
    case(TrapPlugin_logic_harts_0_trap_fsm_stateReg)
      TrapPlugin_logic_harts_0_trap_fsm_RUNNING : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_PROCESS_1 : begin
        TrapPlugin_logic_harts_0_trap_fsm_triggerEbreakReg <= TrapPlugin_logic_harts_0_trap_fsm_triggerEbreak;
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVAL : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_TVEC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_TRAP_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_EPC : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_XRET_APPLY : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_JUMP : begin
      end
      TrapPlugin_logic_harts_0_trap_fsm_FETCH_FLUSH : begin
      end
      default : begin
      end
    endcase
    case(CsrAccessPlugin_logic_fsm_stateReg)
      CsrAccessPlugin_logic_fsm_READ : begin
        CsrAccessPlugin_logic_fsm_regs_aluInput <= CsrAccessPlugin_bus_read_toWriteBits;
        CsrAccessPlugin_logic_fsm_regs_csrValue <= CsrAccessPlugin_logic_fsm_readLogic_csrValue;
      end
      CsrAccessPlugin_logic_fsm_WRITE : begin
      end
      CsrAccessPlugin_logic_fsm_COMPLETION : begin
      end
      default : begin
        REG_CSR_1952 <= COMB_CSR_1952;
        REG_CSR_1953 <= COMB_CSR_1953;
        REG_CSR_1954 <= COMB_CSR_1954;
        REG_CSR_3857 <= COMB_CSR_3857;
        REG_CSR_3858 <= COMB_CSR_3858;
        REG_CSR_3859 <= COMB_CSR_3859;
        REG_CSR_3860 <= COMB_CSR_3860;
        REG_CSR_769 <= COMB_CSR_769;
        REG_CSR_768 <= COMB_CSR_768;
        REG_CSR_834 <= COMB_CSR_834;
        REG_CSR_836 <= COMB_CSR_836;
        REG_CSR_772 <= COMB_CSR_772;
        REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter <= COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_tvecFilter;
        REG_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter <= COMB_CSR_PrivilegedPlugin_logic_readAnyWriteLegal_epcFilter;
        REG_CSR_CsrRamPlugin_csrMapper_selFilter <= COMB_CSR_CsrRamPlugin_csrMapper_selFilter;
        REG_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter <= COMB_CSR_CsrAccessPlugin_logic_trapNextOnWriteFilter;
      end
    endcase
  end


endmodule

module RegFileMem (
  input  wire          io_writes_0_valid,
  input  wire [4:0]    io_writes_0_address,
  input  wire [63:0]   io_writes_0_data,
  input  wire [15:0]   io_writes_0_uopId,
  input  wire          io_reads_0_valid,
  input  wire [4:0]    io_reads_0_address,
  output wire [63:0]   io_reads_0_data,
  input  wire          io_reads_1_valid,
  input  wire [4:0]    io_reads_1_address,
  output wire [63:0]   io_reads_1_data,
  input  wire          clk,
  input  wire          reset
);

  wire       [63:0]   asMem_ram_spinal_port1;
  wire       [63:0]   asMem_ram_spinal_port2;
  reg                 _zz_1;
  wire                conv_writes_0_valid;
  wire       [4:0]    conv_writes_0_payload_address;
  wire       [63:0]   conv_writes_0_payload_data;
  wire                conv_read_0_cmd_valid;
  wire       [4:0]    conv_read_0_cmd_payload;
  wire       [63:0]   conv_read_0_rsp;
  wire                conv_read_1_cmd_valid;
  wire       [4:0]    conv_read_1_cmd_payload;
  wire       [63:0]   conv_read_1_rsp;
  wire                asMem_writes_0_port_valid;
  wire       [4:0]    asMem_writes_0_port_payload_address;
  wire       [63:0]   asMem_writes_0_port_payload_data;
  wire       [4:0]    asMem_reads_0_async_port_address;
  wire       [63:0]   asMem_reads_0_async_port_data;
  wire       [4:0]    asMem_reads_1_async_port_address;
  wire       [63:0]   asMem_reads_1_async_port_data;
  (* ram_style = "distributed" *) reg [63:0] asMem_ram [0:31] /* verilator public */ ;

  always @(posedge clk) begin
    if(_zz_1) begin
      asMem_ram[asMem_writes_0_port_payload_address] <= asMem_writes_0_port_payload_data;
    end
  end

  assign asMem_ram_spinal_port1 = asMem_ram[asMem_reads_0_async_port_address];
  assign asMem_ram_spinal_port2 = asMem_ram[asMem_reads_1_async_port_address];
  always @(*) begin
    _zz_1 = 1'b0;
    if(asMem_writes_0_port_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign conv_writes_0_valid = io_writes_0_valid;
  assign conv_writes_0_payload_address = io_writes_0_address;
  assign conv_writes_0_payload_data = io_writes_0_data;
  assign conv_read_0_cmd_valid = io_reads_0_valid;
  assign conv_read_0_cmd_payload = io_reads_0_address;
  assign io_reads_0_data = conv_read_0_rsp;
  assign conv_read_1_cmd_valid = io_reads_1_valid;
  assign conv_read_1_cmd_payload = io_reads_1_address;
  assign io_reads_1_data = conv_read_1_rsp;
  assign asMem_writes_0_port_valid = conv_writes_0_valid;
  assign asMem_writes_0_port_payload_address = conv_writes_0_payload_address;
  assign asMem_writes_0_port_payload_data = conv_writes_0_payload_data;
  assign asMem_reads_0_async_port_data = asMem_ram_spinal_port1;
  assign asMem_reads_0_async_port_address = conv_read_0_cmd_payload;
  assign conv_read_0_rsp = asMem_reads_0_async_port_data;
  assign asMem_reads_1_async_port_data = asMem_ram_spinal_port2;
  assign asMem_reads_1_async_port_address = conv_read_1_cmd_payload;
  assign conv_read_1_rsp = asMem_reads_1_async_port_data;

endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_pcOnLastSlice,
  input  wire [31:0]   io_inputs_0_payload_pcTarget,
  input  wire          io_inputs_0_payload_taken,
  input  wire          io_inputs_0_payload_isBranch,
  input  wire          io_inputs_0_payload_isPush,
  input  wire          io_inputs_0_payload_isPop,
  input  wire          io_inputs_0_payload_wasWrong,
  input  wire          io_inputs_0_payload_badPredictedTarget,
  input  wire [15:0]   io_inputs_0_payload_uopId,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_pcOnLastSlice,
  output wire [31:0]   io_output_payload_pcTarget,
  output wire          io_output_payload_taken,
  output wire          io_output_payload_isBranch,
  output wire          io_output_payload_isPush,
  output wire          io_output_payload_isPop,
  output wire          io_output_payload_wasWrong,
  output wire          io_output_payload_badPredictedTarget,
  output wire [15:0]   io_output_payload_uopId,
  output wire [0:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  wire                locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign locked = 1'b0;
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_pcOnLastSlice = io_inputs_0_payload_pcOnLastSlice;
  assign io_output_payload_pcTarget = io_inputs_0_payload_pcTarget;
  assign io_output_payload_taken = io_inputs_0_payload_taken;
  assign io_output_payload_isBranch = io_inputs_0_payload_isBranch;
  assign io_output_payload_isPush = io_inputs_0_payload_isPush;
  assign io_output_payload_isPop = io_inputs_0_payload_isPop;
  assign io_output_payload_wasWrong = io_inputs_0_payload_wasWrong;
  assign io_output_payload_badPredictedTarget = io_inputs_0_payload_badPredictedTarget;
  assign io_output_payload_uopId = io_inputs_0_payload_uopId;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
    end
  end


endmodule
