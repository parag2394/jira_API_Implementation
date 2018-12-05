package com.icreon.parag.JiraAPI.Model;

import org.springframework.stereotype.Component;

@Component
public class IssueDetails {

    private String reporterName;
    private String assigneeName;
    private String projectName;
    private String timeSpent;
    private int votes;
    private int watches;
    private String updated;

    public IssueDetails(String reporterName, String assigneeName, String projectName, String timeSpent, int votes, int watches, String updated) {
        this.reporterName = reporterName;
        this.assigneeName = assigneeName;
        this.projectName = projectName;
        this.timeSpent = timeSpent;
        this.votes = votes;
        this.watches = watches;
        this.updated = updated;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public int getWatches() {
        return watches;
    }

    public void setWatches(int watches) {
        this.watches = watches;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }

    public String getAssigneeName() {
        return assigneeName;
    }

    public void setAssigneeName(String assigneeName) {
        this.assigneeName = assigneeName;
    }

    public IssueDetails() {
    }


    public String getReporterName() {
        return reporterName;
    }

    public void setReporterName(String reporterName) {
        this.reporterName = reporterName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(String timeSpent) {
        this.timeSpent = timeSpent;
    }
}
