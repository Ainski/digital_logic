/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#define CC_CLANG

#include "iki.h"
#ifdef __GNUC__
#include <stdlib.h>
#else
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#define CC_CLANG

#include "iki.h"
#ifdef __GNUC__
#include <stdlib.h>
#else
#define alloca _alloca
#endif
void relocate(char *dp) _asm("_relocate");

void relocate(char *dp)
{
	_iki_relocate(dp, "xsim.dir/de_selector14_tb_behav/xsim.reloc", "xsim.dir/de_selector14_tb_behav/xsimk.exe", (void*)relocate);

	/*Populate the transaction function pointer field in the whole net structure */
}
void sensitize(char *dp) _asm("_sensitize");

void sensitize(char *dp)
{
	_iki_sensitize(dp, "xsim.dir/de_selector14_tb_behav/xsim.reloc");
}
void simulate(char *dp) _asm("_simulate");

void simulate(char *dp)
{
	_iki_schedule_processes_at_time_zero(dp, "xsim.dir/de_selector14_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	_iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#define CC_CLANG
#include "iki_bridge.h"
void relocate(char *dp) _asm("_relocate");
void sensitize(char *dp) _asm("_sensitize");
void simulate(char *dp) _asm("_simulate");
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int _main(int argc, char **argv)
{
_iki_heap_initialize("ms", "isimmm", 0, 10485760) ;
    void* design_handle = _iki_create_design("xsim.dir/de_selector14_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, _isimBridge_getWdbWriter(), 0, argc, argv);
     _iki_set_sv_type_file_path_name("xsim.dir/de_selector14_tb_behav/xsim.svtype");
    (void* ) design_handle;
    return _iki_simulate_design();
}
