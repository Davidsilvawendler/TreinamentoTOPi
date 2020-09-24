public with sharing class AccountFilter {

    public List<Account> filterByChangedDocummentNumber (List<Account> newAccounts, Map<Id, Account> oldAccount){
    
        List<Account> filteredAccounts = new List <Account> ();

        for (Account account: newAccounts) {

            if (String.isEmpty(account.DocumentNumber__c)){
                continue;
            }

            if (oldAccount ==null || oldAccount.isEmpty ()){

                filteredAccounts.add(account);
                continue;
            }

            if (account.DocumentNumber__c == oldAccount.get(account.Id).DocumentNumber__c){
                continue;
            }

            filteredAccounts.add(account);
        
        }

        return filteredAccounts;
    }

    public List<Account> filterByCategoryPremiumAndMillionAnnualRevenue(List<Account> newAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        for (Account account : newAccounts) {
            if( String.isEmpty(account.Category__c) || account.AnnualRevenue == null) {
                continue;
            }

            if( account.Category__c == 'Premium' && account.AnnualRevenue > 1000000) {
                    filteredAccounts.add(account);
            }
        }

        return filteredAccounts;


    }

}

