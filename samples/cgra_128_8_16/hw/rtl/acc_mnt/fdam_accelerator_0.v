module fdam_accelerator_0
(
  input clk,
  input rst,
  input start,
  input [2-1:0] conf_valid,
  input [112-1:0] conf,
  input [8-1:0] available_read,
  output [8-1:0] request_read,
  output [512-1:0] request_data,
  input read_data_valid,
  input [16-1:0] read_queue_id,
  input [512-1:0] read_data,
  input [9-1:0] available_write,
  output [9-1:0] request_write,
  output [5184-1:0] write_data,
  input write_data_valid,
  input [16-1:0] write_queue_id
);

  wire [18-1:0] rst_reg;
  wire [18-1:0] start_reg;
  reg [2-1:0] conf_valid_reg;
  reg [112-1:0] conf_reg;
  reg read_data_valid_reg;
  reg [16-1:0] read_queue_id_reg;
  reg [512-1:0] read_data_reg;
  reg write_data_valid_reg;
  reg [16-1:0] write_queue_id_reg;
  wire [8-1:0] acc_user_available_read;
  wire [8-1:0] acc_user_request_read;
  wire [4096-1:0] acc_user_read_data;
  wire [8-1:0] acc_user_read_data_valid;
  wire [8-1:0] acc_user_available_write;
  wire [8-1:0] acc_user_request_write;
  wire [4096-1:0] acc_user_write_data;
  wire acc_user_done;
  wire [8-1:0] acc_user_done_reg;
  wire acc_user_done_dsm;
  wire [8-1:0] has_peding_rd;
  wire [8-1:0] has_peding_wr;
  wire has_peding;
  wire [8-1:0] input_queue_done;
  wire [8-1:0] output_queue_done;
  genvar idx_in_queue;
  genvar idx_out_queue;

  reg_tree_4_18_2
  #(
    .DATA_WIDTH(1)
  )
  rst_reg_tree_4_18_2
  (
    .clk(clk),
    .in(rst),
    .out_0(rst_reg[0]),
    .out_1(rst_reg[1]),
    .out_2(rst_reg[2]),
    .out_3(rst_reg[3]),
    .out_4(rst_reg[4]),
    .out_5(rst_reg[5]),
    .out_6(rst_reg[6]),
    .out_7(rst_reg[7]),
    .out_8(rst_reg[8]),
    .out_9(rst_reg[9]),
    .out_10(rst_reg[10]),
    .out_11(rst_reg[11]),
    .out_12(rst_reg[12]),
    .out_13(rst_reg[13]),
    .out_14(rst_reg[14]),
    .out_15(rst_reg[15]),
    .out_16(rst_reg[16]),
    .out_17(rst_reg[17])
  );


  reg_tree_4_18_2
  #(
    .DATA_WIDTH(1)
  )
  start_reg_tree_4_18_2
  (
    .clk(clk),
    .in(start),
    .out_0(start_reg[0]),
    .out_1(start_reg[1]),
    .out_2(start_reg[2]),
    .out_3(start_reg[3]),
    .out_4(start_reg[4]),
    .out_5(start_reg[5]),
    .out_6(start_reg[6]),
    .out_7(start_reg[7]),
    .out_8(start_reg[8]),
    .out_9(start_reg[9]),
    .out_10(start_reg[10]),
    .out_11(start_reg[11]),
    .out_12(start_reg[12]),
    .out_13(start_reg[13]),
    .out_14(start_reg[14]),
    .out_15(start_reg[15]),
    .out_16(start_reg[16]),
    .out_17(start_reg[17])
  );


  reg_tree_4_8_4
  #(
    .DATA_WIDTH(1)
  )
  acc_done_reg_tree_4_8_4
  (
    .clk(clk),
    .in(acc_user_done),
    .out_0(acc_user_done_reg[0]),
    .out_1(acc_user_done_reg[1]),
    .out_2(acc_user_done_reg[2]),
    .out_3(acc_user_done_reg[3]),
    .out_4(acc_user_done_reg[4]),
    .out_5(acc_user_done_reg[5]),
    .out_6(acc_user_done_reg[6]),
    .out_7(acc_user_done_reg[7])
  );


  generate for(idx_in_queue=0; idx_in_queue<8; idx_in_queue=idx_in_queue+1) begin : gen_in_queue_controller

    fdam_input_queue_controller
    #(
      .ID_QUEUE(0 + idx_in_queue),
      .ADDR_WIDTH(48),
      .QTD_WIDTH(32),
      .DATA_WIDTH(512),
      .CONF_ID_QUEUE_WIDTH(32),
      .TAG_WIDTH(16)
    )
    input_queue_controller
    (
      .clk(clk),
      .rst(rst_reg[idx_in_queue]),
      .start(start_reg[idx_in_queue]),
      .conf_valid(conf_valid_reg),
      .conf(conf_reg),
      .available_read(available_read[idx_in_queue]),
      .has_rd_peding(has_peding_rd[idx_in_queue]),
      .request_read(request_read[idx_in_queue]),
      .request_data(request_data[idx_in_queue*64+64-1:idx_in_queue*64]),
      .read_data_valid(read_data_valid_reg),
      .read_queue_id(read_queue_id_reg),
      .read_data(read_data_reg),
      .acc_user_available_read(acc_user_available_read[idx_in_queue]),
      .acc_user_request_read(acc_user_request_read[idx_in_queue]),
      .acc_user_read_data(acc_user_read_data[idx_in_queue*512+512-1:idx_in_queue*512]),
      .acc_user_read_data_valid(acc_user_read_data_valid[idx_in_queue]),
      .done(input_queue_done[idx_in_queue])
    );

  end
  endgenerate


  generate for(idx_out_queue=0; idx_out_queue<8; idx_out_queue=idx_out_queue+1) begin : gen_out_queue_controller

    fdam_output_queue_controller
    #(
      .ID_QUEUE(0 + idx_out_queue),
      .ADDR_WIDTH(48),
      .QTD_WIDTH(32),
      .DATA_WIDTH(512),
      .CONF_ID_QUEUE_WIDTH(32),
      .TAG_WIDTH(16)
    )
    output_queue_controller
    (
      .clk(clk),
      .rst(rst_reg[8 + idx_out_queue]),
      .start(start_reg[8 + idx_out_queue]),
      .conf_valid(conf_valid_reg),
      .conf(conf_reg),
      .available_write(available_write[idx_out_queue]),
      .has_wr_peding(has_peding_wr[idx_out_queue]),
      .request_write(request_write[idx_out_queue]),
      .write_data(write_data[idx_out_queue*576+576-1:idx_out_queue*576]),
      .write_data_valid(write_data_valid_reg),
      .write_queue_id(write_queue_id_reg),
      .acc_user_available_write(acc_user_available_write[idx_out_queue]),
      .acc_user_request_write(acc_user_request_write[idx_out_queue]),
      .acc_user_write_data(acc_user_write_data[idx_out_queue*512+512-1:idx_out_queue*512]),
      .acc_user_done(acc_user_done_reg[idx_out_queue]),
      .done(output_queue_done[idx_out_queue])
    );

  end
  endgenerate


  fdam_dsm_controller
  #(
    .ACC_ID(0),
    .ADDR_WIDTH(48),
    .QTD_WIDTH(32),
    .TAG_WIDTH(16),
    .CONF_ID_QUEUE_WIDTH(32),
    .DATA_WIDTH(512),
    .NUM_INPUT_QUEUES(8),
    .NUM_OUTPUT_QUEUES(8)
  )
  dsm_controller
  (
    .clk(clk),
    .rst(rst_reg[16]),
    .start(start_reg[16]),
    .done_rd(input_queue_done),
    .done_wr(output_queue_done),
    .done_acc(acc_user_done_dsm),
    .acc_req_rd_data_en(acc_user_request_read),
    .acc_req_wr_data_en(acc_user_request_write),
    .conf_valid(conf_valid_reg),
    .conf(conf_reg),
    .available_write(available_write[8]),
    .request_write(request_write[8]),
    .write_data(write_data[5183:4608]),
    .write_data_valid(write_data_valid_reg),
    .write_queue_id(write_queue_id_reg)
  );


  fdam_acc_user_0
  acc_user_0
  (
    .clk(clk),
    .rst(rst_reg[17]),
    .start(start_reg[17]),
    .acc_user_done_rd_data(input_queue_done),
    .acc_user_done_wr_data(output_queue_done),
    .acc_user_available_read(acc_user_available_read),
    .acc_user_request_read(acc_user_request_read),
    .acc_user_read_data_valid(acc_user_read_data_valid),
    .acc_user_read_data(acc_user_read_data),
    .acc_user_available_write(acc_user_available_write),
    .acc_user_request_write(acc_user_request_write),
    .acc_user_write_data(acc_user_write_data),
    .acc_user_done(acc_user_done)
  );

  assign has_peding = |{ has_peding_rd, has_peding_wr };
  assign acc_user_done_dsm = acc_user_done && ~has_peding;

  always @(posedge clk) begin
    conf_valid_reg <= conf_valid;
    conf_reg <= conf;
    read_data_valid_reg <= read_data_valid;
    read_queue_id_reg <= read_queue_id;
    read_data_reg <= read_data;
    write_data_valid_reg <= write_data_valid;
    write_queue_id_reg <= write_queue_id;
  end

endmodule