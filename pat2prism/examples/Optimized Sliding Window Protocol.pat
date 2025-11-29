//@Model: Optimized sliding window protocol
//@Tag: Protocol, Timing
/*@Description:
  The i-protocol is a part of protocol stack; its purpose is to ensure ordered reliable duplex communication between sites. 
  At its lower interface it assumes unreliable (lossy) packet-based FIFO connectivity. To its upper interface it provides reliable packet-based FIFO connectivity. 
  A distinguished feature of the i-protocol is the rather sophisticated manner in which it attempts to minimize control-messages and retransmission overhead. 
  
  The sender maintains a window of packets that can be sent without requiring an acknowledgment for each individual packet. And each packet is uniquely identified using sequence numbers which allows the receiver to detect any missing packets. When a packet is sent, the sender updates its state based on the responses it receives. 
  - If an ACK for a packet is received, the sender can slide the window to include new packets. 
  - If a NAK is received for a missing packet, the sender will retransmit the necessary packets to ensure that the receiver can assemble the complete message. 
  Additionally, a timeout mechanism is integrated; if the sender does not receive any acknowledgment for a predefined period, it will also retransmit packets based on the last acknowledged sequence to ensure the continuity of data flow.
  The receiver validats incoming packets against expected sequence numbers. If a packet arrives out of order, the receiver will buffer it and send a NAK for the expected packet. Or, it sends ACK back to the sender.
*/

#define SIZE 0;
// W: Size of a window
#define W    2; 
// SEQ: How many numbers are used to distinguish packets
#define SEQ  3;

channel Get			SIZE;
channel Put			SIZE;
channel SAck		SIZE;
channel SNak		SIZE;
channel SData		SIZE;
channel RAck		SIZE;
channel RNak		SIZE;
channel RData		SIZE;
channel RCorrData	SIZE;
channel Timeout		SIZE;

var i;
var sent = 0;
var recseq = 0;
var lack = 0;
var recbuf[SEQ];
var nakd[SEQ];

hvar get_message = false;

var t_m;
var t_send;
var t_recv;

Timer = Timeout!0 -> Timer;

Producer = ProducerWait(0);

ProducerWait(message) = wait2produce -> Get!message -> ProducerWait((message + 1) % SEQ);

Consumer() = Put?message{get_message = true;} -> con2wait -> Consumer;

Medium = //wait -> data
		SData?value{t_m = value} -> (
							RData!value -> dataOk2wait -> Medium
						[]	data2wait -> Medium
						[]	RCorrData!value -> Medium
						)
	//wait -> ack
	[] RAck?value{t_m = value} -> 	(
							SAck!value -> ackOk2wait -> Medium
						[]	ack2wait -> Medium
						)
	//wait -> nak
	[]	RNak?value{t_m = value} ->	(
							SNak!value -> nakOk2wait -> Medium
						[]	nak2wait -> Medium
						);

Sender = Ready2Send(1,0);

Ready2Send(sendseq, rack) = 
		//wait -> ack
		SAck?value{t_send = value;} -> 	(
							//ack -> wait
							[(rack < sendseq && rack < value && value < sendseq) || (rack > sendseq && sendseq < value && value < rack)]ack2wait.1 -> Ready2Send(sendseq, value)
						[]	//ack -> wait
							[(rack >= sendseq || rack >= value || value >= sendseq) && (rack <= sendseq || sendseq >= value || value >= rack)]ack2wait.2 -> Ready2Send(sendseq, rack)
						)
	[]	//wait -> nak
		SNak?value{t_send = value;} ->	(
							//nak -> wait
							[(rack < sendseq && rack < value && value < sendseq) || (rack > sendseq && sendseq < value && value < rack)]SData!value -> Ready2Send(sendseq, rack)
						[]	//nak -> wait
							[(rack >= sendseq || rack >= value || value >= sendseq) && (rack<=sendseq || sendseq >= value || value >= rack)]nak2wait -> Ready2Send(sendseq, rack)
						)
	[]	//wait -> timeout
		Timeout?0 ->	(
							//timeout -> wait
							[(rack + 1) % SEQ != sendseq]SData!(rack+1)%SEQ -> Ready2Send(sendseq, rack)
						[]	//timeout -> wait
							[(rack + 1) % SEQ == sendseq]timeout2wait -> Ready2Send(sendseq, rack)
						)
	[]	//wait -> data && data -> wait
		[(rack + W) % SEQ > sendseq] Get?value{t_send = value;} -> SData!sendseq -> Ready2Send((sendseq+1)%SEQ, rack);


Receiver = 	//wait -> data
			RData?value{t_recv = value;} -> 	(
								//data -> send_naks
								[value != (recseq + 1) % SEQ]rec_update.1{recbuf[value] = 1; i = (recseq+1)%SEQ;} -> SendNaks(value)
								//data -> put_data
							[]	[value == (recseq + 1) % SEQ] Put!value{ recseq = (recseq + 1) % SEQ; sent = (sent + 1) % SEQ; } -> PutData()
							)
		[]	//wait -> corr_data
			RCorrData?value{t_recv = value;} -> ( [nakd[value] == 0]RNak!value -> Receiver [] [nakd[value] == 1]corr2wait -> Receiver)
		[]	//wait -> on_timeout
			Timeout?0{i = 0;} -> ReceiverTimeout();
			
ReceiverTimeout() =	//on_timeout -> on_timeout
					[i < SEQ]time_update.1{nakd[i] = 0; i++;} -> ReceiverTimeout()
					//on_timeout -> timeout_ack
				[]	[i == SEQ]RNak!(recseq+1)%SEQ{ nakd[(recseq + 1) % SEQ] = 1; } -> RAck!lack -> Receiver;

SendNaks(value) = //send_naks -> send_naks
					[i != value && nakd[i] == 1]send_update.1{i = (i+1)%SEQ;} -> SendNaks(value)
					//send_naks -> send_naks
				[]	[i != value && nakd[i] == 0]RNak!i{ nakd[i] = 1; i = (i+1)%SEQ;} -> SendNaks(value)
					//send_naks -> wait
				[]	[i == value] naks2wait -> Receiver;

PutData() =//put_data -> put_data
			[sent == W/2]RAck!recseq{ lack = recseq; sent = 0; } -> PutData() 
			//put_data -> put_data
		[]	[sent != W/2 && recbuf[(recseq+1)%SEQ]==1]Put!(recseq+1)%SEQ{ recseq = (recseq+1)%SEQ ; recbuf[recseq]=0; } -> PutData()
			//put_data -> wait
		[]	[sent != W/2 && recbuf[(recseq+1)%SEQ] == 0] put2wait -> Receiver;

IProtocol = Timer ||| Producer ||| Consumer ||| Medium ||| Sender ||| Receiver;

/*@Properties:
  1. The consumer can get message
  2. The consumer will eventually get message
  3. The consumer will get message infinitely often
  4. If the medium transmits both data and acknowledgement correctly infinitelly often then the consumer will get message infinitely often
  5. The protocol is deadlock-free
*/

#define goal1 get_message == true;
#assert IProtocol reaches goal1;

#define goal2 get_message == true;		
#assert IProtocol |= []<> goal2;

#assert IProtocol |= (([]<>dataOk2wait && []<>nakOk2wait) -> []<>goal2);	

#assert IProtocol deadlockfree;
