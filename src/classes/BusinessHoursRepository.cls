public class BusinessHoursRepository {

    public List<BusinessHours> findActive() {
        return [ SELECT Id, Name
        FROM BusinessHours 
        WHERE IsActive = true ];
    }

}