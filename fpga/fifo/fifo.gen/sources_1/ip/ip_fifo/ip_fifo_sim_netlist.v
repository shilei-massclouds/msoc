// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sun Jan 10 16:03:53 2021
// Host        : cloud-Vostro-3471 running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top ip_fifo -prefix
//               ip_fifo_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ip_fifo
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
  ip_fifo_fifo_generator_v13_2_5 U0
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
module ip_fifo_xpm_cdc_async_rst
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
module ip_fifo_xpm_cdc_async_rst__1
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
module ip_fifo_xpm_cdc_gray
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
module ip_fifo_xpm_cdc_gray__2
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
module ip_fifo_xpm_cdc_single
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
module ip_fifo_xpm_cdc_single__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 68848)
`pragma protect data_block
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
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
