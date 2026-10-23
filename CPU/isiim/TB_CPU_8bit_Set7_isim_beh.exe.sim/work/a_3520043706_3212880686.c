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
static const char *ng0 = "/home/ise/Shared_back_up/CPU/computer/CPU_tb.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3520043706_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    unsigned char t8;
    unsigned char t9;

LAB0:    t1 = (t0 + 2984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(35, ng0);

LAB4:
LAB5:    xsi_set_current_line(36, ng0);
    t7 = (5 * 1000LL);
    t2 = (t0 + 2792);
    xsi_process_wait(t2, t7);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB6:;
LAB7:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(47, ng0);

LAB20:    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB8:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t9 = (t8 == (unsigned char)2);
    if (t9 != 0)
        goto LAB7;

LAB12:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(40, ng0);
    t7 = (5 * 1000LL);
    t2 = (t0 + 2792);
    xsi_process_wait(t2, t7);

LAB15:    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t9 = (t8 == (unsigned char)2);
    if (t9 != 0)
        goto LAB7;

LAB17:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

LAB18:    goto LAB2;

LAB19:    goto LAB18;

LAB21:    goto LAB19;

}

static void work_a_3520043706_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    int64 t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 3808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(55, ng0);

LAB6:    t2 = (t0 + 3552);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t4 = (t0 + 3552);
    *((int *)t4) = 0;
    xsi_set_current_line(56, ng0);

LAB10:    t2 = (t0 + 3568);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t4 = (t0 + 3568);
    *((int *)t4) = 0;
    xsi_set_current_line(57, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 5984);
    t7 = 1;
    if (8U == 8U)
        goto LAB18;

LAB19:    t7 = 0;

LAB20:    if (t7 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t7 = *((unsigned char *)t3);
    t12 = (t7 == (unsigned char)3);
    if (t12 == 0)
        goto LAB24;

LAB25:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 6032);
    t7 = 1;
    if (4U == 4U)
        goto LAB28;

LAB29:    t7 = 0;

LAB30:    if (t7 == 0)
        goto LAB26;

LAB27:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 6062);
    xsi_report(t2, 12U, (unsigned char)0);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(76, ng0);

LAB36:    t2 = (t0 + 3584);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    t10 = (t0 + 5992);
    xsi_report(t10, 15U, (unsigned char)2);
    goto LAB17;

LAB18:    t9 = 0;

LAB21:    if (t9 < 8U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB19;

LAB23:    t9 = (t9 + 1);
    goto LAB21;

LAB24:    t2 = (t0 + 6007);
    xsi_report(t2, 25U, (unsigned char)2);
    goto LAB25;

LAB26:    t10 = (t0 + 6036);
    xsi_report(t10, 26U, (unsigned char)2);
    goto LAB27;

LAB28:    t9 = 0;

LAB31:    if (t9 < 4U)
        goto LAB32;
    else
        goto LAB30;

LAB32:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB29;

LAB33:    t9 = (t9 + 1);
    goto LAB31;

LAB34:    t4 = (t0 + 3584);
    *((int *)t4) = 0;
    xsi_set_current_line(77, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB40:    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB35:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB34;
    else
        goto LAB36;

LAB37:    goto LAB35;

LAB38:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6074);
    t13 = 1;
    if (8U == 8U)
        goto LAB50;

LAB51:    t13 = 0;

LAB52:    if (t13 == 1)
        goto LAB47;

LAB48:    t12 = (unsigned char)0;

LAB49:    if (t12 == 1)
        goto LAB44;

LAB45:    t7 = (unsigned char)0;

LAB46:    if (t7 == 0)
        goto LAB42;

LAB43:    xsi_set_current_line(82, ng0);

LAB64:    t2 = (t0 + 3600);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

LAB42:    t22 = (t0 + 6086);
    xsi_report(t22, 12U, (unsigned char)2);
    goto LAB43;

LAB44:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6082);
    t18 = 1;
    if (4U == 4U)
        goto LAB56;

LAB57:    t18 = 0;

LAB58:    t7 = t18;
    goto LAB46;

LAB47:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)2);
    t12 = t15;
    goto LAB49;

LAB50:    t9 = 0;

LAB53:    if (t9 < 8U)
        goto LAB54;
    else
        goto LAB52;

LAB54:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB51;

LAB55:    t9 = (t9 + 1);
    goto LAB53;

LAB56:    t19 = 0;

LAB59:    if (t19 < 4U)
        goto LAB60;
    else
        goto LAB58;

LAB60:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB57;

LAB61:    t19 = (t19 + 1);
    goto LAB59;

LAB62:    t4 = (t0 + 3600);
    *((int *)t4) = 0;
    xsi_set_current_line(83, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB68:    *((char **)t1) = &&LAB69;
    goto LAB1;

LAB63:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB62;
    else
        goto LAB64;

LAB65:    goto LAB63;

LAB66:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6098);
    t13 = 1;
    if (8U == 8U)
        goto LAB78;

LAB79:    t13 = 0;

LAB80:    if (t13 == 1)
        goto LAB75;

LAB76:    t12 = (unsigned char)0;

LAB77:    if (t12 == 1)
        goto LAB72;

LAB73:    t7 = (unsigned char)0;

LAB74:    if (t7 == 0)
        goto LAB70;

LAB71:    xsi_set_current_line(88, ng0);

LAB92:    t2 = (t0 + 3616);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB93;
    goto LAB1;

LAB67:    goto LAB66;

LAB69:    goto LAB67;

LAB70:    t22 = (t0 + 6110);
    xsi_report(t22, 12U, (unsigned char)2);
    goto LAB71;

LAB72:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6106);
    t18 = 1;
    if (4U == 4U)
        goto LAB84;

LAB85:    t18 = 0;

LAB86:    t7 = t18;
    goto LAB74;

LAB75:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)2);
    t12 = t15;
    goto LAB77;

LAB78:    t9 = 0;

LAB81:    if (t9 < 8U)
        goto LAB82;
    else
        goto LAB80;

LAB82:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB79;

LAB83:    t9 = (t9 + 1);
    goto LAB81;

LAB84:    t19 = 0;

LAB87:    if (t19 < 4U)
        goto LAB88;
    else
        goto LAB86;

LAB88:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB85;

LAB89:    t19 = (t19 + 1);
    goto LAB87;

LAB90:    t4 = (t0 + 3616);
    *((int *)t4) = 0;
    xsi_set_current_line(89, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB96:    *((char **)t1) = &&LAB97;
    goto LAB1;

LAB91:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB90;
    else
        goto LAB92;

LAB93:    goto LAB91;

LAB94:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6122);
    t13 = 1;
    if (8U == 8U)
        goto LAB106;

LAB107:    t13 = 0;

LAB108:    if (t13 == 1)
        goto LAB103;

LAB104:    t12 = (unsigned char)0;

LAB105:    if (t12 == 1)
        goto LAB100;

LAB101:    t7 = (unsigned char)0;

LAB102:    if (t7 == 0)
        goto LAB98;

LAB99:    xsi_set_current_line(94, ng0);

LAB120:    t2 = (t0 + 3632);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB121;
    goto LAB1;

LAB95:    goto LAB94;

LAB97:    goto LAB95;

LAB98:    t22 = (t0 + 6134);
    xsi_report(t22, 12U, (unsigned char)2);
    goto LAB99;

LAB100:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6130);
    t18 = 1;
    if (4U == 4U)
        goto LAB112;

LAB113:    t18 = 0;

LAB114:    t7 = t18;
    goto LAB102;

LAB103:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)2);
    t12 = t15;
    goto LAB105;

LAB106:    t9 = 0;

LAB109:    if (t9 < 8U)
        goto LAB110;
    else
        goto LAB108;

LAB110:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB107;

LAB111:    t9 = (t9 + 1);
    goto LAB109;

LAB112:    t19 = 0;

LAB115:    if (t19 < 4U)
        goto LAB116;
    else
        goto LAB114;

LAB116:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB113;

LAB117:    t19 = (t19 + 1);
    goto LAB115;

LAB118:    t4 = (t0 + 3632);
    *((int *)t4) = 0;
    xsi_set_current_line(95, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB124:    *((char **)t1) = &&LAB125;
    goto LAB1;

LAB119:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB118;
    else
        goto LAB120;

LAB121:    goto LAB119;

LAB122:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6146);
    t13 = 1;
    if (8U == 8U)
        goto LAB134;

LAB135:    t13 = 0;

LAB136:    if (t13 == 1)
        goto LAB131;

LAB132:    t12 = (unsigned char)0;

LAB133:    if (t12 == 1)
        goto LAB128;

LAB129:    t7 = (unsigned char)0;

LAB130:    if (t7 == 0)
        goto LAB126;

LAB127:    xsi_set_current_line(100, ng0);

LAB148:    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB149;
    goto LAB1;

LAB123:    goto LAB122;

LAB125:    goto LAB123;

LAB126:    t22 = (t0 + 6158);
    xsi_report(t22, 9U, (unsigned char)2);
    goto LAB127;

LAB128:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6154);
    t18 = 1;
    if (4U == 4U)
        goto LAB140;

LAB141:    t18 = 0;

LAB142:    t7 = t18;
    goto LAB130;

LAB131:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)2);
    t12 = t15;
    goto LAB133;

LAB134:    t9 = 0;

LAB137:    if (t9 < 8U)
        goto LAB138;
    else
        goto LAB136;

LAB138:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB135;

LAB139:    t9 = (t9 + 1);
    goto LAB137;

LAB140:    t19 = 0;

LAB143:    if (t19 < 4U)
        goto LAB144;
    else
        goto LAB142;

LAB144:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB141;

LAB145:    t19 = (t19 + 1);
    goto LAB143;

LAB146:    t4 = (t0 + 3648);
    *((int *)t4) = 0;
    xsi_set_current_line(101, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB152:    *((char **)t1) = &&LAB153;
    goto LAB1;

LAB147:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB146;
    else
        goto LAB148;

LAB149:    goto LAB147;

LAB150:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6167);
    t13 = 1;
    if (8U == 8U)
        goto LAB162;

LAB163:    t13 = 0;

LAB164:    if (t13 == 1)
        goto LAB159;

LAB160:    t12 = (unsigned char)0;

LAB161:    if (t12 == 1)
        goto LAB156;

LAB157:    t7 = (unsigned char)0;

LAB158:    if (t7 == 0)
        goto LAB154;

LAB155:    xsi_set_current_line(106, ng0);

LAB176:    t2 = (t0 + 3664);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB177;
    goto LAB1;

LAB151:    goto LAB150;

LAB153:    goto LAB151;

LAB154:    t22 = (t0 + 6179);
    xsi_report(t22, 12U, (unsigned char)2);
    goto LAB155;

LAB156:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6175);
    t18 = 1;
    if (4U == 4U)
        goto LAB168;

LAB169:    t18 = 0;

LAB170:    t7 = t18;
    goto LAB158;

LAB159:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)2);
    t12 = t15;
    goto LAB161;

LAB162:    t9 = 0;

LAB165:    if (t9 < 8U)
        goto LAB166;
    else
        goto LAB164;

LAB166:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB163;

LAB167:    t9 = (t9 + 1);
    goto LAB165;

LAB168:    t19 = 0;

LAB171:    if (t19 < 4U)
        goto LAB172;
    else
        goto LAB170;

LAB172:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB169;

LAB173:    t19 = (t19 + 1);
    goto LAB171;

LAB174:    t4 = (t0 + 3664);
    *((int *)t4) = 0;
    xsi_set_current_line(107, ng0);
    t8 = (1 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t8);

LAB180:    *((char **)t1) = &&LAB181;
    goto LAB1;

LAB175:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB174;
    else
        goto LAB176;

LAB177:    goto LAB175;

LAB178:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 6191);
    t13 = 1;
    if (8U == 8U)
        goto LAB190;

LAB191:    t13 = 0;

LAB192:    if (t13 == 1)
        goto LAB187;

LAB188:    t12 = (unsigned char)0;

LAB189:    if (t12 == 1)
        goto LAB184;

LAB185:    t7 = (unsigned char)0;

LAB186:    if (t7 == 0)
        goto LAB182;

LAB183:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 6215);
    xsi_report(t2, 23U, (unsigned char)0);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3872);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);

LAB204:    *((char **)t1) = &&LAB205;
    goto LAB1;

LAB179:    goto LAB178;

LAB181:    goto LAB179;

LAB182:    t22 = (t0 + 6203);
    xsi_report(t22, 12U, (unsigned char)2);
    goto LAB183;

LAB184:    t10 = (t0 + 1832U);
    t16 = *((char **)t10);
    t10 = (t0 + 6199);
    t18 = 1;
    if (4U == 4U)
        goto LAB196;

LAB197:    t18 = 0;

LAB198:    t7 = t18;
    goto LAB186;

LAB187:    t10 = (t0 + 1672U);
    t11 = *((char **)t10);
    t14 = *((unsigned char *)t11);
    t15 = (t14 == (unsigned char)3);
    t12 = t15;
    goto LAB189;

LAB190:    t9 = 0;

LAB193:    if (t9 < 8U)
        goto LAB194;
    else
        goto LAB192;

LAB194:    t5 = (t3 + t9);
    t6 = (t2 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB191;

LAB195:    t9 = (t9 + 1);
    goto LAB193;

LAB196:    t19 = 0;

LAB199:    if (t19 < 4U)
        goto LAB200;
    else
        goto LAB198;

LAB200:    t20 = (t16 + t19);
    t21 = (t10 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB197;

LAB201:    t19 = (t19 + 1);
    goto LAB199;

LAB202:    goto LAB2;

LAB203:    goto LAB202;

LAB205:    goto LAB203;

}


extern void work_a_3520043706_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3520043706_3212880686_p_0,(void *)work_a_3520043706_3212880686_p_1};
	xsi_register_didat("work_a_3520043706_3212880686", "isim/TB_CPU_8bit_Set7_isim_beh.exe.sim/work/a_3520043706_3212880686.didat");
	xsi_register_executes(pe);
}
