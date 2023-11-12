package business;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class SavingAccount extends Account implements Serializable {

    @OneToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "cus_id",referencedColumnName = "customerId")
    private Customer customer;

    @Id
    @Column(columnDefinition = "varchar(20)")
    private String savingAccountId;
    private int minBalence;
    private int savingAmount;
    private int interestRate;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getSavingAccountId() {
        return savingAccountId;
    }

    public void setSavingAccountId(String savingAccountId) {
        this.savingAccountId = savingAccountId;
    }

    public int getMinBalence() {
        return minBalence;
    }

    public void setMinBalence(int minBalence) {
        this.minBalence = minBalence;
    }

    public int getSavingAmount() {
        return savingAmount;
    }

    public void setSavingAmount(int savingAmount) {
        this.savingAmount = savingAmount;
    }

    public int getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(int interestRate) {
        this.interestRate = interestRate;
    }

}
