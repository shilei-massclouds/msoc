#include "head.h"

#define LOAD_SBI

.global _start
_start:

    csrr    a0, mhartid
    li      a1, DTB_LOAD_ADDR

    li      t2, SBI_LOAD_ADDR   /* start of load addr */
    ld      t1, -8(t2)          /* size of sbi */
    add     t3, t2, t1          /* end of load addr */

    li      t0, SBI_LINK_ADDR   /* start of link addr */
    add     t1, t0, t1          /* end of link end */

#ifdef LOAD_SBI
_relocate:
	add	t3, t3, -8
	add	t1, t1, -8
	ld	t2, 0(t3)
	sd	t2, 0(t1)
	blt	t0, t1, _relocate
#endif

    jr      t0
