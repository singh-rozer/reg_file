typedef struct packed {
reg [31:12] reserved        ;
reg [11:8]  clkdiv_restart  ;
reg [7:4]   sm_restart      ;
reg [3:0]   sm_enable       ;
} CNTRL_REG;
parameter CTRL_OFF = 'h000;
parameter CTRL_MASK = 'h0000000f; 
parameter CTRL_RESET = 'h00000000;

typedef struct packed {
reg [31:28] reserved1       ;
reg [27:24] tx_empty        ;
reg [23:20] reserved2       ;
reg [19:16] tx_full         ;
reg [15:12] reserved3       ;
reg [11:8]  rx_empty        ;
reg [7:4]   reserved4       ;
reg [3:0]   rx_full         ;
} FSTAT_REG;
parameter FSTAT_OFF = 'h004;
parameter FSTAT_RESET = 'h0f000f00;

typedef struct packed {
reg [31:28] reserved1       ;
reg [27:24] tx_stall        ;
reg [23:20] reserved2       ;
reg [19:16] tx_over         ;
reg [15:12] reserved3       ;
reg [11:8]  rx_under        ;
reg [7:4]   reserved4       ;
reg [3:0]   rx_stall        ;
} FDEBUG_REG;
parameter FDEBUG_OFF = 'h008;
parameter FDEBUG_RESET = 'h0000000;

typedef struct packed {
reg [31:28] rx3        ;
reg [27:24] tx3        ;
reg [23:20] rx2        ;
reg [19:16] tx2        ;
reg [15:12] rx1        ;
reg [11:8]  tx1        ;
reg [7:4]   rx0        ;
reg [3:0]   tx0        ;
} FLEVEL_REG;
parameter FLEVEL_OFF = 'h00c;
parameter FLEVEL_RESET = 'h00000000;

typedef struct packed {
reg [31:0] tx_fifo        ;
} TX_F_REG;
parameter TXF0_OFF = 'h010;
parameter TXF1_OFF = 'h014;
parameter TXF2_OFF = 'h018;
parameter TXF3_OFF = 'h01c;

typedef struct packed {
reg [31:8] reserved     ;
reg [7:0] sm_irq_flag   ;
} IRQ_REG;
parameter IRQ_OFF = 'h030;

typedef struct packed {
reg [31:8] reserved     ;
reg [7:0] sm_irq_force  ;
} IRQ_FORCE_REG;
parameter IRQ_FORCE_OFF = 'h034;

typedef struct packed {
reg [31:0] input_synchronizer;
} INPUT_SYNC_BYPASS_REG;
parameter INPUT_SYNC_BYPASS_OFF = 'h038;
parameter INPUT_SYNC_BYPASS_MASK = 'hffffffff;

typedef struct packed {
reg [31:0] pad_out_val;
} DBG_PADOUT_REG;
parameter DBG_PADOUT_OFF = 'h03c;

typedef struct packed {
reg [31:0] pad_out_en;
} DBG_PADOE_REG;
parameter DBG_PADOE_OFF = 'h040;

typedef struct packed {
reg [31:22] reserved  ;
reg [21:16] imem_size ;
reg [15:12] reserved1  ;
reg [11:8]  sm_count  ;
reg [7:4]   reserved2  ;
reg [3:0]   fifo_depth;
} DBG_CFGINFO_REG;
parameter DBG_CFGINFO_OFF = 'h044;

typedef struct packed {
reg [31:16] reserved       ;
reg [15:8]  effective_freq ;
reg [7:0]   fractional_part;
} SM_CLKDIV_REG;
parameter SM0_CLKDIV_OFF = 'h0c8;
parameter SM1_CLKDIV_OFF = 'h0e0;
parameter SM2_CLKDIV_OFF = 'h0f8;
parameter SM3_CLKDIV_OFF = 'h110;
parameter SM_CLKDIV_MASK = 'hffffff00;

typedef struct packed {
reg     exec_stalled         ;//31
reg     sid_en               ;//30
reg     side_pin_dir         ;//29
reg [28:24] jmp_pin          ;
reg [23:19] out_en_sel       ;
reg     inline_out_en        ;//18
reg     out_sticky           ;//17
reg [16:12] wrap_top         ;
reg [11:7]  wrap_bottom      ;
reg [6:5]   reserved         ;
reg      status_sel          ;//4
reg [3:0]   status_n         ;
} SM_EXECCTRL_REG;
parameter SM0_EXECCTRL_OFF = 'h0cc;
parameter SM1_EXECCTRL_OFF = 'h0e4;
parameter SM2_EXECCTRL_OFF = 'h0fc;
parameter SM3_EXECCTRL_OFF = 'h114;
parameter SM_EXECCTRL_MASK = 'h7fffff9f; 

typedef struct packed {
reg         fjoin_rx     ;//31
reg         fjoin_tx     ;//30
reg [29:25] pull_tresh   ;
reg [24:20] push_tresh   ;
reg         out_shift_dir;//19
reg         in_shift_dir ;//18
reg         auto_pull    ;//17
reg         auto_push    ;//16
reg [15:0]  reserved     ;
} SM_SHIFTCTRL_REG;
parameter SM0_SHIFTCTRL_OFF = 'h0d0;
parameter SM1_SHIFTCTRL_OFF = 'h0e8;
parameter SM2_SHIFTCTRL_OFF = 'h100;
parameter SM3_SHIFTCTRL_OFF = 'h118;
parameter SM_SHIFTCTRL_MASK = 'hffff0000;

typedef struct packed {
reg [31:5] reserved       ;
reg [4:0]  instr_addr     ;
} SM_ADDR_REG;
parameter SM0_ADDR_OFF = 'h0d4;
parameter SM1_ADDR_OFF = 'h0ec;
parameter SM2_ADDR_OFF = 'h104;
parameter SM3_ADDR_OFF = 'h11c;

typedef struct packed {
reg [31:5] reserved       ;
reg [4:0]  instr_addr_pc     ;
} SM_INSTR_REG;
parameter SM0_INSTR_OFF = 'h0d8;
parameter SM1_INSTR_OFF = 'h0f0;
parameter SM2_INSTR_OFF = 'h108;
parameter SM3_INSTR_OFF = 'h120;
parameter SM_INSTR_MASK = 'h0000ffff;

typedef struct packed {
reg [31:29] sideset_count;
reg [28:26] set_count    ;
reg [25:20] out_count    ;
reg [19:15] in_base      ;
reg [14:10] sideset_base ;
reg [9:5]   set_base     ;
reg [4:0]   out_base     ;
} SM_PINCTRL_REG;
parameter SM0_PINCTRL_OFF = 'h0dc;
parameter SM1_PINCTRL_OFF = 'h0f4;
parameter SM2_PINCTRL_OFF = 'h10c;
parameter SM3_PINCTRL_OFF = 'h124;
parameter SM_PINCTRL_MASK = 'hffffffff;

typedef struct packed {
reg [31:12] reserved;
reg    SM3         ;//11
reg    SM2         ;//10
reg    SM1         ;//9
reg    SM0         ;//8
reg    SM3_TXNFULL ;//7
reg    SM2_TXNFULL ;//6
reg    SM1_TXNFULL ;//5
reg    SM0_TXNFULL ;//4
reg    SM3_RXNEMPTY;//3
reg    SM2_RXNEMPTY;//2
reg    SM1_RXNEMPTY;//1
reg    SM0_RXNEMPTY;//0
} INT_RO_REG;
parameter INTR_OFF = 'h128;
parameter IRQ0_INTS_OFF = 'h134;
parameter IRQ1_INTS_OFF = 'h140;

typedef struct packed {
reg [31:12] reserved    ;
reg         SM3         ;//11
reg         SM2         ;//10
reg         SM1         ;//9
reg         SM0         ;//8
reg         SM3_TXNFULL ;//7
reg         SM2_TXNFULL ;//6
reg         SM1_TXNFULL ;//5
reg         SM0_TXNFULL ;//4
reg         SM3_RXNEMPTY;//3
reg         SM2_RXNEMPTY;//2
reg         SM1_RXNEMPTY;//1
reg         SM0_RXNEMPTY;//0
} IRQ_INT_RW_REG;
parameter IRQ0_INTE_OFF = 'h12c;
parameter IRQ0_INTF_OFF = 'h130;
parameter IRQ1_INTE_OFF = 'h138;
parameter IRQ1_INTF_OFF = 'h13c;
parameter IRQ0_INTE_MASK = 'h00000fff;
parameter IRQ0_INTF_MASK = 'h00000fff;
parameter IRQ1_INTE_MASK = 'h00000fff;
parameter IRQ1_INTF_MASK = 'h00000fff;
