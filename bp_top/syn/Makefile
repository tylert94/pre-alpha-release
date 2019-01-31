## Top level source directory should include 
# bp_top, bp_fe, bp_be, bp_me, bp_common, bsg_ip_cores, verilator, systemc
TOP            = $(CURDIR)/../..
BP_TOP_PATH	   = $(TOP)/bp_top
BP_FE_PATH	   = $(TOP)/bp_fe
BP_BE_PATH	   = $(TOP)/bp_be
BP_ME_PATH 	   = $(TOP)/bp_me
BP_COMMON_PATH = $(TOP)/bp_common

CADENV_PATH    = $(TOP)/bsg_cadenv
BSG_IP_PATH	   = $(TOP)/bsg_ip_cores
VERILATOR_PATH = $(TOP)/verilator
SYSTEMC_PATH   = $(TOP)/systemc

SRC_PATH	= $(BP_TOP_PATH)/src/v
TB_PATH		= $(BP_TOP_PATH)/test/tb
SYN_PATH	= $(BP_TOP_PATH)/syn

# All synthesizable sources 
# Nonsynth and test sources are added in tool-specific files
HDL_SOURCE=\
	$(BP_COMMON_PATH)/bp_common_pkg.vh\
	$(BP_COMMON_PATH)/bp_common_fe_be_if.vh\
	$(BP_COMMON_PATH)/bp_common_me_if.vh\
	\
	$(BSG_IP_PATH)/bsg_noc/bsg_noc_pkg.v\
	$(BSG_IP_PATH)/bsg_dataflow/bsg_fifo_1r1w_small.v\
	$(BSG_IP_PATH)/bsg_dataflow/bsg_fifo_tracker.v\
	$(BSG_IP_PATH)/bsg_dataflow/bsg_shift_reg.v\
	$(BSG_IP_PATH)/bsg_dataflow/bsg_two_fifo.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_2r1w_sync_synth.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1r1w.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1r1w_sync.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1r1w_sync_synth.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1r1w_synth.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync_synth.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync_mask_write_bit_synth.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.v\
	$(BSG_IP_PATH)/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_adder_ripple_carry.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_circular_ptr.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_counter_clear_up.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_crossbar_o_by_i.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_decode_with_v.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_dff.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_dff_chain.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_dff_en.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_dff_reset.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_encode_one_hot.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_mux.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_mux_one_hot.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_mux_segmented.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_priority_encode_one_hot_out.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_priority_encode.v\
	$(BSG_IP_PATH)/bsg_fsb/bsg_fsb_node_trace_replay.v\
	$(BSG_IP_PATH)/bsg_noc/bsg_mesh_router_buffered.v\
	$(BSG_IP_PATH)/bsg_noc/bsg_mesh_router.v\
	$(BSG_IP_PATH)/bsg_misc/bsg_round_robin_arb.v\
	\
	$(BP_BE_PATH)/bp_dcache/include/bp_dcache_lce_pkg.vh\
	$(BP_BE_PATH)/bp_dcache/include/bp_dcache_pkg.vh\
	$(BP_BE_PATH)/v/bp_be_top.v\
	$(BP_BE_PATH)/v/bp_be_checker.v\
	$(BP_BE_PATH)/v/bp_be_fe_adapter.v\
	$(BP_BE_PATH)/v/bp_be_calculator.v\
	$(BP_BE_PATH)/v/bp_be_instr_decoder.v\
	$(BP_BE_PATH)/v/bp_be_calc_bypass.v\
	$(BP_BE_PATH)/v/bp_be_pipe_int.v\
	$(BP_BE_PATH)/v/bp_be_pipe_mul.v\
	$(BP_BE_PATH)/v/bp_be_pipe_mem.v\
	$(BP_BE_PATH)/v/bp_be_pipe_fp.v\
	$(BP_BE_PATH)/v/bp_be_mmu.v\
	$(BP_BE_PATH)/v/bp_be_int_alu.v\
	$(BP_BE_PATH)/v/bp_be_regfile.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_lce.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_lru_decode.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_lru_encode.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_wbuf_queue.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_wbuf.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_lce_cce_req.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_cce_lce_cmd.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_cce_lce_data_cmd.v\
	$(BP_BE_PATH)/bp_dcache/v/bp_dcache_lce_lce_tr_resp_in.v\
	$(BP_BE_PATH)/v/bsg_decode.v\
	$(BP_BE_PATH)/v/bsg_dff_reset_en.v\
	$(BP_BE_PATH)/v/bsg_fifo_1r1w_rolly.v\
	$(BP_BE_PATH)/v/bsg_circular_ptr_resval.v\
	$(BP_BE_PATH)/v/bsg_pipeline.v\
	$(BP_BE_PATH)/v/bsg_scan.v\
	\
	$(BP_FE_PATH)/src/include/bp_fe_pc_gen_pkg.vh\
	$(BP_FE_PATH)/src/include/bp_fe_itlb_pkg.vh\
	$(BP_FE_PATH)/src/include/bp_fe_lce.vh\
	$(BP_FE_PATH)/src/include/bp_fe_pc_gen.vh\
	$(BP_FE_PATH)/src/include/bp_fe_icache.vh\
	$(BP_FE_PATH)/src/v/bp_fe_top.v\
	$(BP_FE_PATH)/src/v/bp_fe_itlb.v\
	$(BP_FE_PATH)/src/v/bp_fe_branch_predictor.v\
	$(BP_FE_PATH)/src/v/bp_fe_pc_gen.v\
	$(BP_FE_PATH)/src/v/bp_fe_icache.v\
	$(BP_FE_PATH)/src/v/bp_fe_lce.v\
	$(BP_FE_PATH)/src/v/bp_fe_cce_lce_cmd.v\
	$(BP_FE_PATH)/src/v/bp_fe_cce_lce_data_cmd.v\
	$(BP_FE_PATH)/src/v/bp_fe_lce_cce_req.v\
	$(BP_FE_PATH)/src/v/bp_fe_lce_lce_tr_resp_in.v\
	$(BP_FE_PATH)/src/v/bp_fe_bht.v\
	$(BP_FE_PATH)/src/v/bp_fe_btb.v\
	$(BP_FE_PATH)/src/v/bp_fe_instr_scan.v\
	\
	$(BP_ME_PATH)/src/include/v/bp_cce_inst_pkg.v\
	$(BP_ME_PATH)/test/common/bp_me_top.v\
	$(BP_ME_PATH)/test/common/bp_mem.v\
	$(BP_ME_PATH)/src/v/roms/bp_me_mem_rom_0.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_top.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_alu.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_dir.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_gad.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_inst_decode.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_pc.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce_reg.v\
	$(BP_ME_PATH)/src/v/cce/bp_cce.v\
	$(BP_ME_PATH)/src/v/network/bp_coherence_network.v\
	$(BP_ME_PATH)/src/v/network/bp_coherence_network_channel.v\
	\
	$(BP_BE_PATH)/tb/common/bp_multi_wrapper.v\
	\
	$(BP_BE_PATH)/bp_dcache/testing/v/mock_tlb.v

#$(BSG_IP_PATH)/bsg_test/bsg_nonsynth_clock_gen.v\
#$(BSG_IP_PATH)/bsg_test/bsg_nonsynth_reset_gen.v\

# Tests that all BP repos are present
test_env:
		[ -d $(BP_TOP_PATH)    ] && [ -d $(BP_FE_PATH)      ] && \
		[ -d $(BP_BE_PATH)     ] && [ -d $(BP_ME_PATH)      ] && \
		[ -d $(COMMON_PATH)    ] && [ -d $(BSG_IP_PATH)     ] && \
		[ -d $(CADENV_PATH)	   ] && [ -d $(VERILATOR_PATH)  ] && \
		[ -d $(SYSTEMC_PATH)   ] && 							 \
		echo "BP environment correctly set up!"

clean:
	rm -rf $(SYN_PATH)/obj_dir
	rm -rf csrc
	rm -rf ucli.key
	rm -rf inter.vpd
	rm -rf DVEfiles
	rm -rf *vpd
	rm -rf *simv
	rm -rf *simv.daidir

#include	$(SYN_PATH)/Makefile.verilator

#include $(SYN_PATH)/Makefile.vcs

include $(SYN_PATH)/Makefile.verilator
