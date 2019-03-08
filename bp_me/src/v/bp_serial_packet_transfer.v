//TODO: calculate packet_width_p based on data_width_p and num_packets_p

module bp_serial_packet_transfer # ( parameter data_width_p    = "inv"
                                   , parameter num_packets_p   = "inv"
                                   , parameter els_p           = "inv"
                                   , localparam packet_width_p = (data_width_p+num_packets_p-1)/num_packets_p
                                   )
    ( input clk_i
    , input reset_i

    , input  logic [els_p-1:0] valid_i
    , input  logic [els_p-1:0][data_width_p-1:0] data_i
    , output logic [els_p-1:0] ready_o

    , output logic [els_p-1:0] valid_o
    , output logic [els_p-1:0][data_width_p-1:0] data_o
    , input  logic [els_p-1:0] yumi_i // yumi_i or ready_i?
    );

    logic [els_p-1:0][num_packets_p-1:0][packet_width_p-1:0]  data_i_tx;
    logic [els_p-1:0][packet_width_p-1:0]                     packet_o_tx;
    logic [els_p-1:0]                                         v_o_tx;

    logic [els_p-1:0][num_packets_p-1:0][packet_width_p-1:0]  data_o_rx;

    always_comb
    begin
      for (int i = 0; i < els_p; i++) begin
        for (int j = 0; j < num_packets_p - 1; j++) begin
          for (int k = 0; k < packet_width_p; k++) begin
          data_i_tx[i][j][k] = data_i[i][j*packet_width_p+k];
          data_o[i][j*packet_width_p+k] = data_o_rx[i][j][k];
          //data_i_tx[i][j] = data_i[i][((j+1)*packet_width_p-1):(j*packet_width_p)];
          //data_o[i][((j+1)*packet_width_p-1):(j*packet_width_p)] = data_o_rx[i][j];
          end
        end
        data_i_tx[i][num_packets_p-1] = data_i[i][data_width_p-1:(num_packets_p-1)*packet_width_p]; // Maybe I don't care what happens on the extra bits of this signal?
        data_o[i][data_width_p-1:(num_packets_p-1)*packet_width_p] = data_o_rx[i][num_packets_p-1][data_width_p-((num_packets_p-1)*packet_width_p)-1:0];
      end
    end



for (genvar i = 0; i < els_p; i++) begin
  bsg_parallel_in_serial_out #(
      .width_p(packet_width_p)
      ,.els_p(num_packets_p)
  ) serial_data_tx (
      .clk_i(clk_i)
      ,.reset_i(reset_i)

      // input data channel
      ,.valid_i(valid_i[i])
      ,.data_i(data_i_tx[i])
      ,.ready_o(ready_o[i])

      // parallel to serial output
      ,.valid_o(v_o_tx[i])
      ,.data_o(packet_o_tx[i])
      ,.yumi_i(yumi_rx[i])
  );

  bsg_serial_in_parallel_out_full #(
      .width_p(packet_width_p)
      ,.els_p(num_packets_p)
  ) serial_data_rx (
      .clk_i(clk_i)
      ,.reset_i(reset_i)

      // serial input
      ,.v_i(v_o_tx[i])
      ,.ready_o(yumi_rx[i])
      ,.data_i(packet_o_tx[i])

      // output data channel
      ,.data_o(data_o_rx[i])
      ,.v_o(valid_o[i])
      ,.yumi_i(yumi_i[i])
  );
  end

 endmodule
