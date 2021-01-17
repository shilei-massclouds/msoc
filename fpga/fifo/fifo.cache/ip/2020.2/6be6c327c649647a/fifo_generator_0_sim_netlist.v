// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sun Jan 10 16:03:53 2021
// Host        : cloud-Vostro-3471 running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "13" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "12" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* RST_ACTIVE_HIGH = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "ASYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst__1
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
SFoQ2tXDMrL2nCJbfpmHXuteJlKaWDWl3o9OY1miFvmYb8EDywmDpLUHQktJ/VoW+17fK5WHgFVI
FZV1B91GDQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mxGWDRjEAsKmBqldxevT1RKZvqK7vn0KlTODVXNGlRcGf9zOAmj0Z7Ppu79POBDb8oNQyCY+2q1q
BddzhQfh5WLIVX9BNUMIF6M6IF0elM4GMSLHGeYEwqSaMPC+thuR8FGj1J7z6rH+43gDYhtIeyY+
ZuZUz/Pqg8Lu63Xwe+0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HLwPjQzkuqv5FEDBriEJS2DikBeIHB/bWuVWooHY5ChdoHatcmqCHpSvnGxVzLwObZWHFys2nR9y
P3zxywjtgtOWq/n3cYVa5li6eyiUmGXv2OE8nw1nLnAY1kzBvGd6VwQ45t6l4Hx5+oqpIfuU2KI2
7/Qpj2atiTN3Y+q5He/BMXLIxF9vWuU6XL/+HsxriGAumcZDuESdidlxOztbW1bFhYr1/qWwou2q
wynnRVKYHL41aWycgFdkDoDEFFxv8ft8+F5Ux+J5Hg5XdgRULJc6uUQE/lDG3zOqzPftlODB52zU
d0cm8gFOvSZ2nO8ZB8THnxoAGe33iIZJfMcefA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jlR0iZ4fp9QXiFgaT07DMAK1YFLyBpsOGOOR9j2PWImFEh8oTBt4cvmGo+2z1Umbt9OMQwOhyepO
QIsKLFzUXYUba+SFFLBoCiaww24KICecbUfd3VV5sg2bEJjAdtYTT6mJqyc3vQRvBlONeBFdIGy2
AXqdK7QtXGLsLAIF/z4FG8cfG6nSD6e16gccBC6+kl5MoShdnmebKLyoo6UKFdMbDK88sHvTcD9S
LNCau6RK7FkTZg23FV0tf6cTP9Rray9YEcowm2AAh51Wldo2lGJ2W5iiDatRKH/W1bu7FGWZG+OT
+VZE+Ckiuf4T6cuu+G5IbrtMv6a4U93R0gtxXQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p/kq+JjPPJbOTWT2SRiPJ99/iH6kkVGEiluRRXpuRN+j+cVPgJD1v4QVjw3zMWLlvTGB7OOqC+JG
Lc62Wiizd/BFfGj2JYkTZMatcOWok7A87HK+vRTjr4nZMApD2jKaneJdU1279KsIEeRfImCQ2uRl
QRNMH3PPdNGYCnOGgNk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kyyI/O29YYc5VBwhz19i7AV7MC75r43hHVKAOTBiGBhRu8zZxCwGGcNFqc2HgHcWC6nq4jCIbIXf
S3FDzPdasegnERlWvoob9/SXM88zKsyeTbUf+DRu5lB8SPROBMaIhnj375C5XLowL17MXZdmB6fV
X5ukCg7cNhCjssKt/bIJibWkfna7hvj4ye+CLWmi3LdEiix8KTwRoBS3ZJrjM4/N6FfZkXerVxs+
txkhdsmG9ga1g/xErhTRilhqrV2WetlpX86qH/64sRGVxrWeEfNoHhMZsqEK0jWDx4WavKt8XY7W
NDzMXLZ2m5Dv5HMiJWgFG+ntPwgiYYtBuwu7Eg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tv6UL1ZWqo3dAIlhN5UTNGzJyqzdHpCqh217JPvIvHiWJgcFh2tw1n7HWnOPcK3VhCt31AGnCEFe
HpTiinXvHna65L2X2HhtNUrsgvZlUuh/oQR273wp5JPFDPD97NQ4ELkGI+w26HTYLgZ70K5rQo87
D4AkQNRuzTRS5G12yb4RU7ZYgmkYLuq1UyqjlxyN62Del4XoqZyivOGw5H+7wlfkNRu98iQwqq12
jthZbH/ue5wxZJUcb7NmEwL+3abpyDNmWs1qORHOFoE3t97/9XMmeSCpM2+KnSKJvsV5VbuoTCOT
964fsEh7ey4IVb4aum095gQjLCqTmDm8DWFmaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Oxo3AgNmVWgrXtMKDIThYfXr0YJfyFr7Bsjn2ge/G72mb25MA8Dbkd9ZZPtwqU1poazNnTng5Cx5
s8C1zMNEoo38jNY8zEUBjCCuasJgeMo5xsiha+3ZIBiuHS0KLrjLaPFIQZdsYevb44fg6J5YQLn5
jd1M6YdNMd1VwSezDxtbk9sN8ExPrmtwum/6L1ia9j9UlIzPTEaJ60Xz7tloPsgsbkborO2JLiIk
kIAY2q1b8tuhHzJ5DoXlvIo49wSDj75ncLrkwbAd26huob7aOmX1bS34pJLF17JzqYH0MoPJbHxb
RPdD+qUawXFsMSs2fOLnZrNxeG8L+TyAT0N8tQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CIR/vwxo0IBrPr5+bMp2YuBCQTNBRIIbqgEB18Oewkc8CuHzGCAgPyQUBUKaUG3bBy+KDOPVxBP5
cE/d3QYZAT11fyB1OMMTrjmEIZcr0Vk3nVTAnivoxxxkmdzPjkj0OcGcU9fMArPi3dfTgIsKdtCq
94+mV/70WeprgijzuZFWD7uH+gVioY/+rq/Wc1O6x1n949w8YGgSCTurUvhsobx2bonoC317J0Wm
IX17XRkSBIFgzqA8iC+GV5oCfxIGkihKmXxjIJbMamlOdCOycEkjkh3JYmm7TLNxmI65iffsabR0
t5+iI0l8eJxFhElzWeREqE43cnJYLaKZBUA+DA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69968)
`pragma protect data_block
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
eGMLyb7W5bxffDZQbPpGAuPXbCzBqADYUhxRW4Q=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
