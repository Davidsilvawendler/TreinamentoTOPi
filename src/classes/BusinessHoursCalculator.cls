public class BusinessHoursCalculator {

    BusinessHoursRepository repository;

    List<BusinessHours> businessHoursSystem;

    BusinessHours businessHoursDefault;

    public BusinessHoursCalculator() {
        this.repository = new BusinessHoursRepository();

        this.businessHoursSystem = repository.findActive();

        getDefaultBusinessHours();
    }

    public void getDefaultBusinessHours() {
        for (BusinessHours businessHour : businessHoursSystem) {
            if (businessHour.Name == 'Default') {
                this.businessHoursDefault = businessHour;
            }
        }
    }

    virtual
    public Datetime getNextBusinessHour(Datetime eventDateTime) {
        return BusinessHours.nextStartDate(
            this.businessHoursDefault.Id, eventDateTime
        );
    }

}