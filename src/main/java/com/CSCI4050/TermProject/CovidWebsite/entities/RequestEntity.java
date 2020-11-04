package com.CSCI4050.TermProject.CovidWebsite.entities;

import java.util.Date;

import javax.persistence.*;

@Entity(name="request")
public class RequestEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private int amount;
    private Date date;
    private String reason;

    @ManyToOne(cascade = CascadeType.ALL)
    private AccountEntity account;

    public AccountEntity getAccount() {return account;}

    public void setAccount(AccountEntity account) {this.account = account;}

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {this.date = date;}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {this.amount = amount;}

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}