package es.thousandburgers.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;


@Entity
@Table (name = "client")
@Data
public class ClientEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String telephone;

    private Date birthdate;

    private String email;

    private String user;

    @JsonProperty (access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    private boolean verified;

    private String token;

    @OneToMany(mappedBy = "client", fetch = jakarta.persistence.FetchType.LAZY)
    private List<BookingEntity> bookings;
    
    public ClientEntity() {
        bookings = new ArrayList<>();
    }

    public int getBookingsSize() {
        return bookings.size();
    }
    
}
