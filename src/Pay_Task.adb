with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

package body Pay_Task is

   task body pay_Task is
      amountPayByCustomer: PUMP.FLOAT_NUMBER;
      pump_to_reset: PUMP.PUMP;
      change: PUMP.FLOAT_NUMBER;
      id: PUMP_UNIT.UNIT_ID_TYPE;
      topay: PUMP.FLOAT_NUMBER;
      use all type PUMP.FLOAT_NUMBER;
      use all type PUMP.STATE_TYPE;
      payFuelException : Exception;
   begin
      amountPayByCustomer:= PUMP.FLOAT_NUMBER(AMOUNT);
      if unitID = 1 then
         id := "UNIT_1";
         topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_ACTIVE_STATE /= PUMP.Waiting then
            print("you need return nozzle or pumping first");
            Raise payFuelException;
         else
            if id = CASH_REGISTER_OBJECT.cashRegister.UNIT_1.ID  and PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1) /= 0.00 then
               print("Pay for: "&CASH_REGISTER_OBJECT.cashRegister.UNIT_1.ID);
               print_float_type("Amount to pay: ",topay);
               print_Positive_type("Actual amount given: ",AMOUNT);
               if amountPayByCustomer = topay then
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_1.TO_PAY:= 0.00;
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_1.PUMPED:=0.00;
                  pump_to_reset:=PUMP_UNIT.GET_PUMP(pumpUnit => PUMP_UNIT_OBJECTS.PUMP_UNIT_1,
                                     fuelType => PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP.FUEL_TYPE);
                  PUMP.SET_PUMP_STATE(pump_to_reset,PUMP.STATE_TYPE'Val(0));
                  PUMP.SET_PUMPED(pump_to_reset,0.00);
                  PUMP_UNIT.SET_IS_PAID(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
                  PUMP_UNIT.SET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_1, 0.00);
                  PUMP_UNIT.SET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,0.00);
                  PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePump:=True;
               elsif amountPayByCustomer > topay then
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_1.TO_PAY:= 0.00;
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_1.PUMPED:=0.00;
                  pump_to_reset:=PUMP_UNIT.GET_PUMP(pumpUnit => PUMP_UNIT_OBJECTS.PUMP_UNIT_1,
                                     fuelType => PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP.FUEL_TYPE);
                  PUMP.SET_PUMP_STATE(pump_to_reset,PUMP.STATE_TYPE'Val(0));
                  PUMP.SET_PUMPED(pump_to_reset,0.00);
                  PUMP_UNIT.SET_IS_PAID(PUMP_UNIT_OBJECTS.PUMP_UNIT_1);
                  PUMP_UNIT.SET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_1, 0.00);
                  PUMP_UNIT.SET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,0.00);
                  PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePump:=True;
                  change:= amountPayByCustomer - topay;
                  print_float_type("unit 1 - paid changes: ", change);
               else
                  print("unit 1 - amount < to pay");
                  Raise payFuelException;
               end if;
            elsif PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_1) = 0.00 then
               print("unit 1 already paid");
            end if;
         end if;
      elsif unitID = 2 then
          id := "UNIT_2";
         topay:= PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_ACTIVE_STATE /= PUMP.Waiting then
            print("you need return nozzle or pumping first");
            Raise payFuelException;
         else
            if id = CASH_REGISTER_OBJECT.cashRegister.UNIT_2.ID  and PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2) /= 0.00 then
               print("Pay for: "&CASH_REGISTER_OBJECT.cashRegister.UNIT_2.ID);
               print_float_type("Amount to pay: ",topay);
               print_float_type("Actual amount given: ",amountPayByCustomer);
               if amountPayByCustomer = topay then
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_2.TO_PAY:= 0.00;
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_2.PUMPED:=0.00;
                  pump_to_reset:=PUMP_UNIT.GET_PUMP(pumpUnit => PUMP_UNIT_OBJECTS.PUMP_UNIT_2,
                                     fuelType => PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP.FUEL_TYPE);
                  PUMP.SET_PUMP_STATE(pump_to_reset,PUMP.STATE_TYPE'Val(0));
                  PUMP.SET_PUMPED(pump_to_reset,0.00);
                  PUMP_UNIT.SET_IS_PAID(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
                  PUMP_UNIT.SET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_2, 0.00);
                  PUMP_UNIT.SET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,0.00);
                  PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePump:=True;
              elsif amountPayByCustomer > topay then
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_2.TO_PAY:= 0.00;
                  CASH_REGISTER_OBJECT.cashRegister.UNIT_2.PUMPED:=0.00;
                  pump_to_reset:=PUMP_UNIT.GET_PUMP(pumpUnit => PUMP_UNIT_OBJECTS.PUMP_UNIT_2,
                                      fuelType => PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP.FUEL_TYPE);
                  PUMP.SET_PUMP_STATE(pump_to_reset,PUMP.STATE_TYPE'Val(0));
                  PUMP.SET_PUMPED(pump_to_reset,0.00);
                  PUMP_UNIT.SET_IS_PAID(PUMP_UNIT_OBJECTS.PUMP_UNIT_2);
                  PUMP_UNIT.SET_PUMPED(PUMP_UNIT_OBJECTS.PUMP_UNIT_2, 0.00);
                  PUMP_UNIT.SET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,0.00);
                  PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePump:=True;
                  change:= amountPayByCustomer - topay;
                  print_float_type("unit 2 - paid changes: ", change);
               else
                  print("unit 2 - amount < to pay");
                  Raise payFuelException;
               end if;

            elsif PUMP_UNIT.GET_TO_PAY(PUMP_UNIT_OBJECTS.PUMP_UNIT_2) = 0.00 then
               print("unit 2 already paid");

            end if;
         end if;
      end if;



   end pay_Task;
end Pay_Task;
