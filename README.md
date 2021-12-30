# UART-interface

UART Interface in VHDL. Constraints for Zybo Z7 <br>

To have a brief understanding of UART protocol: https://www.analog.com/en/analog-dialogue/articles/uart-a-hardware-communication-protocol.html
## RTL
![image](https://user-images.githubusercontent.com/57245076/147791080-a889e3ab-a6ac-4ad9-a0fa-ec8fc939234c.png)

FIFO structure stores and shifts packages at every one-clock pulse of wr_uart or rd_uart. The file register's depth and width can be adjusted in generic parameters <br>

wr_uart: enables writing mode(stores into fifo_tx), wr_data(parallel bus) will be reflected at tx(serial) pin. Just one-clock pulse per bit package<br>
rd_uart: enables reading mode(shifts fifo's stored packages), rx(serial) will be reflected at rd_data bus (parallel). Just one-clock pulse per bit package <br>
rx_empty: signal flag, high when fifo_rx is empty <br>
rx_empty: signal flag, high when fifo_tx is full <br>
