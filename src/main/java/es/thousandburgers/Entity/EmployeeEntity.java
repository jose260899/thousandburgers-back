package es.thousandburgers.Entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table (name = "employee")
@Data
public class EmployeeEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String dni;

    private String telephone;

    private Date birthdate;

    private String role;

    private String user;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    @OneToMany(mappedBy = "employee", fetch = jakarta.persistence.FetchType.LAZY)
    private List<OrderLineEntity> orders;
    
    @OneToMany(mappedBy = "employee", fetch = jakarta.persistence.FetchType.LAZY)
    private List<BookingEntity> bookings;

    public EmployeeEntity() {
        orders = new ArrayList<>();
        bookings = new ArrayList<>();
    }

    public int getOrdersSize() {
        return orders.size();
    }

    public int getBookingsSize() {
        return bookings.size();
    }

    
}
