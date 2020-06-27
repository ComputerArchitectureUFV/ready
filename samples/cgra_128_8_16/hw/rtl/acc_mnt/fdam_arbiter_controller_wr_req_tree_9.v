module fdam_arbiter_controller_wr_req_tree_9 #
(
  parameter DATA_WIDTH = 32,
  parameter INPUT_FIFO_DEPTH_BITS = 4,
  parameter OUTPUT_FIFO_DEPTH_BITS = 4
)
(
  input clk,
  input rst,
  input [9-1:0] req_wr_en_in,
  input [DATA_WIDTH*9-1:0] req_wr_data_in,
  output [9-1:0] req_wr_available_in,
  input req_wr_available_out,
  output req_wr_en_out,
  output [DATA_WIDTH-1:0] req_wr_data_out
);

  wire [2-1:0] req_wr_available_out_0;
  wire [2-1:0] req_wr_en_out_0;
  wire [DATA_WIDTH*2-1:0] req_wr_data_out_0;

  fdam_arbiter_controller_wr_req_8
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_FIFO_DEPTH_BITS(INPUT_FIFO_DEPTH_BITS),
    .OUTPUT_FIFO_DEPTH_BITS(OUTPUT_FIFO_DEPTH_BITS)
  )
  arbiter_controller_wr_req_0_0
  (
    .clk(clk),
    .rst(rst),
    .req_wr_en_in(req_wr_en_in[7:0]),
    .req_wr_data_in(req_wr_data_in[DATA_WIDTH*8 - 1:DATA_WIDTH*0]),
    .req_wr_available_in(req_wr_available_in[7:0]),
    .req_wr_available_out(req_wr_available_out_0[0]),
    .req_wr_en_out(req_wr_en_out_0[0]),
    .req_wr_data_out(req_wr_data_out_0[DATA_WIDTH*1 - 1:DATA_WIDTH*0])
  );


  fdam_arbiter_controller_wr_req_1
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_FIFO_DEPTH_BITS(INPUT_FIFO_DEPTH_BITS),
    .OUTPUT_FIFO_DEPTH_BITS(OUTPUT_FIFO_DEPTH_BITS)
  )
  arbiter_controller_wr_req_0_1
  (
    .clk(clk),
    .rst(rst),
    .req_wr_en_in(req_wr_en_in[8:8]),
    .req_wr_data_in(req_wr_data_in[DATA_WIDTH*9 - 1:DATA_WIDTH*8]),
    .req_wr_available_in(req_wr_available_in[8:8]),
    .req_wr_available_out(req_wr_available_out_0[1]),
    .req_wr_en_out(req_wr_en_out_0[1]),
    .req_wr_data_out(req_wr_data_out_0[DATA_WIDTH*2 - 1:DATA_WIDTH*1])
  );


  fdam_arbiter_controller_wr_req_2
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_FIFO_DEPTH_BITS(INPUT_FIFO_DEPTH_BITS),
    .OUTPUT_FIFO_DEPTH_BITS(OUTPUT_FIFO_DEPTH_BITS)
  )
  arbiter_controller_wr_req_1_0
  (
    .clk(clk),
    .rst(rst),
    .req_wr_en_in(req_wr_en_out_0),
    .req_wr_data_in(req_wr_data_out_0),
    .req_wr_available_in(req_wr_available_out_0),
    .req_wr_available_out(req_wr_available_out),
    .req_wr_en_out(req_wr_en_out),
    .req_wr_data_out(req_wr_data_out)
  );

endmodule