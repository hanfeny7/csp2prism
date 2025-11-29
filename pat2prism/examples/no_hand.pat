channel ComSC 0;
channel ComCA 0;
channel FakeS 0;
channel FakeC 0;
channel FakeA 0;

enum {MSK};
enum {ReqEUI,Ack,MsgEncryptData};

#define PSK 1234;
#define Fake_PSK 123;
#define EUI 4321;
#define ReqAck 001;
var data_leak=false;
var data_access=false;
var check_pass=false;
var key_leak=false;

//var data_available= false;
//var msk_leak = false;
//var device_fake = false;
//var user_fake = false;

var random[4] = [101,1011,1001,1101];
var nonce_s;
var nonce_c;
var Ek1;
var Ek2;
var Ak1;
var Ak2;
var Ts;
var MIC1;
var MIC2;
var EncryptData[4];

#define Generate_Nonce_s(m)
{
	nonce_s = random[m];
};
#define Generate_Nonce_c(m)
{
	nonce_c = random[m];
};
#define Generate_Timestamp(n)
{
	Ts = random[n];
};

#define HMAC_Ek1(PSK1,EUI1){
	Ek1 = PSK1+EUI1;};
#define HMAC_Ek2(PSK2,EUI2){
	Ek2 = PSK2+EUI2;};
#define HMAC_Ak1(PSK1,EUI1,nonce_c1,Ts1){
	Ak1 = PSK1+EUI1+nonce_c1+Ts1;};
#define HMAC_Ak2(PSK2,EUI2,nonce_c2,Ts2){
	Ak2 = PSK2+EUI2+nonce_c2+Ts2;};
#define Compute_MIC1(Akey1,EUI1,nonce_s1,Ts1){
	MIC1=Akey1+EUI1+nonce_s1+Ts1;};
#define Compute_MIC2(Akey2,EUI2,nonce_s2,Ts2){
	MIC2=Akey2+EUI2+nonce_s2+Ts2;};

#define Encrypt(Ekey,content1,content2,i,j){
	EncryptData[i]=content1+Ekey;
	EncryptData[j]=content2+Ekey;
	};
#define Decrypt(Ekey,i,j){
	EncryptData[i]=EncryptData[i-2]+Ekey;
	EncryptData[j]=EncryptData[j-2]+Ekey;
	};

#define CheckDecrypt(Ekey){
	if(Ekey==Ek1)
	{check_pass=true;}
	};
#define CheckGetMSK(receipt){
	if(receipt==MSK)
	{data_access=true;}
	};


SmartObject()=
AckEUi{call(Generate_Nonce_c,0);}->
ComSC!EUI->
ComSC?MsgEncryptData->
{call(HMAC_Ek2,PSK,EUI);}->
{call(CheckDecrypt,Ek2);}->
if(check_pass == true)
{
	{call(Decrypt,Ek2,2,3);}->
	{call(HMAC_Ak1,PSK,EUI,nonce_c,Ts);}->
	{call(Compute_MIC1,Ak1,EUI,nonce_s,Ts);}->
	ComSC!nonce_c.MIC1->
	ComSC?msk->
	codei{call(CheckGetMSK,msk);}->Skip
}
else
{
	skip->SmartObject()
}
[]
{call(Generate_Nonce_c,0);}->
FakeS!EUI->
FakeS?MsgEncryptData->
{call(HMAC_Ek2,PSK,EUI);}->
{call(CheckDecrypt,Ek2);}->
if(check_pass == true)
{
	{call(Decrypt,Ek2,2,3);}->
	{call(HMAC_Ak1,PSK,EUI,nonce_c,Ts);}->
	{call(Compute_MIC1,Ak1,EUI,nonce_s,Ts);}->
	FakeS!nonce_c.MIC1->
	FakeS?msk->
	{call(CheckGetMSK,msk);}->
	if(data_access == true)
	{
		FakeSkip{key_leak=true}->
		Skip
	}
	else
	{
		skip->SmartObject()
	}
}
else
{
	skip->SmartObject()
};

Controller() =
ComSC?EUI->
ComCA!EUI->
ComCA?MsgEncryptData->
ComSC!MsgEncryptData->
ComSC?second_nonce_c.next_MIC1->
ComCA!second_nonce_c.next_MIC1->
ComCA?msk->
ComSC!msk->
skip->Controller()
[]
FakeS?EUI->
FakeA!EUI->
FakeA?MsgEncryptData->
FakeS!MsgEncryptData->
FakeS?second_nonce_c.next_MIC1->
FakeA!second_nonce_c.next_MIC1->
FakeA?msk->
FakeS!msk->
Skip;

AAA_Server()=
ComCA?EUI->
{call(HMAC_Ek1,PSK,EUI);}->
{call(Generate_Nonce_s,1);}->
{call(Generate_Timestamp,2);}->
{call(Encrypt,Ek1,nonce_s,Ts,0,1);}->
ComCA!MsgEncryptData->
ComCA?third_nonce_c.next_MIC1->
{call(HMAC_Ak2,PSK,EUI,nonce_c,Ts);}->
{call(Compute_MIC2,Ak2,EUI,nonce_s,Ts);}->
if(MIC1==MIC2)
{
	ComCA!MSK->AAA_Server()
//ServerData{data_access=true;}->ComCA!MSK->
//AAA_Server()
}
else
{skip->AAA_Server()
}
[]
FakeA?EUI->
{call(HMAC_Ek1,PSK,EUI);}->
{call(Generate_Nonce_s,1);}->
{call(Generate_Timestamp,2);}->
{call(Encrypt,Ek1,nonce_s,Ts,0,1);}->
FakeA!MsgEncryptData->
FakeA?third_nonce_c.next_MIC1->
{call(HMAC_Ak2,PSK,EUI,nonce_c,Ts);}->
{call(Compute_MIC2,Ak2,EUI,nonce_s,Ts);}->
if(MIC1==MIC2)
{FakeA!MSK->AAA_Server()
}
else
{skip->AAA_Server()
};

Intruder()=
FakeS?EUI->
FakeC!EUI->
FakeC?EUI1->
FakeA!EUI1->
FakeA?MsgEncryptData1->
FakeC!MsgEncryptData1->
FakeC?MsgEncryptData2->
FakeS!MsgEncryptData2->
FakeS?fnonce_c.fMIC1->
FakeC!fnonce_c.fMIC1->
FakeC?ffnonce_c.ffMIC1->
FakeA!ffnonce_c.ffMIC1->
FakeA?msk1->
FakeC!msk1->
FakeC?msk2->
FakeS!msk2->
Intruder();

System() = SmartObject() || Controller() || AAA_Server() || Intruder() ;
#assert System() deadlockfree;
#assert System() divergencefree;
#assert System() deterministic;
#define Data_Accessibility data_access==true;
#assert System() reaches Data_Accessibility;
#define Data_Leakage key_leak==true;
#assert System() |=[]! Data_Leakage;