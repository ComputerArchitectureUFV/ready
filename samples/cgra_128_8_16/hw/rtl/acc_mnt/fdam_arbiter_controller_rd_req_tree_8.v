module fdam_arbiter_controller_rd_req_tree_8 #
(
  parameter DATA_WIDTH = 32,
  parameter INPUT_FIFO_DEPTH_BITS = 4,
  parameter OUTPUT_FIFO_DEPTH_BITS = 4
)
(
  input clk,
  input rst,
  input [8-1:0] req_wr_en_in,
  input [DATA_WIDTH*8-1:0] req_wr_data_in,
  output [8-1:0] req_wr_available_in,
  input req_wr_available_out,
  output req_wr_en_out,
  output [DATA_WIDTH-1:0] req_wr_data_out
);


  fdam_arbiter_controller_rd_req_8
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_FIFO_DEPTH_BITS(INPUT_FIFO_DEPTH_BITS),
    .OUTPUT_FIFO_DEPTH_BITS(OUTPUT_FIFO_DEPTH_BITS)
  )
  arbiter_controller_rd_req_0_0
  (
    .clk(clk),
    .rst(rst),
    .req_wr_en_in(req_wr_en_in),
    .req_wr_data_in(req_wr_data_in),
    .req_wr_available_in(req_wr_available_in),
    .req_wr_available_out(req_wr_available_out),
    .req_wr_en_out(req_wr_en_out),
    .req_wr_data_out(req_wr_data_out)
  );

endmodule