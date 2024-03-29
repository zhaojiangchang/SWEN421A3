with sPrint; use sPrint;
with Ada.Exceptions;

package body CASH_REGISTER
with SPARK_Mode is

   ---------------------------------------
   -- payFuel  ----------------------------
   ---------------------------------------
   procedure payFuel (pumpUnit: in out PUMP_UNIT.PUMP_UNIT; pump_r: in out PUMP.PUMP; AMOUNT: in  PUMP.FLOAT_NUMBER)is
      id: PUMP_UNIT.UNIT_ID_TYPE;
      topay: PUMP.FLOAT_NUMBER;
      use all type PUMP.FLOAT_NUMBER;
      use all type PUMP.STATE_TYPE;
      payFuelException : Exception;

   begin

      id := PUMP_UNIT.GET_ID(pumpUnit);
      topay:= PUMP_UNIT.GET_TO_PAY(pumpUnit);
      if pumpUnit.PUMP_ACTIVE_STATE /= PUMP.Waiting then
         print("you need return nozzle or pumping first");
         Raise payFuelException;
      else


         if id = cashRegister.UNIT_1.ID  and PUMP_UNIT.GET_TO_PAY(pumpUnit) /= 0.00 then
            print("Pay for: "&cashRegister.UNIT_1.ID);
            print_float_type("Amount to pay: ",topay);
            print_float_type("Actual amount given: ",AMOUNT);
            if AMOUNT = topay then
               cashRegister.UNIT_1.TO_PAY:= 0.00;
               cashRegister.UNIT_1.PUMPED:=0.00;
               PUMP.SET_PUMP_STATE(pump_r,PUMP.STATE_TYPE'Val(0));
               PUMP.SET_PUMPED(pump_r,0.00);
               PUMP_UNIT.SET_IS_PAID(pumpUnit);
               PUMP_UNIT.SET_PUMPED(pumpUnit, 0.00);
               PUMP_UNIT.SET_TO_PAY(pumpUnit,0.00);
               pumpUnit.ActivePumpUnit:=False;
               --              PUMP_UNIT.PUMP_UNIT

            else
               print("unit 1 - amount not equal");
               Raise payFuelException;
            end if;
         elsif id = cashRegister.UNIT_2.ID  and PUMP_UNIT.GET_TO_PAY(pumpUnit) /= 0.00 then
              print("Pay for: "&cashRegister.UNIT_2.ID);
              print_float_type("Amount to pay: ",topay);
              print_float_type("Actual amount given: ",AMOUNT);
             if AMOUNT = topay then
               cashRegister.UNIT_2.TO_PAY:= 0.00;
               cashRegister.UNIT_2.PUMPED:=0.00;
               PUMP.SET_PUMP_STATE(pump_r,PUMP.STATE_TYPE'Val(0));
               PUMP.SET_PUMPED(pump_r,0.00);
               PUMP_UNIT.SET_IS_PAID(pumpUnit);
               PUMP_UNIT.SET_PUMPED(pumpUnit, 0.00);
               PUMP_UNIT.SET_TO_PAY(pumpUnit,0.00);
               pumpUnit.ActivePumpUnit:=False;


               --              PUMP_UNIT.PUMP_UNIT

            else
               print("unit 2 - amount not equal");
               Raise payFuelException;
            end if;

         elsif PUMP_UNIT.GET_TO_PAY(pumpUnit) = 0.00 then
            print("already paid");

         end if;
      end if;

   end payFuel;
   ---------------------------------------
   -- SET_PUMPED_INFO_TO_CASH_REGISTER  --
   ---------------------------------------
   procedure SET_PUMPED_INFO_TO_CASH_REGISTER
     (pumpUnit: in out PUMP_UNIT.PUMP_UNIT)
   is
      topay: PUMP.FLOAT_NUMBER;
      pumpUnitId: PUMP_UNIT_ID;
   begin
      topay:= PUMP_UNIT.GET_TO_PAY(pumpUnit);
      pumpUnitId.ID :=PUMP_UNIT.GET_ID(pumpUnit);
      pumpUnitId.TO_PAY := topay;
      pumpUnitId.PUMPED := PUMP_UNIT.GET_PUMPED(pumpUnit);
      pumpUnitId.FUEL := PUMP_UNIT.GET_FUEL(pumpUnit);
      cashRegister.UNIT_1 := pumpUnitId;
      print("set pumpunit value to cash regesiter");
   end SET_PUMPED_INFO_TO_CASH_REGISTER;

   function activePump(ID: PUMP_UNIT.UNIT_ID_TYPE; pumpUnit: PUMP_UNIT.PUMP_UNIT) return Boolean
   is
   begin
      if pumpUnit.IS_PAID = True then
         return True;
      else
         print(ID & "not paid");
         return False;
      end if;
   end activePump;
 procedure initial(cr: in out CASH_REGISTER)
   is
   begin
      print("Initialize Cash Register");
      cr.UNIT_1.ID:="      ";
      cr.UNIT_1.TO_PAY:=0.00;
      cr.UNIT_1.PUMPED:=0.00;
      cr.UNIT_1.FUEL:=PUMP.U91;

      cr.UNIT_2.ID:="      ";
      cr.UNIT_2.TO_PAY:=0.00;
      cr.UNIT_2.PUMPED:=0.00;
      cr.UNIT_2.FUEL:=PUMP.U91;

      cr.STATE:=PUMP_UNIT.Closed;
      cr.ActiveCashRegister:=False;
      cr.IS_SETUP:=False;
   end initial;

end CASH_REGISTER;
