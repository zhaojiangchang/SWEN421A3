with PUMP;
with PUMP_UNIT;
with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Cash_Register_Setup_Task  is
   UNIT_2 : PUMP_UNIT.PUMP_UNIT;
   UNIT_1 : PUMP_UNIT.PUMP_UNIT;


   task body cash_Register_Setup_Task  is
      --     type UNIT is new PUMP_UNIT;
   begin
--        CASH_REGISTER.initial(CASH_REGISTER_OBJECT.cashRegister);
      print("Initialize Cash Register");
      CASH_REGISTER_OBJECT.cashRegister.UNIT_1.ID:="      ";
      CASH_REGISTER_OBJECT.cashRegister.UNIT_1.TO_PAY:=0.00;
      CASH_REGISTER_OBJECT.cashRegister.UNIT_1.PUMPED:=0.00;
      CASH_REGISTER_OBJECT.cashRegister.UNIT_1.FUEL:=PUMP.U91;

      CASH_REGISTER_OBJECT.cashRegister.UNIT_2.ID:="      ";
      CASH_REGISTER_OBJECT.cashRegister.UNIT_2.TO_PAY:=0.00;
      CASH_REGISTER_OBJECT.cashRegister.UNIT_2.PUMPED:=0.00;
      CASH_REGISTER_OBJECT.cashRegister.UNIT_2.FUEL:=PUMP.U91;

      CASH_REGISTER_OBJECT.cashRegister.STATE:=PUMP_UNIT.Inoperative;
      CASH_REGISTER_OBJECT.cashRegister.IS_SETUP:=True;
   end cash_Register_Setup_Task ;
end Cash_Register_Setup_Task ;
