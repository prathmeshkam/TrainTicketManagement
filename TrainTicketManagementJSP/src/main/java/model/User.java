package model;

public class User {

    int id;
    String username;
    String password;
    String email;
    String address;
    String contactNumber;

    public User(String username, String password, String email, String address, String contactNumber) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.contactNumber = contactNumber;
    }

    public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

}