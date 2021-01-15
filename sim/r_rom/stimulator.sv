`include "isa.vh"

module stimulator (
    input   wire    clk,
    input   wire    rst_n,

    tilelink.master bus
);

    localparam ADDR_COUNT = 3;
    reg [63:0] addr_list[ADDR_COUNT] = {
        64'hEFCD_AB89_6745_2301,
        64'h0123_4567_89AB_CDEF,
        64'hAABB_CCDD_EEFF_0011
    };

    initial begin
        wait(rst_n);

        for (integer i = 0; i < ADDR_COUNT; i++) begin
            read_req(bus, addr_list[i], 8);

            @ (posedge bus.d_valid);
            bus.a_valid <= `DISABLE;
            ack(bus);

            @ (posedge clk);
            @ (posedge clk);
        end

        $finish();
    end

    function read_req(virtual tilelink.master bus,
                      input [63:0] addr, input [3:0] size);
        bus.a_opcode = `TL_GET;
        bus.a_size = $clog2(size);
        bus.a_source = 4'b0000;
        bus.a_address = addr;
        bus.a_mask = 8'hFF;
        bus.a_valid = `ENABLE;
    endfunction

    function ack(virtual tilelink.master bus);
        if (bus.d_opcode == `TL_ACCESS_ACK_DATA) begin
            $display($time,, "[%x] Read (%1d) %x.",
                     bus.a_address, 1 << bus.d_size, bus.d_data);
            bus.d_ready = 1'b1;
            bus.a_valid = 1'b0;
        end
    endfunction

endmodule
