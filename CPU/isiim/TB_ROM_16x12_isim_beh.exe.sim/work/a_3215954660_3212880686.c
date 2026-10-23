/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Shared_back_up/CPU/computer/Rom_16x12_tb.vhd";
extern char *IEEE_P_1242562249;
extern char *STD_STANDARD;

char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );


static void work_a_3215954660_3212880686_p_0(char *t0)
{
    char t6[16];
    char t26[16];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int64 t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t29;
    char *t30;
    int t31;
    unsigned int t32;
    unsigned int t33;

LAB0:    t1 = (t0 + 2464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 5232);
    *((int *)t2) = 0;
    t3 = (t0 + 5236);
    *((int *)t3) = 15;
    t4 = 0;
    t5 = 15;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 5278);
    xsi_report(t2, 17U, (unsigned char)0);
    xsi_set_current_line(61, ng0);

LAB23:    *((char **)t1) = &&LAB24;

LAB1:    return;
LAB5:    xsi_set_current_line(47, ng0);
    t7 = (t0 + 5232);
    t8 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 4);
    t9 = (t0 + 2848);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 4U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(49, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 2272);
    xsi_process_wait(t2, t14);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 5232);
    t4 = *((int *)t2);
    t3 = (t0 + 5236);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB20:    t15 = (t4 + 1);
    t4 = t15;
    t7 = (t0 + 5232);
    *((int *)t7) = t4;
    goto LAB4;

LAB8:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1488U);
    t7 = *((char **)t2);
    t2 = (t0 + 5232);
    t15 = *((int *)t2);
    t16 = (t15 - 0);
    t17 = (t16 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, *((int *)t2));
    t18 = (12U * t17);
    t19 = (0 + t18);
    t8 = (t7 + t19);
    t20 = 1;
    if (12U == 12U)
        goto LAB14;

LAB15:    t20 = 0;

LAB16:    if (t20 == 0)
        goto LAB12;

LAB13:    goto LAB6;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t11 = (t0 + 5240);
    t13 = ((STD_STANDARD) + 384);
    t22 = (t0 + 5232);
    t23 = xsi_int_to_mem(*((int *)t22));
    t24 = xsi_string_variable_get_image(t6, t13, t23);
    t27 = ((STD_STANDARD) + 984);
    t29 = (t28 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 1;
    t30 = (t29 + 4U);
    *((int *)t30) = 38;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t31 = (38 - 1);
    t32 = (t31 * 1);
    t32 = (t32 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t32;
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t11, t28, (char)97, t24, t6, (char)101);
    t30 = (t6 + 12U);
    t32 = *((unsigned int *)t30);
    t33 = (38U + t32);
    xsi_report(t25, t33, (unsigned char)2);
    goto LAB13;

LAB14:    t21 = 0;

LAB17:    if (t21 < 12U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t9 = (t3 + t21);
    t10 = (t8 + t21);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB15;

LAB19:    t21 = (t21 + 1);
    goto LAB17;

LAB21:    goto LAB2;

LAB22:    goto LAB21;

LAB24:    goto LAB22;

}


extern void work_a_3215954660_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3215954660_3212880686_p_0};
	xsi_register_didat("work_a_3215954660_3212880686", "isim/TB_ROM_16x12_isim_beh.exe.sim/work/a_3215954660_3212880686.didat");
	xsi_register_executes(pe);
}
