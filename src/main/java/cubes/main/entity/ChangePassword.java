package cubes.main.entity;

public class ChangePassword {

	private String odlPassword;
	private String newPassword;
	private String confirmPassword;
	
	
	public ChangePassword() {
		
	}
	
	public ChangePassword(String odlPassword, String newPassword, String confirmPassword) {
		super();
		this.odlPassword = odlPassword;
		this.newPassword = newPassword;
		this.confirmPassword = confirmPassword;
	}
	public String getOdlPassword() {
		return odlPassword;
	}
	public void setOdlPassword(String odlPassword) {
		this.odlPassword = odlPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	
}
