package db;

public class ConditionBuilder {
    private String dateFormat;

    public ConditionBuilder setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
        return this;
    }

    public Condition build(){
        Condition condition = new Condition(dateFormat);
        return condition;
    }
}
