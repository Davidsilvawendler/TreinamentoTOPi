@isTest
public with sharing class ProjectFixtureFactory {

    public Project__c newProject(String name, Date StartDate, Date endDate){

        return new Project__c (
            ProjectName__c = name
            , StartDate__c = StartDate
            , EndDate__c = endDate
        );
    }

    public static Project__c createProject (String name, Date StartDate, Date endDate){
        return createProject ( newProject)
    }

    public static Project__c createProject (Project__c project) {

        insert project;
        return project;
    }
}