package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbHelper {

	// 数据库驱动
	private static final String driver = "com.mysql.jdbc.Driver";
	// 数据库
	private static final String url = "jdbc:mysql://localhost:3306/db_test";
	// 数据库用户名和密码
	private static final String username = "root";
	private static final String password = "root";

	private static Connection connection = null;

	// 静态代码块，负责加载驱动
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 单例模式返回数据库连接对象
	public static Connection getConnection() throws Exception {

		if (connection == null) {
			connection = DriverManager.getConnection(url, username, password);
			return connection;
		}
		return connection;
	}

	// 主函数测试本类方法
	public static void main(String[] args) {
		System.out.println("主函数启动");
		try {
			Connection conn = DbHelper.getConnection();
			if (conn != null) {
				System.out.println("数据库连接正常");
			} else {
				System.out.println("数据库连接异常");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
