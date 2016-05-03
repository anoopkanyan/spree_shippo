 $(function() {
    $( "#shipment_date" ).datepicker({ minDate: -0, maxDate: "+15D",dateFormat: 'yy-mm-dd' + " " + getCurrentTime() }).datepicker("setDate", new Date());

   // $( "#DueDate" ).datepicker( "option", "dateFormat", "mm/dd/yy" + " " + getCurrentTime() );

function getCurrentTime() {
    var CurrentTime = "";
    try {
        var CurrentDate = new Date();
        var CurrentHours = CurrentDate.getHours();
        var CurrentMinutes = CurrentDate.getMinutes();
        var CurrentAmPm = "A'M'";
        if (CurrentMinutes < 10) { CurrentMinutes = "0" + CurrentMinutes; }

        if (CurrentHours == 12) {
            CurrentHours = 12;
            CurrentAmPm = " P'M'";
        }
        else if (CurrentHours == 0) {
            CurrentHours = 12;
            CurrentAmPm = " A'M'";
        }
        else if (CurrentHours > 12) {
            CurrentHours = CurrentHours - 12;
            CurrentAmPm = " P'M'";
        }
        else {
            CurrentAmPm = " A'M'";
        }
        CurrentTime = "" + CurrentHours + ":" + CurrentMinutes + CurrentAmPm + "";
    }
    catch (ex) {
    }
    return CurrentTime;
}
  })
