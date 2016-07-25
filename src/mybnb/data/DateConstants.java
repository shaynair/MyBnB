package mybnb.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * Constants for dates.
 */
public class DateConstants {

  public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  /**
   * Parses text into YYYY-MM-DD.
   *
   * @param text
   * @return the date
   */
  public static final Date parseDate(String text) {
    try {
      return sdf.parse(text);
    } catch (ParseException e) {
      return null;
    }
  }

  /**
   * Gets the difference in years between two dates.
   * @param first
   * @param last
   * @return the difference
   */
  public static int getDiffYears(Date first, Date last) {
    Calendar a = toCalendar(first);
    Calendar b = toCalendar(last);
    int diff = b.get(Calendar.YEAR) - a.get(Calendar.YEAR);
    if (a.get(Calendar.MONTH) > b.get(Calendar.MONTH)
            || (a.get(Calendar.MONTH) == b.get(Calendar.MONTH) && a.get(Calendar.DATE) > b.get(Calendar.DATE))) {
      diff--;
    }
    return diff;
  }

  /**
   * Converts a Date to a Calendar.
   * @param date
   * @return the calendar
   */
  public static Calendar toCalendar(Date date) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    return cal;
  }
  
  public static String serializeDate(Date date) {
    return sdf.format(date);
  }
}
