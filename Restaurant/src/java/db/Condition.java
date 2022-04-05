package db;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Condition {
    private StringBuilder condition;
    private String dateFormat = "yyyy-MM-dd";

    public Condition() {
        this.condition = new StringBuilder();
    }

    // public Condition(String condition){
    // this.addRequest(condition);
    // }

    protected Condition(String dateFormat) {
        setDateFormat(dateFormat);
        this.condition = new StringBuilder();
    }

    private void setDateFormat(String dateFormat) {
        if (dateFormat != null) {
            this.dateFormat = dateFormat;
        }
    }

    public static ConditionBuilder getBuilder() {
        return new ConditionBuilder();
    }

    public String getCondition() {
        return condition.toString();
    }

    public Condition addRequest(String request) {
        condition.append(request);
        return this;
    }

    public Condition greater(String column, Date date, boolean strict) {
        SimpleDateFormat format = new SimpleDateFormat(this.dateFormat);
        if (date != null && !column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, ">");
            this.condition.append(format.format(date));
        }
        return this;
    }

    public Condition less(String column, Date date, boolean strict) {
        SimpleDateFormat format = new SimpleDateFormat(this.dateFormat);
        if (date != null && !column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, "<");
            this.condition.append(format.format(date));
        }
        return this;
    }

    public Condition greater(String column, int value, boolean strict) {
        if (!column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, ">");
            this.condition.append(Integer.toString(value));
        }
        return this;
    }

    public Condition less(String column, int value, boolean strict) {
        if (!column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, "<");
            this.condition.append(Integer.toString(value));
        }
        return this;
    }

    public Condition greater(String column, double value, boolean strict) {
        if (!column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, ">");
            this.condition.append(Double.toString(value));
        }
        return this;
    }

    public Condition less(String column, double value, boolean strict) {
        if (!column.equals("")) {
            checkContinuation();
            this.condition.append(column);
            checkStrict(strict, "<");
            this.condition.append(Double.toString(value));
        }
        return this;
    }

    public Condition equals(String column, String value){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" = ");
            this.condition.append(value);
        }
        return this;
    }

    public Condition equals(String column, Date value){
        SimpleDateFormat format = new SimpleDateFormat(this.dateFormat);
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" = ");
            this.condition.append(format.format(value));
        }
        return this;
    }

    public Condition equals(String column, int value){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" = ");
            this.condition.append(Integer.toString(value));
        }
        return this;
    }

    public Condition endsWith(String column, String expression){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" like ");
            this.condition.append("'"+expression+"%'");
        }
        return this;
    }

    public Condition startsWith(String column, String expression){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" like ");
            this.condition.append("'%"+expression+"'");
        }
        return this;
    }

    public Condition contains(String column, String expression){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" like ");
            this.condition.append("'%"+expression+"%'");
        }
        return this;
    }

    public Condition equals(String column, double value){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" = ");
            this.condition.append(Double.toString(value));
        }
        return this;
    }

    public Condition between(String column, Date lowerDate, Date upperDate){
        try{
            SimpleDateFormat format = new SimpleDateFormat(this.dateFormat);
        if(lowerDate.after(upperDate)) throw new Exception("The lowerDate should be less or equals the upperDate");
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" between ");
            this.condition.append("'"+format.format(lowerDate)+"' and ");
            this.condition.append("'"+format.format(upperDate)+"'");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        return this;
    }

    public Condition between(String column, int lowerNumber, int upperNumber){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" between ");
            this.condition.append(Integer.toString(lowerNumber)+" and ");
            this.condition.append(Integer.toString(upperNumber));
        }
        return this;
    }
    
    public Condition between(String column, double lowerDouble, double upperDouble){
        if(!column.equals("")){
            checkContinuation();
            this.condition.append(column);
            this.condition.append(" between ");
            this.condition.append(Double.toString(lowerDouble)+" and ");
            this.condition.append(Double.toString(upperDouble));
        }
        return this;
    }

    private void checkStrict(boolean strict, String sign) {
        condition.append(" ");
        if (strict)
            condition.append(sign + " ");
        else
            condition.append(sign + "= ");
    }

    private void checkContinuation() {
        if (this.condition.length() > 0) {
            this.condition.append(" and ");
        }
    }
}
