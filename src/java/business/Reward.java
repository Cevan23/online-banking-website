package business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Reward implements Serializable {

    @ManyToMany(mappedBy = "rewards",cascade = CascadeType.DETACH)
    private List<PaymentAccount> paymentAccounts;

    @Id
    @Column(columnDefinition = "varchar(20)")
    private String rewardId;
    @Column(columnDefinition = "varchar(20)")
    private String rewardName;
    private int price;
    private int costPoint;

    public List<PaymentAccount> getCurrentAccounts() {
        return paymentAccounts;
    }

    public void setCurrentAccounts(List<PaymentAccount> paymentAccounts) {
        this.paymentAccounts = paymentAccounts;
    }

    public String getRewardId() {
        return rewardId;
    }

    public void setRewardId(String rewardId) {
        this.rewardId = rewardId;
    }

    public String getRewardName() {
        return rewardName;
    }

    public void setRewardName(String rewardName) {
        this.rewardName = rewardName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCostPoint() {
        return costPoint;
    }

    public void setCostPoint(int costPoint) {
        this.costPoint = costPoint;
    }
}
