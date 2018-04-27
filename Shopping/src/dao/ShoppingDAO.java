package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Shopping;
import util.DbHelper;

// 业务逻辑类
public class ShoppingDAO {

	// 获取所有商品信息
	public ArrayList<Shopping> getAllShopping() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rSet = null;
		// 商品集合
		ArrayList<Shopping> list = new ArrayList<Shopping>();

		try {
			conn = DbHelper.getConnection();
			String sql = "SELECT * FROM shopping;";
			stat = conn.prepareStatement(sql);
			rSet = stat.executeQuery();
			while (rSet.next()) {
				Shopping sh = new Shopping();
				sh.setId(rSet.getInt("id"));
				sh.setName(rSet.getString("name"));
				sh.setCity(rSet.getString("city"));
				sh.setNumber(rSet.getInt("number"));
				sh.setPrice(rSet.getInt("price"));
				sh.setPicture(rSet.getString("picture"));
				list.add(sh);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rSet != null) {
				try {
					rSet.close();
					rSet = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stat != null) {
				try {
					stat.close();
					stat = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	// 根据商品Id获得商品资料
	public Shopping getShoppingById(int id) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rSet = null;

		try {
			connection = DbHelper.getConnection();
			String sql = "SELECT * FROM shopping WHERE id = ?;";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			rSet = statement.executeQuery();
			if (rSet.next()) {
				Shopping item = new Shopping();
				item.setId(rSet.getInt("id"));
				item.setName(rSet.getString("name"));
				item.setCity(rSet.getString("city"));
				item.setNumber(rSet.getInt("number"));
				item.setPrice(rSet.getInt("price"));
				item.setPicture(rSet.getString("picture"));
				return item;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rSet != null) {
				try {
					rSet.close();
					rSet = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (statement != null) {
				try {
					statement.close();
					statement = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}

		return null;
	}

	// 获取最近浏览的前5条商品信息
	public ArrayList<Shopping> getViewList(String list) {

		ArrayList<Shopping> itemlist = new ArrayList<Shopping>();
		int iCount = 5; // 每次返回前五条记录
		if (list != null && list.length() > 0) {
			String[] arr = list.split("#");
			System.out.println("当前缓存的个数：arr.length=" + arr.length);
			// 如果商品记录大于等于5条，则返回最新的5条数据，否则返回所有的数据
			if (arr.length >= 5) {
				for (int i = arr.length - 1; i >= arr.length - iCount; i--) {
					itemlist.add(getShoppingById(Integer.parseInt(arr[i])));
				}
			} else {
				for (int i = arr.length - 1; i >= 0; i--) {
					itemlist.add(getShoppingById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		} else {
			return null;
		}
	}

}
